// Open-sourced by BaoLT

// Activity panel handlers cover featured activity, premium membership, and combo shop data.
package activity

import (
	"fmt"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetJXHDList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charIDStr := ctx.CharacterID
	if charIDStr == "" {
		h.logger.Warn("GetJXHDList: no character ID in session", zap.Uint32("conn_id", ctx.ConnID))
		return nil, errors.ErrUnauthorized
	}

	h.logger.Debug("GetJXHDList: fetching activity list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", charIDStr))

	now := time.Now().UnixMilli()
	activities := map[string]interface{}{
		"LimitTimeShop":      map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"SystemShopDiscount": map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"Gailv":              map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000, "notice": "Tỷ lệ tăng giới hạn thời gian"},
		"Goldman":            map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"MonthWelfare":       map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"ConsumeAward":       map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"Wawagame":           map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"PointAward":         map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"ComboShop":          map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"JewelRemove":        map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"Juhuasuan":          map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"Treasurebowl":       map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"VipShop":            map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"Dailysignin":        map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"Happyline":          map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"PointNotice":        map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000, "text": "Nạp tích lũy nhận quà giá trị", "text2": "Chi tiết phần thưởng nạp tích lũy..."},
		"xcds":               map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
		"mczd":               map[string]interface{}{"startTime": now - 86400000, "endTime": now + 86400000},
	}

	h.logger.Info("GetJXHDList: returning activity list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", charIDStr),
		zap.Int("count", len(activities)))

	if err := ctx.Connection.SendCallback("onJXHDList", activities); err != nil {
		h.logger.Error("GetJXHDList: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return activities, nil
}

func (h *Handler) InitPmData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "InitPmData")
	if err != nil {
		return nil, err
	}
	if h.premiumService == nil {
		return nil, errors.ErrSystemError
	}

	h.logger.Debug("InitPmData: fetching premium member data",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	state, err := h.premiumService.GetPMState(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	response := pmInitResponse(state)

	h.logger.Info("InitPmData: returning premium member data",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("pm_level", state.PMLevel))

	if err := ctx.Connection.SendCallback("onInitPmData", response); err != nil {
		h.logger.Error("InitPmData: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return response, nil
}

func (h *Handler) GetSendCombineAct(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetSendCombineAct")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetSendCombineAct: fetching send combine activities",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	activities := buildSendCombineActivitiesWithBuyCounts(h.getSendCombineBuyCounts(characterID))

	h.logger.Info("GetSendCombineAct: returning send combine activities",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("count", len(activities)))

	if ctx.Connection != nil {
		if err := ctx.Connection.SendCallback("onGetSendCombineAct", activities); err != nil {
			h.logger.Error("GetSendCombineAct: failed to send callback",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(err))
		}
	}

	return activities, nil
}

func (h *Handler) BuyPm(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "BuyPm")
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		h.logger.Warn("BuyPm: missing level parameter", zap.Uint32("conn_id", ctx.ConnID))
		return nil, errors.ErrInvalidArgs
	}
	if h.premiumService == nil {
		return nil, errors.ErrSystemError
	}

	pmLevel, ok := parseIntArg(args[0])
	if !ok {
		h.logger.Warn("BuyPm: invalid level type", zap.Any("level", args[0]))
		return nil, errors.ErrInvalidInput
	}
	if pmLevel < 1 || pmLevel > 3 {
		h.logger.Warn("BuyPm: invalid level range", zap.Int("level", pmLevel))
		return nil, errors.ErrInvalidInput
	}

	h.logger.Info("BuyPm: purchasing premium member",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("pm_level", pmLevel))

	state, err := h.premiumService.BuyPM(ctx.Context, characterID, pmLevel)
	if err != nil {
		h.logger.Warn("BuyPm: purchase failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Int("pm_level", pmLevel),
			zap.Error(err))
		if ctx.Connection != nil {
			_ = ctx.Connection.SendCallback("onRedMsg", fmt.Sprintf("Mua thất bại: %s", err.Error()))
		}
		return nil, nil
	}

	response := pmBuyResponse(state)

	h.logger.Info("BuyPm: purchase completed",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("pm_level", state.PMLevel),
		zap.Float64("keep_day", state.KeepDay))

	if err := ctx.Connection.SendCallback("onBuyPm", response); err != nil {
		h.logger.Error("BuyPm: failed to send callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}
	_ = ctx.Connection.SendCallback("onAddPm", response)
	if state.GoldCost > 0 {
		_ = ctx.Connection.SendCallback("onAddMoney", float64(characterID), "gold", float64(-state.GoldCost), float64(state.Gold))
	}
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": state.Gold})

	h.pushPMLevelUpdate(ctx, characterID, state.PMLevel)

	return response, nil
}

func pmInitResponse(state *appactivity.PMState) map[string]interface{} {
	return map[string]interface{}{
		"data": map[string]interface{}{
			"pmExp":      state.PMExp,
			"activeType": state.ActiveType,
			"keepDay":    state.KeepDay,
			"activeTime": state.ActiveTime,
		},
		"date":        state.Date,
		"flag":        state.PMLevel,
		"processFlag": state.ProcessFlag,
		"findback":    state.Findback,
	}
}

func pmBuyResponse(state *appactivity.PMState) map[string]interface{} {
	return map[string]interface{}{
		"level": state.PMLevel,
		"data": map[string]interface{}{
			"pmExp":      state.PMExp,
			"activeType": state.ActiveType,
			"keepDay":    state.KeepDay,
			"activeTime": state.ActiveTime,
		},
	}
}

func (h *Handler) pushPMLevelUpdate(ctx *rtmp.RPCContext, characterID int64, pmLevel int) {
	payload := map[string]interface{}{
		"cid":     characterID,
		"pmLevel": pmLevel,
	}

	if ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("updateScenePmLevel", payload)
	}

	if h.rtmpServer == nil || ctx.Connection == nil {
		return
	}

	mapID, _ := ctx.Connection.GetSceneInfo()
	if mapID <= 0 {
		return
	}

	h.rtmpServer.GetSceneManager().BroadcastToScene(
		ctx.Connection.GetChannelID(),
		mapID,
		ctx.ConnID,
		"updateScenePmLevel",
		payload,
	)
}
