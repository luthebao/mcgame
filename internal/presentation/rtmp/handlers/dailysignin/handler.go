// Open-sourced by BaoLT

// Daily sign-in RPC handler package.
// Owns the eight Flash client RPCs across the modern monthly DailySignInPanel
// and the legacy SignInPanel. Backed by application/dailysignin which keeps
// both panels in sync with one underlying record per character per month.
// Reply channels:
//   - inline Responder for initData, doSignin, getAward, getSignInData, signinNow
//   - server-push only (no inline reply) for initConsumeLimit, retroactive, upCrit
package dailysignin

import (
	"context"
	"strconv"

	appdailysignin "mcgame-server/internal/application/dailysignin"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type Handler struct {
	service       *appdailysignin.Service
	characterRepo domainchar.Repository
	logger        *zap.Logger
}

func NewHandler(service *appdailysignin.Service, logger *zap.Logger) *Handler {
	return &Handler{service: service, logger: logger}
}

func (h *Handler) SetCharacterRepository(repo domainchar.Repository) {
	h.characterRepo = repo
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("initDailySignInActData", h.InitDailySignInActData)
	dispatcher.Register("initDailySignInActConsumeLimit", h.InitDailySignInActConsumeLimit)
	dispatcher.Register("dailySignInActDoSignin", h.DailySignInActDoSignin)
	dispatcher.Register("dailySignInActGetAward", h.DailySignInActGetAward)
	dispatcher.Register("dailySignInActRetroactive", h.DailySignInActRetroactive)
	dispatcher.Register("dailySignInUpActCrit", h.DailySignInUpActCrit)
	dispatcher.Register("getSignInData", h.GetSignInData)
	dispatcher.Register("signinNow", h.SigninNow)
}

func (h *Handler) characterID(ctx *rtmp.RPCContext, method string) (int64, error) {
	if ctx.CharacterID == "" {
		h.logger.Warn(method+": no character ID in session", zap.Uint32("conn_id", ctx.ConnID))
		return 0, pkgerrors.ErrUnauthorized
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		h.logger.Warn(method+": invalid character ID",
			zap.String("char_id", ctx.CharacterID),
			zap.Error(err))
		return 0, pkgerrors.ErrInvalidInput
	}
	return id, nil
}

func (h *Handler) requestContext(ctx *rtmp.RPCContext) context.Context {
	if ctx.Context == nil {
		return context.Background()
	}
	return ctx.Context
}

func (h *Handler) sendCallback(ctx *rtmp.RPCContext, method string, args ...interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback(method, args...); err != nil {
		h.logger.Error("daily signin callback failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("method", method),
			zap.Error(err))
	}
}
