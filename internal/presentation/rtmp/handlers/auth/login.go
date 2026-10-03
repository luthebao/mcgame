// Open-sourced by BaoLT

// OnConnectAuth and ChooseCharacter RPC entry points for the auth handler.
// Routing: on global connections (app="master/test") server sends updateAccount;
// on scene/game-line connections (app="tcn/lineN") server sends onLogin.
// onLogin.id is emitted as "0": this schema has no numeric account id (accounts are
// UUID-only), the live "guid" (e.g. 1284878) has no Go equivalent, and the client stores
// onLogin.id into the write-only Number _core.guid (never read back), so a UUID would
// coerce to NaN. "0" is intentional; revisit only if a numeric account id is modeled.
package auth

import (
	"fmt"

	appauth "mcgame-server/internal/application/auth"
	appchar "mcgame-server/internal/application/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

const (
	sendCombineActivityID       = 12
	sendCombineActivitySortType = 12
	vipShopActivityID           = 19
	vipShopActivitySortType     = 19
	autoTaskActivityID          = 48
	autoTaskActivitySortType    = 48
	bossDailyActivityID         = 49
	bossDailyActivitySortType   = 49
	defaultStartedActivityCount = 84

	defaultServerTimeZone           = -25200000
	defaultServerSpeedHackThreshold = 400
)

func (h *Handler) OnConnectAuth(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		h.logger.Warn("OnConnectAuth: insufficient arguments",
			zap.Int("args_count", len(args)))
		return nil, pkgerrors.ErrInvalidInput
	}

	if h.configStore != nil {
		if h.configStore.MaintenanceMode() || !h.configStore.LoginEnabled() {
			h.logger.Info("Login blocked: server under maintenance")
			return nil, pkgerrors.ErrServerMaintenance
		}
	}

	username, _ := args[1].(string)
	password, _ := args[2].(string)

	if username == "" {
		h.logger.Warn("OnConnectAuth: empty username")
		return nil, pkgerrors.ErrInvalidCredentials
	}

	resp, err := h.authService.Login(ctx.Context, &appauth.LoginRequest{
		Username:  username,
		Password:  password,
		IPAddress: "unknown",
	})
	if err != nil {
		h.logger.Warn("OnConnectAuth: login failed",
			zap.String("username", username),
			zap.Error(err))
		return nil, err
	}

	if ctx.Connection != nil {
		ctx.Connection.SetSession(resp.SessionID, resp.AccountID, resp.Username)
	}

	if ctx.Connection != nil {
		h.sendSceneConnectCallbacks(ctx, username, password)
	}

	return nil, nil
}

func (h *Handler) ChooseCharacter(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		h.logger.Warn("ChooseCharacter: no arguments provided",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, ok := parseInt64Arg(args[0])
	if !ok {
		h.logger.Warn("ChooseCharacter: unexpected argument type",
			zap.String("type", fmt.Sprintf("%T", args[0])))
		return nil, pkgerrors.ErrInvalidArgs
	}

	accountID, err := uuid.Parse(ctx.AccountID)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.Select(ctx.Context, &appchar.SelectRequest{
		AccountID:   accountID,
		CharacterID: characterID,
	})
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}
	if err := h.syncCharacterPremiumState(ctx.Context, char); err != nil {
		h.logger.Warn("ChooseCharacter: failed to sync premium state",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}
	pmExpChange, updatedChar, err := h.grantDailyPMLoginReward(ctx.Context, char)
	if err != nil {
		h.logger.Warn("ChooseCharacter: failed to grant daily PM login reward",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}
	char = updatedChar

	if h.playerCache != nil {
		if err := h.playerCache.LoadPlayer(ctx.Context, char.ID); err != nil {
			h.logger.Error("Failed to load player data into cache",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
			return rtmp.ErrorToResponse(err), nil
		}

		if _, err := h.playerCache.LoadHotState(ctx.Context, char.ID); err != nil {
			h.logger.Warn("Failed to load hot state (non-critical)",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		}
	}

	ctx.Connection.SetCharacter(fmt.Sprintf("%d", char.ID))
	ctx.Connection.SetExpSkill(char.Experience)
	if h.loginEvents != nil {
		h.loginEvents.EmitLogin(ctx.Context, char.ID)
	}

	h.sendOnChooseCharactorCallback(ctx, char)
	h.pushPMExpChangeCallbacks(ctx, pmExpChange)

	return nil, nil
}
