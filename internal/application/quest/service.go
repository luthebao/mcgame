// Open-sourced by BaoLT

// Quest service handles quest tracking and progression use cases.
// Manages quest acceptance, completion, objective updates, and rewards.
// Supports main story, daily loop, and NPC-triggered quests.
package quest

import (
	"context"
	"errors"
	"math/rand"
	"sort"
	"strconv"
	"strings"
	"sync"
	"time"

	"mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/creature"
	pkgitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"

	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/gamedata/predef"
)

const (
	questGenderNone = 2
	questPreModeAnd = 1
	questPreModeOr  = 2
)

type Service struct {
	questRepo         quest.Repository
	gameDataManager   *gamedata.Manager
	logger            *zap.Logger
	charRepo          character.Repository
	itemService       *item.Service
	petService        *apppet.Service // Added
	callBoardCache    sync.Map
	refreshCounts     sync.Map
	loopRepo          quest.LoopRepository
	guildMembership   GuildMembership
	loopBossSummonsMu sync.Mutex
	loopBossSummons   map[int64]*LoopBossSummon
}

type dailyCounter struct {
	date  string
	count int
}

func NewService(questRepo quest.Repository, logger *zap.Logger) *Service {
	return &Service{
		questRepo: questRepo,
		logger:    logger,
	}
}

func (s *Service) SetGameDataManager(manager *gamedata.Manager) {
	s.gameDataManager = manager
}

func (s *Service) SetCharacterRepository(repo character.Repository) {
	s.charRepo = repo
}

func (s *Service) SetItemService(svc *item.Service) {
	s.itemService = svc
}

func (s *Service) SetPetService(svc *apppet.Service) {
	s.petService = svc
}

func (s *Service) GetCharacter(ctx context.Context, charID int64) (*character.Character, error) {
	if s.charRepo == nil {
		return nil, errors.New("character repository not set")
	}

	return s.charRepo.FindByID(ctx, charID)
}

func (s *Service) CanAcceptQuestWithSnapshot(ctx context.Context, char *character.Character, questTpl *models.QuestTemplate, activeQuestIDs map[int]bool, completedQuestIDs map[int]bool) (bool, string) {
	if questTpl == nil {
		return false, "Quest template not found"
	}
	if char == nil {
		return false, "Character not found"
	}

	questID := int(questTpl.ID)
	if activeQuestIDs != nil && activeQuestIDs[questID] {
		return false, "Quest already in progress"
	}
	if completedQuestIDs != nil && completedQuestIDs[questID] {
		return false, "Quest already completed"
	}

	effectiveLevel := char.Level
	if int(questTpl.IsRebirth) > 0 {
		effectiveLevel = char.RebirthLvl
	}
	if int(questTpl.MinLevel) > 0 && effectiveLevel < int(questTpl.MinLevel) {
		return false, "Level too low"
	}
	if int(questTpl.MaxLevel) > 0 && effectiveLevel > int(questTpl.MaxLevel) {
		return false, "Level too high"
	}

	qGender := int(questTpl.Gender)
	if qGender != questGenderNone && char.Gender != qGender {
		return false, "Gender requirement not met"
	}

	if questTpl.ReqClass != "" && questTpl.ReqClass != "0" {
		allowedClasses := questTpl.ParsePipeDelimitedInts(questTpl.ReqClass)
		if len(allowedClasses) > 0 {
			allowed := false
			for _, classID := range allowedClasses {
				if classID == char.ClassID {
					allowed = true
					break
				}
			}
			if !allowed {
				return false, "Class requirement not met"
			}
		}
	}

	if s.gameDataManager == nil {
		return true, ""
	}

	preConditions := s.gameDataManager.GetQuestPre(questID)
	if len(preConditions) == 0 {
		return true, ""
	}

	preQuestMode := int(questTpl.PreQuestType)
	hasQuestPre := false
	anyQuestCompleted := false

	for _, pre := range preConditions {
		switch int(pre.Kind) {
		case quest.RequireKindItem:
			if s.itemService == nil {
				continue
			}
			required := int(pre.Num)
			if required <= 0 {
				required = 1
			}
			held, err := s.itemService.CountCarriedItemsByTemplate(ctx, char.ID, int(pre.ItemID), int(pre.Type), -1)
			if err != nil {
				s.logger.Warn("Failed to count item for quest prereq",
					zap.Int("quest_id", questID),
					zap.Int("item_id", int(pre.ItemID)),
					zap.Error(err))
				return false, "Item requirement check failed"
			}
			if held < required {
				return false, "Item requirement not met"
			}
		case quest.RequireKindCreature:
			requiredQuestID := int(pre.ItemID)
			isFinished := completedQuestIDs != nil && completedQuestIDs[requiredQuestID]
			switch preQuestMode {
			case questPreModeAnd:
				if !isFinished {
					return false, "Required quest not completed"
				}
			case questPreModeOr:
				hasQuestPre = true
				if isFinished {
					anyQuestCompleted = true
				}
			}
		}
	}

	if preQuestMode == questPreModeOr && hasQuestPre && !anyQuestCompleted {
		return false, "Required quest not completed"
	}

	return true, ""
}

func (s *Service) GetActiveQuests(ctx context.Context, charID int64) ([]*quest.QuestProgress, error) {
	quests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	for _, qp := range quests {
		if err := s.syncCollectObjectives(ctx, qp); err != nil {
			return nil, err
		}
	}

	return quests, nil
}

func (s *Service) GetQuestTemplate(id int) *models.QuestTemplate {
	if s.gameDataManager == nil {
		return nil
	}
	return s.gameDataManager.GetQuest(id)
}

func (s *Service) EnrichQuestDTO(ctx context.Context, qp *quest.QuestProgress) map[string]interface{} {
	dto := qp.ToDTO()
	if s.gameDataManager == nil {
		return dto
	}

	questTpl := s.gameDataManager.GetQuest(qp.QuestID)
	if questTpl == nil {
		return dto
	}

	// Use color from template if available
	dto["c"] = int(questTpl.Color)

	// Construct data map with camelCase keys for client
	data := make(map[string]interface{})
	data["id"] = questTpl.ID
	data["name"] = questTpl.Name
	data["info"] = questTpl.Info
	data["type"] = int(questTpl.Type)
	data["subType"] = questTpl.SubType
	data["startText"] = questTpl.StartText
	data["completeText"] = questTpl.CompleteText
	data["awardExp"] = questTpl.AwardExpRe
	data["moneyNum"] = questTpl.MoneyNum
	data["moneyType"] = questTpl.MoneyType
	data["finishNpc"] = questTpl.FinishNPC
	data["startNpc"] = questTpl.StartNPC
	data["minLevel"] = questTpl.MinLevel
	data["reqClass"] = questTpl.ReqClass
	data["at"] = questTpl.At

	dto["data"] = data

	// Determine position based on quest state
	// If complete, point to FinishNPC. Otherwise, point to StartNPC or first objective?
	// Usually client expects "pos" to be the "destination" for navigation.
	targetNpcID := int(questTpl.FinishNPC)
	if !qp.IsComplete() && questTpl.StartNPC > 0 {
		// If we haven't finished, maybe we need to talk to someone else?
		// But usually it points to FinishNPC once taken.
		// Let's stick with FinishNPC as the main destination.
	}

	if targetNpcID > 0 {
		npcTpl := s.gameDataManager.GetNPC(targetNpcID)
		if npcTpl != nil {
			mapTpl := s.gameDataManager.GetMap(int(npcTpl.PosMapID))
			mapName := "Unknown"
			if mapTpl != nil {
				mapName = mapTpl.Name
			}
			posName := mapName
			if !qp.IsComplete() {
				for _, obj := range qp.Objectives {
					if obj.Type != quest.ObjectiveKillMonster {
						continue
					}
					monster := s.gameDataManager.GetCreature(obj.Target)
					if monster == nil || monster.Name == "" {
						continue
					}
					posName = monster.Name
					break
				}
			}

			dto["pos"] = map[string]interface{}{
				"map":  int(npcTpl.PosMapID),
				"x":    int(npcTpl.PosX),
				"y":    int(npcTpl.PosY),
				"name": posName,
			}
			dto["fName"] = npcTpl.Name
		}
	}

	// Construct requirements and progress for client
	require := make([]map[string]interface{}, 0)
	questKill := make([]map[string]interface{}, 0)

	for _, obj := range qp.Objectives {
		req := map[string]interface{}{
			"itemId": obj.Target,
			"num":    obj.Required,
			"q":      obj.Quality,
			"kind":   obj.ClientKind(),
			"type":   obj.ClientTableType(),
		}

		switch obj.Type {
		case quest.ObjectiveCollectItem:
			if obj.ItemTableType == quest.TableIDEquiptTemplate {
				if s.gameDataManager != nil {
					if eq := s.gameDataManager.GetEquipment(obj.Target); eq != nil {
						req["name"] = eq.Name
					}
				}
			} else if s.gameDataManager != nil {
				if it := s.gameDataManager.GetItem(obj.Target); it != nil {
					req["name"] = it.Name
				}
			}
			require = append(require, req)
		case quest.ObjectiveKillMonster:
			if s.gameDataManager != nil {
				monster := s.gameDataManager.GetCreature(obj.Target)
				if monster != nil {
					req["name"] = monster.Name
					req["creature"] = map[string]interface{}{
						"id":   monster.ID,
						"name": monster.Name,
					}
				}
			}
			require = append(require, req)

			remaining := obj.Required - obj.Current
			if remaining < 0 {
				remaining = 0
			}
			qk := map[string]interface{}{
				"cid":        qp.CharacterID,
				"creatureId": obj.Target,
				"num":        remaining,
			}
			questKill = append(questKill, qk)
		case quest.ObjectiveSubmitPet:
			if s.gameDataManager != nil {
				monster := s.gameDataManager.GetCreature(obj.Target)
				if monster != nil {
					req["name"] = monster.Name
					req["creature"] = map[string]interface{}{
						"id":   monster.ID,
						"name": monster.Name,
					}
				}
			}
			require = append(require, req)
		}
	}

	dto["require"] = require
	if len(questKill) > 0 {
		dto["questKill"] = questKill
	}

	return dto
}

// GetActiveQuest retrieves a specific active quest for a character
func (s *Service) GetActiveQuest(ctx context.Context, charID int64, questID int) (*quest.QuestProgress, error) {
	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil {
		return nil, err
	}
	if qp == nil || qp.Status != quest.QuestStatusActive {
		return nil, pkgerrors.ErrNotFound
	}
	if err := s.syncCollectObjectives(ctx, qp); err != nil {
		return nil, err
	}
	return qp, nil
}

func (s *Service) GetInitialObjectives(questID int) []quest.Objective {
	if s.gameDataManager == nil {
		return []quest.Objective{}
	}

	reqTemplates := s.gameDataManager.GetQuestRequire(questID)
	objectives := make([]quest.Objective, 0, len(reqTemplates))

	for _, tpl := range reqTemplates {
		var objType quest.ObjectiveType
		switch int(tpl.Kind) {
		case quest.RequireKindItem:
			objType = quest.ObjectiveCollectItem
		case quest.RequireKindCreature:
			objType = quest.ObjectiveKillMonster
		case quest.RequireKindPet:
			objType = quest.ObjectiveSubmitPet
		default:
			objType = quest.ObjectiveType(tpl.Kind)
		}

		required := int(tpl.Num)
		if required <= 0 {
			required = 1
		}

		obj := quest.Objective{
			Type:     objType,
			Target:   int(tpl.ItemID),
			Required: required,
			Current:  0,
			Quality:  int(tpl.Q),
		}
		if objType == quest.ObjectiveCollectItem {
			obj.ItemTableType = int(tpl.Type)
		}
		objectives = append(objectives, obj)
	}
	return objectives
}

func (s *Service) GetAvailableQuestsForCallBoard(ctx context.Context, charID int64, level int) ([]*models.QuestTemplate, error) {
	if s.gameDataManager == nil {
		return nil, errors.New("game data manager not set")
	}

	allQuests := s.gameDataManager.GetAllQuests()
	availableQuests := make([]*models.QuestTemplate, 0)

	// Get active and completed quests to filter them out
	activeQuests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	activeQuestIDs := make(map[int]bool)
	for _, q := range activeQuests {
		activeQuestIDs[q.QuestID] = true
	}

	completedIDs, err := s.GetCompletedQuestIDs(ctx, charID)
	if err != nil {
		return nil, err
	}

	completedQuestMap := make(map[int]bool)
	for _, id := range completedIDs {
		completedQuestMap[id] = true
	}

	for _, q := range allQuests {
		// Filter logic:
		// 1. Level requirement
		// 2. Not already active
		// 3. Not completed (unless repeatable - but keeping simple for now)
		// 4. Ideally check class requirement too, but ignoring for now

		// Skip if level out of range
		if level < int(q.MinLevel) || (q.MaxLevel > 0 && level > int(q.MaxLevel)) {
			continue
		}

		// Skip if already active
		if activeQuestIDs[int(q.ID)] {
			continue
		}

		// Skip if already completed
		if completedQuestMap[int(q.ID)] {
			continue
		}

		// Filter by SubType (Call Board Quests only)
		// if q.SubType != "-1" {
		// 	continue
		// }

		// Filter by Type 9 (Call Board / Bounty)
		if int(q.Type) != 9 {
			continue
		}

		// For CallBoard, we might only want quests with specific Type or explicit display.
		// For now, let's limit to a reasonable number, say 10 max
		availableQuests = append(availableQuests, q)
		if len(availableQuests) >= 10 {
			break
		}
	}

	return availableQuests, nil
}

func (s *Service) GetAvailableQuestsForNpc(ctx context.Context, charID int64, npcID int) ([]*models.QuestTemplate, error) {
	if s.gameDataManager == nil {
		return nil, errors.New("game data manager not set")
	}

	allQuests := s.gameDataManager.GetAllQuests()
	availableQuests := make([]*models.QuestTemplate, 0)

	// Get active quests to exclude them
	activeQuests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}
	activeQuestIDs := make(map[int]bool)
	for _, q := range activeQuests {
		activeQuestIDs[q.QuestID] = true
	}

	// Get completed quests to exclude (unless repeatable)
	completedIDs, err := s.GetCompletedQuestIDs(ctx, charID)
	if err != nil {
		return nil, err
	}
	completedQuestMap := make(map[int]bool)
	for _, id := range completedIDs {
		completedQuestMap[id] = true
	}

	// Get character level
	char, err := s.GetCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	for _, q := range allQuests {
		if int(q.StartNPC) != npcID {
			continue
		}

		canAccept, _ := s.CanAcceptQuestWithSnapshot(ctx, char, q, activeQuestIDs, completedQuestMap)
		if canAccept {
			availableQuests = append(availableQuests, q)
		}
	}

	return availableQuests, nil
}

func (s *Service) BuildQuestLogString(ctx context.Context, charID int64) (string, error) {
	ids, err := s.GetCompletedQuestIDs(ctx, charID)
	if err != nil {
		return "|", err
	}
	if len(ids) == 0 {
		return "|", nil
	}
	var b strings.Builder
	b.WriteByte('|')
	for _, id := range ids {
		b.WriteString(strconv.Itoa(id))
		b.WriteByte('|')
	}
	return b.String(), nil
}

func (s *Service) GetQuestProgress(ctx context.Context, charID int64, questID int) (*quest.QuestProgress, error) {
	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil {
		return nil, err
	}
	if err := s.syncCollectObjectives(ctx, qp); err != nil {
		return nil, err
	}
	return qp, nil
}

func (s *Service) CanAcceptQuest(ctx context.Context, charID int64, questID int) (bool, string, error) {
	// 1. Check if quest is already active
	existing, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil && !errors.Is(err, pkgerrors.ErrNotFound) {
		return false, "", err
	}

	activeQuestIDs := make(map[int]bool, 1)
	if existing != nil && existing.Status == quest.QuestStatusActive {
		activeQuestIDs[questID] = true
	}

	completedIDs, err := s.GetCompletedQuestIDs(ctx, charID)
	if err != nil {
		return false, "", err
	}
	completedQuestMap := make(map[int]bool, len(completedIDs))
	for _, id := range completedIDs {
		completedQuestMap[id] = true
	}

	if s.gameDataManager == nil {
		return true, "", nil
	}

	// 3. Check Quest Template Requirements (Level, Class)
	questTpl := s.gameDataManager.GetQuest(questID)
	if questTpl == nil {
		return false, "Quest template not found", nil
	}

	char, err := s.GetCharacter(ctx, charID)
	if err != nil {
		return false, "", err
	}

	canAccept, reason := s.CanAcceptQuestWithSnapshot(ctx, char, questTpl, activeQuestIDs, completedQuestMap)
	return canAccept, reason, nil
}

func (s *Service) AcceptQuest(ctx context.Context, charID int64, questID int, objectives []quest.Objective) (*quest.QuestProgress, error) {
	canAccept, reason, err := s.CanAcceptQuest(ctx, charID, questID)
	if err != nil {
		return nil, err
	}
	if !canAccept {
		s.logger.Debug("Cannot accept quest",
			zap.Int64("character_id", charID),
			zap.Int("quest_id", questID),
			zap.String("reason", reason))
		return nil, pkgerrors.ErrInvalidInput
	}

	qp := quest.NewQuestProgress(charID, questID, objectives)

	if err := s.questRepo.Save(ctx, qp); err != nil {
		return nil, err
	}

	s.logger.Info("Quest accepted",
		zap.Int64("character_id", charID),
		zap.Int("quest_id", questID))

	return qp, nil
}

func (s *Service) AcceptQuestFromNPC(ctx context.Context, charID int64, questID int, npcID int, objectives []quest.Objective) (*quest.QuestProgress, error) {
	qp, err := s.AcceptQuest(ctx, charID, questID, objectives)
	if err != nil {
		return nil, err
	}

	s.logger.Info("Quest accepted from NPC",
		zap.Int64("character_id", charID),
		zap.Int("quest_id", questID),
		zap.Int("npc_id", npcID))

	return qp, nil
}

func (s *Service) CompleteQuest(ctx context.Context, charID int64, questID int) (*quest.QuestProgress, map[string]interface{}, error) {
	if s.IsLoopChild(questID) {
		return s.completeLoopChildQuest(ctx, charID, questID)
	}

	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil {
		return nil, nil, err
	}

	if err := s.syncCollectObjectives(ctx, qp); err != nil {
		return nil, nil, err
	}
	if !qp.CanComplete() {
		s.logger.Debug("Cannot complete quest",
			zap.Int64("character_id", charID),
			zap.Int("quest_id", questID),
			zap.Int("status", int(qp.Status)),
			zap.Bool("objectives_complete", qp.IsComplete()))
		return nil, nil, pkgerrors.ErrInvalidInput
	}

	consumedItems, deletedPetIDs, err := s.consumeCollectObjectiveItems(ctx, qp)
	if err != nil {
		return nil, nil, pkgerrors.ErrInvalidInput
	}

	qp.Complete()

	if err := s.questRepo.Update(ctx, qp); err != nil {
		return nil, nil, err
	}

	// Calculate and Apply Rewards
	rewards, err := s.applyRewards(ctx, charID, questID, qp.CompletionCount)
	if err != nil {
		s.logger.Error("Failed to apply quest rewards", zap.Error(err))
	}
	if rewards == nil {
		rewards = make(map[string]interface{})
	}
	if len(consumedItems) > 0 {
		rewards["consumedItems"] = consumedItems
	}
	if len(deletedPetIDs) > 0 {
		rewards["consumedPets"] = deletedPetIDs
	}

	history := &quest.QuestHistory{
		CharacterID:    charID,
		QuestID:        questID,
		CompletedAt:    time.Now(),
		RewardsClaimed: rewards,
	}
	if err := s.questRepo.RecordHistory(ctx, history); err != nil {
		s.logger.Warn("Failed to record quest history",
			zap.Error(err))
	}

	if s.gameDataManager != nil {
		if questTpl := s.gameDataManager.GetQuest(questID); questTpl != nil && int(questTpl.Type) == predef.QuestTypeDaily {
			if err := s.questRepo.Delete(ctx, qp.ID); err != nil {
				s.logger.Warn("Failed to reset daily quest for re-take",
					zap.Int64("character_id", charID), zap.Int("quest_id", questID), zap.Error(err))
			}
		}
	}

	s.logger.Info("Quest completed",
		zap.Int64("character_id", charID),
		zap.Int("quest_id", questID))

	return qp, rewards, nil
}

func (s *Service) syncCollectObjectives(ctx context.Context, qp *quest.QuestProgress) error {
	if qp == nil {
		return nil
	}

	changed := false

	if s.itemService != nil {
		type itemKey struct {
			templateID int
			tableType  int
			colorCode  int
		}
		itemCounts := make(map[itemKey]int)
		for i := range qp.Objectives {
			obj := &qp.Objectives[i]
			if obj.Type != quest.ObjectiveCollectItem {
				continue
			}
			key := itemKey{
				templateID: obj.Target,
				tableType:  obj.ItemTableType,
				colorCode:  collectObjectiveColorFilter(obj),
			}
			count, ok := itemCounts[key]
			if !ok {
				current, err := s.itemService.CountCarriedItemsByTemplate(ctx, qp.CharacterID, key.templateID, key.tableType, key.colorCode)
				if err != nil {
					return err
				}
				count = current
				itemCounts[key] = count
			}
			current := min(count, obj.Required)
			if obj.Current != current {
				obj.Current = current
				changed = true
			}
		}
	}

	if s.petService != nil {
		hasPetObjective := false
		for _, obj := range qp.Objectives {
			if obj.Type == quest.ObjectiveSubmitPet {
				hasPetObjective = true
				break
			}
		}
		if hasPetObjective {
			pets, err := s.petService.GetPetList(ctx, qp.CharacterID)
			if err != nil {
				return err
			}
			for i := range qp.Objectives {
				obj := &qp.Objectives[i]
				if obj.Type != quest.ObjectiveSubmitPet {
					continue
				}
				count := s.countQualifyingPets(pets, obj)
				current := min(count, obj.Required)
				if obj.Current != current {
					obj.Current = current
					changed = true
				}
			}
		}
	}

	if changed && qp.ID != 0 {
		return s.questRepo.Update(ctx, qp)
	}

	return nil
}

// collectObjectiveColorFilter returns the exact colorCode an objective row
// requires, or -1 to skip the color filter. Quest rows with `q < 0` are
// "any color"; rows with `q >= 0` map to a specific color tier via Flash's
// getColorByQuality formula ((q+4)/5, mirrored by
// EquipmentColorCodeFromQuality). Applies to both equipment (kind=1 type=19)
// and consumable (kind=1 type=29) collect objectives — Flash's Core.as
// getItemNumByColor uses the same color comparison for both.
func collectObjectiveColorFilter(obj *quest.Objective) int {
	if obj.Quality < 0 {
		return -1
	}
	return pkgitem.EquipmentColorCodeFromQuality(obj.Quality)
}

// countQualifyingPets returns the number of pets that satisfy a kind=3
// quest objective (template id match + name unchanged + grow-rate tier above
// threshold). Mirrors QuestPanel.as:1210 checkPet.
func (s *Service) countQualifyingPets(pets []*domainpet.Pet, obj *quest.Objective) int {
	templateName := s.creatureTemplateName(obj.Target)
	count := 0
	for _, pet := range pets {
		if !petQualifiesForQuestSubmit(pet, obj, templateName) {
			continue
		}
		count++
	}
	return count
}

// petQualifiesForQuestSubmit mirrors the Flash checkPet eligibility test.
func petQualifiesForQuestSubmit(pet *domainpet.Pet, obj *quest.Objective, templateName string) bool {
	if pet == nil {
		return false
	}
	if pet.TemplateID != obj.Target {
		return false
	}
	if templateName != "" && pet.Name != templateName {
		return false
	}
	return domainpet.PetGrowRateMeetsQuestQuality(pet.GrowRate, obj.Quality)
}

func (s *Service) creatureTemplateName(creatureID int) string {
	if s.gameDataManager == nil {
		return ""
	}
	tpl := s.gameDataManager.GetCreature(creatureID)
	if tpl == nil {
		return ""
	}
	return tpl.Name
}

func (s *Service) consumeCollectObjectiveItems(ctx context.Context, qp *quest.QuestProgress) ([]map[string]interface{}, []int64, error) {
	if qp == nil {
		return nil, nil, nil
	}

	consumed := make([]map[string]interface{}, 0)
	type itemKey struct {
		templateID int
		tableType  int
		colorCode  int
	}
	requiredByKey := make(map[itemKey]int)

	if s.itemService != nil {
		for _, obj := range qp.Objectives {
			if obj.Type != quest.ObjectiveCollectItem || obj.Required <= 0 {
				continue
			}
			key := itemKey{
				templateID: obj.Target,
				tableType:  obj.ItemTableType,
				colorCode:  collectObjectiveColorFilter(&obj),
			}
			requiredByKey[key] += obj.Required
		}

		for key, count := range requiredByKey {
			changes, err := s.itemService.ConsumeCarriedItemsByTemplate(ctx, qp.CharacterID, key.templateID, count, key.tableType, key.colorCode)
			if err != nil {
				return nil, nil, err
			}
			for _, change := range changes {
				if change.Item == nil {
					continue
				}
				entry := map[string]interface{}{
					"deleted": change.Deleted,
					"sid":     change.Item.CalculateSID(),
				}
				if !change.Deleted {
					entry["item"] = change.Item.ToDTO()
				}
				consumed = append(consumed, entry)
			}
		}
	}

	deletedPetIDs, err := s.consumeSubmitPetObjectives(ctx, qp)
	if err != nil {
		return nil, nil, err
	}

	return consumed, deletedPetIDs, nil
}

// consumeSubmitPetObjectives deletes the minimum number of qualifying pets
// to satisfy every kind=3 objective. When several pets qualify, the
// lowest-growRate pet is consumed first so the player keeps any rare-tier
// pet they could have swapped in. Returns the deleted pet IDs so handlers
// can push onDelPet callbacks.
func (s *Service) consumeSubmitPetObjectives(ctx context.Context, qp *quest.QuestProgress) ([]int64, error) {
	if s.petService == nil {
		return nil, nil
	}
	hasPetObjective := false
	for _, obj := range qp.Objectives {
		if obj.Type == quest.ObjectiveSubmitPet {
			hasPetObjective = true
			break
		}
	}
	if !hasPetObjective {
		return nil, nil
	}

	pets, err := s.petService.GetPetList(ctx, qp.CharacterID)
	if err != nil {
		return nil, err
	}

	deletedPetIDs := make([]int64, 0)
	consumedPetIDs := make(map[int64]bool)

	for _, obj := range qp.Objectives {
		if obj.Type != quest.ObjectiveSubmitPet || obj.Required <= 0 {
			continue
		}
		templateName := s.creatureTemplateName(obj.Target)
		candidates := make([]*domainpet.Pet, 0)
		for _, pet := range pets {
			if pet == nil || consumedPetIDs[pet.ID] {
				continue
			}
			if petQualifiesForQuestSubmit(pet, &obj, templateName) {
				candidates = append(candidates, pet)
			}
		}
		if len(candidates) < obj.Required {
			s.logger.Warn("Not enough pets to satisfy submit objective",
				zap.Int64("character_id", qp.CharacterID),
				zap.Int("quest_id", qp.QuestID),
				zap.Int("template_id", obj.Target),
				zap.Int("required", obj.Required),
				zap.Int("available", len(candidates)))
			return nil, pkgerrors.ErrInsufficientFunds
		}
		sort.Slice(candidates, func(i, j int) bool {
			if candidates[i].GrowRate != candidates[j].GrowRate {
				return candidates[i].GrowRate < candidates[j].GrowRate
			}
			return candidates[i].ID < candidates[j].ID
		})

		for i := 0; i < obj.Required; i++ {
			victim := candidates[i]
			if err := s.petService.DeletePet(ctx, qp.CharacterID, victim.ID); err != nil {
				return nil, err
			}
			consumedPetIDs[victim.ID] = true
			deletedPetIDs = append(deletedPetIDs, victim.ID)
		}
	}

	return deletedPetIDs, nil
}

func (s *Service) UpdateObjectiveProgress(ctx context.Context, charID int64, objType quest.ObjectiveType, target int, amount int) ([]*quest.QuestProgress, error) {
	quests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	var updatedQuests []*quest.QuestProgress

	for _, qp := range quests {
		if qp.UpdateObjective(objType, target, amount) {
			if err := s.questRepo.Update(ctx, qp); err != nil {
				s.logger.Warn("Failed to update quest progress",
					zap.Int64("quest_progress_id", qp.ID),
					zap.Error(err))
				continue
			}
			updatedQuests = append(updatedQuests, qp)

			s.logger.Debug("Quest objective updated",
				zap.Int64("character_id", charID),
				zap.Int("quest_id", qp.QuestID),
				zap.Int("objective_type", int(objType)),
				zap.Int("target", target),
				zap.Int("amount", amount))
		}
	}

	return updatedQuests, nil
}

func (s *Service) OnMonsterKilled(ctx context.Context, charID int64, monsterID int) ([]*quest.QuestProgress, error) {
	return s.UpdateObjectiveProgress(ctx, charID, quest.ObjectiveKillMonster, monsterID, 1)
}

func (s *Service) OnItemCollected(ctx context.Context, charID int64, itemID int, amount int) ([]*quest.QuestProgress, error) {
	if amount <= 0 {
		return nil, nil
	}
	return s.UpdateObjectiveProgress(ctx, charID, quest.ObjectiveCollectItem, itemID, amount)
}

func (s *Service) OnNPCInteracted(ctx context.Context, charID int64, npcID int) error {
	_, err := s.UpdateObjectiveProgress(ctx, charID, quest.ObjectiveTalkToNPC, npcID, 1)
	return err
}

func (s *Service) OnLevelUp(ctx context.Context, charID int64, _, newLevel int) error {
	quests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	if err != nil {
		return err
	}

	for _, qp := range quests {
		for i := range qp.Objectives {
			obj := &qp.Objectives[i]
			if obj.Type == quest.ObjectiveReachLevel && newLevel >= obj.Target {
				obj.Current = obj.Required
			}
		}
		if err := s.questRepo.Update(ctx, qp); err != nil {
			s.logger.Warn("Failed to update quest progress",
				zap.Int64("quest_progress_id", qp.ID),
				zap.Error(err))
		}
	}

	return nil
}

func (s *Service) OnBattleWon(ctx context.Context, charID int64, battleType int) error {
	_, err := s.UpdateObjectiveProgress(ctx, charID, quest.ObjectiveWinBattle, battleType, 1)
	return err
}

func (s *Service) GetLoopQuestStartTime(questType int) int64 {
	now := time.Now()

	switch questType {
	case 1:
		return time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location()).Unix()
	case 2:
		weekday := int(now.Weekday())
		if weekday == 0 {
			weekday = 7
		}
		daysToMonday := weekday - 1
		monday := now.AddDate(0, 0, -daysToMonday)
		return time.Date(monday.Year(), monday.Month(), monday.Day(), 0, 0, 0, 0, now.Location()).Unix()
	default:
		return 0
	}
}

func (s *Service) AbandonQuest(ctx context.Context, charID int64, questID int) error {
	if s.gameDataManager != nil {
		if questTpl := s.gameDataManager.GetQuest(questID); questTpl != nil && int(questTpl.Type) == predef.QuestTypeNewbie {
			return pkgerrors.ErrQuestNotAvailable
		}
	}

	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil {
		return err
	}

	if qp.Status != quest.QuestStatusActive {
		return pkgerrors.ErrInvalidInput
	}

	if err := s.questRepo.Delete(ctx, qp.ID); err != nil {
		return err
	}

	s.logger.Info("Quest abandoned",
		zap.Int64("character_id", charID),
		zap.Int("quest_id", questID))

	return nil
}

func (s *Service) AbandonGuildQuests(ctx context.Context, charID int64) ([]int, error) {
	if s.questRepo == nil || s.gameDataManager == nil {
		return nil, nil
	}

	quests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	abandoned := make([]int, 0)
	for _, progress := range quests {
		if progress == nil {
			continue
		}

		questTpl := s.gameDataManager.GetQuest(progress.QuestID)
		if questTpl == nil {
			continue
		}

		isGuildQuest := int(questTpl.Type) == 11
		if !isGuildQuest {
			for _, subType := range questTpl.ParsePipeDelimitedInts(questTpl.SubType) {
				if subType == 2 {
					isGuildQuest = true
					break
				}
			}
		}
		if !isGuildQuest {
			continue
		}

		if err := s.questRepo.Delete(ctx, progress.ID); err != nil {
			return abandoned, err
		}
		abandoned = append(abandoned, progress.QuestID)
	}

	return abandoned, nil
}

func (s *Service) applyRewards(ctx context.Context, charID int64, questID int, completionCount int) (map[string]interface{}, error) {
	if s.gameDataManager == nil {
		return nil, errors.New("game data manager not set")
	}
	if s.charRepo == nil {
		return nil, errors.New("character repo not set")
	}

	// 1. Get Award Data
	awards := s.gameDataManager.GetQuestAwards(questID)
	questTpl := s.gameDataManager.GetQuest(questID)

	s.logger.Debug("Applying rewards",
		zap.Int("quest_id", questID),
		zap.Int("awards_count", len(awards)))

	totalExp := int64(0)
	totalMoney := int64(0)

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	oldLevel := char.Level

	isClassQuest := false
	if questTpl != nil {
		questType := int(questTpl.Type)
		switch questType {
		case predef.QuestTypeClass:
			isClassQuest = true
			totalExp = predef.CalcClassQuestExp(char.Level, char.QuestN)
			totalMoney = predef.CalcClassQuestMoney(char.Level, char.QuestN)
		default:
			totalExp = int64(questTpl.AwardExpRe)
		}
		if questType == predef.QuestTypeCallboard {
			multiplier := predef.CallboardMultiplier(int(questTpl.Color))
			totalExp = int64(float64(totalExp) * multiplier)
			totalMoney = int64(float64(questTpl.MoneyNum) * multiplier)
		}
	}
	_ = completionCount

	itemsToGive := make([]map[string]interface{}, 0)
	notifiedItems := make([]map[string]interface{}, 0)
	petsToGive := make([]map[string]interface{}, 0)

	for _, award := range awards {
		s.logger.Debug("Processing award",
			zap.Int("quest_id", questID),
			zap.Int("award_type", int(award.Type)),
			zap.Int("item_id", int(award.ItemID)))

		// Award Type 12: Pet (TBL_CREATURE)
		if int(award.Type) == 12 && s.petService != nil {
			rewardQuality := int(award.Q)
			pets, err := s.petService.ContractPetsWithQuality(ctx, charID, []int{int(award.ItemID)}, rewardQuality)
			if err != nil {
				s.logger.Warn("Failed to add reward pet", zap.Error(err))
			} else {
				for _, p := range pets {
					if p == nil {
						continue
					}
					boundPet, bindErr := s.petService.BindPet(ctx, charID, p.ID)
					if bindErr != nil {
						s.logger.Warn("Failed to bind reward pet",
							zap.Int("quest_id", questID),
							zap.Int64("pet_id", p.ID),
							zap.Error(bindErr))
						boundPet = p
					}
					petsToGive = append(petsToGive, boundPet.ToDTO())
				}
			}
			continue
		}

		if award.ItemID > 0 {
			templateID := int(award.ItemID)
			rewardQuality := int(award.Q)
			var itemType pkgitem.ItemType
			var eqTpl *models.EquiptTemplateTemplate
			var itTpl *models.ItemTemplateTemplate

			// Determine Item Type and validate template presence
			switch int(award.Type) {
			case int(creature.TypeEquiptTemplate):
				itemType = pkgitem.ItemTypeEquipment
				eqTpl = s.gameDataManager.GetEquipment(templateID)
				if eqTpl == nil {
					s.logger.Warn("Skipping invalid equipment quest reward",
						zap.Int("quest_id", questID),
						zap.Int("item_id", templateID),
						zap.Int("award_type", int(award.Type)))
					continue
				}
			default:
				// Cases 0, 29 and others map to Consumable/Generic
				itemType = pkgitem.ItemTypeConsumable
				itTpl = s.gameDataManager.GetItem(templateID)
				if itTpl == nil {
					s.logger.Warn("Skipping invalid item quest reward",
						zap.Int("quest_id", questID),
						zap.Int("item_id", templateID),
						zap.Int("award_type", int(award.Type)))
					continue
				}
			}

			// Determine Binding Status for ALL items
			isBound := true

			if s.itemService != nil {
				rewardColorCode := 0
				if itemType == pkgitem.ItemTypeEquipment {
					rewardColorCode = pkgitem.QuestRewardEquipmentColorCodeFromQuality(rewardQuality)
				}

				addedItem, err := s.itemService.AddItemWithBindAndColor(ctx, charID, templateID, itemType, int(award.Num), isBound, rewardColorCode)
				if err != nil {
					s.logger.Warn("Failed to add reward item",
						zap.Int("quest_id", questID),
						zap.Int("item_id", templateID),
						zap.Int("award_type", int(award.Type)),
						zap.Bool("is_bound", isBound),
						zap.Error(err))
				} else if addedItem != nil {
					if itemType == pkgitem.ItemTypeEquipment && rewardQuality > 0 {
						updatedItem, updateErr := s.itemService.UpdateQuestRewardEquipmentQuality(ctx, addedItem.ID, rewardQuality)
						if updateErr != nil {
							s.logger.Warn("Failed to apply reward item quality",
								zap.Int("quest_id", questID),
								zap.Int64("item_id", addedItem.ID),
								zap.Int("template_id", templateID),
								zap.Int("quality", rewardQuality),
								zap.Error(updateErr))
						} else {
							addedItem = updatedItem
						}
					}

					if itemType == pkgitem.ItemTypeEquipment {
						updatedItem, updateErr := s.itemService.AssignRandomEquipmentElement(ctx, addedItem.ID)
						if updateErr != nil {
							s.logger.Warn("Failed to assign reward item element",
								zap.Int("quest_id", questID),
								zap.Int64("item_id", addedItem.ID),
								zap.Int("template_id", templateID),
								zap.Error(updateErr))
						} else {
							addedItem = updatedItem
						}
					}

					itemDTO := addedItem.ToDTO()
					if s.itemService != nil {
						itemDTO = s.itemService.BuildClientItemDTO(addedItem)
					}
					itemsToGive = append(itemsToGive, itemDTO)

					itemName := ""
					itemKind := 0
					itemTableType := 29
					notifyQ := int(award.Num)
					notifyColor := pkgitem.PopupNoticeColor(itemType, addedItem.ColorCode)
					if itemType == pkgitem.ItemTypeEquipment {
						itemTableType = 19
						if rewardQuality > 0 {
							itemName = pkgitem.FormatEquipmentDisplayNameFromQuality(eqTpl.Name, rewardQuality)
							notifyQ = rewardQuality
						} else {
							itemName = pkgitem.FormatEquipmentDisplayName(eqTpl.Name, addedItem.ColorCode)
						}
						itemKind = int(eqTpl.Kind)
					} else {
						itemName = itTpl.Name
						itemKind = int(itTpl.Kind)
					}

					notifiedItems = append(notifiedItems, map[string]interface{}{
						"i":  templateID,
						"q":  notifyQ,
						"s":  "",
						"c":  notifyColor,
						"t":  itemTableType,
						"n":  itemName,
						"tt": itemKind,
					})
				}
			}
		}
	}

	// 2. Apply Changes to Character
	leveledUp := false
	if totalExp > 0 {
		leveledUp = char.GainExperience(totalExp)
	}

	currencyChanges := make(map[string]int64)

	// Apply money reward: use totalMoney (calculated for class/callboard quests) or template MoneyNum
	moneyAmount := totalMoney
	if moneyAmount == 0 && questTpl != nil && questTpl.MoneyNum > 0 {
		moneyAmount = int64(questTpl.MoneyNum)
	}
	if moneyAmount > 0 && questTpl != nil {
		mType := int(questTpl.MoneyType)
		switch mType {
		case 1: // MoneyBind (client: Currency.TYPE_MONEY_BIND)
			char.MoneyBind += moneyAmount
			currencyChanges["moneyBind"] += moneyAmount
		case 2: // Money (client: Currency.TYPE_MONEY)
			char.Money += moneyAmount
			currencyChanges["money"] += moneyAmount
		case 3: // GoldBind (client: Currency.TYPE_GOLD_BIND)
			char.GoldBind += moneyAmount
			currencyChanges["goldBind"] += moneyAmount
		case 4: // Gold (client: Currency.TYPE_GOLD)
			char.Gold += moneyAmount
			currencyChanges["gold"] += moneyAmount
		default:
			if err := s.addCurrency(char, mType, int(moneyAmount)); err != nil {
				s.logger.Warn("Unsupported money type in quest reward", zap.Int("type", mType))
				char.MoneyBind += moneyAmount
				currencyChanges["moneyBind"] += moneyAmount
			}
		}
	}

	oldClassRank := char.ClassRank
	char.QuestN++
	if isClassQuest && char.ClassRank < classRankMax {
		char.ClassRank++
	}

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	var activePetReward map[string]interface{}
	activePetLeveledUp := false
	if totalExp > 0 && s.petService != nil {
		activePet, err := s.petService.GetActivePet(ctx, charID)
		if err != nil {
			s.logger.Warn("Failed to load active pet for quest exp reward",
				zap.Int64("character_id", charID),
				zap.Int("quest_id", questID),
				zap.Error(err))
		} else if activePet != nil {
			updatedPet, petLeveledUp, err := s.petService.GainExperience(ctx, charID, activePet.ID, totalExp)
			if err != nil {
				s.logger.Warn("Failed to grant quest exp reward to active pet",
					zap.Int64("character_id", charID),
					zap.Int64("pet_id", activePet.ID),
					zap.Int("quest_id", questID),
					zap.Error(err))
			} else if updatedPet != nil {
				activePetReward = updatedPet.ToDTO()
				activePetLeveledUp = petLeveledUp
			}
		}
	}

	rewards := map[string]interface{}{
		"exp":             totalExp,
		"money":           totalMoney, // Kept for legacy compatibility if needed
		"currencyChanges": currencyChanges,
		"items":           itemsToGive,
		"notifiedItems":   notifiedItems,
		"pets":            petsToGive,
		"levelUp":         leveledUp,
		"oldLevel":        oldLevel,
		"newLevel":        char.Level,
		"char":            char,
		"questN":          char.QuestN,
	}
	if activePetReward != nil {
		rewards["activePet"] = activePetReward
		rewards["activePetLevelUp"] = activePetLeveledUp
	}
	if char.ClassRank != oldClassRank {
		rewards["classRankUp"] = char.ClassRank
	}

	return rewards, nil
}

const classRankMax = 5

// AddCurrency adds amount to the specified currency type on the character
func (s *Service) addCurrency(c *character.Character, currencyType int, amount int) error {
	switch currencyType {
	case character.CurrencyArenaPoint:
		c.ArenaPoints += amount
	case character.CurrencyPetArena:
		c.PetArenaPoint += amount
	case character.CurrencyPetArenaAct:
		c.PetArenaActPoint += amount
	case character.CurrencyDogMedal:
		c.DogMedal += amount
	case character.CurrencyAchillesMedal:
		c.AchillesMedal += amount
	case character.CurrencyGroupPvpMedal:
		c.GroupPvpMedal += amount
	case character.CurrencyNewYearPoint:
		c.NewYearPoint += amount
	case character.CurrencyLunaPoint:
		c.LunaPoint += amount
	case character.CurrencyValentinePoint:
		c.ValentinePoint += amount
	case character.CurrencyLanternPoint:
		c.LanternPoint += amount
	case character.CurrencyLaborPoint:
		c.LaborPoint += amount
	case character.CurrencyFishingPoint:
		c.FishingPoint += amount
	case character.CurrencyQixiPoint:
		c.QixiPoint += amount
	case character.CurrencySummerPoint:
		c.SummerPoint += amount
	case character.CurrencyAnnualThird:
		c.AnnualThird += amount
	case character.CurrencyXmasPoint:
		c.XmasPoint += amount
	case character.CurrencyNationalDayPoint:
		c.NationalDayPoint += amount
	case character.CurrencyWorldCup:
		c.WorldCupPoint += amount
	case character.CurrencyGoldWorldCup:
		c.GoldWorldCup += amount
	case character.CurrencySummerGame:
		c.SummerGamePoint += amount
	case character.CurrencyAnniversary:
		c.AnniversaryPoint += amount
	case character.CurrencyDouble11:
		c.Double11Point += amount
	case character.CurrencyShowTime:
		c.ShowTimePoint += amount
	case character.CurrencyAnniConsume:
		c.AnniConsumePoint += amount
	case character.CurrencyShowTime2:
		c.ShowTime2Point += amount
	case character.CurrencyNormalContrib:
		c.GuildContrib += amount
	case character.CurrencyDonateContrib:
		c.DonateContrib += amount
	case character.CurrencyPetChip:
		c.PetChip += amount
	case character.CurrencyShopGold:
		c.ShopGold += amount
	case character.CurrencyMCBeans:
		c.MCBeans += amount
	default:
		return errors.New("unsupported currency type")
	}
	return nil
}

// Deprecated: use applyRewards instead
func (s *Service) calculateRewards(questID int) map[string]interface{} {
	return map[string]interface{}{
		"exp":   questID * 100,
		"money": questID * 50,
		"items": []map[string]interface{}{},
	}
}

// RefreshCallBoard consumes a Call Board refresh item and returns a new list of quests from DB.
// refreshType: 0=1330, 1=1331, 2=1332, 3=1333, 4=1335
func (s *Service) RefreshCallBoard(ctx context.Context, charID int64, refreshType int) (*pkgitem.Item, map[string]interface{}, error) {
	// Map refreshType to ItemTemplateID and TargetColor
	var itemID int
	var targetColor int

	switch refreshType {
	case 1:
		itemID = 1330 // Trắng
		targetColor = 0
	case 2:
		itemID = 1331 // Lục
		targetColor = 1
	case 3:
		itemID = 1332 // Lam
		targetColor = 2
	case 4:
		itemID = 1333 // Tím
		targetColor = 3
	case 5:
		itemID = 1335 // Cam
		targetColor = 4
	case 6:
		itemID = 731               // Random Refresh Item
		targetColor = rand.Intn(5) // Random 0-4
	default:
		// Fallback for 0 based legacy calls if any, map 0->1330 (Color 0)
		if refreshType == 0 {
			itemID = 1330
			targetColor = 0
		} else {
			return nil, nil, pkgerrors.ErrInvalidArgs
		}
	}

	// Check Limit
	if !s.checkDailyRefreshLimit(charID) {
		return nil, map[string]interface{}{
			"f": false,
			"t": 1, // Error type 1: Daily limit reached
		}, nil
	}

	// Consume Item
	itemConsumed, err := s.itemService.ConsumeItemByTemplateID(ctx, charID, itemID)
	if err != nil {
		return nil, nil, err
	}
	if itemConsumed == nil {
		// Item not found
		return nil, map[string]interface{}{
			"f": false,
			"t": 2, // Error type 2: Not enough items
		}, nil
	}

	// Increment Limit
	s.incrementDailyRefreshLimit(charID)

	// Find Matching Quests from DB
	if s.gameDataManager == nil {
		return nil, nil, errors.New("gameDataManager not set")
	}

	// Get Character for Level check
	// char, err := s.charRepo.FindByID(ctx, charID)
	// if err != nil {
	// 	return nil, nil, err
	// }

	allQuests := s.gameDataManager.GetAllQuests()
	candidateQuests := make([]*models.QuestTemplate, 0)

	// Get active quests to filter out
	activeQuests, err := s.questRepo.FindActiveByCharacter(ctx, charID)
	activeIDs := make(map[int]bool)
	if err == nil {
		for _, q := range activeQuests {
			activeIDs[q.QuestID] = true
		}
	}

	for _, q := range allQuests {
		// Filter by Level
		// if int(q.MinLevel) > char.Level || (q.MaxLevel > 0 && int(q.MaxLevel) < char.Level) {
		// 	continue
		// }

		// Filter by Color (matches targetColor)
		if int(q.Color) != targetColor {
			continue
		}

		// Filter by Active
		if activeIDs[int(q.ID)] {
			continue
		}

		// Filter by Type 9 (Call Board)
		if int(q.Type) != 9 {
			continue
		}

		candidateQuests = append(candidateQuests, q)
	}

	// Shuffle and pick 10
	rand.Shuffle(len(candidateQuests), func(i, j int) {
		candidateQuests[i], candidateQuests[j] = candidateQuests[j], candidateQuests[i]
	})

	limit := 10
	if len(candidateQuests) < limit {
		limit = len(candidateQuests)
	}

	questList := make([]map[string]interface{}, 0)
	cachedIDs := make([]int, 0)

	for i := 0; i < limit; i++ {
		q := candidateQuests[i]
		sIndex := i + 1
		cachedIDs = append(cachedIDs, int(q.ID))
		questList = append(questList, map[string]interface{}{
			"id":     int(q.ID),
			"qid":    strconv.Itoa(int(q.ID)),
			"state":  102, // ST_QUEST_CANTAKE
			"sIndex": sIndex,
			"c":      targetColor, // Use target color
			"data":   q.ToDTO(),
		})
	}

	// Save to Cache
	s.SaveCallBoardSession(charID, cachedIDs)

	s.logger.Info("RefreshCallBoard success",
		zap.Int("candidates_found", len(candidateQuests)),
		zap.Int("returned", limit),
		zap.Int("refresh_type", refreshType))

	return itemConsumed, map[string]interface{}{
		"f":    true,
		"n":    10,
		"data": questList,
	}, nil
}

func (s *Service) SaveCallBoardSession(charID int64, questIDs []int) {
	s.callBoardCache.Store(charID, questIDs)
}

func (s *Service) GetCallBoardQuestID(charID int64, sIndex int) (int, error) {
	val, ok := s.callBoardCache.Load(charID)
	if !ok {
		return 0, pkgerrors.ErrNotFound
	}
	ids, ok := val.([]int)
	if !ok {
		return 0, pkgerrors.ErrSystemError
	}
	// sIndex is 1-based
	if sIndex < 1 || sIndex > len(ids) {
		return 0, pkgerrors.ErrInvalidArgs
	}
	return ids[sIndex-1], nil
}

func (s *Service) LoadCallBoard(ctx context.Context, charID int64) ([]*models.QuestTemplate, error) {
	// 1. Check Cache
	val, ok := s.callBoardCache.Load(charID)
	if ok {
		ids, valid := val.([]int)
		if valid && len(ids) > 0 {
			// Get Active Quests to filter
			activeQuests, _ := s.questRepo.FindActiveByCharacter(ctx, charID)
			activeMap := make(map[int]bool)
			for _, q := range activeQuests {
				activeMap[q.QuestID] = true
			}

			// Load templates
			list := make([]*models.QuestTemplate, 0)
			if s.gameDataManager != nil {
				for _, id := range ids {
					if activeMap[id] {
						continue
					}
					tpl := s.gameDataManager.GetQuest(id)
					if tpl != nil {
						list = append(list, tpl)
					}
				}
			}
			// Only return if we found templates, otherwise fallback to regenerate
			// Note: If all cached quests are active, list is empty. Fallback will generate new/empty list logic.
			// But usually we just return what remains.
			if len(list) > 0 {
				return list, nil
			}
			// If Cache exists but all taken -> Return empty list to force refresh or empty view?
			// If we return nil, it falls back to Generate New.
			// CallBoard Logic: If you take all quests, do you get new ones immediately?
			// Usually No. You wait for refresh.
			// So returning empty list is correct behavior for session.
			// But code below falls back if return is nil/empty?
			// The original code returned list if len > 0. If 0, it falls through to Generate New.
			// This effectively AUTO-REFRESHES if you take all cached quests.
			// Is this desired?
			// If yes, keep it. If no, return empty list.
			// Let's assume Auto-fill is nice feature for now, or keep existing behavior.
			// BUT: Generate New will likely pick the SAME quests if they are the only ones available and not active check fails?
			// Actually GenerateNew calls GetAvailable... which checks Active. So it won't pick them again.
			// It will pick DIFFERENT quests.
			// If no different quests, it returns empty.
			// So falling through is SAFE.
		}
	}

	// 2. Generate New (Fallback)
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	list, err := s.GetAvailableQuestsForCallBoard(ctx, charID, char.Level)
	if err != nil {
		return nil, err
	}

	// Save to Cache
	ids := make([]int, 0, len(list))
	for _, q := range list {
		ids = append(ids, int(q.ID))
	}
	s.SaveCallBoardSession(charID, ids)

	return list, nil
}

func (s *Service) checkDailyRefreshLimit(charID int64) bool {
	now := time.Now().Format("2006-01-02")
	val, ok := s.refreshCounts.Load(charID)
	if !ok {
		return true
	}
	counter := val.(*dailyCounter)
	if counter.date != now {
		return true // New day, allow
	}
	return counter.count < 4
}

func (s *Service) incrementDailyRefreshLimit(charID int64) {
	now := time.Now().Format("2006-01-02")
	val, ok := s.refreshCounts.Load(charID)
	var counter *dailyCounter
	if !ok {
		counter = &dailyCounter{date: now, count: 0}
		s.refreshCounts.Store(charID, counter)
	} else {
		counter = val.(*dailyCounter)
		if counter.date != now {
			counter.date = now
			counter.count = 0
		}
	}
	counter.count++
}
