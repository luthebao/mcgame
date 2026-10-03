// Open-sourced by BaoLT

// Item element helpers derive character element state from equipped gear.
package item

import (
	"context"
	"strconv"

	"mcgame-server/internal/domain/character"
	domainelement "mcgame-server/internal/domain/element"
)

const maxCharacterElementRank = 12
const minEquippedForSoulGlow = 12

func (s *Service) ApplyCharacterElementState(ctx context.Context, char *character.Character) {
	if char == nil {
		return
	}

	elementID, rank := s.GetCharacterElementState(ctx, char.ID)
	char.Ee = strconv.Itoa(elementID)
	char.En = rank
	char.Ef = s.checkAllSoulsActive(ctx, char.ID)
}

func (s *Service) GetCharacterElementState(ctx context.Context, charID int64) (int, int) {
	equipment, err := s.GetEquipment(ctx, charID)
	if err != nil {
		return domainelement.ClientElementNeutral, 0
	}

	counts := make(map[int]int)
	dominantElementID := domainelement.ClientElementNeutral
	dominantCount := 0

	for _, equippedItem := range equipment {
		if equippedItem == nil {
			continue
		}

		elementID := normalizeEquipmentElementID(equippedItem.Properties["element"])
		if elementID == domainelement.ClientElementNeutral {
			continue
		}

		counts[elementID]++

		if counts[elementID] > dominantCount {
			dominantElementID = elementID
			dominantCount = counts[elementID]
			continue
		}

		if counts[elementID] == dominantCount && (dominantElementID == domainelement.ClientElementNeutral || elementID < dominantElementID) {
			dominantElementID = elementID
		}
	}

	if dominantCount == 0 {
		return domainelement.ClientElementNeutral, 0
	}

	rank := dominantCount
	if rank > maxCharacterElementRank {
		rank = maxCharacterElementRank
	}

	return dominantElementID, rank
}

func (s *Service) checkAllSoulsActive(ctx context.Context, charID int64) bool {
	if s == nil || s.itemRepo == nil || s.gameDataRec == nil {
		return false
	}

	equipment, err := s.GetEquipment(ctx, charID)
	if err != nil || len(equipment) < minEquippedForSoulGlow {
		return false
	}

	activeList := s.BuildEquipActiveList(ctx, charID)

	hasSoul := false
	for _, eq := range equipment {
		tpl := s.GetEquipmentTemplate(eq.TemplateID)
		if tpl == nil || int(tpl.ActiveEquipID) <= 0 {
			continue
		}
		hasSoul = true
		sid := strconv.Itoa(eq.CalculateSID())
		active, _ := activeList[sid].(bool)
		if !active {
			return false
		}
	}

	return hasSoul
}

func normalizeEquipmentElementID(value interface{}) int {
	switch typed := value.(type) {
	case int:
		return domainelement.NormalizeClientElementID(typed)
	case int8:
		return domainelement.NormalizeClientElementID(int(typed))
	case int16:
		return domainelement.NormalizeClientElementID(int(typed))
	case int32:
		return domainelement.NormalizeClientElementID(int(typed))
	case int64:
		return domainelement.NormalizeClientElementID(int(typed))
	case uint:
		return domainelement.NormalizeClientElementID(int(typed))
	case uint8:
		return domainelement.NormalizeClientElementID(int(typed))
	case uint16:
		return domainelement.NormalizeClientElementID(int(typed))
	case uint32:
		return domainelement.NormalizeClientElementID(int(typed))
	case uint64:
		return domainelement.NormalizeClientElementID(int(typed))
	case float32:
		return domainelement.NormalizeClientElementID(int(typed))
	case float64:
		return domainelement.NormalizeClientElementID(int(typed))
	case string:
		parsed, err := strconv.Atoi(typed)
		if err != nil {
			return domainelement.ClientElementNeutral
		}
		return domainelement.NormalizeClientElementID(parsed)
	default:
		return domainelement.ClientElementNeutral
	}
}
