// Open-sourced by BaoLT

// monsterHeartSet and monsterHeartReMove: slot placement and removal with security re-validation.
package monsterheart

import (
	"errors"

	appmonsterheart "mcgame-server/internal/application/monsterheart"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) MonsterHeartSet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MonsterHeartSet called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 4 {
		return nil, nil
	}

	bagItemID := toInt(args[0])
	holePos := toInt(args[1])
	box := toInt(args[2])

	if bagItemID <= 0 || !appmonsterheart.IsValidHole(holePos) || !appmonsterheart.IsValidBox(box) {
		h.logger.Warn("MonsterHeartSet: invalid arguments",
			zap.Int("bag_item_id", bagItemID),
			zap.Int("hole_pos", holePos),
			zap.Int("box", box))
		return nil, nil
	}

	charID, ok := h.charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}

	if h.service == nil {
		return nil, nil
	}

	state, err := h.service.SetSlot(ctx.Context, charID, bagItemID, holePos, box)
	if err != nil {
		if errors.Is(err, appmonsterheart.ErrItemNotInBag) {
			h.logger.Warn("MonsterHeartSet: item not in bag",
				zap.Int64("char_id", charID),
				zap.Int("bag_item_id", bagItemID))
			return nil, nil
		}
		if errors.Is(err, appmonsterheart.ErrSlotAlreadyFull) {
			h.logger.Warn("MonsterHeartSet: slot already occupied",
				zap.Int64("char_id", charID),
				zap.Int("box", box),
				zap.Int("hole_pos", holePos))
			return nil, nil
		}
		if errors.Is(err, appmonsterheart.ErrInvalidBox) || errors.Is(err, appmonsterheart.ErrInvalidHole) {
			h.logger.Warn("MonsterHeartSet: invalid box or hole",
				zap.Int64("char_id", charID),
				zap.Int("box", box),
				zap.Int("hole_pos", holePos))
			return nil, nil
		}
		h.logger.Error("MonsterHeartSet: set slot failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return nil, nil
	}

	h.pushViewProps(ctx, charID)

	wire := stateToWire(state)
	_ = ctx.Connection.SendCallback("updateMonsterHeartPanel", wire)

	return nil, nil
}

func (h *Handler) MonsterHeartReMove(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MonsterHeartReMove called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 2 {
		return nil, nil
	}

	holePos := toInt(args[0])
	box := toInt(args[1])

	if !appmonsterheart.IsValidHole(holePos) || !appmonsterheart.IsValidBox(box) {
		h.logger.Warn("MonsterHeartReMove: invalid arguments",
			zap.Int("hole_pos", holePos),
			zap.Int("box", box))
		return nil, nil
	}

	charID, ok := h.charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}

	if h.service == nil {
		return nil, nil
	}

	state, err := h.service.RemoveSlot(ctx.Context, charID, holePos, box)
	if err != nil {
		if errors.Is(err, appmonsterheart.ErrSlotEmpty) {
			h.logger.Warn("MonsterHeartReMove: slot already empty",
				zap.Int64("char_id", charID),
				zap.Int("box", box),
				zap.Int("hole_pos", holePos))
			return nil, nil
		}
		if errors.Is(err, appmonsterheart.ErrInvalidBox) || errors.Is(err, appmonsterheart.ErrInvalidHole) {
			h.logger.Warn("MonsterHeartReMove: invalid box or hole",
				zap.Int64("char_id", charID),
				zap.Int("box", box),
				zap.Int("hole_pos", holePos))
			return nil, nil
		}
		h.logger.Error("MonsterHeartReMove: remove slot failed",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return nil, nil
	}

	h.pushViewProps(ctx, charID)

	wire := stateToWire(state)
	_ = ctx.Connection.SendCallback("updateMonsterHeartPanel", wire)

	return nil, nil
}

func toInt(v interface{}) int {
	switch typed := v.(type) {
	case float64:
		return int(typed)
	case int:
		return typed
	case int64:
		return int(typed)
	case int32:
		return int(typed)
	}
	return 0
}
