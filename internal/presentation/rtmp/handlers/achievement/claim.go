// Open-sourced by BaoLT

// Achievement reward claim handler.
package achievement

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetAchieveAward(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if h.achievementService == nil || h.gameDataManager == nil {
		return map[string]interface{}{"flag": false}, nil
	}

	achievementID, err := parseAchievementID(args[0])
	if err != nil {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	template := h.gameDataManager.GetAchievement(int(achievementID))
	if template == nil || int(template.IsAward) <= 0 {
		return map[string]interface{}{"flag": false}, nil
	}

	claimResult, err := h.achievementService.ClaimReward(ctx.Context, characterID, achievementID)
	if err != nil {
		h.logger.Warn("Failed to claim achievement reward",
			zap.Int64("character_id", characterID),
			zap.Int64("achievement_id", achievementID),
			zap.Error(err))
		_ = ctx.Connection.SendCallback("onRedMsg", "Khong the nhan phan thuong thanh tuu.")
		return map[string]interface{}{"flag": false}, nil
	}

	claimCount := claimResult.ClaimCount
	if claimCount <= 0 {
		claimCount = 1
	}
	_ = ctx.Connection.SendCallback("updateAchieveAwardLog", map[string]interface{}{
		"aid": achievementID,
		"num": claimCount,
	})

	if int(template.IsAward) == 2 {
		h.sendTitleRewardCallbacks(ctx, characterID, template.Name)
	}

	h.grantStructuredReward(ctx, characterID, template)

	return map[string]interface{}{"flag": true, "aid": achievementID}, nil
}

func parseAchievementID(value interface{}) (int64, error) {
	switch typed := value.(type) {
	case float64:
		return int64(typed), nil
	case int:
		return int64(typed), nil
	case int64:
		return typed, nil
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func (h *Handler) sendTitleRewardCallbacks(ctx *rtmp.RPCContext, characterID int64, achievementName string) {
	if h.titleService == nil || h.gameDataManager == nil || ctx == nil || ctx.Connection == nil {
		return
	}

	titleTemplate := h.gameDataManager.FindUniqueTitleByName(achievementName)
	if titleTemplate == nil {
		h.logger.Warn("Skipped achievement title reward because title lookup was ambiguous",
			zap.Int64("character_id", characterID),
			zap.String("achievement_name", achievementName))
		return
	}

	grantResult, err := h.titleService.GrantTitle(ctx.Context, characterID, int(titleTemplate.ID))
	if err != nil {
		h.logger.Warn("Failed to grant achievement title reward",
			zap.Int64("character_id", characterID),
			zap.Int64("title_id", titleTemplate.ID),
			zap.Error(err))
		return
	}
	if !grantResult.Added {
		return
	}

	rtmputils.SendTitleGrantedCallback(ctx.Connection, int(titleTemplate.ID), grantResult.Titles, grantResult.SpecialTitles, grantResult.IsSpecial)
	_ = ctx.Connection.SendCallback("onAchieveTitle", titleTemplate.N)
}
