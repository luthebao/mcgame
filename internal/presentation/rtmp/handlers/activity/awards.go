// Open-sourced by BaoLT

// Activity award handlers cover consume, point, shop, gift, and event reward views.
package activity

import (
	"encoding/json"
	"time"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetStageConsumeAwardList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetStageConsumeAwardList")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetStageConsumeAwardList: fetching stage consume award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	now := time.Now().Unix()
	stageData := map[string]interface{}{
		"stageNum": 3,
		"0": map[string]interface{}{
			"start": now - 86400,
			"end":   now + 86400,
			"awardList": map[string]interface{}{
				"0": map[string]interface{}{"min": 100, "max": 500, "award": []interface{}{}, "point": 10},
				"1": map[string]interface{}{"min": 500, "max": 1000, "award": []interface{}{}, "point": 20},
			},
		},
		"1": map[string]interface{}{
			"start": now - 86400,
			"end":   now + 86400,
			"awardList": map[string]interface{}{
				"0": map[string]interface{}{"min": 1000, "max": 2000, "award": []interface{}{}, "point": 30},
			},
		},
		"2": map[string]interface{}{
			"start": now - 86400,
			"end":   now + 86400,
			"awardList": map[string]interface{}{
				"0": map[string]interface{}{"min": 2000, "max": 0, "award": []interface{}{}, "point": 50},
			},
		},
	}

	consumptionTotals := map[string]interface{}{
		"0": map[string]interface{}{"total": 300, "start": now - 86400, "end": now + 86400},
		"1": map[string]interface{}{"total": 1500, "start": now - 86400, "end": now + 86400},
		"2": map[string]interface{}{"total": 2500, "start": now - 86400, "end": now + 86400},
	}

	response := []interface{}{stageData, consumptionTotals}

	h.logger.Info("GetStageConsumeAwardList: returning stage consume award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetConsumeAwardList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetConsumeAwardList")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetConsumeAwardList: fetching consume award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	now := time.Now().Unix()
	awardStages := map[string]interface{}{
		"0": map[string]interface{}{"i": 100, "j": 500, "start": now - 86400, "end": now + 86400, "award": []interface{}{}, "point": 10},
		"1": map[string]interface{}{"i": 500, "j": 1000, "start": now - 86400, "end": now + 86400, "award": []interface{}{}, "point": 20},
		"2": map[string]interface{}{"i": 1000, "j": 0, "start": now - 86400, "end": now + 86400, "award": []interface{}{}, "point": 30},
	}

	response := []interface{}{awardStages, 750}

	h.logger.Info("GetConsumeAwardList: returning consume award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetPointAward(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetPointAward")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetPointAward: fetching point award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	now := time.Now().Unix()
	response := map[string]interface{}{
		"firstTime": map[string]interface{}{"id": 0, "key": "", "value": "", "type": "", "itemId": "", "timeRange": "", "start": 0, "q": 0, "binded": 1},
		"1":         map[string]interface{}{"itemId": 1001, "binded": 1, "start": now - 86400, "end": now + 86400, "q": 1, "value": 100, "type": 18},
		"2":         map[string]interface{}{"itemId": 1002, "binded": 0, "start": now - 86400, "end": now + 86400, "q": 1, "value": 200, "type": 18},
	}

	h.logger.Info("GetPointAward: returning point award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) SearchGameGift(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "SearchGameGift")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("SearchGameGift: searching game gifts",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	gifts := []map[string]interface{}{
		{"giftid": 1001, "code": "GIFT001", "name": "Welcome Gift"},
		{"giftid": 1002, "code": "GIFT002", "name": "New Player Gift"},
	}

	jsonData, marshalErr := json.Marshal(gifts)
	if marshalErr != nil {
		h.logger.Error("SearchGameGift: failed to marshal gifts", zap.Error(marshalErr))
		return nil, pkgerrors.ErrSystemError
	}

	h.logger.Info("SearchGameGift: returning game gifts",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("gift_count", len(gifts)))

	return string(jsonData), nil
}

func (h *Handler) GetShopAward(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetShopAward")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetShopAward: fetching shop award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	now := time.Now().Unix()
	response := map[string]interface{}{
		"firstTime":   map[string]interface{}{"id": 0, "key": "", "value": "", "type": "", "itemId": "", "timeRange": "", "start": 0, "q": 0, "binded": 1},
		"information": map[string]interface{}{"text": "Shop Award Activity"},
		"1":           map[string]interface{}{"i": 10, "j": 50, "itemType": 18, "itemId": 2001, "binded": 1, "start": now - 86400, "end": now + 86400},
		"2":           map[string]interface{}{"i": 50, "j": 100, "itemType": 18, "itemId": 2002, "binded": 0, "start": now - 86400, "end": now + 86400},
		"3":           map[string]interface{}{"i": 100, "j": 0, "itemType": 18, "itemId": 2003, "binded": 1, "start": now - 86400, "end": now + 86400},
	}

	h.logger.Info("GetShopAward: returning shop award list",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) CheckDoubleExpTime(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charIDStr := ctx.CharacterID
	if charIDStr == "" {
		h.logger.Warn("CheckDoubleExpTime: no character ID in session", zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	now := time.Now()
	isDoubleExpActive := now.Hour() >= 18 && now.Hour() < 22
	if isDoubleExpActive {
		endTime := time.Date(now.Year(), now.Month(), now.Day(), 22, 0, 0, 0, now.Location())
		if now.After(endTime) {
			endTime = endTime.Add(24 * time.Hour)
		}
		timeLeftSeconds := int64(endTime.Sub(now).Seconds())
		buffData := map[string]interface{}{
			"bid":      1001,
			"id":       0,
			"type":     0,
			"timeLeft": timeLeftSeconds,
			"desc":     "Double Experience Event Active",
		}

		h.logger.Info("CheckDoubleExpTime: double exp active",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("time_left_seconds", timeLeftSeconds))

		if err := ctx.Connection.SendCallback("addDoubleExpBuff", buffData); err != nil {
			h.logger.Warn("Failed to send addDoubleExpBuff callback",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(err))
		}
	} else {
		if err := ctx.Connection.SendCallback("endDoubleExpBuff"); err != nil {
			h.logger.Warn("Failed to send endDoubleExpBuff callback",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(err))
		}
	}

	return nil, nil
}
