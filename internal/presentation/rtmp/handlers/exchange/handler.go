// Open-sourced by BaoLT

// Package exchange handles RTMP requests for account asset queries.
// Characters sharing the same account share the award point (gold) pool.
package exchange

import (
	"mcgame-server/internal/domain/auth"
	"mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type Handler struct {
	accountRepo auth.AccountRepository
	logger      *zap.Logger
}

func NewHandler(accountRepo auth.AccountRepository, logger *zap.Logger) *Handler {
	return &Handler{
		accountRepo: accountRepo,
		logger:      logger,
	}
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("gp", h.GetAwardPoint)
}

func (h *Handler) GetAwardPoint(ctx *rtmp.RPCContext, _ []interface{}) (interface{}, error) {
	accountID, err := uuid.Parse(ctx.AccountID)
	if err != nil {
		h.logger.Warn("gp: invalid account ID", zap.String("account_id", ctx.AccountID))
		return nil, nil
	}

	account, err := h.accountRepo.FindByID(ctx.Context, accountID)
	if err != nil {
		h.logger.Warn("gp: failed to find account", zap.String("account_id", ctx.AccountID), zap.Error(err))
		return nil, nil
	}

	if err := ctx.Connection.SendCallback("onGetAwardPoint", float64(account.Gold)); err != nil {
		h.logger.Warn("gp: failed to send onGetAwardPoint callback", zap.Error(err))
	}

	return nil, nil
}
