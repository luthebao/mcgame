// Open-sourced by BaoLT

package auth

import (
	"fmt"
	"strconv"
	"time"

	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

func (h *Handler) GetTodayOnlineTime(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Debug("GetTodayOnlineTime received",
		zap.Uint32("conn_id", ctx.ConnID))

	return 0, nil
}

func (h *Handler) SetBp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	playerInFront, ok := parseBoolSettingArg(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if ctx.Connection != nil {
		ctx.Connection.SetPlayerInFront(playerInFront)
	}

	h.logger.Debug("SetBp received",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("arg_count", len(args)),
		zap.Bool("player_in_front", playerInFront))

	return map[string]interface{}{"success": true}, nil
}

func parseBoolSettingArg(arg interface{}) (bool, bool) {
	switch v := arg.(type) {
	case bool:
		return v, true
	case float64:
		return v != 0, true
	case float32:
		return v != 0, true
	case int:
		return v != 0, true
	case int64:
		return v != 0, true
	case string:
		if v == "true" || v == "1" {
			return true, true
		}
		if v == "false" || v == "0" {
			return false, true
		}
	}

	return false, false
}

func (h *Handler) ChangeLine(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		h.logger.Warn("ChangeLine: no arguments provided",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	newLineID, ok := parseIntArg(args[0])
	if !ok {
		h.logger.Warn("ChangeLine: unexpected argument type",
			zap.String("type", fmt.Sprintf("%T", args[0])))
		return nil, pkgerrors.ErrInvalidArgs
	}

	oldChannelID := ctx.Connection.GetChannelID()
	mapID, charID := ctx.Connection.GetSceneInfo()

	h.logger.Info("ChangeLine: switching channel",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int("old_channel", oldChannelID),
		zap.Int("new_channel", newLineID),
		zap.Int("map_id", mapID),
		zap.Int64("char_id", charID))

	if h.sceneManager != nil && mapID > 0 && charID > 0 {
		h.sceneManager.RemoveFromScene(oldChannelID, mapID, ctx.ConnID)
		h.sceneManager.BroadcastToScene(oldChannelID, mapID, ctx.ConnID, "onCharLeaveScene", charID)

		ctx.Connection.SetChannelID(newLineID)
		h.sceneManager.AddToScene(newLineID, mapID, ctx.Connection)

		if h.charService != nil {
			char, err := h.charService.GetByID(ctx.Context, charID)
			if err == nil {
				_ = rtmputils.UpsertSocialPresenceFromCharacter(ctx.Context, h.presenceStore, char, newLineID)
				resCodeStr, _, iconCodeStr, _ := h.charService.GetAppearanceCodesByClassAndGender(char.ClassID, char.Gender)
				resCode, _ := strconv.ParseInt(resCodeStr, 10, 64)
				iconCode, _ := strconv.ParseInt(iconCodeStr, 10, 64)

				playerData := map[string]interface{}{
					"id":       char.ID,
					"name":     char.Name,
					"gender":   char.Gender,
					"classId":  char.ClassID,
					"level":    char.Level,
					"pmLevel":  char.CurrentPMLevel(time.Now()),
					"posX":     char.PosX,
					"posY":     char.PosY,
					"posMapId": char.MapID,
					"resCode":  resCode,
					"iconCode": iconCode,
					"vipT":     0,
					"SpeT":     0,
					"t":        0,
				}
				h.sceneManager.BroadcastToScene(newLineID, mapID, ctx.ConnID, "onScenePlayerEntered", playerData)
			}
		}

		h.logger.Info("ChangeLine: channel switch complete",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int("new_channel", newLineID),
			zap.Int("map_id", mapID))
	} else {
		ctx.Connection.SetChannelID(newLineID)
		h.logger.Debug("ChangeLine: updated channel ID (player not in scene)",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int("new_channel", newLineID))
	}

	if err := ctx.Connection.SendCallback("onChangeLine", newLineID); err != nil {
		h.logger.Error("Failed to send onChangeLine callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) SaveGuideLog(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, nil
	}

	guideID, ok := parseIntArg(args[0])
	if !ok || ctx.CharacterID == "" {
		return nil, nil
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, nil
	}

	err = h.charService.SaveGuideLog(ctx.Context, charID, guideID)
	if err != nil {
		h.logger.Error("Failed to save guide log", zap.Error(err), zap.Int64("charID", charID), zap.Int("guideID", guideID))
	}

	return nil, nil
}

func (h *Handler) SetDeletePass(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return "Lỗi tham số", nil
	}

	accountIDStr := ctx.AccountID
	if accountIDStr == "" {
		return "Chưa đăng nhập", nil
	}

	accountID, err := uuid.Parse(accountIDStr)
	if err != nil {
		return "Lỗi xác thực", nil
	}

	var newPassHash string
	var oldPassHash string

	if len(args) >= 1 {
		if typed, ok := args[0].(string); ok {
			newPassHash = typed
		}
	}

	if len(args) >= 2 {
		if typed, ok := args[1].(string); ok {
			oldPassHash = typed
		}
	}

	h.logger.Info("SetDeletePass called", zap.String("accountID", accountIDStr))

	account, err := h.accountRepo.FindByID(ctx.Context, accountID)
	if err != nil {
		h.logger.Error("SetDeletePass: account not found", zap.Error(err))
		return "Tài khoản không tồn tại", nil
	}

	if account.SecondaryPassword != "" {
		if oldPassHash == "" {
			return "Vui lòng nhập mật khẩu cũ!", nil
		}
		if !account.CheckSecondaryPassword(oldPassHash) {
			h.logger.Warn("SetDeletePass: incorrect old password")
			return "Mật khẩu cấp 2 cũ không đúng!", nil
		}
	}

	if newPassHash != "" {
		account.SetSecondaryPassword(newPassHash)
		if err := h.accountRepo.Update(ctx.Context, account); err != nil {
			h.logger.Error("SetDeletePass: failed to update account", zap.Error(err))
			return "Lỗi hệ thống khi cập nhật", nil
		}
		if err := rtmputils.CacheSecondaryPassword(ctx.Connection, newPassHash); err != nil {
			h.logger.Error("SetDeletePass: failed to sync client password", zap.Error(err))
		}
	}

	return "", nil
}
