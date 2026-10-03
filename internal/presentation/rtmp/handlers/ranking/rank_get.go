// Open-sourced by BaoLT

package ranking

import (
	pkgerrors "mcgame-server/pkg/errors"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

var allowedCategories = map[string]bool{
	"expBattle": true,
	"exp":       true,
	"money":     true,
	"pop":       true,
	"totalBp":   true,
	"achPoint":  true,
}

func emptyRankDescEntry() map[string]interface{} {
	return map[string]interface{}{
		"guild": "Không có bang",
		"id":    nil,
		"name":  nil,
		"value": nil,
	}
}

func emptyRankData() map[string]interface{} {
	return map[string]interface{}{
		"desc": emptyRankDescEntry(),
		"key":  emptyRankDescEntry(),
	}
}

func (h *Handler) RankGet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn("RankGet: no character in session",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) == 0 {
		h.logger.Warn("RankGet: missing category argument",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	category, ok := args[0].(string)
	if !ok || category == "" {
		h.logger.Warn("RankGet: category argument is not a string",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	if !allowedCategories[category] {
		h.logger.Warn("RankGet: unknown category rejected",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("category", category))
		return nil, pkgerrors.ErrInvalidArgs
	}

	h.logger.Info("RankGet: returning empty rank list (backing data not yet modeled)",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.String("category", category))

	return map[string]interface{}{
		"data": emptyRankData(),
		"name": category,
	}, nil
}

func (h *Handler) GetRankList(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	h.logger.Debug("GetRankList: stub — no backing data",
		zap.Uint32("conn_id", ctx.ConnID))
	return nil, nil
}
