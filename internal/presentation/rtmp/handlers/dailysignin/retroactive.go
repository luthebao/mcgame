// Open-sourced by BaoLT

// Retroactive sign-in (ký bù). No inline Responder; the AS3 panel reacts to
// setBtnsDailySignInAct push. Charges Gold (Vcoin) per cfg.RetroactivePrice
// and grants the standard daily reward for the missed day.
package dailysignin

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) DailySignInActRetroactive(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "DailySignInActRetroactive")
	if err != nil {
		return nil, err
	}
	out, err := h.service.Retroactive(h.requestContext(ctx), characterID)
	if err != nil {
		h.respondError(ctx, "DailySignInActRetroactive", err)
		return nil, nil
	}

	h.fanoutGrants(ctx, out.Granted)
	h.pushGoldDebit(ctx, out)
	h.pushConsumeLimit(ctx, out)
	h.pushSignInUpdate(ctx, out)
	return nil, nil
}
