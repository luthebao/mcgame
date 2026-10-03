// Open-sourced by BaoLT

package character

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) LvUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	h.logger.Info("LvUp called", zap.Int64("char_id", charID), zap.Any("args", args))

	if len(args) < 2 {
		h.logger.Warn("LvUp: missing secondary password", zap.Int64("char_id", charID))
		return false, nil
	}

	passHash, ok := args[1].(string)
	if !ok || passHash == "" {
		h.logger.Warn("LvUp: invalid secondary password argument", zap.Int64("char_id", charID), zap.Any("password_arg", args[1]))
		return false, nil
	}

	if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
		h.logger.Warn("LvUp: secondary password verification failed", zap.Int64("char_id", charID), zap.Error(err))
		if notifyErr := rtmputils.NotifySecondaryPasswordFailure(ctx.Connection); notifyErr != nil {
			h.logger.Error("LvUp: failed to notify client about secondary password failure", zap.Error(notifyErr))
		}
		return false, nil
	}

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	oldLevel := char.Level
	if !char.ManualLevelUp() {
		return false, nil
	}

	h.logger.Info("Character leveled up via RPC confirm",
		zap.Int64("char_id", charID),
		zap.Int("old_level", oldLevel),
		zap.Int("new_level", char.Level))

	if err := h.charService.Save(ctx.Context, char); err != nil {
		return nil, err
	}

	h.sendExpCallbacksWithEquipment(ctx, char, 0, true)
	if h.eventBus != nil {
		h.eventBus.EmitLevelUp(ctx.Context, char.ID, oldLevel, char.Level)
	}
	if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil {
		h.logger.Error("LvUp: failed to sync client password", zap.Error(err))
	}

	return true, nil
}
