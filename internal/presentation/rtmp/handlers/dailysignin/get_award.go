// Open-sourced by BaoLT

// Lucky-day award claim. Replies a Number (1=success) per the AS3
// onDailySignInActGetAward inline Responder. Reward is the per-week
// luckyGold[w] gold amount; service emits Outcome.GoldSpent < 0 to signal
// the credit. We push onUPP with goldDiff > 0 and refresh button state.
package dailysignin

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

func (h *Handler) DailySignInActGetAward(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "DailySignInActGetAward")
	if err != nil {
		return nil, err
	}
	out, err := h.service.GetAward(h.requestContext(ctx), characterID)
	if err != nil {
		h.respondError(ctx, "DailySignInActGetAward", err)
		return 0, nil
	}

	h.pushGoldCredit(ctx, out)
	h.sendCallback(ctx, cbSetBtnsDailySignInAct, signInDataPayload(out.Record, out.AwardDay))
	return 1, nil
}
