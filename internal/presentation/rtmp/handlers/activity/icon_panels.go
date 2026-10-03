// Open-sourced by BaoLT

// Activity icon panel handlers return safe starter payloads for client panels opened from startedActList.
package activity

import (
	"context"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetXCDSData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "GetXCDSData")
	if err != nil {
		return nil, err
	}

	response := map[string]interface{}{
		"canMove": false,
		"score":   0,
		"rank":    0,
	}

	h.sendActivityCallback(ctx, "onXCDSGetData", response)
	h.logger.Info("GetXCDSData: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) XCDSGetRank(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "XCDSGetRank")
	if err != nil {
		return nil, err
	}

	response := []interface{}{}

	h.sendActivityCallback(ctx, "onXCDSRank", response)
	h.logger.Info("XCDSGetRank: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetConsumeNoticeData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "GetConsumeNoticeData")
	if err != nil {
		return nil, err
	}

	now := time.Now()
	response := map[string]interface{}{
		"t":     1,
		"start": now.Unix(),
		"end":   now.Add(7 * 24 * time.Hour).Unix(),
		"at":    now.Add(8 * 24 * time.Hour).Unix(),
		"info":  "Hoat dong tieu dung dang duoc cap nhat.",
		"it":    []interface{}{},
	}

	h.logger.Info("GetConsumeNoticeData: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetShowTimeInfo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "GetShowTimeInfo")
	if err != nil {
		return nil, err
	}

	response := map[string]interface{}{
		"1": map[string]interface{}{"v": 0},
		"2": map[string]interface{}{"v": 0},
	}

	h.sendActivityCallback(ctx, "onGetShowTimeData", response, false)
	h.logger.Info("GetShowTimeInfo: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetMCZDData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "GetMCZDData")
	if err != nil {
		return nil, err
	}

	now := time.Now()
	response := map[string]interface{}{
		"start":         now.Format("2006-01-02 15:04:05"),
		"end":           now.Add(7 * 24 * time.Hour).Format("2006-01-02 15:04:05"),
		"mczdTodayRank": map[string]interface{}{},
		"mczdAllRank":   map[string]interface{}{},
		"todayMyRank":   -1,
		"allMyRank":     -1,
		"flag": map[string]interface{}{
			"myregion":        -1,
			"type":            0,
			"todaypnt":        0,
			"allpnt":          0,
			"mytimes":         0,
			"alltimes":        0,
			"myPurchaseTimes": 0,
			"totaltimes":      0,
		},
	}

	h.sendActivityCallback(ctx, "onMCZDGetData", response)
	h.logger.Info("GetMCZDData: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetMYTCDataView(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "GetMYTCDataView")
	if err != nil {
		return nil, err
	}

	response := map[string]interface{}{
		"tc":  map[string]interface{}{},
		"lt":  3,
		"lt2": 3,
		"lt3": 1,
		"lt4": 3,
		"ymd": time.Now().Format("20060102"),
	}

	h.sendActivityCallback(ctx, "onMYTCData", response)
	h.logger.Info("GetMYTCDataView: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetHMTXLSData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, char, err := h.loadActivityCharacter(ctx, "GetHMTXLSData")
	if err != nil {
		return nil, err
	}

	level := 1
	if char != nil && char.Level > 0 {
		level = char.Level
	}

	now := time.Now()
	response := map[string]interface{}{
		"pubdata": map[string]interface{}{
			"plist":    map[string]interface{}{},
			"plistadv": map[string]interface{}{},
			"flagat":   0,
		},
		"nmldata": map[string]interface{}{
			"name": "Normal",
		},
		"now": now.UnixMilli(),
		"lev": level,
	}

	h.sendActivityCallback(ctx, "onHMTXLSData", response)
	h.logger.Info("GetHMTXLSData: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("level", level))

	return response, nil
}

func (h *Handler) EnterPubRoom(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, char, err := h.loadActivityCharacter(ctx, "EnterPubRoom")
	if err != nil {
		return nil, err
	}

	level := 1
	if char != nil && char.Level > 0 {
		level = char.Level
	}

	now := time.Now()
	response := map[string]interface{}{
		"pubdata": map[string]interface{}{
			"plist":    map[string]interface{}{},
			"plistadv": map[string]interface{}{},
			"flagat":   0,
		},
		"nmldata": map[string]interface{}{
			"name": "Normal",
		},
		"now": now.UnixMilli(),
		"lev": level,
	}

	h.sendActivityCallback(ctx, "onHMTXLSData", response)
	h.sendActivityCallback(ctx, "onMidNote", "Làm mới dữ liệu")
	h.logger.Info("EnterPubRoom: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("level", level))

	return nil, nil
}

func (h *Handler) GetTXKCData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, _, err := h.loadActivityCharacter(ctx, "GetTXKCData")
	if err != nil {
		return nil, err
	}

	now := time.Now()
	response := map[string]interface{}{
		"start": now.Format("2006-01-02"),
		"end":   now.Add(7 * 24 * time.Hour).Format("2006-01-02"),
		"days":  7,
		"flag": map[string]interface{}{
			"lev":  1,
			"exp":  0,
			"p":    0,
			"awd1": 0,
			"awd2": 0,
		},
	}

	h.sendActivityCallback(ctx, "onTXKCGetData", response)
	h.logger.Info("GetTXKCData: returning starter payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) loadActivityCharacter(ctx *rtmp.RPCContext, method string) (int64, *domainchar.Character, error) {
	_, characterID, err := h.characterID(ctx, method)
	if err != nil {
		return 0, nil, err
	}
	if h.characterRepo == nil {
		return characterID, nil, nil
	}

	requestContext := ctx.Context
	if requestContext == nil {
		requestContext = context.Background()
	}

	char, err := h.characterRepo.FindByID(requestContext, characterID)
	if err != nil {
		h.logger.Warn(method+": failed to load character for starter payload",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return characterID, nil, nil
	}

	return characterID, char, nil
}

func (h *Handler) sendActivityCallback(ctx *rtmp.RPCContext, method string, args ...interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback(method, args...); err != nil {
		h.logger.Error("activity callback failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("method", method),
			zap.Error(err))
	}
}
