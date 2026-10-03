// Open-sourced by BaoLT

package utils

import (
	"context"

	domainauth "mcgame-server/internal/domain/auth"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
)

type secondaryPasswordSender interface {
	SendCallback(method string, args ...interface{}) error
}

const SecondaryPasswordFailureMessage = "Mật khẩu không chính xác, vui lòng thử lại!"

func VerifySecondaryPassword(ctx context.Context, accountRepo domainauth.AccountRepository, accountID, passwordHash string) error {
	if accountRepo == nil || accountID == "" || passwordHash == "" {
		return pkgerrors.ErrUnauthorized
	}

	parsedAccountID, err := uuid.Parse(accountID)
	if err != nil {
		return pkgerrors.ErrUnauthorized
	}

	account, err := accountRepo.FindByID(ctx, parsedAccountID)
	if err != nil {
		return err
	}

	if !account.CheckSecondaryPassword(passwordHash) {
		return pkgerrors.ErrUnauthorized
	}

	return nil
}

func CacheSecondaryPassword(sender secondaryPasswordSender, passwordHash string) error {
	if sender == nil || passwordHash == "" {
		return nil
	}

	return sender.SendCallback("setClientDP", passwordHash)
}

func NotifySecondaryPasswordFailure(sender secondaryPasswordSender) error {
	if sender == nil {
		return nil
	}

	return sender.SendCallback("a", SecondaryPasswordFailureMessage)
}
