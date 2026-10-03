// Open-sourced by BaoLT

// SUPERSEDED: onGetMakeLimitTimes is now served by the mysterytreasure handler, which reads the
// real makeLimitTimes counter from the per-character mystery_treasure feature state. This craft
// stub remains only as a compile-safe fallback (empty-correct shape {n:0, t:"0|0"}); main.go must
// remove the craft-package registration of "onGetMakeLimitTimes" so the mysterytreasure handler
// (which holds the mysService dependency) is the authoritative one.
//
// Live shape: {n:int (remaining crafts), t:"month0idx|day" (last reset date)}.
package craft

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetMakeLimitTimes(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn("onGetMakeLimitTimes (craft fallback): no character in session",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrUnauthorized
	}

	h.logger.Warn("onGetMakeLimitTimes (craft fallback) hit; expected mysterytreasure handler to own this method",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	return map[string]interface{}{
		"n": 0,
		"t": "0|0",
	}, nil
}
