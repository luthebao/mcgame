// Open-sourced by BaoLT

// Initial state fetch + consume-limit push.
// initDailySignInActData replies inline with the full time/conf/data shape.
// initDailySignInActConsumeLimit has no Responder; we push
// oninitDailySignInActConsumeLimit and reply nil.
package dailysignin

import (
	"strconv"

	"mcgame-server/internal/domain/dailysignin"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitDailySignInActData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "InitDailySignInActData")
	if err != nil {
		return nil, err
	}
	reqCtx := h.requestContext(ctx)
	state, err := h.service.GetState(reqCtx, characterID)
	if err != nil {
		h.logger.Error("InitDailySignInActData: get state failed",
			zap.Int64("characterID", characterID), zap.Error(err))
		return nil, err
	}

	rewards, err := h.service.ListRewards(reqCtx)
	if err != nil {
		h.logger.Warn("InitDailySignInActData: list rewards failed",
			zap.Int64("characterID", characterID), zap.Error(err))
		rewards = nil
	}

	tiers := h.service.ListLuckyTiers(reqCtx, state.Now.Year(), int(state.Now.Month()))

	return map[string]interface{}{
		"time": timePayload(state.Now),
		"conf": confPayload(h.service.GetConfig(), rewardCatalogToIInfo(rewards), tiers),
		"data": signInDataPayload(state.Record, state.AwardDay),
	}, nil
}

func (h *Handler) InitDailySignInActConsumeLimit(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "InitDailySignInActConsumeLimit")
	if err != nil {
		return nil, err
	}
	state, err := h.service.GetState(h.requestContext(ctx), characterID)
	if err != nil {
		h.logger.Warn("InitDailySignInActConsumeLimit: get state failed",
			zap.Int64("characterID", characterID), zap.Error(err))
		return nil, nil
	}
	h.sendCallback(ctx, cbOnInitDailySignInActConsumeLim, state.Record.ConsumeLimitTotal)
	return nil, nil
}

func rewardCatalogToIInfo(rewards []*dailysignin.Reward) map[string]map[string]interface{} {
	out := make(map[string]map[string]interface{}, len(rewards))
	for _, r := range rewards {
		out[strconv.Itoa(r.RewardID)] = map[string]interface{}{
			"inc":    r.Inc,
			"iid":    r.ItemID,
			"number": r.Quantity,
		}
	}
	return out
}
