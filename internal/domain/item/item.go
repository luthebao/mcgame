// Open-sourced by BaoLT

// Item entity represents inventory items with type-specific behaviors.
// Supports equipment with durability, stackable consumables, and quest items.
// Handles slot management across bag, equipped, and bank storage.
package item

import (
	"time"
)

type ItemType int

const (
	ItemTypeConsumable ItemType = 1
	ItemTypeEquipment  ItemType = 2
	ItemTypeMaterial   ItemType = 3
	ItemTypeQuest      ItemType = 4
)

type SlotType int

const (
	SlotTypeBag         SlotType = 0
	SlotTypeEquipped    SlotType = 1
	SlotTypeBank        SlotType = 2
	SlotTypeTempBag     SlotType = 3
	SlotTypeQuestBag    SlotType = 4 // Quest items bag (30 slots, SID 2311-2340)
	SlotTypePetItemBag  SlotType = 5 // Pet items bag (30 slots, SID 2341-2370)
	SlotTypePetEquipped SlotType = 6 // Pet equipment slots (200 slots, SID 1001-1200)
)

type EquipSlot int

const (
	EquipSlotWeapon   EquipSlot = 0
	EquipSlotOffhand  EquipSlot = 1
	EquipSlotHelmet   EquipSlot = 2
	EquipSlotChest    EquipSlot = 3
	EquipSlotGloves   EquipSlot = 4
	EquipSlotBoots    EquipSlot = 5
	EquipSlotNecklace EquipSlot = 6
	EquipSlotRing1    EquipSlot = 7
	EquipSlotRing2    EquipSlot = 8
	EquipSlotBelt     EquipSlot = 9
	EquipSlotCape     EquipSlot = 10
	EquipSlotMax      EquipSlot = 11
)

const (
	DefaultBagSlots        = 210 // 7 pages * 30 slots for regular items only
	DefaultQuestBagSlots   = 30  // 1 page * 30 slots for quest items
	DefaultPetItemBagSlots = 30  // 1 page * 30 slots for pet items
	DefaultBankSlots       = 150 // 5 pages * 30 slots
	DefaultTempBagSlots    = 30  // 1 page * 30 slots (20 actually used: 80-99)
)

type Item struct {
	ID          int64
	CharacterID int64
	TemplateID  int
	ItemType    ItemType
	SlotType    SlotType
	SlotIndex   int
	StackCount  int
	IsBound     bool

	Durability    *int
	MaxDurability *int
	EnchantLevel  int
	StarLevel     int
	ColorCode     int

	Properties map[string]interface{}

	CreatedAt time.Time
	UpdatedAt time.Time
}

func NewItem(charID int64, templateID int, itemType ItemType, slotType SlotType, slotIndex int) *Item {
	now := time.Now()
	return &Item{
		CharacterID: charID,
		TemplateID:  templateID,
		ItemType:    itemType,
		SlotType:    slotType,
		SlotIndex:   slotIndex,
		StackCount:  1,
		IsBound:     false,
		Properties:  make(map[string]interface{}),
		CreatedAt:   now,
		UpdatedAt:   now,
	}
}

func NewEquipment(charID int64, templateID int, slotIndex int, durability int) *Item {
	item := NewItem(charID, templateID, ItemTypeEquipment, SlotTypeBag, slotIndex)
	item.Durability = &durability
	item.MaxDurability = &durability
	return item
}

func (i *Item) IsEquipment() bool {
	return i.ItemType == ItemTypeEquipment
}

func (i *Item) IsConsumable() bool {
	return i.ItemType == ItemTypeConsumable
}

func (i *Item) IsStackable() bool {
	return i.ItemType == ItemTypeConsumable || i.ItemType == ItemTypeMaterial
}

func (i *Item) CanStack(other *Item) bool {
	if !i.IsStackable() {
		return false
	}
	return i.TemplateID == other.TemplateID &&
		i.IsBound == other.IsBound &&
		i.SlotType == other.SlotType &&
		i.ColorCode == other.ColorCode
}

func (i *Item) IsEquipped() bool {
	return i.SlotType == SlotTypeEquipped
}

func (i *Item) IsBroken() bool {
	if i.Durability == nil {
		return false
	}
	return *i.Durability <= 0
}

func (i *Item) NeedsRepair() bool {
	if i.Durability == nil || i.MaxDurability == nil {
		return false
	}
	return *i.Durability < *i.MaxDurability
}

func (i *Item) Repair() {
	if i.MaxDurability != nil {
		i.Durability = i.MaxDurability
	}
}

func (i *Item) ReduceDurability(amount int) {
	if i.Durability == nil {
		return
	}
	*i.Durability -= amount
	if *i.Durability < 0 {
		*i.Durability = 0
	}
}

func (i *Item) MoveTo(slotType SlotType, slotIndex int) {
	i.SlotType = slotType
	i.SlotIndex = slotIndex
	i.UpdatedAt = time.Now()
}

func (i *Item) Equip(equipSlot EquipSlot) {
	i.MoveTo(SlotTypeEquipped, int(equipSlot))
}

func (i *Item) Unequip(bagSlot int) {
	i.MoveTo(SlotTypeBag, bagSlot)
}

func (i *Item) ToDTO() map[string]interface{} {
	// Calculate global slot ID (sid) based on slot type and index
	sid := i.CalculateSID()
	effectiveColorCode := i.ColorCode
	binded := "0"
	if i.IsBound {
		binded = "1"
	}

	// Map internal ItemType to Flash client TBL_* constants for the "type" field
	// The client expects the Instance Table ID for items in the bag (sList), not the Template ID.
	// TBL_EQUIPT_INSTANCE = 18
	// TBL_ITEM_INSTANCE = 28
	clientTableType := 28
	if i.ItemType == ItemTypeEquipment {
		clientTableType = 18
	}

	dto := map[string]interface{}{
		"id":       i.ID,
		"sid":      sid,
		"giid":     i.TemplateID,    // Global Instance ID (Template ID)
		"type":     clientTableType, // FLASH TABLE TYPE (18 or 28)
		"itemId":   i.ID,            // Instance ID (Required for lookup when type is 28/18)
		"tid":      i.TemplateID,    // Template ID (required for getTemplateData from Instance)
		"cid":      i.TemplateID,    // Config ID (Template ID), required by some client views
		"stackNum": i.StackCount,    // Stack count (client calls this stackNum)
		"binded":   binded,
		// Meta fields for client logic
		"itemType":   int(i.ItemType), // Internal category (1=consumable, 2=equip, etc.)
		"tplId":      i.TemplateID,
		"slotType":   int(i.SlotType),
		"slotIndex":  i.SlotIndex,
		"stackCount": i.StackCount,
		"enchantLv":  i.EnchantLevel, // Enchant level
		"upgradeNum": i.StarLevel,    // Flash client uses "upgradeNum" for star level display
		"starLv":     i.StarLevel,
		"color":      i.ColorCode,
		"colorCode":  i.ColorCode, // Keep colorCode as well
	}
	if i.ItemType == ItemTypeEquipment {
		dto["color"] = EquipmentDisplayColorFromColorCode(i.ColorCode)
	}

	if i.Durability != nil {
		dto["durability"] = *i.Durability
	}
	if i.MaxDurability != nil {
		dto["maxDurability"] = *i.MaxDurability
	}

	if len(i.Properties) > 0 {
		for k, v := range i.Properties {
			dto[k] = v
		}
		if effectiveColorCode <= 0 {
			if i.ItemType == ItemTypeEquipment {
				effectiveColorCode = EquipmentColorCodeFromDisplayColor(displayIntValue(i.Properties["color"]))
			} else {
				effectiveColorCode = displayIntValue(i.Properties["color"])
			}
		}
		if effectiveColorCode <= 0 {
			effectiveColorCode = displayIntValue(i.Properties["colorCode"])
		}
	}

	if i.ItemType == ItemTypeEquipment {
		prefixType := ResolveEquipmentPrefixType(dto["preNameType"], effectiveColorCode)
		if prefixType > 0 {
			dto["preNameType"] = prefixType
		}
	}

	dto["id"] = i.ID
	dto["itemId"] = i.ID
	dto["sid"] = sid
	dto["binded"] = binded

	return dto
}

// CalculateSID returns the global slot ID based on slot type and index
// This matches the Flash client's SLOT_SID_* constants from GamePredef.as:
// - SLOT_SID_EQUIP = [1, 22] → Equipment slots: 1-21
// - SLOT_SID_BAG = [2101, 2310] → Bag: 7 pages for regular items (210 slots, each page has 30 slots)
// - SLOT_SID_QUESTBAG = [2311, 2340] → Quest items bag: 1 page (30 slots)
// - SLOT_SID_PETITEMBAG = [2341, 2370] → Pet items bag: 1 page (30 slots)
// - SLOT_SID_BANK = [301, 450] → Bank: 5 pages (150 slots, each page has 30 slots)
// - SLOT_SID_TEMPBAG = [80, 99] → Temp bag slots: 80-99 (20 slots)
func (i *Item) CalculateSID() int {
	switch i.SlotType {
	case SlotTypeEquipped:
		// Equipment slot: sid = 1 + slotIndex (range: 1-21)
		return 1 + i.SlotIndex
	case SlotTypeBag:
		// Bag slot: sid = 2100 + slotIndex
		// Structure: 7 pages for regular items only (210 slots)
		// Each page has 30 slots
		return 2100 + i.SlotIndex + 1
	case SlotTypeQuestBag:
		// Quest bag slot: sid = 2311 + slotIndex (range: 2311-2340)
		// 1 page with 30 slots for quest items
		return 2311 + i.SlotIndex
	case SlotTypePetItemBag:
		// Pet item bag slot: sid = 2341 + slotIndex (range: 2341-2370)
		// 1 page with 30 slots for pet items
		return 2341 + i.SlotIndex
	case SlotTypePetEquipped:
		// Pet equipment slot: sid = 1001 + slotIndex (range: 1001-1200)
		return 1001 + i.SlotIndex
	case SlotTypeBank:
		// Bank slot: sid = 300 + slotIndex
		// Structure: 5 pages, each with 30 slots
		return 300 + i.SlotIndex + 1
	case SlotTypeTempBag:
		// Temp bag slot: sid = 80 + slotIndex (range: 80-99)
		return 80 + i.SlotIndex
	default:
		return i.SlotIndex
	}
}

// ParseSID decomposes a global slot ID (sid) back into SlotType and SlotIndex
func ParseSID(sid int) (SlotType, int) {
	if sid >= 1 && sid <= 22 {
		return SlotTypeEquipped, sid - 1
	}
	// Bag: 7 pages regular items = 7 pages * 30 slots = 210 slots
	if sid >= 2101 && sid <= 2310 { // 7 pages * 30 slots
		return SlotTypeBag, sid - 2101
	}
	// Quest Bag: 1 page = 30 slots (SID 2311-2340)
	if sid >= 2311 && sid <= 2340 {
		return SlotTypeQuestBag, sid - 2311
	}
	// Pet Item Bag: 1 page = 30 slots (SID 2341-2370)
	if sid >= 2341 && sid <= 2370 {
		return SlotTypePetItemBag, sid - 2341
	}
	if sid >= 1001 && sid <= 1200 {
		return SlotTypePetEquipped, sid - 1001
	}
	// Bank: 5 pages * 30 slots = 150 slots
	if sid >= 301 && sid <= 450 { // 5 pages * 30 slots
		return SlotTypeBank, sid - 301
	}
	if sid >= 80 && sid <= 99 {
		return SlotTypeTempBag, sid - 80
	}
	if sid >= 100 && sid <= 299 {
		// MX Temp Bag slots (SID 100+) allow direct mapping or specific logic
		// Client sends SID 100 for MX items. We want this to map to SlotIndex 100.
		// So we return sid directly as index.
		return SlotTypeTempBag, sid
	}
	if sid >= 2800 {
		return SlotTypeBag, sid - 2800
	}
	// Fallback/Default
	return SlotTypeBag, sid
}

type SlotConfig struct {
	BagSlots     int
	BankSlots    int
	TempBagSlots int
	EquipSlots   int
}

func DefaultSlotConfig() *SlotConfig {
	return &SlotConfig{
		BagSlots:     DefaultBagSlots,
		BankSlots:    DefaultBankSlots,
		TempBagSlots: DefaultTempBagSlots,
		EquipSlots:   int(EquipSlotMax),
	}
}

func (s *SlotConfig) ToDTO() map[string]interface{} {
	return map[string]interface{}{
		"bagSlots":     s.BagSlots,
		"bankSlots":    s.BankSlots,
		"tempBagSlots": s.TempBagSlots,
		"equipSlots":   s.EquipSlots,
	}
}
