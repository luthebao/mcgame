// Open-sourced by BaoLT

// Crit-rate purchase. No inline Responder; the AS3 panel listens for
// updateDailySignInActCrit push with the new percent.
package dailysignin

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) DailySignInUpActCrit(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "DailySignInUpActCrit")
	if err != nil {
		return nil, err
	}
	out, err := h.service.UpCrit(h.requestContext(ctx), characterID)
	if err != nil {
		h.respondError(ctx, "DailySignInUpActCrit", err)
		return nil, nil
	}

	h.pushGoldDebit(ctx, out)
	h.pushConsumeLimit(ctx, out)
	h.sendCallback(ctx, cbUpdateDailySignInActCrit, out.Record.CritPercent)
	return nil, nil
}
