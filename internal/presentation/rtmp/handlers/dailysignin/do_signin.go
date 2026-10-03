// Open-sourced by BaoLT

// Modern monthly sign-in. Replies inline with {data, date} per the AS3
// onDailySignInActDoSignin Responder, also pushes setBtnsDailySignInAct
// for any other listener (matches the dual-channel client expectation).
package dailysignin

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) DailySignInActDoSignin(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "DailySignInActDoSignin")
	if err != nil {
		return nil, err
	}
	out, err := h.service.DoSignin(h.requestContext(ctx), characterID)
	if err != nil {
		h.respondError(ctx, "DailySignInActDoSignin", err)
		return nil, nil
	}

	h.fanoutGrants(ctx, out.Granted)
	dataPayload := h.pushSignInUpdate(ctx, out)
	return map[string]interface{}{
		"data": dataPayload,
		"date": out.Day,
	}, nil
}
