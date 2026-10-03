// Open-sourced by BaoLT

package cache

import (
	"context"
	"fmt"
	"strconv"
	"time"

	"mcgame-server/internal/domain/item"
	infraredis "mcgame-server/internal/infrastructure/redis"

	"go.uber.org/zap"
)

const (
	warmInventoryRedisKey = "player:warm:"
	warmInventoryTTL      = 2 * time.Hour
)

type WarmInventory struct {
	Gold            int64
	GoldBind        int64
	BagSlots        []int64
	EquipSlots      []int64
	QuestBagSlots   []int64
	PetItemBagSlots []int64
}

type WarmInventoryLoader struct {
	redisClient *infraredis.Client
	itemRepo    item.Repository
	logger      *zap.Logger
}

func NewWarmInventoryLoader(
	redisClient *infraredis.Client,
	itemRepo item.Repository,
	logger *zap.Logger,
) *WarmInventoryLoader {
	return &WarmInventoryLoader{
		redisClient: redisClient,
		itemRepo:    itemRepo,
		logger:      logger,
	}
}

func newWarmInventory() *WarmInventory {
	return &WarmInventory{
		BagSlots:        make([]int64, item.DefaultBagSlots),
		EquipSlots:      make([]int64, int(item.EquipSlotMax)),
		QuestBagSlots:   make([]int64, item.DefaultQuestBagSlots),
		PetItemBagSlots: make([]int64, item.DefaultPetItemBagSlots),
	}
}

func warmSlotCapacity(slotType item.SlotType) (int, bool) {
	switch slotType {
	case item.SlotTypeBag:
		return item.DefaultBagSlots, true
	case item.SlotTypeEquipped:
		return int(item.EquipSlotMax), true
	case item.SlotTypeQuestBag:
		return item.DefaultQuestBagSlots, true
	case item.SlotTypePetItemBag:
		return item.DefaultPetItemBagSlots, true
	default:
		return 0, false
	}
}

func warmSlotFieldName(slotType item.SlotType) (string, bool) {
	switch slotType {
	case item.SlotTypeBag:
		return "bag_slots", true
	case item.SlotTypeEquipped:
		return "equip", true
	case item.SlotTypeQuestBag:
		return "quest_bag_slots", true
	case item.SlotTypePetItemBag:
		return "pet_item_bag_slots", true
	default:
		return "", false
	}
}

func collectWarmItemIDs(warmData *WarmInventory) map[int64]bool {
	itemIDs := make(map[int64]bool)

	for _, itemID := range warmData.BagSlots {
		if itemID > 0 {
			itemIDs[itemID] = true
		}
	}
	for _, itemID := range warmData.EquipSlots {
		if itemID > 0 {
			itemIDs[itemID] = true
		}
	}
	for _, itemID := range warmData.QuestBagSlots {
		if itemID > 0 {
			itemIDs[itemID] = true
		}
	}
	for _, itemID := range warmData.PetItemBagSlots {
		if itemID > 0 {
			itemIDs[itemID] = true
		}
	}

	return itemIDs
}

func (w *WarmInventoryLoader) GetItems(ctx context.Context, charID int64) (map[int64]*item.Item, error) {
	itemsSlice, err := w.itemRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	result := make(map[int64]*item.Item)
	for _, it := range itemsSlice {
		result[it.ID] = it
	}

	if w.redisClient == nil {
		return result, nil
	}

	warmData, err := w.loadFromRedis(ctx, charID)
	if err != nil {
		w.logger.Debug("Warm inventory cache miss",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return result, nil
	}

	itemIDs := collectWarmItemIDs(warmData)
	if len(itemIDs) == 0 {
		return result, nil
	}

	if len(itemIDs) < len(result) {
		return result, nil
	}

	filtered := make(map[int64]*item.Item)
	for id, it := range result {
		if itemIDs[id] {
			filtered[id] = it
		}
	}

	if len(filtered) < len(result) {
		return result, nil
	}

	return filtered, nil
}

func (w *WarmInventoryLoader) UpdateItem(ctx context.Context, charID int64, itemID int64, slotType item.SlotType, slotIndex int) error {
	if w.redisClient == nil {
		return nil
	}

	if charID <= 0 {
		return nil
	}

	capacity, tracked := warmSlotCapacity(slotType)
	if !tracked {
		return nil
	}
	if slotIndex < 0 || slotIndex >= capacity {
		w.logger.Warn("Warm inventory slot index out of range",
			zap.Int64("char_id", charID),
			zap.Int("slot_index", slotIndex),
			zap.Int("slot_capacity", capacity),
			zap.Int("slot_type", int(slotType)))
		return nil
	}

	fieldName, _ := warmSlotFieldName(slotType)
	field := fmt.Sprintf("%s:%d", fieldName, slotIndex)
	key := fmt.Sprintf("%s%d", warmInventoryRedisKey, charID)

	if err := w.redisClient.GetClient().HSet(ctx, key, field, itemID).Err(); err != nil {
		w.logger.Warn("Failed to update warm inventory field",
			zap.Int64("char_id", charID),
			zap.String("field", field),
			zap.Error(err))
		return err
	}

	w.redisClient.GetClient().Expire(ctx, key, warmInventoryTTL)
	return nil
}

func (w *WarmInventoryLoader) UpdateGold(ctx context.Context, charID int64, gold, goldBind int64) error {
	if w.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", warmInventoryRedisKey, charID)

	pipe := w.redisClient.GetClient().Pipeline()
	pipe.HSet(ctx, key, "gold", gold)
	pipe.HSet(ctx, key, "gold_bind", goldBind)
	pipe.Expire(ctx, key, warmInventoryTTL)

	if _, err := pipe.Exec(ctx); err != nil {
		w.logger.Warn("Failed to update warm inventory gold",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return err
	}

	return nil
}

func (w *WarmInventoryLoader) loadFromRedis(ctx context.Context, charID int64) (*WarmInventory, error) {
	key := fmt.Sprintf("%s%d", warmInventoryRedisKey, charID)
	fields, err := w.redisClient.GetClient().HGetAll(ctx, key).Result()
	if err != nil {
		return nil, err
	}

	if len(fields) == 0 {
		return nil, fmt.Errorf("no warm data found")
	}

	warm := newWarmInventory()

	for k, v := range fields {
		switch k {
		case "gold":
			warm.Gold, _ = strconv.ParseInt(v, 10, 64)
		case "gold_bind":
			warm.GoldBind, _ = strconv.ParseInt(v, 10, 64)
		}
	}

	for i := 0; i < len(warm.BagSlots); i++ {
		if v, ok := fields[fmt.Sprintf("bag_slots:%d", i)]; ok {
			warm.BagSlots[i], _ = strconv.ParseInt(v, 10, 64)
		}
	}

	for i := 0; i < len(warm.EquipSlots); i++ {
		if v, ok := fields[fmt.Sprintf("equip:%d", i)]; ok {
			warm.EquipSlots[i], _ = strconv.ParseInt(v, 10, 64)
		}
	}

	for i := 0; i < len(warm.QuestBagSlots); i++ {
		if v, ok := fields[fmt.Sprintf("quest_bag_slots:%d", i)]; ok {
			warm.QuestBagSlots[i], _ = strconv.ParseInt(v, 10, 64)
		}
	}

	for i := 0; i < len(warm.PetItemBagSlots); i++ {
		if v, ok := fields[fmt.Sprintf("pet_item_bag_slots:%d", i)]; ok {
			warm.PetItemBagSlots[i], _ = strconv.ParseInt(v, 10, 64)
		}
	}

	return warm, nil
}

func (w *WarmInventoryLoader) InitializeFromItems(ctx context.Context, charID int64, items map[int64]*item.Item, gold, goldBind int64) error {
	if w.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", warmInventoryRedisKey, charID)

	fields := make(map[string]interface{})
	fields["gold"] = gold
	fields["gold_bind"] = goldBind

	for _, it := range items {
		fieldName, tracked := warmSlotFieldName(it.SlotType)
		if !tracked {
			continue
		}

		capacity, _ := warmSlotCapacity(it.SlotType)
		if it.SlotIndex < 0 || it.SlotIndex >= capacity {
			continue
		}

		field := fmt.Sprintf("%s:%d", fieldName, it.SlotIndex)
		fields[field] = it.ID
	}

	if err := w.redisClient.GetClient().HSet(ctx, key, fields).Err(); err != nil {
		return err
	}

	w.redisClient.GetClient().Expire(ctx, key, warmInventoryTTL)
	return nil
}

func (w *WarmInventoryLoader) DeleteFromRedis(ctx context.Context, charID int64) error {
	if w.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", warmInventoryRedisKey, charID)
	return w.redisClient.GetClient().Del(ctx, key).Err()
}
