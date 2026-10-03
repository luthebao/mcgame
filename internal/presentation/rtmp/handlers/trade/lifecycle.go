// Open-sourced by BaoLT

// Trade lifecycle handlers.
package trade

import (
	"strconv"

	apptrade "mcgame-server/internal/application/trade"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

func (h *Handler) NewTrade(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("NewTrade called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	initiatorID, err := parseCharacterID(ctx)
	if err != nil {
		h.logger.Warn("NewTrade: invalid character ID",
			zap.String("character_id", ctx.CharacterID),
			zap.Error(err))
		return map[string]interface{}{"flag": false, "info": "Invalid character ID"}, nil
	}
	if len(args) < 1 {
		return map[string]interface{}{"flag": false, "info": "Missing target player ID"}, nil
	}
	targetID, ok := parseInt64Value(args[0])
	if !ok || targetID <= 0 {
		return map[string]interface{}{"flag": false, "info": "Invalid target player ID"}, nil
	}

	if targetID == initiatorID {
		return map[string]interface{}{"flag": false, "info": "Cannot trade with yourself"}, nil
	}

	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetID, 10))
	if targetConn == nil {
		return map[string]interface{}{"flag": false, "info": "Target player is not online"}, nil
	}
	initiator, err := h.charService.GetByID(ctx.Context, initiatorID)
	if err != nil {
		h.logger.Warn("NewTrade: initiator lookup failed",
			zap.Int64("initiator_id", initiatorID),
			zap.Error(err))
		return map[string]interface{}{"flag": false, "info": "Failed to start trade"}, nil
	}
	result, err := h.tradeService.StartTrade(ctx.Context, initiatorID, targetID)
	if err != nil {
		return map[string]interface{}{"flag": false, "info": err.Error()}, nil
	}

	h.logger.Debug("Trade request initiated",
		zap.Int64("trade_id", result.TradeID),
		zap.Int64("initiator_id", initiatorID),
		zap.Int64("target_id", targetID))
	if err := targetConn.SendCallback("onRequestTrade", initiatorID, initiator.Name); err != nil {
		_, _ = h.tradeService.StopTrade(ctx.Context, initiatorID)
		h.logger.Warn("NewTrade: failed to notify target",
			zap.Int64("trade_id", result.TradeID),
			zap.Int64("target_id", targetID),
			zap.Error(err))
		return map[string]interface{}{"flag": false, "info": "Target player is not available"}, nil
	}
	h.broadcastActionState([]int64{initiatorID, targetID}, apptrade.ActionStateTrade)

	return map[string]interface{}{
		"flag":    true,
		"tradeId": result.TradeID,
	}, nil
}

func (h *Handler) StopTrade(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("StopTrade called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))
	charID, err := parseCharacterID(ctx)
	if err != nil {
		return nil, nil
	}
	result, err := h.tradeService.StopTrade(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("StopTrade failed",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return nil, nil
	}
	if result == nil {
		return nil, nil
	}
	participants := []int64{result.InitiatorID, result.TargetID}
	h.restoreTradeItems(result.RestoredByCharacter)
	h.broadcastTradeCallback(participants, "onStopTrade")
	h.broadcastActionState(participants, apptrade.ActionStateNormal)
	return nil, nil
}

func (h *Handler) TradeLock(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TradeLock called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))
	charID, err := parseCharacterID(ctx)
	if err != nil {
		return map[string]interface{}{"flag": false, "info": "Invalid character ID"}, nil
	}
	input, err := h.parseLockInput(args)
	if err != nil {
		return map[string]interface{}{"flag": false, "info": err.Error()}, nil
	}
	result, err := h.tradeService.LockTrade(ctx.Context, charID, input)
	if err != nil {
		return map[string]interface{}{"flag": false, "info": err.Error()}, nil
	}
	h.sendHiddenTradeItems(charID, result.HiddenItems)
	h.sendCallbackToCharacter(result.TargetID, "onTargetLock", result.OfferCallback)
	return map[string]interface{}{"flag": true}, nil
}

func (h *Handler) TradeConfirm(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TradeConfirm called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return map[string]interface{}{"flag": false, "success": false}, nil
	}

	passHash, ok := args[0].(string)
	if !ok || passHash == "" {
		return map[string]interface{}{"flag": false, "success": false}, nil
	}

	if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
		h.logger.Warn("TradeConfirm: secondary password verification failed", zap.String("account_id", ctx.AccountID), zap.Error(err))
		if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
			h.logger.Error("TradeConfirm: failed to notify client about secondary password failure", zap.Error(notifyErr))
		}
		return map[string]interface{}{"flag": false, "success": false}, nil
	}

	if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil {
		h.logger.Error("TradeConfirm: failed to sync client password", zap.Error(err))
	}
	charID, err := parseCharacterID(ctx)
	if err != nil {
		return map[string]interface{}{"flag": false, "success": false, "info": "Invalid character ID"}, nil
	}
	result, err := h.tradeService.ConfirmTrade(ctx.Context, charID)
	if err != nil {
		return map[string]interface{}{"flag": false, "success": false, "info": err.Error()}, nil
	}
	if result.Failed {
		participants := []int64{result.SelfID, result.TargetID}
		h.restoreTradeItems(result.RestoredByCharacter)
		h.broadcastTradeCallback(participants, "onTradeFail", result.Info)
		h.broadcastActionState(participants, apptrade.ActionStateNormal)
		return map[string]interface{}{"flag": false, "success": false, "info": result.Info}, nil
	}
	response := map[string]interface{}{
		"flag":    true,
		"success": true,
	}
	if len(result.Received) > 0 {
		response["received"] = result.Received
	}
	if !result.Completed {
		return response, nil
	}
	h.sendCallbackToCharacter(result.TargetID, "onTargetConfirm")
	participants := []int64{result.SelfID, result.TargetID}
	h.sendReceivedTradeItems(result.AddedByCharacter)
	h.sendTradeCurrencyUpdates(result.CurrencyByCharacter)
	h.broadcastActionState(participants, apptrade.ActionStateNormal)
	h.broadcastTradeCallback(participants, "onTradeSuccess")
	return response, nil
}
