// Open-sourced by BaoLT

// addDecoHoleLevel handler — upgrades a decoration hole to the next level.
// Request: [position:int] — hole position (1-4).
// Reply: _result = full decoInfo map (position -> hole row), same shape as cData.decoInfo.
// Spends DecoSilver (cost_sil from TBL_DECO_HOLE template). On max-level or RNG fail returns current state.
// Security: position validated server-side against [1,4] enum; charID from session (never payload).
package dress

import (
	"errors"

	"go.uber.org/zap"

	appdress "mcgame-server/internal/application/dress"
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) AddDecoHoleLevel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := h.characterID(ctx)
	if !ok {
		return nil, nil
	}

	if len(args) < 1 {
		h.logger.Warn("addDecoHoleLevel: missing position arg", zap.Int64("character_id", charID))
		return nil, nil
	}
	position, posOk := toInt64(args[0])
	if !posOk || position < 1 || position > 4 {
		h.logger.Warn("addDecoHoleLevel: invalid position", zap.Int64("character_id", charID), zap.Any("arg", args[0]))
		return nil, nil
	}

	if h.decoHoleService == nil {
		return nil, nil
	}

	result, err := h.decoHoleService.AddDecoHoleLevel(ctx.Context, charID, int(position))
	if err != nil {
		if errors.Is(err, appdress.ErrDecoHoleInvalidPosition) {
			h.logger.Warn("addDecoHoleLevel: invalid position rejected by service", zap.Int64("character_id", charID), zap.Int64("position", position))
			return nil, nil
		}
		if errors.Is(err, appdress.ErrDecoHoleInsufficientSil) {
			h.logger.Debug("addDecoHoleLevel: insufficient deco silver", zap.Int64("character_id", charID))
			return nil, nil
		}
		h.logger.Error("addDecoHoleLevel: service error", zap.Int64("character_id", charID), zap.Error(err))
		return nil, nil
	}

	if result.SpentDecoSilver > 0 && ctx.Connection != nil {
		_ = ctx.Connection.SendCallback("onAddMoney", float64(charID), "decoSilver", float64(-result.SpentDecoSilver), float64(result.DecoSilverAfter))
	}

	wire := appdress.DecoHoleStateToWire(charID, result.State)
	return wire, nil
}
