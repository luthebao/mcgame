// Open-sourced by BaoLT

// Trade item and money exchange handlers.
package trade

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) TradeAddItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TradeAddItem called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return map[string]interface{}{"success": false, "error": "missing slot ID"}, nil
	}

	slotID, ok := args[0].(float64)
	if !ok {
		return map[string]interface{}{"success": false, "error": "invalid slot ID"}, nil
	}

	amount := 1
	if len(args) >= 2 {
		if value, ok := args[1].(float64); ok {
			amount = int(value)
		}
	}

	h.logger.Debug("Item added to trade",
		zap.Int64("slot_id", int64(slotID)),
		zap.Int("amount", amount))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) TradeRemoveItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TradeRemoveItem called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return map[string]interface{}{"success": false, "error": "missing slot ID"}, nil
	}

	slotID, ok := args[0].(float64)
	if !ok {
		return map[string]interface{}{"success": false, "error": "invalid slot ID"}, nil
	}

	h.logger.Debug("Item removed from trade", zap.Int64("slot_id", int64(slotID)))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) TradeSetMoney(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TradeSetMoney called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return map[string]interface{}{"success": false, "error": "missing amount"}, nil
	}

	amount, ok := args[0].(float64)
	if !ok {
		return map[string]interface{}{"success": false, "error": "invalid amount"}, nil
	}

	moneyType := 2
	if len(args) >= 2 {
		if value, ok := args[1].(float64); ok {
			moneyType = int(value)
		}
	}

	h.logger.Debug("Money set in trade",
		zap.Int64("amount", int64(amount)),
		zap.Int("money_type", moneyType))

	return map[string]interface{}{"success": true}, nil
}
