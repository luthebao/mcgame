// Open-sourced by BaoLT

// Shared response helpers: error-to-callback mapping and the post-success
// SetBtns / onDailySignInActDoSignin push that the modern panel consumes.
// Centralising both keeps every handler thin and consistent.
package dailysignin

import (
	"errors"
	"fmt"

	appdailysignin "mcgame-server/internal/application/dailysignin"
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/internal/presentation/rtmp/chatfmt"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) respondError(ctx *rtmp.RPCContext, method string, err error) {
	switch {
	case errors.Is(err, appdailysignin.ErrAlreadyClaimedToday):
		h.sendCallback(ctx, cbOnYellowMsg, "Hôm nay đã ký tên rồi.")
	case errors.Is(err, appdailysignin.ErrAwardAlreadyClaimed):
		h.sendCallback(ctx, cbOnYellowMsg, "Phần thưởng đã nhận rồi.")
	case errors.Is(err, appdailysignin.ErrAwardNotAvailable):
		h.sendCallback(ctx, cbOnYellowMsg, "Chưa đủ điều kiện nhận thưởng.")
	case errors.Is(err, appdailysignin.ErrNoMissedDays):
		h.sendCallback(ctx, cbOnYellowMsg, "Số ngày ký tên tháng này đã hết.")
	case errors.Is(err, appdailysignin.ErrCritMaxed):
		h.sendCallback(ctx, cbOnYellowMsg, "Tỉ lệ Bạo kích đạt 100%.")
	case errors.Is(err, appdailysignin.ErrLevelTooLow):
		h.sendCallback(ctx, cbOnSystemMidMsgOrNote, "Cần đạt cấp 50 trở lên để tham gia.")
	case errors.Is(err, pkgerrors.ErrInsufficientFunds):
		h.sendCallback(ctx, cbOnSystemMidMsgOrNote, "Không đủ điểm.")
	default:
		h.logger.Error(method+" failed", zap.Error(err))
		h.sendCallback(ctx, cbOnRedMsg, "Thao tác thất bại.")
	}
}

func (h *Handler) pushSignInUpdate(ctx *rtmp.RPCContext, out *appdailysignin.Outcome) map[string]interface{} {
	dataPayload := signInDataPayload(out.Record, out.AwardDay)
	h.sendCallback(ctx, cbSetBtnsDailySignInAct, dataPayload)
	h.sendCallback(ctx, cbOnDailySignInActDoSignin, map[string]interface{}{
		"data": dataPayload,
		"date": out.Day,
	})
	return dataPayload
}

func (h *Handler) pushGoldDebit(ctx *rtmp.RPCContext, out *appdailysignin.Outcome) {
	if out.GoldSpent <= 0 {
		return
	}
	h.sendCallback(ctx, cbOnUPP, map[string]interface{}{
		"gold":     out.GoldLeft,
		"goldDiff": -out.GoldSpent,
	})
}

func (h *Handler) pushGoldCredit(ctx *rtmp.RPCContext, out *appdailysignin.Outcome) {
	if out.GoldSpent >= 0 {
		return
	}
	h.sendCallback(ctx, cbOnUPP, map[string]interface{}{
		"gold":     out.GoldLeft,
		"goldDiff": -out.GoldSpent,
	})
}

func (h *Handler) pushConsumeLimit(ctx *rtmp.RPCContext, out *appdailysignin.Outcome) {
	if out == nil || out.Record == nil {
		return
	}
	h.sendCallback(ctx, cbOnInitDailySignInActConsumeLim, out.Record.ConsumeLimitTotal)
}

func (h *Handler) fanoutGrants(ctx *rtmp.RPCContext, grants []appdailysignin.GrantedItem) {
	for _, g := range grants {
		if g.DTO == nil {
			continue
		}
		h.sendCallback(ctx, cbOnAddCharactorSlot, g.DTO)
		h.sendCallback(ctx, cbOnSystemSay, grantNoticeText(g))
	}
}

func grantNoticeText(g appdailysignin.GrantedItem) string {
	name := g.Name
	if name == "" {
		name = fmt.Sprintf("Item #%d", g.ItemID)
	}
	link := chatfmt.FormatLink(chatfmt.Link{
		Type:    chatfmt.LinkTypeItemTemplate,
		ID:      int64(g.ItemID),
		Name:    name,
		Display: name,
	})
	if link == "" {
		return fmt.Sprintf("Báo Danh: nhận được %s x%d", name, g.Quantity)
	}
	return fmt.Sprintf("Báo Danh: nhận được %s x%d", link, g.Quantity)
}
