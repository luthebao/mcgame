// Open-sourced by BaoLT

// PPVE tower handler implements challengeNextFloor for the Pet PVE tower feature.
// Floor advance bookkeeping is fully implemented; combat resolution is stubbed (see open questions).
// Pushes changePPLoadingState(cid) then onSendReplayPPVEPanel(result, floor, replayId, rankList, myRank).
// Battle result constants match GamePredef on the Flash client: BATTLE_WIN=1, BATTLE_LOSE=2, BATTLE_NOT_END=-1.
package activity

import (
	"context"
	"errors"

	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const (
	ppveBattleWin    = 1
	ppveBattleNotEnd = -1
)

func (h *Handler) ChallengeNextFloor(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charIDStr, characterID, err := h.characterID(ctx, "ChallengeNextFloor")
	if err != nil {
		return nil, err
	}

	if h.ppveService == nil {
		h.logger.Warn("ChallengeNextFloor: ppveService not configured",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("char_id", charIDStr))
		h.sendActivityCallback(ctx, "changePPLoadingState", characterID)
		return nil, nil
	}

	reqCtx := ctx.Context
	if reqCtx == nil {
		reqCtx = context.Background()
	}

	h.sendActivityCallback(ctx, "changePPLoadingState", characterID)

	result, err := h.ppveService.ChallengeNextFloor(reqCtx, characterID)
	if err != nil {
		if errors.Is(err, apppet.ErrNoFreeChallenges) || errors.Is(err, apppet.ErrAlreadyMaxFloor) {
			h.logger.Warn("ChallengeNextFloor: challenge denied",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.Error(err))
			h.sendActivityCallback(ctx, "onSendReplayPPVEPanel", ppveBattleNotEnd, 0, "", []interface{}{}, -1)
			return nil, nil
		}
		h.logger.Error("ChallengeNextFloor: service error",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	rankList := buildPPVERankList(result.RankList)

	h.logger.Info("ChallengeNextFloor: floor advanced",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("floor", result.FloorNum),
		zap.String("replay_id", result.ReplayID))

	h.sendActivityCallback(ctx, "onSendReplayPPVEPanel",
		ppveBattleWin,
		result.FloorNum,
		result.ReplayID,
		rankList,
		result.MyRank,
	)

	return nil, nil
}

func buildPPVERankList(entries []apppet.PPVERankEntry) []interface{} {
	out := make([]interface{}, 0, len(entries))
	for _, e := range entries {
		out = append(out, map[string]interface{}{
			"cid":      e.CID,
			"classId":  e.ClassID,
			"floorNum": e.FloorNum,
			"level":    e.Level,
			"name":     e.Name,
		})
	}
	return out
}
