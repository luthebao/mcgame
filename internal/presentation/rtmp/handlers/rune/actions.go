// Open-sourced by BaoLT

// Rune RPC action implementations.
// getRuneBagData: returns the rune bag for the authenticated character via _result.
// exchangeRune: convert duplicate chips -> runes via RuneChip.rid; push updateRuneChipBag
//
//	(always) + onRuneBagUpdate (when something converted). Null responder.
//
// runeMove: bag<->upLvlHole / slot move (args fromBagPos, toBagPos, bagType; -1=upLvlHole).
// arrangeRuneBag: dense-pack the chosen bag (args cid, bagType).
// Both use a null responder and push the full runeInfo via onRuneBagUpdate.
package rune

import (
	"strconv"

	apprune "mcgame-server/internal/application/rune"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetRuneBagData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("getRuneBagData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return emptyRuneBagWire(), nil
	}

	if h.service == nil {
		return emptyRuneBagWire(), nil
	}

	bag, err := h.service.GetRuneBag(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getRuneBagData: load failed",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return emptyRuneBagWire(), nil
	}

	return apprune.RuneBagToWire(bag), nil
}

func emptyRuneBagWire() map[string]interface{} {
	return apprune.RuneBagToWire(apprune.RuneBag{
		ChaBag:    map[string]apprune.RuneSlot{},
		PetBag:    map[string]apprune.RuneSlot{},
		UpLvlHole: 0,
	})
}

func (h *Handler) ExchangeRune(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("exchangeRune called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}

	if h.service == nil {
		return nil, nil
	}

	result, err := h.service.ExchangeRune(ctx.Context, charID)
	if err != nil {
		h.logger.Error("exchangeRune: conversion failed",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return nil, nil
	}

	if ctx.Connection != nil {
		if sendErr := ctx.Connection.SendCallback("updateRuneChipBag", apprune.ChipBagToWire(result.ChipBag)); sendErr != nil {
			h.logger.Warn("exchangeRune: failed to push updateRuneChipBag",
				zap.Int64("character_id", charID),
				zap.Error(sendErr))
		}
		if result.Converted > 0 {
			if sendErr := ctx.Connection.SendCallback("onRuneBagUpdate", apprune.RuneBagToWire(result.Bag)); sendErr != nil {
				h.logger.Warn("exchangeRune: failed to push onRuneBagUpdate",
					zap.Int64("character_id", charID),
					zap.Error(sendErr))
			}
		}
	}

	return nil, nil
}

func runeObjArgAt(args []interface{}, idx int) (map[string]int, bool) {
	if idx < 0 || idx >= len(args) {
		return nil, false
	}
	raw, ok := args[idx].(map[string]interface{})
	if !ok {
		return map[string]int{}, true
	}
	out := make(map[string]int, len(raw))
	for k, v := range raw {
		if n, ok := intFromAny(v); ok {
			out[k] = n
		}
	}
	return out, true
}

func intFromAny(v interface{}) (int, bool) {
	switch typed := v.(type) {
	case float64:
		return int(typed), true
	case int:
		return typed, true
	case int64:
		return int(typed), true
	case string:
		n, err := strconv.Atoi(typed)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}

func (h *Handler) RuneMove(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("runeMove called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok || h.service == nil {
		return nil, nil
	}
	fromBagPos, ok1 := intArgAt(args, 0)
	toBagPos, ok2 := intArgAt(args, 1)
	bagType, ok3 := intArgAt(args, 2)
	if !ok1 || !ok2 || !ok3 {
		return nil, nil
	}

	bag, err := h.service.RuneMove(ctx.Context, charID, fromBagPos, toBagPos, bagType)
	if err != nil {
		h.logger.Warn("runeMove failed",
			zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}

	h.pushRuneBagUpdate(ctx, charID, bag)
	return nil, nil
}

func (h *Handler) ArrangeRuneBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("arrangeRuneBag called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	charID, ok := characterIDFromCtx(ctx)
	if !ok || h.service == nil {
		return nil, nil
	}
	bagType, ok1 := intArgAt(args, 1)
	if !ok1 {
		return nil, nil
	}

	bag, err := h.service.ArrangeRuneBag(ctx.Context, charID, bagType)
	if err != nil {
		h.logger.Warn("arrangeRuneBag failed",
			zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}

	h.pushRuneBagUpdate(ctx, charID, bag)
	return nil, nil
}

func (h *Handler) pushRuneBagUpdate(ctx *rtmp.RPCContext, charID int64, bag apprune.RuneBag) {
	if ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback("onRuneBagUpdate", apprune.RuneBagToWire(bag)); err != nil {
		h.logger.Warn("failed to push onRuneBagUpdate",
			zap.Int64("character_id", charID), zap.Error(err))
	}
}

func intArgAt(args []interface{}, idx int) (int, bool) {
	if idx < 0 || idx >= len(args) {
		return 0, false
	}
	switch v := args[idx].(type) {
	case float64:
		return int(v), true
	case int:
		return v, true
	case int64:
		return int(v), true
	case string:
		n, err := strconv.Atoi(v)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}

func characterIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}
