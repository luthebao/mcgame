// Open-sourced by BaoLT

// Equipment star upgrade handlers (starOne, starAll, getStarNum).
// Uses Thăng Tinh Thạch (Star Stones, template ID 5) to increase star level 0-10.
package item

import (
	"math/rand"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	starLevelMax     = 10
	starStoneItemTID = 5
)

var starSuccessRates = [11]int{100, 100, 100, 90, 80, 70, 60, 50, 30, 30, 30}

func starCalcSuccessRate(currentStar int, stoneCount int) int {
	if currentStar < 0 || currentStar >= starLevelMax {
		return 0
	}
	rate := starSuccessRates[currentStar] * stoneCount / 5
	if rate > 100 {
		rate = 100
	}
	return rate
}

func (h *Handler) GetStarNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return 0, nil
	}

	equipmentID, ok := parseFlexibleInt64(args[0])
	if !ok {
		return 0, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, nil
	}

	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, equipmentID)
	if err != nil || equipment == nil {
		return 0, nil
	}

	return equipment.StarLevel, nil
}

func (h *Handler) StarOne(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	stoneCount, ok := parseFlexibleInt64(args[0])
	if !ok || stoneCount < 1 || stoneCount > 5 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	equipmentID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	stoneItemID, ok := parseFlexibleInt64(args[2])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, equipmentID)
	if err != nil || equipment == nil || equipment.ItemType != domainitem.ItemTypeEquipment {
		return nil, nil
	}

	if equipment.StarLevel >= starLevelMax {
		return nil, nil
	}

	stoneItem, err := h.itemService.GetItemByID(ctx.Context, characterID, stoneItemID)
	if err != nil || stoneItem == nil {
		return nil, nil
	}
	if stoneItem.TemplateID != starStoneItemTID {
		return nil, nil
	}
	if stoneItem.StackCount < int(stoneCount) {
		return nil, nil
	}

	consumedStone, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, stoneItemID, int(stoneCount))
	if consumeErr != nil {
		return rtmp.ErrorToResponse(consumeErr), nil
	}
	if deleted {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedStone.ID), float64(consumedStone.CalculateSID()))
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(consumedStone))
	}

	remainingStack := 0
	if !deleted {
		remainingStack = consumedStone.StackCount
	}

	rate := starCalcSuccessRate(equipment.StarLevel, int(stoneCount))
	success := rand.Intn(100) < rate

	newStarLevel := equipment.StarLevel
	if success {
		newStarLevel++
	} else if equipment.StarLevel >= 8 {
		newStarLevel = 0
	}

	if newStarLevel != equipment.StarLevel {
		updatedEquip, updateErr := h.itemService.UpdateEquipmentStarLevel(ctx.Context, equipmentID, newStarLevel)
		if updateErr != nil {
			h.logger.Error("StarOne: failed to update star level", zap.Error(updateErr))
			return nil, nil
		}
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquip))
	}

	h.logger.Info("StarOne: attempt",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("old_star", equipment.StarLevel),
		zap.Int("new_star", newStarLevel),
		zap.Int("rate", rate),
		zap.Bool("success", success))

	return map[string]interface{}{
		"equSlotId":  float64(equipmentID),
		"starSlotId": float64(stoneItemID),
		"num":        float64(remainingStack),
		"starNum":    newStarLevel,
		"flag":       success,
	}, nil
}

func (h *Handler) StarAll(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 4 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	stoneCount, ok := parseFlexibleInt64(args[0])
	if !ok || stoneCount < 1 || stoneCount > 5 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	equipmentID, ok := parseFlexibleInt64(args[1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	maxTarget, ok := parseFlexibleInt64(args[2])
	if !ok || maxTarget < 1 || maxTarget > starLevelMax {
		return nil, pkgerrors.ErrInvalidArgs
	}
	stoneItemID, ok := parseFlexibleInt64(args[3])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	equipment, err := h.itemService.GetItemByID(ctx.Context, characterID, equipmentID)
	if err != nil || equipment == nil || equipment.ItemType != domainitem.ItemTypeEquipment {
		return nil, nil
	}

	stoneItem, err := h.itemService.GetItemByID(ctx.Context, characterID, stoneItemID)
	if err != nil || stoneItem == nil || stoneItem.TemplateID != starStoneItemTID {
		return nil, nil
	}

	currentStar := equipment.StarLevel
	remainingStones := stoneItem.StackCount
	lastSuccess := false

	for currentStar < int(maxTarget) && currentStar < starLevelMax && remainingStones >= int(stoneCount) {
		consumedStone, deleted, consumeErr := h.itemService.ConsumeItemStack(ctx.Context, characterID, stoneItemID, int(stoneCount))
		if consumeErr != nil {
			break
		}
		if deleted {
			remainingStones = 0
		} else {
			remainingStones = consumedStone.StackCount
		}

		rate := starCalcSuccessRate(currentStar, int(stoneCount))
		lastSuccess = rand.Intn(100) < rate

		if lastSuccess {
			currentStar++
		} else if currentStar >= 8 {
			currentStar = 0
		}

		if currentStar != equipment.StarLevel {
			_, updateErr := h.itemService.UpdateEquipmentStarLevel(ctx.Context, equipmentID, currentStar)
			if updateErr != nil {
				h.logger.Error("StarAll: failed to update star level", zap.Error(updateErr))
				break
			}
			equipment.StarLevel = currentStar
		}

		if !lastSuccess && currentStar == 0 {
			break
		}
	}

	updatedEquip, _ := h.itemService.GetItemByID(ctx.Context, characterID, equipmentID)
	if updatedEquip != nil {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedEquip))
	}

	updatedStone, _ := h.itemService.GetItemByID(ctx.Context, characterID, stoneItemID)
	if updatedStone != nil && updatedStone.StackCount > 0 {
		ctx.Connection.SendCallback("onAddCharactorSlot", h.itemDTO(updatedStone))
	} else if remainingStones <= 0 {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(stoneItemID), float64(stoneItem.CalculateSID()))
	}

	h.logger.Info("StarAll: completed",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("equipment_id", equipmentID),
		zap.Int("start_star", equipment.StarLevel),
		zap.Int("end_star", currentStar),
		zap.Int("target", int(maxTarget)),
		zap.Int("remaining_stones", remainingStones))

	return map[string]interface{}{
		"equSlotId":  float64(equipmentID),
		"starSlotId": float64(stoneItemID),
		"num":        float64(remainingStones),
		"starNum":    currentStar,
		"flag":       lastSuccess,
	}, nil
}
