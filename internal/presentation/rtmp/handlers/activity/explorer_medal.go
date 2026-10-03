// Open-sourced by BaoLT

// Explorer medal handlers implement the initEMPanel and levelUpEMedal RPCs.
// initEMPanel returns the full panel state [level, propMap, score, 0].
// levelUpEMedal attempts to advance the player's explorer medal level by one
// tier, checking that the cumulative EMP score meets the next tier's cost
// threshold. On max level or insufficient score an onSystemSay callback is
// emitted instead of a state update.
package activity

import (
	"errors"

	appexplorermedal "mcgame-server/internal/application/explorermedal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitEMPanel(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "InitEMPanel")
	if err != nil {
		return nil, err
	}

	if h.explorerMedalSvc == nil {
		h.logger.Warn("InitEMPanel: explorerMedalSvc not configured",
			zap.Uint32("conn_id", ctx.ConnID))
		return []interface{}{0, map[string]interface{}{}, 0, 0}, nil
	}

	reqCtx := ctx.Context
	level, score, err := h.explorerMedalSvc.GetState(reqCtx, characterID)
	if err != nil {
		h.logger.Warn("InitEMPanel: failed to load explorer medal state",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return []interface{}{0, map[string]interface{}{}, 0, 0}, nil
	}

	response := h.explorerMedalSvc.BuildPanelResponse(level, score)

	h.logger.Info("InitEMPanel: returning panel state",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("level", level),
		zap.Int("score", score))

	return response, nil
}

func (h *Handler) LevelUpEMedal(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "LevelUpEMedal")
	if err != nil {
		return nil, err
	}

	h.logger.Info("LevelUpEMedal called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID))

	if h.explorerMedalSvc == nil {
		h.logger.Warn("LevelUpEMedal: explorerMedalSvc not configured",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, nil
	}

	reqCtx := ctx.Context
	result, err := h.explorerMedalSvc.LevelUp(reqCtx, characterID)
	if err != nil {
		if errors.Is(err, appexplorermedal.ErrAtMaxLevel) {
			h.logger.Info("LevelUpEMedal: already at max level",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID))
			h.sendActivityCallback(ctx, "onSystemSay", "Đã đạt Huy Chương cao cấp nhất")
			return nil, nil
		}
		if errors.Is(err, appexplorermedal.ErrInsufficientScore) {
			h.logger.Info("LevelUpEMedal: insufficient EMP score",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID))
			h.sendActivityCallback(ctx, "onSystemSay", "Không đủ điểm để nâng cấp Huy Chương")
			return nil, nil
		}
		h.logger.Error("LevelUpEMedal: level up failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, nil
	}

	panelResponse := []interface{}{result.Level, result.PropMap, result.Score, 0}
	h.sendActivityCallback(ctx, "updateEMPanel", panelResponse)

	h.logger.Info("LevelUpEMedal: level up successful",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("new_level", result.Level),
		zap.Int("score", result.Score))

	return nil, nil
}
