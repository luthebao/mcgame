// Open-sourced by BaoLT

// TrainSoul RPC handler: zero-arg mutation that spends mysteryCrystal and
// advances soul exp/level. Security guards: balance checked via
// char.DeductCurrency before any mutation is persisted; no client-supplied
// amounts or balances are trusted.
package soultrain

import (
	"errors"

	appsoultrain "mcgame-server/internal/application/soultrain"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) TrainSoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TrainSoul called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	if h.service == nil {
		h.logger.Warn("TrainSoul: service not configured",
			zap.Uint32("conn_id", ctx.ConnID))
		return emptyTrainResult(), nil
	}

	charID, ok := h.charIDFromCtx(ctx)
	if !ok {
		h.logger.Warn("TrainSoul: invalid character id",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("character_id", ctx.CharacterID))
		return emptyTrainResult(), nil
	}

	result, err := h.service.Train(ctx.Context, charID)
	if err != nil {
		if errors.Is(err, appsoultrain.ErrInsufficientCrystal) {
			h.logger.Info("TrainSoul: insufficient mysteryCrystal",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", charID))
			return emptyTrainResult(), nil
		}
		if errors.Is(err, appsoultrain.ErrMaxSoulLevel) {
			h.logger.Info("TrainSoul: character is at max soul level",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", charID))
			return emptyTrainResult(), nil
		}
		h.logger.Error("TrainSoul: training failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", charID),
			zap.Error(err))
		return emptyTrainResult(), nil
	}

	char, loadErr := h.chars.GetByID(ctx.Context, charID)
	if loadErr == nil && char != nil {
		h.emitMinusMoneyNew(ctx, charID, char.MysteryCrystal)
	}

	h.pushViewProps(ctx, charID)

	h.logger.Info("TrainSoul: success",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.Int("soul_lvl", result.SoulLvl),
		zap.Int64("soul_exp", result.SoulExp))

	return map[string]interface{}{
		"soulExp": float64(result.SoulExp),
		"soulLvl": float64(result.SoulLvl),
	}, nil
}

func emptyTrainResult() map[string]interface{} {
	return map[string]interface{}{"soulExp": 0, "soulLvl": 0}
}
