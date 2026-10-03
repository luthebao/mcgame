// Open-sourced by BaoLT

// Signature set bonus calculation determines makerActive and qualityType from equipped items.
package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
)

const makerSetRequiredSlots = int(domainitem.EquipSlotMax)

type MakerSetResult struct {
	Active      bool
	QualityType int
}

func (s *Service) CalculateMakerSet(ctx context.Context, charID int64) MakerSetResult {
	if s == nil || s.itemRepo == nil {
		return MakerSetResult{}
	}

	equipment, err := s.GetEquipment(ctx, charID)
	if err != nil {
		return MakerSetResult{}
	}

	return s.calculateMakerSetFromEquipment(equipment)
}

func (s *Service) calculateMakerSetFromEquipment(equipment []*domainitem.Item) MakerSetResult {
	slotFilled := make(map[int]*domainitem.Item, makerSetRequiredSlots)
	for _, eq := range equipment {
		if eq.SlotIndex >= 0 && eq.SlotIndex < makerSetRequiredSlots {
			slotFilled[eq.SlotIndex] = eq
		}
	}

	if len(slotFilled) < makerSetRequiredSlots {
		return MakerSetResult{}
	}

	var commonMaker string
	minColorCode := 99
	allTracViet := true

	for slot := 0; slot < makerSetRequiredSlots; slot++ {
		eq := slotFilled[slot]
		if eq == nil {
			return MakerSetResult{}
		}

		maker := equipPropertyString(eq.Properties, "maker")
		if maker == "" {
			return MakerSetResult{}
		}
		if commonMaker == "" {
			commonMaker = maker
		} else if maker != commonMaker {
			return MakerSetResult{}
		}

		colorCode := s.equipmentMakerColorCode(eq)
		if colorCode < minColorCode {
			minColorCode = colorCode
		}

		quality := equipPropertyInt(eq.Properties, "q")
		if quality <= 0 {
			quality = equipPropertyInt(eq.Properties, "quality")
		}
		prefixType := 0
		if quality > 0 {
			prefixType = domainitem.EquipmentPrefixTypeFromQuality(quality)
		}
		if prefixType != 5 {
			allTracViet = false
		}
	}

	qualityType := 0
	switch {
	case minColorCode >= 5 && allTracViet:
		qualityType = 20
	case minColorCode >= 5:
		qualityType = 16
	case minColorCode >= 4 && allTracViet:
		qualityType = 15
	case minColorCode >= 4:
		qualityType = 11
	case minColorCode >= 3 && allTracViet:
		qualityType = 10
	}

	if qualityType == 0 {
		return MakerSetResult{}
	}

	return MakerSetResult{Active: true, QualityType: qualityType}
}

func (s *Service) ApplyCharacterMakerSetState(ctx context.Context, char *character.Character) {
	if char == nil {
		return
	}
	result := s.CalculateMakerSet(ctx, char.ID)
	char.MakerActive = result.Active
	char.QualityType = result.QualityType
}

func equipPropertyString(props map[string]interface{}, key string) string {
	if props == nil {
		return ""
	}
	val, ok := props[key]
	if !ok {
		return ""
	}
	str, ok := val.(string)
	if !ok {
		return ""
	}
	return str
}
