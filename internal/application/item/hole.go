// Open-sourced by BaoLT

package item

import (
	"context"
	crand "crypto/rand"
	"math/big"
	"strconv"

	"mcgame-server/internal/domain/item"
	pkgerrors "mcgame-server/pkg/errors"
)

const HoleDigCost int64 = 2000
const MaxHoles = 10
const diamondItemTemplateType = 600
const HoleNotDrilled = -1

func GetDrilledHoleCount(properties map[string]interface{}) int {
	if properties == nil {
		return 0
	}
	count := 0
	for i := 1; i <= MaxHoles; i++ {
		if isHoleDrilled(properties, i) {
			count++
		}
	}
	return count
}

func isHoleDrilled(properties map[string]interface{}, slot int) bool {
	val, exists := properties["t"+strconv.Itoa(slot)]
	if !exists {
		return false
	}
	return toIntValue(val) >= 0
}

func isHoleJeweled(properties map[string]interface{}, slot int) bool {
	val, exists := properties["t"+strconv.Itoa(slot)]
	if !exists {
		return false
	}
	return toIntValue(val) > 0
}

func toIntValue(val interface{}) int64 {
	switch v := val.(type) {
	case float64:
		return int64(v)
	case int:
		return int64(v)
	case int64:
		return v
	case string:
		n, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return HoleNotDrilled
		}
		return n
	default:
		return HoleNotDrilled
	}
}

func GetNextUndrilledSlot(properties map[string]interface{}) int {
	for i := 1; i <= MaxHoles; i++ {
		val, exists := properties["t"+strconv.Itoa(i)]
		if !exists || toIntValue(val) < 0 {
			return i
		}
	}
	return -1
}

func (s *Service) DrillEquipmentHole(ctx context.Context, charID int64, itemID int64) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if it == nil {
		return nil, pkgerrors.ErrItemNotFound
	}
	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}
	if !it.IsEquipment() {
		return nil, pkgerrors.ErrInvalidInput
	}

	nextSlot := GetNextUndrilledSlot(it.Properties)
	if nextSlot < 1 {
		return nil, pkgerrors.ErrInvalidInput
	}

	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["t"+strconv.Itoa(nextSlot)] = 0

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}
	return it, nil
}

func GetTotalDrilledSlots(properties map[string]interface{}) int {
	return GetDrilledHoleCount(properties)
}

func RollCraftedHoleCount() int {
	n, err := crand.Int(crand.Reader, big.NewInt(100))
	if err != nil {
		return 1
	}
	roll := int(n.Int64())
	switch {
	case roll < 40:
		return 1
	case roll < 75:
		return 2
	default:
		return 3
	}
}

func ApplyCraftedHoles(properties map[string]interface{}, holeCount int) {
	if properties == nil || holeCount <= 0 {
		return
	}
	if holeCount > MaxHoles {
		holeCount = MaxHoles
	}
	for i := 1; i <= holeCount; i++ {
		properties["t"+strconv.Itoa(i)] = 0
	}
}

func RequiredDiamondColorForSlot(slot int) int {
	if slot < 1 {
		return 0
	}
	return (slot - 1) / 2
}

func GetHoleGemTemplateID(properties map[string]interface{}, slot int) int {
	if slot < 1 || slot > MaxHoles || properties == nil {
		return HoleNotDrilled
	}
	val, exists := properties["t"+strconv.Itoa(slot)]
	if !exists {
		return HoleNotDrilled
	}
	return int(toIntValue(val))
}

func BuildJewelDataResponse(properties map[string]interface{}) map[string]interface{} {
	resp := map[string]interface{}{
		"holeNum": GetDrilledHoleCount(properties),
	}
	for i := 1; i <= MaxHoles; i++ {
		key := "t" + strconv.Itoa(i)
		val := GetHoleGemTemplateID(properties, i)
		resp[key] = val
	}
	return resp
}

func (s *Service) SetHoleGem(ctx context.Context, charID int64, itemID int64, slot int, gemTemplateID int) (*item.Item, error) {
	if slot < 1 || slot > MaxHoles {
		return nil, pkgerrors.ErrInvalidInput
	}

	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if it == nil {
		return nil, pkgerrors.ErrItemNotFound
	}
	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}
	if !it.IsEquipment() {
		return nil, pkgerrors.ErrInvalidInput
	}

	if !isHoleDrilled(it.Properties, slot) {
		return nil, pkgerrors.ErrInvalidInput
	}

	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	it.Properties["t"+strconv.Itoa(slot)] = gemTemplateID

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}
	return it, nil
}

func (s *Service) BulkSetHoleGems(ctx context.Context, charID int64, itemID int64, gems map[int]int) (*item.Item, error) {
	it, err := s.itemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}
	if it == nil {
		return nil, pkgerrors.ErrItemNotFound
	}
	if it.CharacterID != charID {
		return nil, pkgerrors.ErrItemNotOwned
	}
	if !it.IsEquipment() {
		return nil, pkgerrors.ErrInvalidInput
	}

	if it.Properties == nil {
		it.Properties = make(map[string]interface{})
	}
	for slot, gemTplID := range gems {
		if slot < 1 || slot > MaxHoles {
			continue
		}
		if !isHoleDrilled(it.Properties, slot) {
			continue
		}
		it.Properties["t"+strconv.Itoa(slot)] = gemTplID
	}

	if err := s.itemRepo.Update(ctx, it); err != nil {
		return nil, err
	}
	return it, nil
}

func (s *Service) IsDiamondItem(templateID int) bool {
	if s.gameDataRec == nil {
		return false
	}
	tpl := s.gameDataRec.GetItem(templateID)
	if tpl == nil {
		return false
	}
	return int(tpl.Type) == diamondItemTemplateType
}
