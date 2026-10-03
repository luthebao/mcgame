// Open-sourced by BaoLT

// Admin inventory read: get_inventory returns all items for a character enriched with template metadata.
package adminhttp

import (
	"context"
	"math"
	"net/http"
	"sort"
	"strconv"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
)

func adminPrefixTypeFromValue(value interface{}) int {
	switch v := value.(type) {
	case nil:
		return 0
	case int:
		return v
	case int32:
		return int(v)
	case int64:
		return int(v)
	case float32:
		return int(v)
	case float64:
		return int(v)
	case string:
		n, err := strconv.Atoi(v)
		if err != nil {
			return 0
		}
		return n
	default:
		return 0
	}
}

type inventoryItemView struct {
	ID              int64                  `json:"id"`
	TemplateID      int                    `json:"templateId"`
	TemplateName    string                 `json:"templateName"`
	TemplateTableID int                    `json:"templateTableId"`
	ItemType        int                    `json:"itemType"`
	SlotType        int                    `json:"slotType"`
	SlotIndex       int                    `json:"slotIndex"`
	SID             int                    `json:"sid"`
	StackCount      int                    `json:"stackCount"`
	IsBound         bool                   `json:"isBound"`
	ColorCode       int                    `json:"colorCode"`
	EnchantLevel    int                    `json:"enchantLevel"`
	StarLevel       int                    `json:"starLevel"`
	Durability      *int                   `json:"durability,omitempty"`
	MaxDurability   *int                   `json:"maxDurability,omitempty"`
	IconCode        int                    `json:"iconCode"`
	ResCode         int                    `json:"resCode"`
	PreNameType     int                    `json:"preNameType"`
	Properties      map[string]interface{} `json:"properties,omitempty"`
}

type inventoryResponse struct {
	BagSlots        int                 `json:"bagSlots"`
	BankSlots       int                 `json:"bankSlots"`
	TempBagSlots    int                 `json:"tempBagSlots"`
	QuestBagSlots   int                 `json:"questBagSlots"`
	PetItemBagSlots int                 `json:"petItemBagSlots"`
	PetSlots        int                 `json:"petSlots"`
	EquipSlots      int                 `json:"equipSlots"`
	Items           []inventoryItemView `json:"items"`
}

func (s *Server) executeGetInventory(w http.ResponseWriter, ctx context.Context, char *character.Character) {
	items, err := s.itemProvider.FindByCharacterID(ctx, char.ID)
	if err != nil {
		s.logger.Error("admin get_inventory: failed to load items",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to load inventory"})
		return
	}

	views := make([]inventoryItemView, 0, len(items))
	for _, it := range items {
		if it == nil {
			continue
		}
		views = append(views, s.buildInventoryItemView(it))
	}

	sort.Slice(views, func(i, j int) bool {
		if views[i].SlotType != views[j].SlotType {
			return views[i].SlotType < views[j].SlotType
		}
		return views[i].SlotIndex < views[j].SlotIndex
	})

	resp := inventoryResponse{
		BagSlots:        char.MaxBagSlots(),
		BankSlots:       char.MaxBankSlots(),
		TempBagSlots:    item.DefaultTempBagSlots,
		QuestBagSlots:   item.DefaultQuestBagSlots,
		PetItemBagSlots: item.DefaultPetItemBagSlots,
		PetSlots:        maxPetSlots(char),
		EquipSlots:      int(item.EquipSlotMax),
		Items:           views,
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:       true,
		Action:   "get_inventory",
		TargetID: char.ID,
		Data:     resp,
	})
}

func maxPetSlots(char *character.Character) int {
	if char == nil {
		return 0
	}
	if char.PetMaxNum > 0 {
		return char.PetMaxNum
	}
	return char.PetSlots
}

func (s *Server) buildInventoryItemView(it *item.Item) inventoryItemView {
	view := inventoryItemView{
		ID:            it.ID,
		TemplateID:    it.TemplateID,
		ItemType:      int(it.ItemType),
		SlotType:      int(it.SlotType),
		SlotIndex:     it.SlotIndex,
		SID:           it.CalculateSID(),
		StackCount:    it.StackCount,
		IsBound:       it.IsBound,
		ColorCode:     it.ColorCode,
		EnchantLevel:  it.EnchantLevel,
		StarLevel:     it.StarLevel,
		Durability:    it.Durability,
		MaxDurability: it.MaxDurability,
		Properties:    it.Properties,
	}

	if it.ItemType == item.ItemTypeEquipment {
		view.TemplateTableID = 19
		if s.templateProvider != nil {
			if tpl := s.templateProvider.GetEquipmentTemplate(it.TemplateID); tpl != nil {
				view.TemplateName = tpl.Name
				view.IconCode = int(math.Trunc(tpl.IconCode))
				view.ResCode = int(math.Trunc(tpl.ResCode))
			}
		}
		if it.Properties != nil {
			view.PreNameType = item.NormalizeEquipmentPrefixType(adminPrefixTypeFromValue(it.Properties["preNameType"]))
		}
	} else {
		view.TemplateTableID = 29
		if s.templateProvider != nil {
			if tpl := s.templateProvider.GetItemTemplate(it.TemplateID); tpl != nil {
				view.TemplateName = tpl.Name
				view.IconCode = int(math.Trunc(tpl.IconCode))
			}
		}
	}

	return view
}
