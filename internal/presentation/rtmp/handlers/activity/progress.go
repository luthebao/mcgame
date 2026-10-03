// Open-sourced by BaoLT

// Activity progress handlers cover diary state and ranking views.
package activity

import (
	"time"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetCharDiaryData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetCharDiaryData")
	if err != nil {
		return nil, err
	}

	if h.dailyActService == nil {
		h.logger.Warn("GetCharDiaryData: daily act service not wired",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID))
		return map[string]interface{}{"ad": false, "act": int64(0)}, nil
	}

	state, err := h.dailyActService.GetState(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("GetCharDiaryData: failed to load state",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, pkgerrors.ErrSystemError
	}

	return state, nil
}

func (h *Handler) GetNineBossRankByClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetNineBossRankByClient")
	if err != nil {
		return nil, err
	}

	currentTime := int64(0)
	lastLocalTime := int64(0)
	lastCrossTime := int64(0)
	if len(args) >= 1 {
		if value, ok := parseIntArg(args[0]); ok {
			currentTime = int64(value)
		}
	}
	if len(args) >= 2 {
		if value, ok := parseIntArg(args[1]); ok {
			lastLocalTime = int64(value)
		}
	}
	if len(args) >= 3 {
		if value, ok := parseIntArg(args[2]); ok {
			lastCrossTime = int64(value)
		}
	}

	h.logger.Debug("GetNineBossRankByClient: fetching nine boss rankings",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int64("current_time", currentTime),
		zap.Int64("last_local_time", lastLocalTime),
		zap.Int64("last_cross_time", lastCrossTime))

	now := time.Now().UnixMilli()
	response := []interface{}{
		nil,
		map[string]interface{}{
			"type": 1,
			"time": now,
			"rankObj": map[string]interface{}{
				"1": map[string]interface{}{"rank": 1, "name": "Player1", "guild": "Guild1", "bossIndex": 1},
				"2": map[string]interface{}{"rank": 2, "name": "Player2", "guild": "Guild2", "bossIndex": 2},
			},
		},
		map[string]interface{}{
			"type": 2,
			"time": now,
			"rankObj": map[string]interface{}{
				"1": map[string]interface{}{"rank": 1, "name": "CrossPlayer1", "guild": "CrossGuild1", "totalSec": 3600},
				"2": map[string]interface{}{"rank": 2, "name": "CrossPlayer2", "guild": "CrossGuild2", "totalSec": 3300},
			},
		},
	}

	h.logger.Info("GetNineBossRankByClient: returning nine boss rankings",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}

func (h *Handler) GetGuildWarRank(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetGuildWarRank")
	if err != nil {
		return nil, err
	}

	h.logger.Debug("GetGuildWarRank: fetching guild war rankings",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	response := map[string]interface{}{
		"1": map[string]interface{}{"gid": 1, "guildName": "WarGuild1", "level": 10, "ln": "Leader1", "totalTime": 7200, "winNum": 15},
		"2": map[string]interface{}{"gid": 2, "guildName": "WarGuild2", "level": 9, "ln": "Leader2", "totalTime": 5400, "winNum": 12},
		"3": map[string]interface{}{"gid": 3, "guildName": "WarGuild3", "level": 8, "ln": "Leader3", "totalTime": 3600, "winNum": 10},
	}

	h.logger.Info("GetGuildWarRank: returning guild war rankings",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	return response, nil
}
