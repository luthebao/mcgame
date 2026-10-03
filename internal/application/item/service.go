// Open-sourced by BaoLT

// Item service handles inventory and equipment use cases.
// Manages item operations: equip, unequip, move, use, drop, and repair.
// Supports stacking, partial moves, and bag sorting.
package item

import (
	"context"
	crand "crypto/rand"
	"fmt"
	"math/big"
	"sort"
	"strconv"
	"strings"
	"time"

	appbuff "mcgame-server/internal/application/buff"
	apptitle "mcgame-server/internal/application/title"
	domainbuff "mcgame-server/internal/domain/buff"
	"mcgame-server/internal/domain/character"
	domainelement "mcgame-server/internal/domain/element"
	"mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type QuestService interface {
	OnItemCollected(ctx context.Context, charID int64, itemID int, amount int) ([]*quest.QuestProgress, error)
}

type PetContractService interface {
	ContractPets(ctx context.Context, charID int64, templateIDs []int) ([]*domainpet.Pet, error)
	ContractPetsWithQuality(ctx context.Context, charID int64, templateIDs []int, quality int) ([]*domainpet.Pet, error)
}

type CharacterBonusProvider interface {
	AggregateCharacterStatBonuses(ctx context.Context, charID int64) character.EquipmentStatBonuses
}

type TitleGrantService interface {
	GrantTitle(ctx context.Context, characterID int64, titleID int) (apptitle.GrantResult, error)
}

type SkillAwardService interface {
	HasSkill(ctx context.Context, charID int64, skillID int) (bool, error)
	LearnSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error)
}

type BuffAwardService interface {
	AddOrRefresh(ctx context.Context, characterID int64, req appbuff.AddRequest) (*domainbuff.Buff, error)
}

type Service struct {
	itemRepo            item.Repository
	charRepo            character.Repository
	questService        QuestService
	petService          PetContractService
	titleService        TitleGrantService
	skillService        SkillAwardService
	buffService         BuffAwardService
	medalGranter        MedalGranter
	charBonusProvider   CharacterBonusProvider
	extraBonusProviders []CharacterBonusProvider
	gameDataRec         *gamedata.Manager
	logger              *zap.Logger
	effectHandlers      []ItemEffectHandler
	typeHandlers        map[int]ItemEffectHandler
	awardHandler        *awardEffectHandler
	fallbackHandlers    []ItemEffectHandler
}

type RepairResult struct {
	Cost     int64
	NewMoney int64
}

type InventoryChange struct {
	Item    *item.Item
	Deleted bool
}

type qualityRolledPropLine struct {
	propType  int
	propValue int
}

func NewService(itemRepo item.Repository, logger *zap.Logger) *Service {
	return &Service{
		itemRepo: itemRepo,
		logger:   logger,
	}
}

func (s *Service) SetGameDataManager(mgr *gamedata.Manager) {
	s.gameDataRec = mgr
	s.initEffectHandlers()
}

func (s *Service) SetCharacterBonusProvider(provider CharacterBonusProvider) {
	s.charBonusProvider = provider
}

// AddCharacterBonusProvider registers an additional bonus provider whose output
// is merged into AggregateEquipmentStats after equipment and the primary
// CharacterBonusProvider. Use this for orthogonal bonus sources like the buff
// system.
func (s *Service) AddCharacterBonusProvider(provider CharacterBonusProvider) {
	if provider == nil {
		return
	}
	s.extraBonusProviders = append(s.extraBonusProviders, provider)
}

func (s *Service) initEffectHandlers() {
	award := &awardEffectHandler{gameData: s.gameDataRec, itemService: s}
	s.awardHandler = award

	giftBox := &giftBoxEffectHandler{gameData: s.gameDataRec}
	petBag := &petBagEffectHandler{service: s}
	questItem := &questItemEffectHandler{
		gameData:       s.gameDataRec,
		giftBoxHandler: giftBox,
		awardHandler:   award,
		petBagHandler:  petBag,
		service:        s,
	}

	s.typeHandlers = map[int]ItemEffectHandler{
		500: &scrollEffectHandler{},
		501: &potionEffectHandler{},
		502: &foodEffectHandler{},
		503: &gemSocketHandler{itemService: s},
		504: &starStoneEffectHandler{itemService: s},
		505: &skillBookEffectHandler{},
		506: &creBookEffectHandler{itemService: s},
		507: &petFuncHandler{itemService: s},
		508: questItem,
		509: questItem,
		512: &petEquipLevelHandler{itemService: s},
		513: &petEquipColorHandler{itemService: s},
		516: &formulaHandler{},
		520: &targetItemHandler{itemService: s},
		550: questItem,
	}

	phase4Stubs := map[int]string{
		510: "Sửa Pháp Bảo",
		511: "Reset Kỹ Năng Pháp Bảo",
		514: "Pháp Bảo Biến Hình",
		515: "Dụng Cụ Câu Cá",
		517: "Túi Tạm",
		518: "Nâng Cấp Cánh",
		519: "Reset Thuộc Tính Pháp Bảo",
		521: "Kỹ Năng Tiên Nữ",
		522: "Pháp Bảo Cấp 8",
		523: "Thăng Hoa",
		524: "Phong Ấn",
		525: "Vật Phẩm Tùy Chỉnh",
		527: "Kỳ Lân Các",
		551: "Thêm Sao",
		552: "Tốc Độ Sao",
	}
	for typeID, name := range phase4Stubs {
		s.typeHandlers[typeID] = &stubEffectHandler{typeName: name}
	}

	s.fallbackHandlers = []ItemEffectHandler{
		&boxEffectHandler{itemService: s},
		&walletEffectHandler{},
		&buffEffectHandler{},
		&defaultEffectHandler{},
	}

	s.effectHandlers = nil
}

func (s *Service) SetCharacterRepository(repo character.Repository) {
	s.charRepo = repo
}

func (s *Service) SetQuestService(qs QuestService) {
	s.questService = qs
}

func (s *Service) SetPetService(ps PetContractService) {
	s.petService = ps
}

func (s *Service) SetTitleService(service TitleGrantService) {
	s.titleService = service
}

func (s *Service) SetSkillService(service SkillAwardService) {
	s.skillService = service
}

func (s *Service) SetBuffService(service BuffAwardService) {
	s.buffService = service
}

func (s *Service) SetMedalGranter(g MedalGranter) {
	s.medalGranter = g
}

func (s *Service) GetPetService() PetContractService {
	return s.petService
}

func (s *Service) ConsumeItemByID(ctx context.Context, charID int64, itemID int64) error {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return err
	}
	if it == nil || it.CharacterID != charID {
		return pkgerrors.ErrItemNotOwned
	}
	it.StackCount--
	if it.StackCount <= 0 {
		return s.itemRepo.Delete(ctx, it.ID)
	}
	return s.itemRepo.Update(ctx, it)
}

func (s *Service) ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*item.Item, bool, error) {
	if count <= 0 {
		return nil, false, pkgerrors.ErrInvalidInput
	}
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, false, err
	}
	if it == nil || it.CharacterID != charID {
		return nil, false, pkgerrors.ErrItemNotOwned
	}
	if it.StackCount < count {
		return nil, false, pkgerrors.ErrInsufficientFunds
	}
	it.StackCount -= count
	if it.StackCount <= 0 {
		if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
			return nil, false, err
		}
		return it, true, nil
	}
	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, false, err
	}
	return it, false, nil
}

func (s *Service) ConsumeItemByTemplateIDs(ctx context.Context, charID int64, templateIDs []int) (*item.Item, int, error) {
	if len(templateIDs) == 0 {
		return nil, 0, nil
	}

	items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return nil, 0, err
	}

	byTemplate := make(map[int]*item.Item, len(items))
	for _, it := range items {
		if _, exists := byTemplate[it.TemplateID]; !exists {
			byTemplate[it.TemplateID] = it
		}
	}

	for _, templateID := range templateIDs {
		target, ok := byTemplate[templateID]
		if !ok {
			continue
		}

		target.StackCount--
		if target.StackCount <= 0 {
			if err := s.itemRepo.Delete(ctx, target.ID); err != nil {
				return nil, 0, err
			}
			target.StackCount = 0
		} else {
			if err := s.itemRepo.UpdateStack(ctx, target.ID, target.StackCount); err != nil {
				return nil, 0, err
			}
		}

		s.logger.Info("Item consumed by template ID",
			zap.Int64("character_id", charID),
			zap.Int("template_id", templateID),
			zap.Int64("item_id", target.ID),
			zap.Int("remaining_stack", target.StackCount))

		return target, templateID, nil
	}

	return nil, 0, nil
}

func (s *Service) getMaxSlots(ctx context.Context, charID int64, slotType item.SlotType) int {
	switch slotType {
	case item.SlotTypeBag:
		if s.charRepo != nil {
			if ch, err := s.charRepo.FindByID(ctx, charID); err == nil && ch.BagSlotNum > 0 {
				return ch.MaxBagSlots()
			}
		}
		return item.DefaultBagSlots
	case item.SlotTypeBank:
		if s.charRepo != nil {
			if ch, err := s.charRepo.FindByID(ctx, charID); err == nil && ch.BankSlotNum > 0 {
				return ch.MaxBankSlots()
			}
		}
		return item.DefaultBankSlots
	case item.SlotTypeTempBag:
		return item.DefaultTempBagSlots
	case item.SlotTypeQuestBag:
		return item.DefaultQuestBagSlots
	case item.SlotTypePetItemBag:
		return item.DefaultPetItemBagSlots
	default:
		return item.DefaultBagSlots
	}
}

const BagLowSlotThreshold = 10

func (s *Service) GetBagRemainingSlots(ctx context.Context, charID int64) (int, error) {
	maxSlots := s.getMaxSlots(ctx, charID, item.SlotTypeBag)
	count, err := s.itemRepo.CountBySlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return maxSlots, err
	}
	return maxSlots - count, nil
}

func (s *Service) GetEquipmentTemplate(templateID int) *models.EquiptTemplateTemplate {
	if s.gameDataRec == nil {
		return nil
	}
	return s.gameDataRec.GetEquipment(templateID)
}

func (s *Service) GetItemTemplate(templateID int) *models.ItemTemplateTemplate {
	if s.gameDataRec == nil {
		return nil
	}
	return s.gameDataRec.GetItem(templateID)
}

func (s *Service) GetSlotConfig() *item.SlotConfig {
	return item.DefaultSlotConfig()
}

func (s *Service) GetInventory(ctx context.Context, charID int64) ([]*item.Item, error) {
	items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return nil, err
	}

	s.logger.Debug("Retrieved inventory",
		zap.Int64("character_id", charID),
		zap.Int("count", len(items)))

	return items, nil
}

func (s *Service) CountCarriedItemsByTemplateID(ctx context.Context, charID int64, templateID int) (int, error) {
	return s.CountCarriedItemsByTemplate(ctx, charID, templateID, 0, -1)
}

// CountCarriedItemsByTemplate counts inventory + quest-bag items by template
// id, optionally filtered by Flash table id (TBL_ITEM_TEMPLATE=29 /
// TBL_EQUIPT_TEMPLATE=19) and by exact colorCode. Pass tableType=0 to skip
// the table filter, colorCode<0 to skip the color filter.
func (s *Service) CountCarriedItemsByTemplate(ctx context.Context, charID int64, templateID int, tableType int, colorCode int) (int, error) {
	items, err := s.findCarriedItemsByTemplate(ctx, charID, templateID, tableType, colorCode)
	if err != nil {
		return 0, err
	}

	total := 0
	for _, it := range items {
		total += it.StackCount
	}

	return total, nil
}

func (s *Service) ConsumeCarriedItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) ([]InventoryChange, error) {
	return s.ConsumeCarriedItemsByTemplate(ctx, charID, templateID, count, 0, -1)
}

// ConsumeCarriedItemsByTemplate consumes `count` units of items matching the
// supplied template id and optional Flash table id / colorCode filters.
func (s *Service) ConsumeCarriedItemsByTemplate(ctx context.Context, charID int64, templateID int, count int, tableType int, colorCode int) ([]InventoryChange, error) {
	if count <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	items, err := s.findCarriedItemsByTemplate(ctx, charID, templateID, tableType, colorCode)
	if err != nil {
		return nil, err
	}

	available := 0
	for _, it := range items {
		available += it.StackCount
	}
	if available < count {
		return nil, pkgerrors.ErrInsufficientFunds
	}

	remaining := count
	changes := make([]InventoryChange, 0)
	for _, it := range items {
		if remaining <= 0 {
			break
		}

		if it.StackCount <= remaining {
			remaining -= it.StackCount
			if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
				return nil, err
			}
			changes = append(changes, InventoryChange{
				Item:    it,
				Deleted: true,
			})
			continue
		}

		it.StackCount -= remaining
		remaining = 0
		if err := s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount); err != nil {
			return nil, err
		}
		changes = append(changes, InventoryChange{
			Item:    it,
			Deleted: false,
		})
	}

	return changes, nil
}

func (s *Service) findCarriedItemsByTemplateID(ctx context.Context, charID int64, templateID int) ([]*item.Item, error) {
	return s.findCarriedItemsByTemplate(ctx, charID, templateID, 0, -1)
}

// GetItemByTemplateID returns the first bag or quest-bag item matching
// templateID for charID, or nil if none is carried.
func (s *Service) GetItemByTemplateID(ctx context.Context, charID int64, templateID int) (*item.Item, error) {
	items, err := s.findCarriedItemsByTemplateID(ctx, charID, templateID)
	if err != nil || len(items) == 0 {
		return nil, err
	}
	return items[0], nil
}

func (s *Service) findCarriedItemsByTemplate(ctx context.Context, charID int64, templateID int, tableType int, colorCode int) ([]*item.Item, error) {
	questItems, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeQuestBag)
	if err != nil {
		return nil, err
	}
	bagItems, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return nil, err
	}

	items := make([]*item.Item, 0)
	for _, it := range append(questItems, bagItems...) {
		if it.TemplateID != templateID {
			continue
		}
		if tableType != 0 && !itemMatchesTableType(it, tableType) {
			continue
		}
		if colorCode >= 0 && it.ColorCode != colorCode {
			continue
		}
		items = append(items, it)
	}

	sort.Slice(items, func(i, j int) bool {
		if items[i].SlotType != items[j].SlotType {
			return items[i].SlotType > items[j].SlotType
		}
		return items[i].SlotIndex < items[j].SlotIndex
	})

	return items, nil
}

// itemMatchesTableType compares an inventory item's domain ItemType against
// the Flash TBL_* table id used in TBL_QUEST_REQUIRE / TBL_QUEST_PRE.
// TBL_ITEM_TEMPLATE (29) covers Consumable / Material / Quest item kinds;
// TBL_EQUIPT_TEMPLATE (19) covers Equipment instances.
func itemMatchesTableType(it *item.Item, tableType int) bool {
	switch tableType {
	case 19:
		return it.ItemType == item.ItemTypeEquipment
	case 29:
		return it.ItemType == item.ItemTypeConsumable ||
			it.ItemType == item.ItemTypeMaterial ||
			it.ItemType == item.ItemTypeQuest
	}
	return true
}

func (s *Service) GetEquipment(ctx context.Context, charID int64) ([]*item.Item, error) {
	items, err := s.itemRepo.FindEquipped(ctx, charID)
	if err != nil {
		return nil, err
	}

	return items, nil
}

func (s *Service) BuildEquipActiveList(ctx context.Context, charID int64) map[string]interface{} {
	result := make(map[string]interface{}, 22)
	for sid := 1; sid <= 22; sid++ {
		result[strconv.Itoa(sid)] = false
	}

	if s == nil || s.itemRepo == nil || s.gameDataRec == nil {
		return result
	}

	equipment, err := s.GetEquipment(ctx, charID)
	if err != nil {
		s.logger.Warn("BuildEquipActiveList: failed to get equipment",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return result
	}

	equippedByTemplateID := make(map[int]*item.Item, len(equipment))
	for _, eq := range equipment {
		equippedByTemplateID[eq.TemplateID] = eq
	}

	for _, eq := range equipment {
		tpl := s.GetEquipmentTemplate(eq.TemplateID)
		if tpl == nil {
			continue
		}

		activeEquipID := int(tpl.ActiveEquipID)
		if activeEquipID <= 0 {
			continue
		}

		activePropNum := int(tpl.ActivePropNum)
		if activePropNum <= 0 {
			activePropNum = equipPropertyInt(eq.Properties, "activePropNum")
		}
		if activePropNum <= 0 {
			continue
		}

		partner, partnerEquipped := equippedByTemplateID[activeEquipID]
		if !partnerEquipped {
			continue
		}

		myElement := equipPropertyInt(eq.Properties, "element")
		partnerElement := equipPropertyInt(partner.Properties, "element")
		result[strconv.Itoa(eq.CalculateSID())] = myElement > 0 && myElement == partnerElement
	}

	return result
}

func equipPropertyInt(props map[string]interface{}, key string) int {
	if props == nil {
		return 0
	}
	val, ok := props[key]
	if !ok {
		return 0
	}
	switch v := val.(type) {
	case int:
		return v
	case int64:
		return int(v)
	case float64:
		return int(v)
	default:
		return 0
	}
}

func (s *Service) GetAllItems(ctx context.Context, charID int64) ([]*item.Item, error) {
	return s.itemRepo.FindByCharacterID(ctx, charID)
}

func (s *Service) GetItemInSlot(ctx context.Context, charID int64, slotType item.SlotType, slotIndex int) (*item.Item, error) {
	return s.itemRepo.FindBySlot(ctx, charID, slotType, slotIndex)
}

func (s *Service) GetItemByID(ctx context.Context, charID int64, itemID int64) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}
	return it, nil
}

// IsEquippedBySlotID checks if an item at the given slot ID is currently equipped
// Returns true if the item exists and is in an equipped slot, false otherwise
func (s *Service) IsEquippedBySlotID(ctx context.Context, charID int64, slotID int64) (bool, error) {
	// Try to find item by ID first (sid might be item ID)
	it, err := s.itemRepo.FindByID(ctx, slotID)
	if err == nil && it != nil {
		// Found by ID, check if it belongs to character and is equipped
		if it.CharacterID == charID && it.SlotType == item.SlotTypeEquipped {
			return true, nil
		}
		// Item exists but not equipped or not owned by character
		return false, nil
	}

	// If not found by ID, try to find by slot index in bag
	// (sid might be slot index in bag)
	it, err = s.itemRepo.FindBySlot(ctx, charID, item.SlotTypeBag, int(slotID))
	if err != nil {
		// Item not found in bag slot either
		return false, nil
	}

	// Found item in bag, check if it's also equipped (shouldn't be, but check anyway)
	// Actually, if we found it in bag, it's not equipped
	// But we should check if there's an equipped version of this item
	equippedItems, err := s.itemRepo.FindEquipped(ctx, charID)
	if err != nil {
		return false, nil
	}

	// Check if any equipped item has the same template ID (same item type)
	for _, equipped := range equippedItems {
		if equipped.TemplateID == it.TemplateID {
			return true, nil
		}
	}

	return false, nil
}

func (s *Service) EquipItem(ctx context.Context, charID int64, itemID int64, equipSlot item.EquipSlot) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}

	if !it.IsEquipment() {
		return nil, pkgerrors.ErrCannotEquip
	}

	if it.IsBroken() {
		return nil, pkgerrors.ErrItemBroken
	}

	// For auto-selection (slot -1)
	if equipSlot < 0 {
		tpl := s.gameDataRec.GetEquipment(it.TemplateID)
		if tpl == nil {
			return nil, pkgerrors.ErrCannotEquip
		}
		// Map template position to EquipSlot (Position 1-indexed)
		equipSlot = item.EquipSlot(int(tpl.Position) - 1)

		// Special handling for Ring (Position 8 -> Slots 7 or 8)
		if equipSlot == item.EquipSlotRing1 {
			existing1, _ := s.itemRepo.FindBySlot(ctx, charID, item.SlotTypeEquipped, 7)
			if existing1 != nil {
				existing2, _ := s.itemRepo.FindBySlot(ctx, charID, item.SlotTypeEquipped, 8)
				if existing2 == nil {
					equipSlot = item.EquipSlot(8)
				}
			}
		}
	}

	existing, err := s.itemRepo.FindBySlot(ctx, charID, item.SlotTypeEquipped, int(equipSlot))
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		return nil, err
	}

	if existing != nil {
		maxBag := s.getMaxSlots(ctx, charID, item.SlotTypeBag)
		emptySlot, err := s.itemRepo.FindFirstEmptySlot(ctx, charID, item.SlotTypeBag, maxBag)
		if err != nil {
			return nil, err
		}

		if err := s.itemRepo.MoveItem(ctx, existing.ID, item.SlotTypeBag, emptySlot); err != nil {
			return nil, err
		}
		existing.SlotType = item.SlotTypeBag
		existing.SlotIndex = emptySlot
	}

	if err := s.itemRepo.MoveItem(ctx, itemID, item.SlotTypeEquipped, int(equipSlot)); err != nil {
		return nil, err
	}

	s.logger.Info("Item equipped",
		zap.Int64("character_id", charID),
		zap.Int64("item_id", itemID),
		zap.Int("equip_slot", int(equipSlot)))

	return existing, nil
}

func (s *Service) UnequipItem(ctx context.Context, charID int64, equipSlot item.EquipSlot) (*item.Item, error) {
	it, err := s.itemRepo.FindBySlot(ctx, charID, item.SlotTypeEquipped, int(equipSlot))
	if err != nil {
		return nil, err
	}

	maxBag := s.getMaxSlots(ctx, charID, item.SlotTypeBag)
	emptySlot, err := s.itemRepo.FindFirstEmptySlot(ctx, charID, item.SlotTypeBag, maxBag)
	if err != nil {
		return nil, err
	}

	if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeBag, emptySlot); err != nil {
		return nil, err
	}

	it.SlotType = item.SlotTypeBag
	it.SlotIndex = emptySlot

	s.logger.Info("Item unequipped",
		zap.Int64("character_id", charID),
		zap.Int64("item_id", it.ID),
		zap.Int("equip_slot", int(equipSlot)),
		zap.Int("bag_slot", emptySlot))

	return it, nil
}

func (s *Service) MoveItem(ctx context.Context, charID int64, itemID int64, toSlotType item.SlotType, toSlotIndex int) error {
	s.logger.Info("MoveItem: Start",
		zap.Int64("charID", charID),
		zap.Int64("itemID", itemID),
		zap.Int("toSlotIndex", toSlotIndex))

	// 1. Get Source Item
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return err
	}

	if it.CharacterID != charID {
		return pkgerrors.ErrItemNotOwned
	}

	// 2. Validate move destination rules (e.g. TempBag restrictions)
	if err := s.validateMove(ctx, it, toSlotType, toSlotIndex); err != nil {
		return err
	}

	// 3. Check Destination Slot
	existing, err := s.itemRepo.FindBySlot(ctx, charID, toSlotType, toSlotIndex)
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		s.logger.Error("MoveItem: FindBySlot error", zap.Error(err))
		return err
	}

	// 4. Handle Occupied Destination
	if existing != nil {
		s.logger.Info("MoveItem: Destination occupied",
			zap.Int64("existingID", existing.ID),
			zap.Int("it_TemplateID", it.TemplateID), zap.Bool("it_IsBound", it.IsBound), zap.Int("it_SlotType", int(it.SlotType)),
			zap.Int("ex_TemplateID", existing.TemplateID), zap.Bool("ex_IsBound", existing.IsBound), zap.Int("ex_SlotType", int(existing.SlotType)))

		// Case A: Stacking
		if it.CanStack(existing) {
			newCount := existing.StackCount + it.StackCount
			if s.gameDataRec != nil {
				tpl := s.gameDataRec.GetItem(existing.TemplateID)
				if tpl != nil {
					maxStack := int(tpl.StackMax)
					if maxStack > 0 && newCount > maxStack {
						s.logger.Warn("MoveItem: Stack limit exceeded",
							zap.Int("newCount", newCount),
							zap.Int("maxStack", maxStack))
						return pkgerrors.ErrCannotStack
					}
				}
			}

			if err := s.itemRepo.UpdateStack(ctx, existing.ID, newCount); err != nil {
				return err
			}
			existing.StackCount = newCount
			return s.itemRepo.Delete(ctx, it.ID)
		}

		// Case B: Swapping
		srcSlotType := it.SlotType
		srcSlotIndex := it.SlotIndex

		s.logger.Info("MoveItem: Swapping items",
			zap.Int64("srcID", it.ID), zap.Int("srcSlot", srcSlotIndex),
			zap.Int64("destID", existing.ID), zap.Int("destSlot", existing.SlotIndex))

		// Step 1: Move 'it' to Temp (-1)
		tempSlot := -1
		if err := s.itemRepo.MoveItem(ctx, it.ID, srcSlotType, tempSlot); err != nil {
			return pkgerrors.Wrap(err, "Swap Step 1 Failed")
		}

		// Step 2: Move 'existing' to older source slot of 'it'
		// WE USE 'srcSlotIndex' HERE, NOT 'it.SlotIndex' (which might be -1 now)
		if err := s.itemRepo.MoveItem(ctx, existing.ID, srcSlotType, srcSlotIndex); err != nil {
			// Try to rollback Step 1 (move it back to source) - best effort
			_ = s.itemRepo.MoveItem(ctx, it.ID, srcSlotType, srcSlotIndex)
			return pkgerrors.Wrap(err, "Swap Step 2 Failed")
		}

		// Step 3: Move 'it' from Temp to Dest (toSlotIndex)
		if err := s.itemRepo.MoveItem(ctx, it.ID, toSlotType, toSlotIndex); err != nil {
			return pkgerrors.Wrap(err, "Swap Step 3 Failed")
		}

		s.logger.Info("MoveItem: Swap complete")
		return nil
	}

	// 5. Handle Empty Destination (Simple Move)
	s.logger.Info("MoveItem: Destination empty, moving directly")

	start := time.Now()
	if err := s.itemRepo.MoveItem(ctx, itemID, toSlotType, toSlotIndex); err != nil {
		s.logger.Error("MoveItem: DB update failed", zap.Error(err), zap.Duration("duration", time.Since(start)))
		return err
	}
	s.logger.Info("MoveItem: DB update success", zap.Duration("duration", time.Since(start)))

	return nil
}

func (s *Service) validateMove(ctx context.Context, it *item.Item, toSlotType item.SlotType, toSlotIndex int) error {
	if toSlotType != item.SlotTypeTempBag {
		return nil
	}

	if s.gameDataRec == nil {
		s.logger.Warn("validateMove: gameDataRec is nil, skipping validation")
		return nil
	}

	// Normal Temp Bag (Slots 0-99)
	if toSlotIndex < 100 {
		tpl := s.gameDataRec.GetItem(it.TemplateID)
		if tpl != nil {
			// ITEM_KIND_MATERIAL = 6, ITEM_KIND_FEATHER = 14
			// ITEM_TYPE_JEWEL = 503, ITEM_TYPE_STAR_SPEED = 552
			if tpl.Kind == 6 || tpl.Kind == 14 || tpl.Type == 503 || tpl.Type == 552 {
				return nil
			}
		}
		// Also check equipment template (though usually not allowed in normal temp bag)
		return pkgerrors.ErrInvalidTempBagItem
	}

	// MX Temp Bag (Slots 100+)
	// Allow Ma Tam items:
	// 1. By ID Range (maintain existing)
	// 2. By specific high-tier IDs found in SQL (2243, 2877, 3467, 3471, etc)
	// 3. By Item Type 506 (Ma Tam)
	if (it.TemplateID >= 5375 && it.TemplateID <= 5697) || (it.TemplateID >= 5770 && it.TemplateID <= 5841) {
		return nil
	}

	// Check template for type 506 if not in ID range
	tpl := s.gameDataRec.GetItem(it.TemplateID)
	if tpl != nil && tpl.Type == 506 {
		return nil
	}

	return pkgerrors.ErrInvalidTempBagItem
}

func (s *Service) MoveItemPartial(ctx context.Context, charID int64, itemID int64, toSlotType item.SlotType, toSlotIndex int, count int) (*item.Item, *item.Item, error) {
	s.logger.Info("MoveItemPartial: Start",
		zap.Int64("charID", charID),
		zap.Int64("itemID", itemID),
		zap.Int("toSlotIndex", toSlotIndex),
		zap.Int("count", count))

	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, nil, err
	}

	if it.CharacterID != charID {
		return nil, nil, pkgerrors.ErrItemNotOwned
	}

	// Validate move destination rules
	if err := s.validateMove(ctx, it, toSlotType, toSlotIndex); err != nil {
		return nil, nil, err
	}

	if !it.IsStackable() || it.StackCount < count {
		return nil, nil, pkgerrors.ErrCannotStack
	}

	existing, err := s.itemRepo.FindBySlot(ctx, charID, toSlotType, toSlotIndex)
	if err != nil && !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		s.logger.Error("MoveItemPartial: FindBySlot error", zap.Error(err))
		return nil, nil, err
	}

	// Prevent drag-to-self
	if existing != nil && existing.ID == it.ID {
		s.logger.Info("MoveItemPartial: Drag to self, no-op")
		return it, it, nil
	}

	var destItem *item.Item

	if existing != nil {
		s.logger.Info("MoveItemPartial: Slot occupied, merging",
			zap.Int64("existingID", existing.ID),
			zap.Int("existingStack", existing.StackCount))

		if it.CanStack(existing) {
			// Calculate new value locally
			newStack := existing.StackCount + count

			// 1. Check Max Stack
			if s.gameDataRec != nil {
				tpl := s.gameDataRec.GetItem(existing.TemplateID)
				if tpl != nil {
					maxStack := int(tpl.StackMax)
					if maxStack > 0 && newStack > maxStack { // Only check if MaxStack is defined (>0)
						s.logger.Warn("MoveItemPartial: Stack limit exceeded",
							zap.Int("newStack", newStack),
							zap.Int("maxStack", maxStack))
						return nil, nil, pkgerrors.ErrCannotStack
					}
				}
			}

			// Update DB Dest
			if err := s.itemRepo.UpdateStack(ctx, existing.ID, newStack); err != nil {
				return nil, nil, err
			}
			// Update local pointer
			existing.StackCount = newStack
			destItem = existing
		} else {
			return nil, nil, pkgerrors.ErrSlotOccupied
		}
	} else {
		// New Item logic (Splitting)
		newItem := item.NewItem(charID, it.TemplateID, it.ItemType, toSlotType, toSlotIndex)
		newItem.StackCount = count
		newItem.IsBound = it.IsBound

		if err := s.itemRepo.Create(ctx, newItem); err != nil {
			// Handle race condition: Unique constraint violation (23505)
			if strings.Contains(err.Error(), "23505") {
				s.logger.Warn("MoveItemPartial: Race condition (23505), fallback to stack",
					zap.Int64("charID", charID),
					zap.Int("slot", toSlotIndex))

				existingRace, errFetch := s.itemRepo.FindBySlot(ctx, charID, toSlotType, toSlotIndex)
				if errFetch != nil {
					return nil, nil, pkgerrors.ErrSlotOccupied
				}

				if it.CanStack(existingRace) {
					newStack := existingRace.StackCount + count
					if err := s.itemRepo.UpdateStack(ctx, existingRace.ID, newStack); err != nil {
						return nil, nil, err
					}
					existingRace.StackCount = newStack
					destItem = existingRace
				} else {
					return nil, nil, pkgerrors.ErrSlotOccupied
				}
			} else {
				s.logger.Error("MoveItemPartial: Create failed", zap.Error(err))
				return nil, nil, err
			}
		} else {
			s.logger.Info("MoveItemPartial: Create successful", zap.Int64("newItemID", newItem.ID))
			destItem = newItem
		}
	}

	newSourceStack := it.StackCount - count
	s.logger.Info("MoveItemPartial: Updating Source",
		zap.Int64("srcID", it.ID),
		zap.Int("oldStack", it.StackCount),
		zap.Int("newStack", newSourceStack))

	it.StackCount = newSourceStack // Update local object

	if newSourceStack <= 0 {
		if err := s.itemRepo.Delete(ctx, itemID); err != nil {
			s.logger.Error("MoveItemPartial: Delete Source Failed", zap.Error(err))
			return nil, nil, err
		}
	} else {
		if err := s.itemRepo.UpdateStack(ctx, itemID, newSourceStack); err != nil {
			s.logger.Error("MoveItemPartial: Update Source Failed", zap.Error(err))
			return nil, nil, err
		}
	}

	return it, destItem, nil
}

func (s *Service) DropItem(ctx context.Context, charID int64, itemID int64) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}

	if err := s.itemRepo.Delete(ctx, itemID); err != nil {
		return nil, err
	}

	s.logger.Info("Item dropped",
		zap.Int64("character_id", charID),
		zap.Int64("item_id", itemID),
		zap.Int("template_id", it.TemplateID))

	return it, nil
}

func (s *Service) UpdateStack(ctx context.Context, itemID int64, stackCount int) error {
	return s.itemRepo.UpdateStack(ctx, itemID, stackCount)
}

func (s *Service) UseItem(ctx context.Context, char *character.Character, itemID int64, uctx *UseContext) (*item.Item, map[string]interface{}, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, nil, err
	}

	if it.CharacterID != char.ID {
		return nil, nil, pkgerrors.ErrItemNotOwned
	}

	// Handle Equipment (Auto-Equip)
	if it.IsEquipment() {
		displaced, err := s.EquipItem(ctx, char.ID, itemID, -1) // -1 for auto-slot
		if err != nil {
			return nil, nil, err
		}

		result := map[string]interface{}{
			"equipped": true,
		}
		if displaced != nil {
			result["displaced"] = displaced
		}

		// Note: We return the item itself. It's now moved to an equipment slot.
		return it, result, nil
	}

	// Note: Client handles quantity dialogs and gift bag selection locally
	// ... (rest of the code for consumables)
	// Get Template
	var tpl *models.ItemTemplateTemplate
	if s.gameDataRec != nil {
		tpl = s.gameDataRec.GetItem(it.TemplateID)
	}

	if tpl == nil {
		// Fallback for logic without template, strictly check generic consumable flag
		if !it.IsConsumable() {
			return nil, nil, pkgerrors.ErrCannotUseItem
		}
	} else {
		// strict check based on template
		// Check Level Requirement
		if char.Level < int(tpl.ReqLevel) {
			return nil, nil, pkgerrors.ErrInsufficientLevel
		}
	}

	result := make(map[string]interface{})
	if tpl != nil {
		if uctx == nil {
			uctx = &UseContext{}
		}
		if uctx.EffectiveMaxHP == 0 && uctx.EffectiveMaxMP == 0 {
			uctx.EffectiveMaxHP, uctx.EffectiveMaxMP = s.computeEffectiveMax(ctx, char)
		}
		effectResult, err := s.applyItemEffect(ctx, uctx, char, it, tpl)
		if err != nil {
			return nil, nil, err
		}

		if effectResult.GiftBox != nil {
			result = s.effectResultToMap(effectResult)
			return it, result, nil
		}

		if effectResult.ConsumeItem {
			it.StackCount--
			if it.StackCount <= 0 {
				if err := s.itemRepo.Delete(ctx, itemID); err != nil {
					return nil, nil, err
				}
			} else {
				if err := s.itemRepo.UpdateStack(ctx, itemID, it.StackCount); err != nil {
					return nil, nil, err
				}
			}
		}

		result = s.effectResultToMap(effectResult)
	} else {
		it.StackCount--
		if it.StackCount <= 0 {
			if err := s.itemRepo.Delete(ctx, itemID); err != nil {
				return nil, nil, err
			}
		} else {
			if err := s.itemRepo.UpdateStack(ctx, itemID, it.StackCount); err != nil {
				return nil, nil, err
			}
		}
	}

	s.logger.Info("Item used",
		zap.Int64("character_id", char.ID),
		zap.Int64("item_id", itemID),
		zap.Int("template_id", it.TemplateID))

	return it, result, nil
}

func (s *Service) applyItemEffect(ctx context.Context, uctx *UseContext, char *character.Character, it *item.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	if tpl.ID == 719 {
		return NewEffectResult(), nil
	}

	if int(tpl.UseType) == 4 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	itemType := int(tpl.Type)
	if handler, ok := s.typeHandlers[itemType]; ok {
		return handler.Apply(ctx, uctx, char, it, tpl)
	}

	if s.awardHandler != nil && s.awardHandler.CanHandle(tpl) {
		return s.awardHandler.Apply(ctx, uctx, char, it, tpl)
	}

	for _, handler := range s.fallbackHandlers {
		if handler.CanHandle(tpl) {
			return handler.Apply(ctx, uctx, char, it, tpl)
		}
	}

	return NewEffectResult(), nil
}

func (s *Service) effectResultToMap(r *ItemEffectResult) map[string]interface{} {
	result := map[string]interface{}{}
	if r.HPHealed > 0 {
		result["hp_healed"] = r.HPHealed
	}
	if r.MPRestored > 0 {
		result["mp_restored"] = r.MPRestored
	}
	if len(r.Pets) > 0 {
		petDTOs := make([]map[string]interface{}, 0, len(r.Pets))
		for _, pet := range r.Pets {
			if pet != nil {
				petDTOs = append(petDTOs, pet.ToDTO())
			}
		}
		result["pets"] = petDTOs
	}
	if len(r.UpdatedPets) > 0 {
		result["updated_pets"] = r.UpdatedPets
	}
	if len(r.GrantedItems) > 0 {
		result["granted_items"] = r.GrantedItems
	}
	if len(r.TempBagItems) > 0 {
		result["temp_bag_items"] = r.TempBagItems
	}
	if len(r.GrantedTitles) > 0 {
		result["granted_titles"] = r.GrantedTitles
	}
	if len(r.GrantedSkillIDs) > 0 {
		result["granted_skill_ids"] = r.GrantedSkillIDs
	}
	if len(r.GrantedBuffs) > 0 {
		result["granted_buffs"] = r.GrantedBuffs
	}
	if len(r.GrantedCurrencies) > 0 {
		result["granted_currencies"] = r.GrantedCurrencies
	}
	if len(r.GrantedMedals) > 0 {
		result["granted_medals"] = r.GrantedMedals
	}
	if r.GiftBox != nil {
		result["gift_box"] = r.GiftBox
	}
	if r.Message != "" {
		result["message"] = r.Message
	}
	if r.RefreshCharacterView {
		result["refresh_character_view"] = true
	}
	return result
}

// UseMultiItem uses multiple instances of a stackable item
func (s *Service) UseMultiItem(ctx context.Context, char *character.Character, slotID int64, count int, targetType int, petID int64) (map[string]interface{}, error) {
	// Find item by slot ID (could be item ID or slot index)
	it, err := s.itemRepo.FindByID(ctx, slotID)
	if err != nil {
		// Try finding by slot index in bag
		items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, char.ID, item.SlotTypeBag)
		if err != nil {
			return nil, err
		}
		for _, item := range items {
			if item.SlotIndex == int(slotID) {
				it = item
				break
			}
		}
		if it == nil {
			return nil, pkgerrors.ErrItemNotFound
		}
	}

	if it.CharacterID != char.ID {
		return nil, pkgerrors.ErrItemNotOwned
	}

	if !it.IsConsumable() {
		return nil, pkgerrors.ErrCannotUseItem
	}

	if it.StackCount < count {
		return nil, pkgerrors.ErrInsufficientItems
	}

	// Get template for item effects
	var tpl *models.ItemTemplateTemplate
	if s.gameDataRec != nil {
		tpl = s.gameDataRec.GetItem(it.TemplateID)
	}

	totalHPHealed := 0
	totalMPRestored := 0

	for i := 0; i < count; i++ {
		if tpl != nil {
			effectResult, err := s.applyItemEffect(ctx, nil, char, it, tpl)
			if err != nil {
				return nil, err
			}
			totalHPHealed += effectResult.HPHealed
			totalMPRestored += effectResult.MPRestored
		}
	}

	// Update stack count
	it.StackCount -= count
	if it.StackCount <= 0 {
		if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
			return nil, err
		}
	} else {
		if err := s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount); err != nil {
			return nil, err
		}
	}

	s.logger.Info("Multi item used",
		zap.Int64("character_id", char.ID),
		zap.Int64("item_id", it.ID),
		zap.Int("template_id", it.TemplateID),
		zap.Int("count", count),
		zap.Int("hp_healed", totalHPHealed),
		zap.Int("mp_restored", totalMPRestored))

	result := map[string]interface{}{
		"consumed":  count,
		"remaining": it.StackCount,
		"item_id":   it.ID,
	}

	if totalHPHealed > 0 {
		result["hp_healed"] = totalHPHealed
	}
	if totalMPRestored > 0 {
		result["mp_restored"] = totalMPRestored
	}

	return result, nil
}

// UseItemOnTarget uses an item on a specific target (e.g., identification scroll on equipment)
func (s *Service) UseItemOnTarget(ctx context.Context, charID int64, slotID int64) (map[string]interface{}, error) {
	// Find item by slot ID
	it, err := s.itemRepo.FindByID(ctx, slotID)
	if err != nil {
		// Try finding by slot index in bag
		items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
		if err != nil {
			return nil, err
		}
		for _, item := range items {
			if item.SlotIndex == int(slotID) {
				it = item
				break
			}
		}
		if it == nil {
			return nil, pkgerrors.ErrItemNotFound
		}
	}

	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}

	// For target items (like identification scrolls), consume the item
	// In real implementation, this would identify/upgrade the target item
	it.StackCount--
	if it.StackCount <= 0 {
		if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
			return nil, err
		}
	} else {
		if err := s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount); err != nil {
			return nil, err
		}
	}

	s.logger.Info("Item used on target",
		zap.Int64("character_id", charID),
		zap.Int64("item_id", it.ID),
		zap.Int("template_id", it.TemplateID))

	// Return result (e.g., identified item data)
	return map[string]interface{}{
		"success": true,
		"itemId":  it.ID,
	}, nil
}

func (s *Service) SortBag(ctx context.Context, charID int64) ([]*item.Item, error) {
	items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return nil, err
	}

	items, err = s.mergeBagSortItems(ctx, items)
	if err != nil {
		return nil, err
	}

	// 1. Move all to temporary range to avoid collisions
	const tempOffset = 10000
	for _, it := range items {
		newTempIndex := it.SlotIndex + tempOffset
		if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeBag, newTempIndex); err != nil {
			return nil, err
		}
		it.SlotIndex = newTempIndex
	}

	// 2. Move to final positions
	for i, it := range items {
		if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeBag, i); err != nil {
			return nil, err
		}
		it.SlotIndex = i
	}

	s.logger.Debug("Bag sorted",
		zap.Int64("character_id", charID),
		zap.Int("count", len(items)))

	return items, nil
}

type bagSortKey struct {
	templateID int
	itemType   item.ItemType
	isBound    bool
	colorCode  int
}

type bagSortState struct {
	item          *item.Item
	originalStack int
	maxStack      int
	key           bagSortKey
}

func (s *Service) mergeBagSortItems(ctx context.Context, items []*item.Item) ([]*item.Item, error) {
	if len(items) == 0 {
		return items, nil
	}

	states := make([]*bagSortState, 0, len(items))
	for _, it := range items {
		maxStack := s.rewardMaxStack(it.TemplateID, it.ItemType)
		if maxStack <= 0 {
			maxStack = 1
		}
		states = append(states, &bagSortState{
			item:          it,
			originalStack: it.StackCount,
			maxStack:      maxStack,
			key: bagSortKey{
				templateID: it.TemplateID,
				itemType:   it.ItemType,
				isBound:    it.IsBound,
				colorCode:  s.resolveItemColorCode(it.TemplateID, it.ItemType, it.ColorCode),
			},
		})
	}

	sort.SliceStable(states, func(i, j int) bool {
		left := states[i]
		right := states[j]
		if left.key.templateID != right.key.templateID {
			return left.key.templateID < right.key.templateID
		}
		if left.key.itemType != right.key.itemType {
			return left.key.itemType < right.key.itemType
		}
		if left.key.isBound != right.key.isBound {
			return !left.key.isBound && right.key.isBound
		}
		if left.key.colorCode != right.key.colorCode {
			return left.key.colorCode < right.key.colorCode
		}
		if left.item.SlotIndex != right.item.SlotIndex {
			return left.item.SlotIndex < right.item.SlotIndex
		}
		return left.item.ID < right.item.ID
	})

	survivors := make([]*bagSortState, 0, len(states))
	survivorIDs := make(map[int64]struct{}, len(states))
	for _, state := range states {
		remaining := state.item.StackCount
		if state.maxStack > 1 {
			for idx := len(survivors) - 1; idx >= 0; idx-- {
				target := survivors[idx]
				if target.key != state.key {
					break
				}
				if target.item.StackCount >= target.maxStack {
					continue
				}
				space := target.maxStack - target.item.StackCount
				moved := remaining
				if moved > space {
					moved = space
				}
				target.item.StackCount += moved
				remaining -= moved
				if remaining == 0 {
					break
				}
			}
		}
		state.item.StackCount = remaining
		if remaining > 0 {
			survivors = append(survivors, state)
			survivorIDs[state.item.ID] = struct{}{}
		}
	}

	mergedItems := make([]*item.Item, 0, len(survivors))
	for _, state := range survivors {
		if state.item.StackCount != state.originalStack {
			if err := s.itemRepo.UpdateStack(ctx, state.item.ID, state.item.StackCount); err != nil {
				return nil, err
			}
		}
		mergedItems = append(mergedItems, state.item)
	}

	for _, state := range states {
		if _, ok := survivorIDs[state.item.ID]; ok {
			continue
		}
		if err := s.itemRepo.Delete(ctx, state.item.ID); err != nil {
			return nil, err
		}
	}

	return mergedItems, nil
}

func (s *Service) SortTempBag(ctx context.Context, charID int64) ([]*item.Item, error) {
	// Get all temp bag items
	allTempItems, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeTempBag)
	if err != nil {
		return nil, err
	}

	// Filter only normal temp bag items (slot index 0-99)
	items := make([]*item.Item, 0)
	for _, it := range allTempItems {
		if it.SlotIndex < 100 {
			items = append(items, it)
		}
	}

	// 1. Move to Temp Range
	const tempOffset = 10000
	for _, it := range items {
		newTempIndex := it.SlotIndex + tempOffset
		if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeTempBag, newTempIndex); err != nil {
			return nil, err
		}
		it.SlotIndex = newTempIndex
	}

	// 2. Sort
	sort.Slice(items, func(i, j int) bool {
		return items[i].TemplateID < items[j].TemplateID
	})

	// 3. Move Back
	for i, it := range items {
		if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeTempBag, i); err != nil {
			return nil, err
		}
		it.SlotIndex = i
	}

	s.logger.Debug("Temp bag sorted",
		zap.Int64("character_id", charID),
		zap.Int("count", len(items)))

	return items, nil
}

func (s *Service) SortMxTempBag(ctx context.Context, charID int64) ([]*item.Item, error) {
	// Get all temp bag items
	allTempItems, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeTempBag)
	if err != nil {
		return nil, err
	}

	// Filter only MX temp bag items (slot index 100+)
	items := make([]*item.Item, 0)
	for _, it := range allTempItems {
		if it.SlotIndex >= 100 {
			items = append(items, it)
		}
	}

	// 1. Move to Temp Range
	const tempOffset = 10000
	for _, it := range items {
		newTempIndex := it.SlotIndex + tempOffset
		if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeTempBag, newTempIndex); err != nil {
			return nil, err
		}
		it.SlotIndex = newTempIndex
	}

	// 2. Sort Logic
	sort.Slice(items, func(i, j int) bool {
		return items[i].TemplateID < items[j].TemplateID
	})

	// 3. Move Back
	// Reassign slot indices starting from 100
	for i, it := range items {
		newIndex := 100 + i
		if err := s.itemRepo.MoveItem(ctx, it.ID, item.SlotTypeTempBag, newIndex); err != nil {
			return nil, err
		}
		it.SlotIndex = newIndex
	}

	s.logger.Debug("MX temp bag sorted",
		zap.Int64("character_id", charID),
		zap.Int("count", len(items)))

	return items, nil
}

func (s *Service) repairCost(it *item.Item) int64 {
	if it == nil || it.Durability == nil || it.MaxDurability == nil {
		return 0
	}

	damage := *it.MaxDurability - *it.Durability
	if damage <= 0 {
		return 0
	}

	return int64(damage * 10)
}

func (s *Service) RepairItem(ctx context.Context, charID int64, itemID int64) (*RepairResult, error) {
	if s.charRepo == nil {
		return nil, fmt.Errorf("character repository not initialized")
	}

	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	if !it.NeedsRepair() {
		return &RepairResult{Cost: 0, NewMoney: char.Money}, nil
	}

	cost := s.repairCost(it)
	if char.Money < cost {
		return nil, fmt.Errorf("not enough silver")
	}

	it.Repair()
	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}

	char.Money -= cost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	s.logger.Info("Item repaired",
		zap.Int64("character_id", charID),
		zap.Int64("item_id", itemID),
		zap.Int64("cost", cost))

	return &RepairResult{Cost: cost, NewMoney: char.Money}, nil
}

func (s *Service) RepairAll(ctx context.Context, charID int64) (*RepairResult, error) {
	if s.charRepo == nil {
		return nil, fmt.Errorf("character repository not initialized")
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	items, err := s.itemRepo.FindEquipped(ctx, charID)
	if err != nil {
		return nil, err
	}

	var totalCost int64
	for _, it := range items {
		if it.NeedsRepair() {
			totalCost += s.repairCost(it)
		}
	}

	if char.Money < totalCost {
		return nil, fmt.Errorf("not enough silver")
	}

	for _, it := range items {
		if !it.NeedsRepair() {
			continue
		}

		it.Repair()
		if err := s.itemRepo.Update(ctx, it); err != nil {
			return nil, err
		}
	}

	char.Money -= totalCost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	s.logger.Info("Repaired all equipment",
		zap.Int64("character_id", charID),
		zap.Int64("total_cost", totalCost))

	return &RepairResult{Cost: totalCost, NewMoney: char.Money}, nil
}

func (s *Service) AddItem(ctx context.Context, charID int64, templateID int, itemType item.ItemType, stackCount int) (*item.Item, error) {
	return s.AddItemWithBind(ctx, charID, templateID, itemType, stackCount, false)
}

func (s *Service) populateEquipmentProperties(it *item.Item, equipTpl *models.EquiptTemplateTemplate) {
	if it == nil || equipTpl == nil {
		s.logger.Warn("populateEquipmentProperties: nil params",
			zap.Any("it", it),
			zap.Any("equipTpl", equipTpl))
		return
	}

	s.logger.Debug("populateEquipmentProperties: loading template",
		zap.Int("template_id", int(equipTpl.ID)),
		zap.Float64("bind_prop_num", equipTpl.BindPropNum),
		zap.Float64("endure_max", equipTpl.EndureMax))

	binded := "0"
	if it.IsBound {
		binded = "1"
	}

	tValue := "-1"
	if equipTpl.T > 0 {
		expiryTime := time.Now().UnixMilli() + int64(equipTpl.T*60*1000)
		tValue = fmt.Sprintf("%d", expiryTime)
	}

	endureMax := int(equipTpl.EndureMax)
	if endureMax < 0 {
		endureMax = 0
	}
	if it.MaxDurability == nil {
		maxDurability := endureMax
		it.MaxDurability = &maxDurability
	}
	if it.Durability == nil {
		durability := endureMax
		it.Durability = &durability
	}

	endureLeft := 0
	if it.Durability != nil {
		endureLeft = *it.Durability
	}
	endureMaxValue := 0
	if it.MaxDurability != nil {
		endureMaxValue = *it.MaxDurability
	}

	it.Properties = map[string]interface{}{
		"mainProp1":        equipTpl.MainProp1,
		"mainProp2":        equipTpl.MainProp2,
		"mainPropNum1":     equipTpl.MainPropNum1,
		"mainPropNum2":     equipTpl.MainPropNum2,
		"prop1":            equipTpl.Prop1,
		"prop2":            equipTpl.Prop2,
		"propNum1":         equipTpl.PropNum1,
		"propNum2":         equipTpl.PropNum2,
		"activeProp":       equipTpl.ActivePropType,
		"activePropNum":    equipTpl.ActivePropNum,
		"bindMainPropNum1": equipTpl.BindPropNum,
		"bindMainPropNum2": equipTpl.BindPropNum,
		"element":          0,
		"preNameType":      item.EquipmentPrefixTypeFromColorCode(it.ColorCode),
		"t":                tValue,
		"tid":              fmt.Sprintf("%d", equipTpl.ID),
		"id":               fmt.Sprintf("%d", it.ID),
		"maker":            "",
		"endureLeft":       fmt.Sprintf("%d", endureLeft),
		"endureMax":        fmt.Sprintf("%d", endureMaxValue),
		"flag":             "",
		"flag2":            nil,
		"flag3":            nil,
		"upgradeNum":       0,
		"binded":           binded,
		"color":            fmt.Sprintf("%d", item.EquipmentDisplayColorFromColorCode(it.ColorCode)),
		"timeStamp":        nil,
	}
}

func (s *Service) resolveItemColorCode(templateID int, itemType item.ItemType, colorCode int) int {
	if itemType != item.ItemTypeEquipment {
		return colorCode
	}

	resolvedColorCode := item.NormalizeEquipmentColorCode(colorCode)
	if resolvedColorCode > 0 || s.gameDataRec == nil {
		return resolvedColorCode
	}

	equipTpl := s.gameDataRec.GetEquipment(templateID)
	if equipTpl == nil {
		return resolvedColorCode
	}

	resolvedColorCode = item.NormalizeEquipmentColorCode(int(equipTpl.ColorCode))
	if resolvedColorCode > 0 {
		return resolvedColorCode
	}

	return item.NormalizeEquipmentColorCode(int(equipTpl.Color))
}

func (s *Service) AddItemWithColor(ctx context.Context, charID int64, templateID int, itemType item.ItemType, stackCount int, colorCode int) (*item.Item, error) {
	return s.AddItemWithBindAndColor(ctx, charID, templateID, itemType, stackCount, false, colorCode)
}

func (s *Service) AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType item.ItemType, stackCount int, isBound bool) (*item.Item, error) {
	return s.AddItemWithBindAndColor(ctx, charID, templateID, itemType, stackCount, isBound, 0)
}

func (s *Service) AddItemWithBindAndColor(ctx context.Context, charID int64, templateID int, itemType item.ItemType, stackCount int, isBound bool, colorCode int) (*item.Item, error) {
	colorCode = s.resolveItemColorCode(templateID, itemType, colorCode)

	// 1. Determine Max Stack Size
	maxStack := 1
	if s.gameDataRec != nil {
		// Priority: Check Equipment first if type matches, or Generic Item
		// Note: We check both because sometimes types overlap or we need specific table data
		if itemType == item.ItemTypeEquipment {
			if eq := s.gameDataRec.GetEquipment(templateID); eq != nil {
				maxStack = int(eq.StackMax)
				if eq.SingleFlag > 0 {
					maxStack = 1
				}
			}
		} else {
			if tpl := s.gameDataRec.GetItem(templateID); tpl != nil {
				maxStack = int(tpl.StackMax)
				if tpl.SingleFlag > 0 {
					maxStack = 1
				}
			}
		}
	}
	if maxStack <= 0 {
		maxStack = 1
	}

	var lastModifiedItem *item.Item
	totalAdded := 0
	defer func() {
		if totalAdded > 0 && s.questService != nil {
			_, _ = s.questService.OnItemCollected(ctx, charID, templateID, totalAdded)
		}
	}()

	if maxStack > 1 {
		inventory, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
		if err != nil {
			return nil, err
		}

		for _, it := range inventory {
			if stackCount <= 0 {
				break
			}

			if it.TemplateID == templateID && it.StackCount < maxStack && it.IsBound == isBound && it.ColorCode == colorCode {
				space := maxStack - it.StackCount
				amountToAdd := stackCount
				if amountToAdd > space {
					amountToAdd = space
				}

				it.StackCount += amountToAdd
				if err := s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount); err != nil {
					return nil, err
				}

				stackCount -= amountToAdd
				totalAdded += amountToAdd
				lastModifiedItem = it
			}
		}
	}

	maxBag := s.getMaxSlots(ctx, charID, item.SlotTypeBag)
	for stackCount > 0 {
		amountToAdd := stackCount
		if amountToAdd > maxStack {
			amountToAdd = maxStack
		}

		var boundItem *item.Item
		var createErr error
		maxRetries := 3

		for attempt := 0; attempt < maxRetries; attempt++ {
			emptySlot, err := s.itemRepo.FindFirstEmptySlot(ctx, charID, item.SlotTypeBag, maxBag)
			if err != nil {
				return nil, err
			}

			it := item.NewItem(charID, templateID, itemType, item.SlotTypeBag, emptySlot)
			it.StackCount = amountToAdd
			it.IsBound = isBound
			it.ColorCode = colorCode

			if itemType == item.ItemTypeEquipment && s.gameDataRec != nil {
				s.logger.Debug("AddItemWithBindAndColor: loading equipment properties",
					zap.Int64("char_id", charID),
					zap.Int("template_id", templateID),
					zap.String("item_type", fmt.Sprintf("%d", itemType)))
				if equipTpl := s.gameDataRec.GetEquipment(templateID); equipTpl != nil {
					s.populateEquipmentProperties(it, equipTpl)
				} else {
					s.logger.Warn("AddItemWithBindAndColor: equipment template not found",
						zap.Int("template_id", templateID))
				}
			}

			if err := s.itemRepo.Create(ctx, it); err != nil {
				if strings.Contains(err.Error(), "23505") || strings.Contains(err.Error(), "duplicate key") {
					s.logger.Warn("AddItem: Slot collision or Constraint Violation, retrying",
						zap.Int64("character_id", charID),
						zap.Int("slot_index", emptySlot),
						zap.Int("attempt", attempt+1))
					continue
				}
				createErr = err
				break // Fatal error, do not retry
			}

			boundItem = it
			createErr = nil
			break // Success
		}

		if createErr != nil {
			return nil, createErr
		}
		if boundItem == nil {
			return nil, pkgerrors.ErrInventoryFull
		}

		s.logger.Info("Item added",
			zap.Int64("character_id", charID),
			zap.Int64("item_id", boundItem.ID),
			zap.Int("template_id", templateID),
			zap.Int("stack_count", amountToAdd),
			zap.Bool("is_bound", isBound))

		stackCount -= amountToAdd
		totalAdded += amountToAdd
		lastModifiedItem = boundItem
	}

	return lastModifiedItem, nil
}

// AddItemToSlot adds an item to a specific slot type (bag, quest bag, pet item bag, bank, temp bag)
// This allows directly adding items to the desired inventory location
func (s *Service) AddItemToSlot(ctx context.Context, charID int64, templateID int, itemType item.ItemType, stackCount int, isBound bool, slotType item.SlotType) (*item.Item, error) {
	// 1. Determine Max Stack Size
	maxStack := 1
	if s.gameDataRec != nil {
		if itemType == item.ItemTypeEquipment {
			if eq := s.gameDataRec.GetEquipment(templateID); eq != nil {
				maxStack = int(eq.StackMax)
			}
		} else {
			if tpl := s.gameDataRec.GetItem(templateID); tpl != nil {
				maxStack = int(tpl.StackMax)
			}
		}
	}
	if maxStack <= 0 {
		maxStack = 1
	}

	var lastModifiedItem *item.Item
	totalAdded := 0
	defer func() {
		if totalAdded > 0 && s.questService != nil {
			_, _ = s.questService.OnItemCollected(ctx, charID, templateID, totalAdded)
		}
	}()

	if maxStack > 1 {
		inventory, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, slotType)
		if err != nil {
			return nil, err
		}

		for _, it := range inventory {
			if stackCount <= 0 {
				break
			}

			if it.TemplateID == templateID && it.StackCount < maxStack && it.IsBound == isBound && it.ColorCode == 0 {
				space := maxStack - it.StackCount
				amountToAdd := stackCount
				if amountToAdd > space {
					amountToAdd = space
				}

				it.StackCount += amountToAdd
				if err := s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount); err != nil {
					return nil, err
				}

				stackCount -= amountToAdd
				totalAdded += amountToAdd
				lastModifiedItem = it
			}
		}
	}

	maxSlots := s.getMaxSlots(ctx, charID, slotType)

	for stackCount > 0 {
		amountToAdd := stackCount
		if amountToAdd > maxStack {
			amountToAdd = maxStack
		}

		var boundItem *item.Item
		var createErr error
		maxRetries := 3

		for attempt := 0; attempt < maxRetries; attempt++ {
			emptySlot, err := s.itemRepo.FindFirstEmptySlot(ctx, charID, slotType, maxSlots)
			if err != nil {
				return nil, err
			}

			it := item.NewItem(charID, templateID, itemType, slotType, emptySlot)
			it.StackCount = amountToAdd
			it.IsBound = isBound

			if err := s.itemRepo.Create(ctx, it); err != nil {
				if strings.Contains(err.Error(), "23505") || strings.Contains(err.Error(), "duplicate key") {
					s.logger.Warn("AddItemToSlot: Slot collision, retrying",
						zap.Int64("character_id", charID),
						zap.Int("slot_type", int(slotType)),
						zap.Int("slot_index", emptySlot),
						zap.Int("attempt", attempt+1))
					continue
				}
				createErr = err
				break // Fatal error
			}

			boundItem = it
			createErr = nil
			break // Success
		}

		if createErr != nil {
			return nil, createErr
		}
		if boundItem == nil {
			return nil, pkgerrors.ErrInventoryFull
		}

		s.logger.Info("Item added to slot",
			zap.Int64("character_id", charID),
			zap.Int64("item_id", boundItem.ID),
			zap.Int("template_id", templateID),
			zap.Int("stack_count", amountToAdd),
			zap.Bool("is_bound", isBound),
			zap.Int("slot_type", int(slotType)))

		stackCount -= amountToAdd
		totalAdded += amountToAdd
		lastModifiedItem = boundItem
	}

	return lastModifiedItem, nil
}

func (s *Service) BindItem(ctx context.Context, charID int64, itemID int64) error {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return err
	}

	if it.CharacterID != charID {
		return pkgerrors.ErrItemNotOwned
	}

	if it.IsBound {
		return nil
	}

	it.IsBound = true
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["binded"] = "1"
	it.UpdatedAt = time.Now()

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return err
	}

	s.logger.Info("Item bound",
		zap.Int64("character_id", charID),
		zap.Int64("item_id", itemID))

	return nil
}

// ConsumeItemByTemplateID consumes one item of the specified template ID from the user's bag.
// Returns the consumed item (with updated stack count) if found, or nil if not found.
func (s *Service) ConsumeItemByTemplateID(ctx context.Context, charID int64, templateID int) (*item.Item, error) {
	// Find item in bag with matching template ID
	items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return nil, err
	}

	var targetItem *item.Item
	for _, it := range items {
		if it.TemplateID == templateID {
			targetItem = it
			break
		}
	}

	if targetItem == nil {
		return nil, nil // Item not found
	}

	// Consume 1 count
	targetItem.StackCount--
	if targetItem.StackCount <= 0 {
		if err := s.itemRepo.Delete(ctx, targetItem.ID); err != nil {
			return nil, err
		}
		targetItem.StackCount = 0
	} else {
		if err := s.itemRepo.UpdateStack(ctx, targetItem.ID, targetItem.StackCount); err != nil {
			return nil, err
		}
	}

	s.logger.Info("Item consumed by template ID",
		zap.Int64("character_id", charID),
		zap.Int("template_id", templateID),
		zap.Int64("item_id", targetItem.ID),
		zap.Int("remaining_stack", targetItem.StackCount))

	return targetItem, nil
}

// UpdateColorCode updates the color code for an item
func (s *Service) UpdateColorCode(ctx context.Context, itemID int64, colorCode int) error {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return err
	}

	resolvedColorCode := s.resolveItemColorCode(it.TemplateID, it.ItemType, colorCode)
	it.ColorCode = resolvedColorCode
	if it.ItemType == item.ItemTypeEquipment {
		if it.Properties == nil {
			it.Properties = make(map[string]interface{})
		}
		it.Properties["color"] = fmt.Sprintf("%d", item.EquipmentDisplayColorFromColorCode(resolvedColorCode))
		it.Properties["preNameType"] = item.EquipmentPrefixTypeFromColorCode(resolvedColorCode)
	}
	return s.itemRepo.Update(ctx, it)
}

func (s *Service) UpdateEquipmentQuality(ctx context.Context, itemID int64, quality int) (*item.Item, error) {
	return s.updateEquipmentQuality(ctx, itemID, quality, item.EquipmentColorCodeFromQuality(quality), false, 0)
}

func (s *Service) UpdateCraftedEquipmentQuality(ctx context.Context, itemID int64, quality int) (*item.Item, error) {
	return s.updateEquipmentQuality(ctx, itemID, quality, item.EquipmentColorCodeFromQuality(quality), true, 0)
}

func (s *Service) UpdateQuestRewardEquipmentQuality(ctx context.Context, itemID int64, quality int) (*item.Item, error) {
	return s.updateEquipmentQuality(ctx, itemID, quality, item.QuestRewardEquipmentColorCodeFromQuality(quality), true, 0)
}

func (s *Service) ApplyEquipmentAwardAttributes(ctx context.Context, itemID int64, quality int, preNameType int) (*item.Item, error) {
	requestedColorCode := 0
	if quality > 0 {
		requestedColorCode = item.EquipmentColorCodeFromQuality(quality)
	}
	return s.updateEquipmentQuality(ctx, itemID, quality, requestedColorCode, false, preNameType)
}

func (s *Service) updateEquipmentQuality(ctx context.Context, itemID int64, quality int, requestedColorCode int, rollTemplateProps bool, overridePrefixType int) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.ItemType != item.ItemTypeEquipment {
		return it, nil
	}

	colorCode := requestedColorCode
	if colorCode <= 0 {
		colorCode = s.resolveItemColorCode(it.TemplateID, it.ItemType, it.ColorCode)
	}

	prefixType := item.NormalizeEquipmentPrefixType(overridePrefixType)
	if prefixType <= 0 {
		prefixType = item.EquipmentPrefixTypeFromQuality(quality)
	}
	if prefixType <= 0 {
		prefixType = item.ResolveEquipmentPrefixType(it.Properties["preNameType"], colorCode)
	}

	it.ColorCode = colorCode
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	if rollTemplateProps {
		if equipTpl := s.GetEquipmentTemplate(it.TemplateID); equipTpl != nil {
			s.ApplyRandomizedEquipmentPropertyRolls(it, equipTpl, quality)
		}
		holeCount := RollCraftedHoleCount()
		ApplyCraftedHoles(it.Properties, holeCount)
	}
	it.Properties["color"] = fmt.Sprintf("%d", item.EquipmentDisplayColorFromColorCode(colorCode))
	it.Properties["q"] = quality
	it.Properties["quality"] = quality
	if prefixType > 0 {
		it.Properties["preNameType"] = prefixType
	}

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}

	return it, nil
}

func (s *Service) ApplyRandomizedEquipmentPropertyRolls(it *item.Item, equipTpl *models.EquiptTemplateTemplate, quality int) {
	if it == nil || equipTpl == nil {
		return
	}
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}

	minMultiplier, maxMultiplier := item.EquipmentQualityMultiplierRange(quality)
	propSlots := equipmentTemplatePropSlots(equipTpl)
	propLines := s.randomizedEquipmentPropLines(equipmentTemplatePropLines(equipTpl))
	for _, slot := range []string{"main1", "main2", "prop1", "prop2"} {
		s.applyEquipmentPropLine(it.Properties, slot, qualityRolledPropLine{}, 0, 0)
	}
	for index, slot := range propSlots {
		if index >= len(propLines) {
			break
		}
		s.applyEquipmentPropLine(it.Properties, slot, propLines[index], minMultiplier, maxMultiplier)
	}

	bindMax := int(float64(max(0, int(equipTpl.BindPropNum))) * maxMultiplier)
	if quality >= 6 && bindMax > 0 {
		it.Properties["bindMainPropNum1"] = s.randomIntInclusive(0, bindMax)
		it.Properties["bindMainPropNum2"] = s.randomIntInclusive(0, bindMax)
	} else {
		it.Properties["bindMainPropNum1"] = 0
		it.Properties["bindMainPropNum2"] = 0
	}
}

func equipmentTemplatePropSlots(equipTpl *models.EquiptTemplateTemplate) []string {
	if equipTpl == nil {
		return nil
	}

	slots := make([]string, 0, 4)
	if int(equipTpl.MainProp1) > 0 {
		slots = append(slots, "main1")
	}
	if int(equipTpl.MainProp2) > 0 {
		slots = append(slots, "main2")
	}
	if int(equipTpl.Prop1) > 0 {
		slots = append(slots, "prop1")
	}
	if int(equipTpl.Prop2) > 0 {
		slots = append(slots, "prop2")
	}

	return slots
}

func equipmentTemplatePropLines(equipTpl *models.EquiptTemplateTemplate) []qualityRolledPropLine {
	if equipTpl == nil {
		return nil
	}

	propLines := make([]qualityRolledPropLine, 0, 4)
	if int(equipTpl.MainProp1) > 0 {
		propLines = append(propLines, qualityRolledPropLine{propType: int(equipTpl.MainProp1), propValue: int(equipTpl.MainPropNum1)})
	}
	if int(equipTpl.MainProp2) > 0 {
		propLines = append(propLines, qualityRolledPropLine{propType: int(equipTpl.MainProp2), propValue: int(equipTpl.MainPropNum2)})
	}
	if int(equipTpl.Prop1) > 0 {
		propLines = append(propLines, qualityRolledPropLine{propType: int(equipTpl.Prop1), propValue: int(equipTpl.PropNum1)})
	}
	if int(equipTpl.Prop2) > 0 {
		propLines = append(propLines, qualityRolledPropLine{propType: int(equipTpl.Prop2), propValue: int(equipTpl.PropNum2)})
	}

	return propLines
}

func (s *Service) randomizedEquipmentPropLines(propLines []qualityRolledPropLine) []qualityRolledPropLine {
	if len(propLines) <= 1 {
		return append([]qualityRolledPropLine(nil), propLines...)
	}

	shuffled := append([]qualityRolledPropLine(nil), propLines...)
	for index := len(shuffled) - 1; index > 0; index-- {
		swapIndex := s.randomIntInclusive(0, index)
		shuffled[index], shuffled[swapIndex] = shuffled[swapIndex], shuffled[index]
	}

	return shuffled
}

func (s *Service) applyEquipmentPropLine(properties map[string]interface{}, slot string, propLine qualityRolledPropLine, minMultiplier float64, maxMultiplier float64) {
	if properties == nil {
		return
	}

	propType := propLine.propType
	propValue := 0
	if propType > 0 {
		propValue = s.scaledEquipmentPropRoll(propLine.propValue, minMultiplier, maxMultiplier)
	}

	switch slot {
	case "main1":
		properties["mainProp1"] = propType
		properties["mainPropNum1"] = propValue
	case "main2":
		properties["mainProp2"] = propType
		properties["mainPropNum2"] = propValue
	case "prop1":
		properties["prop1"] = propType
		properties["propNum1"] = propValue
	case "prop2":
		properties["prop2"] = propType
		properties["propNum2"] = propValue
	}
}

func (s *Service) UpdateEquipmentElement(ctx context.Context, itemID int64, elementID int) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.ItemType != item.ItemTypeEquipment {
		return it, nil
	}

	normalizedElementID := domainelement.NormalizeClientElementID(elementID)
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["element"] = normalizedElementID

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}

	return it, nil
}

func (s *Service) UpdateEquipmentStarLevel(ctx context.Context, itemID int64, starLevel int) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.ItemType != item.ItemTypeEquipment {
		return nil, pkgerrors.ErrInvalidInput
	}
	if starLevel < 0 {
		starLevel = 0
	}

	it.StarLevel = starLevel
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["upgradeNum"] = starLevel

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}

	return it, nil
}

func (s *Service) UpdateEquipmentActiveProp(ctx context.Context, itemID int64, activePropType int, activePropNum int) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.ItemType != item.ItemTypeEquipment {
		return nil, pkgerrors.ErrInvalidInput
	}

	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["activeProp"] = activePropType
	it.Properties["activePropNum"] = activePropNum

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}

	return it, nil
}

func (s *Service) UpdateEquipmentBindProps(ctx context.Context, itemID int64, bindNum1, bindNum2 int) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if it.ItemType != item.ItemTypeEquipment {
		return nil, pkgerrors.ErrInvalidInput
	}

	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["bindMainPropNum1"] = bindNum1
	it.Properties["bindMainPropNum2"] = bindNum2

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}

	return it, nil
}

func (s *Service) ConsumeItemStack(ctx context.Context, charID, itemID int64, count int) (*item.Item, bool, error) {
	if count <= 0 {
		return nil, false, pkgerrors.ErrInvalidInput
	}

	it, err := s.GetItemByID(ctx, charID, itemID)
	if err != nil {
		return nil, false, err
	}
	if it.StackCount < count {
		return nil, false, pkgerrors.ErrInvalidInput
	}

	remaining := it.StackCount - count
	if remaining == 0 {
		if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
			return nil, false, err
		}
		it.StackCount = 0
		return it, true, nil
	}

	it.StackCount = remaining
	if err := s.itemRepo.UpdateStack(ctx, it.ID, remaining); err != nil {
		return nil, false, err
	}

	return it, false, nil
}

func (s *Service) AssignRandomEquipmentElement(ctx context.Context, itemID int64) (*item.Item, error) {
	return s.UpdateEquipmentElement(ctx, itemID, s.randomEquipmentElementID())
}

func (s *Service) scaledEquipmentPropRoll(base int, minMultiplier float64, maxMultiplier float64) int {
	if base <= 0 {
		return 0
	}

	minValue := int(float64(base) * minMultiplier)
	maxValue := int(float64(base) * maxMultiplier)
	if maxValue < minValue {
		maxValue = minValue
	}

	return s.randomIntInclusive(minValue, maxValue)
}

func (s *Service) randomIntInclusive(minValue int, maxValue int) int {
	if maxValue <= minValue {
		return minValue
	}

	span := int64(maxValue - minValue + 1)
	value, err := crand.Int(crand.Reader, big.NewInt(span))
	if err != nil {
		if s.logger != nil {
			s.logger.Warn("randomIntInclusive: failed to generate secure random value", zap.Error(err))
		}
		return minValue
	}

	return minValue + int(value.Int64())
}

func (s *Service) randomEquipmentElementID() int {
	value, err := crand.Int(crand.Reader, big.NewInt(6))
	if err != nil {
		if s.logger != nil {
			s.logger.Warn("randomEquipmentElementID: failed to generate secure random element", zap.Error(err))
		}
		return domainelement.ClientElementLight
	}

	return int(value.Int64()) + 1
}

// DeleteItemByTemplateAndSlotType deletes all items with matching template ID from a specific slot type.
func (s *Service) ConsumeItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) (bool, error) {
	items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, item.SlotTypeBag)
	if err != nil {
		return false, err
	}
	for _, it := range items {
		if it.TemplateID == templateID && it.StackCount >= count {
			it.StackCount -= count
			if it.StackCount <= 0 {
				return true, s.itemRepo.Delete(ctx, it.ID)
			}
			return true, s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount)
		}
	}
	return false, nil
}

// This is used for quest items that need to be removed after quest completion.
func (s *Service) DeleteItemByTemplateAndSlotType(ctx context.Context, charID int64, templateID int, slotType item.SlotType) error {
	// Find items in the specified slot type with matching template ID
	items, err := s.itemRepo.FindByCharacterAndSlotType(ctx, charID, slotType)
	if err != nil {
		return err
	}

	deletedCount := 0
	for _, it := range items {
		if it.TemplateID == templateID {
			if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
				s.logger.Warn("Failed to delete item",
					zap.Int64("character_id", charID),
					zap.Int64("item_id", it.ID),
					zap.Int("template_id", templateID),
					zap.Error(err))
				continue
			}
			deletedCount++
		}
	}

	if deletedCount > 0 {
		s.logger.Info("Deleted items by template and slot type",
			zap.Int64("character_id", charID),
			zap.Int("template_id", templateID),
			zap.Int("slot_type", int(slotType)),
			zap.Int("deleted_count", deletedCount))
	}

	return nil
}
