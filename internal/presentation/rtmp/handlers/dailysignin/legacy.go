// Open-sourced by BaoLT

// Legacy SignInPanel: getSignInData / signinNow. Both reply inline with the
// 3-field shape onGetSignInData parses. State projects from the modern
// per-month record so there is one ledger per character.
package dailysignin

import (
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetSignInData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "GetSignInData")
	if err != nil {
		return nil, err
	}
	res, err := h.service.GetLegacy(h.requestContext(ctx), characterID)
	if err != nil {
		h.logger.Error("GetSignInData failed",
			zap.Int64("characterID", characterID), zap.Error(err))
		return nil, pkgerrors.ErrInvalidInput
	}
	return legacyPayload(res.State), nil
}

func (h *Handler) SigninNow(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := h.characterID(ctx, "SigninNow")
	if err != nil {
		return nil, err
	}
	res, err := h.service.DoLegacySignin(h.requestContext(ctx), characterID)
	if err != nil {
		h.respondError(ctx, "SigninNow", err)
		return nil, nil
	}
	h.fanoutGrants(ctx, res.Granted)
	return legacyPayload(res.State), nil
}
