// Open-sourced by BaoLT

// Equipment maker updates persist Flash-compatible signature data on item instances.
package item

import (
	"context"
	"fmt"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

const equipmentMakerSilverCost int64 = 10000

type ChangeEquipmentMakerResult struct {
	Equipment              *domainitem.Item
	ConsumedItem           *domainitem.Item
	ConsumedItemDeleted    bool
	RemainingMaterialCount int
	MaterialResponseID     int64
	NewMoney               int64
}

func (s *Service) UpdateEquipmentMaker(ctx context.Context, itemID int64, maker string) (*domainitem.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if !it.IsEquipment() {
		return nil, pkgerrors.ErrInvalidInput
	}
	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["maker"] = maker
	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}
	return it, nil
}

func equipmentMakerIntValue(value interface{}) int {
	switch v := value.(type) {
	case int:
		return v
	case int8:
		return int(v)
	case int16:
		return int(v)
	case int32:
		return int(v)
	case int64:
		return int(v)
	case uint:
		return int(v)
	case uint8:
		return int(v)
	case uint16:
		return int(v)
	case uint32:
		return int(v)
	case uint64:
		return int(v)
	case float32:
		return int(v)
	case float64:
		return int(v)
	case string:
		n, err := strconv.Atoi(v)
		if err == nil {
			return n
		}
	}

	return 0
}

func (s *Service) equipmentMakerColorCode(it *domainitem.Item) int {
	if it == nil {
		return 0
	}

	colorCode := domainitem.NormalizeEquipmentColorCode(it.ColorCode)
	if colorCode > 0 {
		return colorCode
	}

	if it.Properties != nil {
		quality := equipmentMakerIntValue(it.Properties["q"])
		if quality <= 0 {
			quality = equipmentMakerIntValue(it.Properties["quality"])
		}
		if quality > 0 {
			colorCode = domainitem.EquipmentColorCodeFromQuality(quality)
		}
	}
	if colorCode > 0 {
		return colorCode
	}

	if it.Properties != nil {
		colorCode = domainitem.EquipmentColorCodeFromDisplayColor(equipmentMakerIntValue(it.Properties["color"]))
		if colorCode <= 0 {
			colorCode = domainitem.NormalizeEquipmentColorCode(equipmentMakerIntValue(it.Properties["colorCode"]))
		}
	}
	if colorCode > 0 {
		return colorCode
	}

	return s.resolveItemColorCode(it.TemplateID, it.ItemType, it.ColorCode)
}

func (s *Service) ChangeEquipmentMaker(ctx context.Context, charID, equipmentID, materialRef int64, tempBagFlag bool) (*ChangeEquipmentMakerResult, error) {
	if s.charRepo == nil {
		return nil, fmt.Errorf("character repository not initialized")
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}

	equipment, err := s.GetItemByID(ctx, charID, equipmentID)
	if err != nil {
		return nil, err
	}
	if !equipment.IsEquipment() {
		return nil, pkgerrors.ErrInvalidInput
	}
	if !equipment.IsBound {
		return nil, pkgerrors.ErrInvalidInput
	}
	if s.equipmentMakerColorCode(equipment) < 4 {
		return nil, pkgerrors.ErrInvalidInput
	}

	equipTpl := s.GetEquipmentTemplate(equipment.TemplateID)
	if equipTpl == nil {
		return nil, pkgerrors.ErrInvalidInput
	}
	requiredMaterialID := int(equipTpl.RequireItem3)
	if requiredMaterialID <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	var material *domainitem.Item
	if tempBagFlag {
		material, err = s.GetItemInSlot(ctx, charID, domainitem.SlotTypeTempBag, int(materialRef))
	} else {
		material, err = s.GetItemByID(ctx, charID, materialRef)
	}
	if err != nil {
		return nil, err
	}
	if material.TemplateID != requiredMaterialID || material.StackCount <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}
	if char.Money < equipmentMakerSilverCost {
		return nil, pkgerrors.ErrInvalidInput
	}

	if equipment.Properties == nil {
		equipment.Properties = make(map[string]interface{})
	}
	equipment, err = s.UpdateEquipmentMaker(ctx, equipment.ID, char.Name)
	if err != nil {
		return nil, err
	}

	remaining := material.StackCount - 1
	deleted := false
	if remaining <= 0 {
		if err := s.itemRepo.Delete(ctx, material.ID); err != nil {
			return nil, err
		}
		material.StackCount = 0
		deleted = true
	} else {
		material.StackCount = remaining
		if err := s.itemRepo.UpdateStack(ctx, material.ID, remaining); err != nil {
			return nil, err
		}
	}

	char.Money -= equipmentMakerSilverCost
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	return &ChangeEquipmentMakerResult{
		Equipment:              equipment,
		ConsumedItem:           material,
		ConsumedItemDeleted:    deleted,
		RemainingMaterialCount: material.StackCount,
		MaterialResponseID:     materialRef,
		NewMoney:               char.Money,
	}, nil
}
