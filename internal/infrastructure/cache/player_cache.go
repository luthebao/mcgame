// Open-sourced by BaoLT

// PlayerCache manages tiered caching of player data.
// Hot states (combat/position) kept in-memory with 5s Redis sync.
// Warm data (inventory) loaded on-demand via WarmInventoryLoader.
// Cold data (quests/skills/pets) loaded directly from Redis/DB via ColdLoader.
// Thread-safe via sync.RWMutex for tracking active sessions.
package cache

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"sort"
	"sync"
	"time"

	"mcgame-server/internal/application/center"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/domain/skill"
	infraredis "mcgame-server/internal/infrastructure/redis"

	"go.uber.org/zap"
)

const (
	redisKeyPrefix = "player_data:"
	redisTTL       = 2 * time.Hour
)

type PlayerCache struct {
	activeSessions map[int64]*PlayerData
	hotStates      map[int64]*HotStateBuffer
	mu             sync.RWMutex

	charRepo  character.Repository
	itemRepo  item.Repository
	skillRepo skill.Repository
	petRepo   pet.Repository
	questRepo quest.Repository

	warmLoader *WarmInventoryLoader
	coldLoader *ColdLoader

	redisClient *infraredis.Client
	logger      *zap.Logger
}

func NewPlayerCache(
	charRepo character.Repository,
	itemRepo item.Repository,
	skillRepo skill.Repository,
	petRepo pet.Repository,
	questRepo quest.Repository,
	redisClient *infraredis.Client,
	logger *zap.Logger,
) *PlayerCache {
	cache := &PlayerCache{
		activeSessions: make(map[int64]*PlayerData),
		hotStates:      make(map[int64]*HotStateBuffer),
		charRepo:       charRepo,
		itemRepo:       itemRepo,
		skillRepo:      skillRepo,
		petRepo:        petRepo,
		questRepo:      questRepo,
		warmLoader:     NewWarmInventoryLoader(redisClient, itemRepo, logger),
		coldLoader:     NewColdLoader(redisClient, questRepo, skillRepo, petRepo, logger),
		redisClient:    redisClient,
		logger:         logger,
	}

	return cache
}

func (c *PlayerCache) StartDebugLogger() {
	go c.debugLoggerLoop()
}

// debugLoggerLoop logs all cached players every 15 seconds to txt file
func (c *PlayerCache) debugLoggerLoop() {
	ticker := time.NewTicker(15 * time.Second)
	defer ticker.Stop()

	for range ticker.C {
		c.mu.RLock()
		var lines []string
		lines = append(lines, fmt.Sprintf("=== DEBUG CACHE at %s ===", time.Now().Format(time.RFC3339)))
		lines = append(lines, fmt.Sprintf("Total cached players: %d (legacy), hot states: %d (new)", len(c.activeSessions), len(c.hotStates)))
		lines = append(lines, "")

		for charID, buf := range c.hotStates {
			state := buf.Get()
			lines = append(lines, fmt.Sprintf("HotState: charID=%d, mapID=%d, pos=(%.1f,%.1f), hp=%d/%d, mp=%d/%d",
				charID, state.MapID, state.PosX, state.PosY, state.CurrentHP, state.MaxHP, state.CurrentMP, state.MaxMP))
		}
		lines = append(lines, "")

		for charID, data := range c.activeSessions {
			if data.Character != nil {
				// Marshal full player data to JSON
				playerJSON := map[string]interface{}{
					"character_id": charID,
					"character": map[string]interface{}{
						"id":                data.Character.ID,
						"name":              data.Character.Name,
						"level":             data.Character.Level,
						"class_id":          data.Character.ClassID,
						"gender":            data.Character.Gender,
						"experience":        data.Character.Experience,
						"current_hp":        data.Character.CurrentHP,
						"max_hp":            data.Character.MaxHP,
						"current_mp":        data.Character.CurrentMP,
						"max_mp":            data.Character.MaxMP,
						"gold":              data.Character.Gold,
						"gold_bind":         data.Character.GoldBind,
						"money":             data.Character.Money,
						"money_bind":        data.Character.MoneyBind,
						"temp_bag_slots":    data.Character.TempBagSlots,
						"mx_temp_bag_slots": data.Character.MxTempBagSlots,
						"bag_slots":         data.Character.MaxBagSlots(),
						"bank_slots":        data.Character.MaxBankSlots(),
						"strength":          data.Character.Strength,
						"agility":           data.Character.Agility,
						"stamina":           data.Character.Stamina,
						"intelligence":      data.Character.Intelligence,
						"spirit":            data.Character.Spirit,
						"attr_points":       data.Character.AttrPoints,
						"map_id":            data.Character.MapID,
						"pos_x":             data.Character.PosX,
						"pos_y":             data.Character.PosY,
					},
					"items_count":  len(data.Items),
					"skills_count": len(data.Skills),
					"pets_count":   len(data.Pets),
					"quests_count": len(data.Quests),
					"is_dirty":     data.IsDirty(),
				}

				// Add items details
				items := []map[string]interface{}{}
				for itemID, item := range data.Items {
					items = append(items, map[string]interface{}{
						"id":            itemID,
						"template_id":   item.TemplateID,
						"stack_count":   item.StackCount,
						"slot_index":    item.SlotIndex,
						"slot_type":     int(item.SlotType),
						"item_type":     int(item.ItemType),
						"is_bound":      item.IsBound,
						"enchant_level": item.EnchantLevel,
					})
				}
				playerJSON["items"] = items

				jsonBytes, err := json.MarshalIndent(playerJSON, "", "  ")
				if err != nil {
					lines = append(lines, fmt.Sprintf("ERROR marshaling player %d: %v", charID, err))
				} else {
					lines = append(lines, string(jsonBytes))
					lines = append(lines, "---")
				}
			}
		}
		c.mu.RUnlock()

		// Write to file
		if len(lines) > 1 {
			content := ""
			for _, l := range lines {
				content += l + "\n"
			}
			_ = os.WriteFile("/app/player_cache_debug.txt", []byte(content), 0644)
		}
	}
}

func (c *PlayerCache) LoadPlayer(ctx context.Context, charID int64) (*PlayerData, error) {
	c.mu.Lock()
	if existing, ok := c.activeSessions[charID]; ok {
		c.mu.Unlock()
		return existing, nil
	}
	c.mu.Unlock()

	if cachedData, err := c.loadFromRedis(ctx, charID); err == nil && cachedData != nil {
		c.mu.Lock()
		if existing, ok := c.activeSessions[charID]; ok {
			c.mu.Unlock()
			return existing, nil
		}
		c.activeSessions[charID] = cachedData
		c.mu.Unlock()
		c.logger.Debug("Player data loaded from Redis", zap.Int64("character_id", charID))
		return cachedData, nil
	}

	char, err := c.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	items, err := c.itemRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	skills, err := c.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	pets, err := c.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	quests, err := c.questRepo.FindAllByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	data := NewPlayerData(charID)
	data.Character = char

	for _, it := range items {
		data.Items[it.ID] = it
	}
	for _, sk := range skills {
		data.Skills[sk.ID] = sk
	}
	for _, pt := range pets {
		data.Pets[pt.ID] = pt
	}
	for _, q := range quests {
		data.Quests[q.ID] = q
	}

	c.mu.Lock()
	if existing, ok := c.activeSessions[charID]; ok {
		c.mu.Unlock()
		return existing, nil
	}
	c.activeSessions[charID] = data
	c.mu.Unlock()

	if err := c.saveToRedis(ctx, data); err != nil {
		c.logger.Warn("Failed to save player data to Redis", zap.Error(err))
	}

	c.logger.Info("Player data loaded from DB and cached to Redis",
		zap.Int64("character_id", charID),
		zap.Int("TempBagSlots", char.TempBagSlots),
		zap.Int("MxTempBagSlots", char.MxTempBagSlots),
		zap.Int("items", len(items)),
		zap.Int("skills", len(skills)),
		zap.Int("pets", len(pets)),
		zap.Int("quests", len(quests)))

	return data, nil
}

func (c *PlayerCache) GetPlayer(charID int64) *PlayerData {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.activeSessions[charID]
}

func (c *PlayerCache) HasPlayer(charID int64) bool {
	c.mu.RLock()
	defer c.mu.RUnlock()
	_, ok := c.activeSessions[charID]
	return ok
}

func (c *PlayerCache) SavePlayer(ctx context.Context, charID int64) error {
	c.mu.RLock()
	data, ok := c.activeSessions[charID]
	c.mu.RUnlock()

	if !ok || !data.IsDirty() {
		return nil
	}

	if err := c.saveToRedis(ctx, data); err != nil {
		c.logger.Warn("Failed to update Redis cache", zap.Int64("character_id", charID), zap.Error(err))
	}

	return c.persistPlayerData(ctx, data)
}

func (c *PlayerCache) SaveAndEvict(ctx context.Context, charID int64) error {
	c.mu.Lock()
	data, ok := c.activeSessions[charID]
	if !ok {
		c.mu.Unlock()
		return nil
	}
	delete(c.activeSessions, charID)
	c.mu.Unlock()

	if data.IsDirty() {
		if err := c.persistPlayerData(ctx, data); err != nil {
			c.logger.Error("Failed to persist player data on eviction",
				zap.Int64("character_id", charID),
				zap.Error(err))
			return err
		}
	}

	if err := c.deleteFromRedis(ctx, charID); err != nil {
		c.logger.Warn("Failed to delete player data from Redis",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}

	c.logger.Info("Player data saved and evicted from cache",
		zap.Int64("character_id", charID))
	return nil
}

func (c *PlayerCache) SaveAllDirty(ctx context.Context) (*center.SaveStats, error) {
	c.mu.RLock()
	charIDs := make([]int64, 0, len(c.activeSessions))
	for id := range c.activeSessions {
		charIDs = append(charIDs, id)
	}
	totalCached := len(c.activeSessions)
	c.mu.RUnlock()

	stats := &center.SaveStats{
		TotalCached: totalCached,
	}

	for _, charID := range charIDs {
		c.mu.RLock()
		data, ok := c.activeSessions[charID]
		c.mu.RUnlock()

		if !ok {
			continue
		}

		if data.IsDirty() {
			stats.DirtyCount++

			if err := c.saveToRedis(ctx, data); err != nil {
				c.logger.Warn("Failed to update Redis cache during SaveAllDirty",
					zap.Int64("character_id", charID),
					zap.Error(err))
			}

			if err := c.persistPlayerData(ctx, data); err != nil {
				c.logger.Error("Failed to persist player data",
					zap.Int64("character_id", charID),
					zap.Error(err))
			} else {
				stats.SavedCount++
			}
		}
	}

	return stats, nil
}

func (c *PlayerCache) persistPlayerData(ctx context.Context, data *PlayerData) error {
	snapshot := data.GetDirtySnapshot()
	hadFailure := false

	if snapshot.DirtyChar && snapshot.Character != nil {
		if err := c.charRepo.Update(ctx, snapshot.Character); err != nil {
			return err
		}
	}

	if err := c.stageDirtyItemMoves(ctx, snapshot.DirtyItems); err != nil {
		hadFailure = true
	}

	for _, itemID := range snapshot.DeletedItems {
		if err := c.itemRepo.Delete(ctx, itemID); err != nil {
			c.logger.Warn("Failed to delete item",
				zap.Int64("item_id", itemID),
				zap.Error(err))
			hadFailure = true
		}
	}

	if err := c.applyDirtyItemUpdates(ctx, snapshot.DirtyItems); err != nil {
		hadFailure = true
	}

	for _, sk := range snapshot.DirtySkills {
		if err := c.skillRepo.Update(ctx, sk); err != nil {
			c.logger.Warn("Failed to update skill",
				zap.Int64("skill_id", sk.ID),
				zap.Error(err))
			hadFailure = true
		}
	}

	for _, skillID := range snapshot.DeletedSkills {
		if err := c.skillRepo.Delete(ctx, skillID); err != nil {
			c.logger.Warn("Failed to delete skill",
				zap.Int64("skill_id", skillID),
				zap.Error(err))
			hadFailure = true
		}
	}

	for _, pt := range snapshot.DirtyPets {
		if err := c.petRepo.Save(ctx, pt); err != nil {
			c.logger.Warn("Failed to save pet",
				zap.Int64("pet_id", pt.ID),
				zap.Error(err))
			hadFailure = true
		}
	}

	for _, petID := range snapshot.DeletedPets {
		if err := c.petRepo.Delete(ctx, petID); err != nil {
			c.logger.Warn("Failed to delete pet",
				zap.Int64("pet_id", petID),
				zap.Error(err))
			hadFailure = true
		}
	}

	for _, q := range snapshot.DirtyQuests {
		if err := c.questRepo.Update(ctx, q); err != nil {
			c.logger.Warn("Failed to update quest",
				zap.Int64("quest_id", q.ID),
				zap.Error(err))
			hadFailure = true
		}
	}

	for _, questID := range snapshot.DeletedQuests {
		if err := c.questRepo.Delete(ctx, questID); err != nil {
			c.logger.Warn("Failed to delete quest",
				zap.Int64("quest_id", questID),
				zap.Error(err))
			hadFailure = true
		}
	}

	if hadFailure {
		return fmt.Errorf("failed to persist one or more cached entities")
	}

	data.ClearDirty()
	return nil
}

func sortedDirtyItems(dirtyItems map[int64]*item.Item) []*item.Item {
	items := make([]*item.Item, 0, len(dirtyItems))
	for _, it := range dirtyItems {
		items = append(items, it)
	}

	sort.Slice(items, func(i, j int) bool {
		if items[i].SlotType != items[j].SlotType {
			return items[i].SlotType < items[j].SlotType
		}
		if items[i].SlotIndex != items[j].SlotIndex {
			return items[i].SlotIndex < items[j].SlotIndex
		}
		return items[i].ID < items[j].ID
	})

	return items
}

func (c *PlayerCache) stageDirtyItemMoves(ctx context.Context, dirtyItems map[int64]*item.Item) error {
	if len(dirtyItems) == 0 {
		return nil
	}

	items := sortedDirtyItems(dirtyItems)
	hadFailure := false
	stageIndex := 0

	for _, it := range items {
		stored, err := c.itemRepo.FindByID(ctx, it.ID)
		if err != nil || stored == nil {
			continue
		}
		if stored.SlotType == it.SlotType && stored.SlotIndex == it.SlotIndex {
			continue
		}

		tempCopy := *it
		tempCopy.SlotType = it.SlotType
		tempCopy.SlotIndex = -1000000 - stageIndex
		stageIndex++

		if err := c.itemRepo.Update(ctx, &tempCopy); err != nil {
			c.logger.Warn("Failed to stage item before final update",
				zap.Int64("item_id", it.ID),
				zap.Int("slot_type", int(it.SlotType)),
				zap.Int("slot_index", it.SlotIndex),
				zap.Error(err))
			hadFailure = true
		}
	}

	if hadFailure {
		return fmt.Errorf("failed to stage dirty items")
	}

	return nil
}

func (c *PlayerCache) applyDirtyItemUpdates(ctx context.Context, dirtyItems map[int64]*item.Item) error {
	if len(dirtyItems) == 0 {
		return nil
	}

	items := sortedDirtyItems(dirtyItems)
	hadFailure := false

	for _, it := range items {
		if err := c.itemRepo.Update(ctx, it); err != nil {
			c.logger.Warn("Failed to update item",
				zap.Int64("item_id", it.ID),
				zap.Error(err))
			hadFailure = true
		}
	}

	if hadFailure {
		return fmt.Errorf("failed to persist dirty items")
	}

	return nil
}

func (c *PlayerCache) GetCachedPlayerIDs() []int64 {
	c.mu.RLock()
	defer c.mu.RUnlock()
	ids := make([]int64, 0, len(c.activeSessions))
	for id := range c.activeSessions {
		ids = append(ids, id)
	}
	return ids
}

func (c *PlayerCache) InvalidateCharacter(ctx context.Context, charID int64) error {
	c.mu.Lock()
	if buf, ok := c.hotStates[charID]; ok {
		buf.StopSync()
		delete(c.hotStates, charID)
	}
	delete(c.activeSessions, charID)
	c.mu.Unlock()

	var firstErr error
	if err := c.deleteFromRedis(ctx, charID); err != nil {
		firstErr = err
	}
	if err := DeleteHotStateFromRedis(ctx, c.redisClient, charID); err != nil {
		firstErr = err
	}
	if c.warmLoader != nil {
		if err := c.warmLoader.DeleteFromRedis(ctx, charID); err != nil {
			firstErr = err
		}
	}
	if c.coldLoader != nil {
		if err := c.coldLoader.DeleteColdData(ctx, charID); err != nil {
			firstErr = err
		}
	}

	return firstErr
}

// Redis methods

func (c *PlayerCache) saveToRedis(ctx context.Context, data *PlayerData) error {
	if c.redisClient == nil {
		return nil
	}

	data.mu.RLock()
	defer data.mu.RUnlock()

	dto := struct {
		CharacterID int64
		Character   *character.Character
		Items       map[int64]*item.Item
		Skills      map[int64]*skill.CharacterSkill
		Pets        map[int64]*pet.Pet
		Quests      map[int64]*quest.QuestProgress
	}{
		CharacterID: data.CharacterID,
		Character:   data.Character,
		Items:       data.Items,
		Skills:      data.Skills,
		Pets:        data.Pets,
		Quests:      data.Quests,
	}

	bytes, err := json.Marshal(dto)
	if err != nil {
		return err
	}

	key := fmt.Sprintf("%s%d", redisKeyPrefix, data.CharacterID)
	return c.redisClient.GetClient().Set(ctx, key, bytes, redisTTL).Err()
}

func (c *PlayerCache) deleteFromRedis(ctx context.Context, charID int64) error {
	if c.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", redisKeyPrefix, charID)
	return c.redisClient.GetClient().Del(ctx, key).Err()
}

func (c *PlayerCache) loadFromRedis(ctx context.Context, charID int64) (*PlayerData, error) {
	if c.redisClient == nil {
		return nil, nil
	}

	key := fmt.Sprintf("%s%d", redisKeyPrefix, charID)
	bytes, err := c.redisClient.GetClient().Get(ctx, key).Bytes()
	if err != nil {
		return nil, err
	}

	dto := struct {
		CharacterID int64
		Character   *character.Character
		Items       map[int64]*item.Item
		Skills      map[int64]*skill.CharacterSkill
		Pets        map[int64]*pet.Pet
		Quests      map[int64]*quest.QuestProgress
	}{}

	if err := json.Unmarshal(bytes, &dto); err != nil {
		return nil, err
	}

	data := NewPlayerData(dto.CharacterID)
	data.Character = dto.Character
	data.Items = dto.Items
	data.Skills = dto.Skills
	data.Pets = dto.Pets
	data.Quests = dto.Quests

	if data.Items == nil {
		data.Items = make(map[int64]*item.Item)
	}
	if data.Skills == nil {
		data.Skills = make(map[int64]*skill.CharacterSkill)
	}
	if data.Pets == nil {
		data.Pets = make(map[int64]*pet.Pet)
	}
	if data.Quests == nil {
		data.Quests = make(map[int64]*quest.QuestProgress)
	}

	return data, nil
}

func (c *PlayerCache) Stats() map[string]int {
	c.mu.RLock()
	defer c.mu.RUnlock()

	totalItems := 0
	totalSkills := 0
	totalPets := 0
	totalQuests := 0
	dirtyPlayers := 0

	for _, data := range c.activeSessions {
		totalItems += len(data.Items)
		totalSkills += len(data.Skills)
		totalPets += len(data.Pets)
		totalQuests += len(data.Quests)
		if data.IsDirty() {
			dirtyPlayers++
		}
	}

	return map[string]int{
		"active_sessions_legacy": len(c.activeSessions),
		"hot_states_new":         len(c.hotStates),
		"dirty_players":          dirtyPlayers,
		"total_items":            totalItems,
		"total_skills":           totalSkills,
		"total_pets":             totalPets,
		"total_quests":           totalQuests,
	}
}

func (c *PlayerCache) GetWarmLoader() *WarmInventoryLoader {
	return c.warmLoader
}

func (c *PlayerCache) GetColdLoader() *ColdLoader {
	return c.coldLoader
}

func (c *PlayerCache) GetHotState(charID int64) *PlayerHotState {
	c.mu.RLock()
	defer c.mu.RUnlock()

	if buf, ok := c.hotStates[charID]; ok {
		return buf.Get()
	}
	return nil
}

func (c *PlayerCache) UpdateHotState(charID int64, fn func(*PlayerHotState)) {
	c.mu.RLock()
	buf, ok := c.hotStates[charID]
	c.mu.RUnlock()

	if ok {
		buf.Update(fn)
	}
}

func (c *PlayerCache) UpdateCachedCharacter(charID int64, fn func(*character.Character)) *character.Character {
	c.mu.RLock()
	data, ok := c.activeSessions[charID]
	c.mu.RUnlock()

	if !ok || data.Character == nil {
		return nil
	}

	data.mu.Lock()
	fn(data.Character)
	data.dirtyChar = true
	snapshot := *data.Character
	data.mu.Unlock()

	return &snapshot
}

func (c *PlayerCache) LoadHotState(ctx context.Context, charID int64) (*HotStateBuffer, error) {
	c.mu.Lock()
	defer c.mu.Unlock()

	if existing, ok := c.hotStates[charID]; ok {
		return existing, nil
	}

	hotState, err := LoadHotStateFromRedis(ctx, c.redisClient, charID)
	wasColdLoad := false
	if err != nil {
		wasColdLoad = true
		hotState = &PlayerHotState{
			CharID:  charID,
			Buffs:   make([]int64, 0, 8),
			Debuffs: make([]int64, 0, 8),
		}

		char, err := c.charRepo.FindByID(ctx, charID)
		if err == nil && char != nil {
			hotState.MapID = int32(char.MapID)
			hotState.PosX = float32(char.PosX)
			hotState.PosY = float32(char.PosY)
			hotState.CurrentHP = int32(char.CurrentHP)
			hotState.CurrentMP = int32(char.CurrentMP)
			hotState.MaxHP = int32(char.MaxHP)
			hotState.MaxMP = int32(char.MaxMP)
			hotState.TempBagSlots = char.TempBagSlots
			hotState.MxTempBagSlots = char.MxTempBagSlots
		}
	}

	buf := NewHotStateBuffer(charID)
	buf.current = hotState
	buf.pending = deepCopyHotState(hotState)
	c.hotStates[charID] = buf

	if wasColdLoad {
		items, err := c.itemRepo.FindByCharacterID(ctx, charID)
		if err == nil {
			itemMap := make(map[int64]*item.Item)
			for _, it := range items {
				itemMap[it.ID] = it
			}
			_ = c.warmLoader.InitializeFromItems(ctx, charID, itemMap, 0, 0)
		}

		skills, err := c.skillRepo.FindByCharacterID(ctx, charID)
		if err == nil {
			skillMap := make(map[int64]*skill.CharacterSkill)
			for _, sk := range skills {
				skillMap[sk.ID] = sk
			}
			_ = c.coldLoader.SaveSkills(ctx, charID, skillMap)
		}

		pets, err := c.petRepo.FindByCharacterID(ctx, charID)
		if err == nil {
			petMap := make(map[int64]*pet.Pet)
			for _, pt := range pets {
				petMap[pt.ID] = pt
			}
			_ = c.coldLoader.SavePets(ctx, charID, petMap)
		}

		quests, err := c.questRepo.FindAllByCharacter(ctx, charID)
		if err == nil {
			questMap := make(map[int64]*quest.QuestProgress)
			for _, q := range quests {
				questMap[q.ID] = q
			}
			_ = c.coldLoader.SaveQuests(ctx, charID, questMap)
		}
	}

	go buf.StartSync(ctx, c.redisClient, c.logger)

	return buf, nil
}

func (c *PlayerCache) SaveAndEvictHotState(ctx context.Context, charID int64) error {
	c.mu.Lock()
	buf, ok := c.hotStates[charID]
	if ok {
		delete(c.hotStates, charID)
	}
	c.mu.Unlock()

	if ok {
		buf.StopSync()
		if err := buf.syncToRedis(ctx, c.redisClient, c.logger); err != nil {
			c.logger.Warn("Failed to sync hot state on evict",
				zap.Int64("char_id", charID),
				zap.Error(err))
		}
	}

	if err := DeleteHotStateFromRedis(ctx, c.redisClient, charID); err != nil {
		c.logger.Warn("Failed to delete hot state from Redis",
			zap.Int64("char_id", charID),
			zap.Error(err))
	}

	return nil
}

func (c *PlayerCache) GetHotStateIDs() []int64 {
	c.mu.RLock()
	defer c.mu.RUnlock()

	ids := make([]int64, 0, len(c.hotStates))
	for id := range c.hotStates {
		ids = append(ids, id)
	}
	return ids
}
