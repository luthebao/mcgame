// Open-sourced by BaoLT

// Pet PVE panel RPCs (push-style; client passes a null responder and reacts to the
// named CallBack):
//
//	initPPVEPanel               -> onUpdatePPVEPanel(kpData, ppveData, null, false)
//	getPPVERank                 -> updatePPRankView(rankList, myRank)
//	savePPVEConf(config)        -> onUpdatePPVEPanel(kpData, ppveData, config, false)
//	increaseChallengeTimeByGold -> onUpdatePPVEPanel(kpData, ppveData, null, false)
//	exchangeKP                  -> onUpdatePPVEPanel(kpData, ppveData, null, false)
//	exchangeKPByGold            -> onUpdatePPVEPanel(kpData, ppveData, null, false)
//
// kpData = {ppvefloor,kp,freeTime,goldTime,goldClgTime,awardTime,gold4awardTimeDaily};
// ppveData = {p,mlv,ppveConfig}. challengeNextFloor lives in ppve.go and
// replayPetPVEFight in the petarena handler. The cross-player rank leaderboard is
// served by GetRank (player.get_ppve_rank): rankList of {cid,classId,floorNum,level,name}
// ordered by ppvefloor DESC, plus the caller's 0-based myRank (-1 if unranked).
package activity

import (
	"context"
	"errors"

	apppet "mcgame-server/internal/application/pet"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitPPVEPanel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "InitPPVEPanel")
	if err != nil {
		return nil, err
	}
	if h.ppveService == nil {
		h.logger.Warn("InitPPVEPanel: ppveService not configured", zap.Uint32("conn_id", ctx.ConnID))
		return nil, nil
	}

	state, err := h.ppveService.InitPanel(h.ppveContext(ctx), characterID)
	if err != nil {
		h.logger.Error("InitPPVEPanel: load state failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.sendActivityCallback(ctx, "onUpdatePPVEPanel",
		h.ppveService.KPData(state),
		h.ppveService.PPVEData(state),
		nil,
		false,
	)
	return nil, nil
}

func (h *Handler) GetPPVERank(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetPPVERank")
	if err != nil {
		return nil, err
	}
	if h.ppveService == nil {
		h.sendActivityCallback(ctx, "updatePPRankView", []interface{}{}, -1)
		return nil, nil
	}
	entries, myRank, err := h.ppveService.GetRank(h.ppveContext(ctx), characterID, apppet.PPVERankLimit)
	if err != nil {
		h.logger.Warn("GetPPVERank: rank query failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		h.sendActivityCallback(ctx, "updatePPRankView", []interface{}{}, -1)
		return nil, nil
	}
	h.sendActivityCallback(ctx, "updatePPRankView", buildPPVERankList(entries), myRank)
	return nil, nil
}

func (h *Handler) SavePPVEConf(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "SavePPVEConf")
	if err != nil {
		return nil, err
	}
	if h.ppveService == nil {
		h.logger.Warn("SavePPVEConf: ppveService not configured", zap.Uint32("conn_id", ctx.ConnID))
		return nil, nil
	}

	config := map[string]interface{}{}
	if len(args) > 0 {
		if m, ok := args[0].(map[string]interface{}); ok {
			config = m
		}
	}

	state, err := h.ppveService.SaveConfig(h.ppveContext(ctx), characterID, config)
	if err != nil {
		h.logger.Error("SavePPVEConf: save failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.sendActivityCallback(ctx, "onUpdatePPVEPanel",
		h.ppveService.KPData(state),
		h.ppveService.PPVEData(state),
		config,
		false,
	)
	return nil, nil
}

func (h *Handler) IncreaseChallengeTimeByGold(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "IncreaseChallengeTimeByGold")
	if err != nil {
		return nil, err
	}
	if h.ppveService == nil {
		h.logger.Warn("IncreaseChallengeTimeByGold: ppveService not configured", zap.Uint32("conn_id", ctx.ConnID))
		return nil, nil
	}

	state, err := h.ppveService.IncreaseChallengeTime(h.ppveContext(ctx), characterID)
	if err != nil {
		if errors.Is(err, apppet.ErrPPVEInsufficientGold) {
			h.sendActivityCallback(ctx, "onMidNote", "Không đủ vàng")
			return nil, nil
		}
		if errors.Is(err, apppet.ErrPPVEChallengeCapReached) {
			h.sendActivityCallback(ctx, "onMidNote", "Đã đạt giới hạn mua lượt hôm nay")
			return nil, nil
		}
		h.logger.Error("IncreaseChallengeTimeByGold: failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.pushPPVEUpdate(ctx, state)
	return nil, nil
}

func (h *Handler) ExchangeKP(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "ExchangeKP")
	if err != nil {
		return nil, err
	}
	if h.ppveService == nil {
		h.logger.Warn("ExchangeKP: ppveService not configured", zap.Uint32("conn_id", ctx.ConnID))
		return nil, nil
	}

	state, err := h.ppveService.ExchangeKPFree(h.ppveContext(ctx), characterID)
	if err != nil {
		if errors.Is(err, apppet.ErrPPVENoFreeExchange) {
			h.sendActivityCallback(ctx, "onMidNote", "Đã hết lượt đổi miễn phí")
			return nil, nil
		}
		h.logger.Error("ExchangeKP: failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.pushPPVEUpdate(ctx, state)
	return nil, nil
}

func (h *Handler) ExchangeKPByGold(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "ExchangeKPByGold")
	if err != nil {
		return nil, err
	}
	if h.ppveService == nil {
		h.logger.Warn("ExchangeKPByGold: ppveService not configured", zap.Uint32("conn_id", ctx.ConnID))
		return nil, nil
	}

	state, err := h.ppveService.ExchangeKPByGold(h.ppveContext(ctx), characterID)
	if err != nil {
		if errors.Is(err, apppet.ErrPPVEInsufficientGold) {
			h.sendActivityCallback(ctx, "onMidNote", "Không đủ vàng")
			return nil, nil
		}
		h.logger.Error("ExchangeKPByGold: failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	h.pushPPVEUpdate(ctx, state)
	return nil, nil
}

func (h *Handler) pushPPVEUpdate(ctx *rtmp.RPCContext, state *apppet.PPVEState) {
	h.sendActivityCallback(ctx, "onUpdatePPVEPanel",
		h.ppveService.KPData(state),
		h.ppveService.PPVEData(state),
		nil,
		false,
	)
}

func (h *Handler) ppveContext(ctx *rtmp.RPCContext) context.Context {
	if ctx != nil && ctx.Context != nil {
		return ctx.Context
	}
	return context.Background()
}
