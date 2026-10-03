// Open-sourced by BaoLT

// Soul acquisition + movement RPC handlers: preySoul (crystal gacha), exchangeSoul
// (chip spend), putSoulToBag (temp-bag → char-bag, single + all), openPetSoulBag
// (soulExp-gated pet slot unlock), and the moveSoul drag-swap.
//
// Wire contracts (decompiled client):
//   - preySoul(index, key, moneyFlag)        null responder → push onPreySoulSingle;
//     also push onAddMoney("soulPnt") so player.soulPnt reflects the deduction before
//     the panel re-reads it. key/moneyFlag are accepted but only moneyFlag changes the
//     spend path (money path skips the soulPnt deduction).
//   - exchangeSoul(soulId)                    Responder → return onExchangeSoul map.
//   - putSoulToBag(tempIndex) | (-1, true)    null responder → push onPutSoulToBag /
//     onPutAllSoulToBag.
//   - openPetSoulBag(petId)                   Responder → return onOpenSoulBag map.
//   - moveSoul(sid, newSid, petId)            null responder → push onUpdateSoulSlot.
//     INBOUND VERB UNCONFIRMED (see internal/application/soul/swap.go).
package soul

import (
	"mcgame-server/internal/infrastructure/rtmp"
)

const soulPntFieldKey = "soulPnt"

func (h *Handler) PreySoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	index, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	moneyFlag := boolArg(args, 2)
	payload, opErr := h.service.PreySoul(ctx.Context, charID, index, moneyFlag, nil)
	if opErr != nil {
		return rtmp.ErrorToResponse(opErr), nil
	}
	spent, _ := payload["spent"].(int64)
	if spent > 0 {
		_ = h.sendCallback(ctx.Connection, "onAddMoney", float64(charID), soulPntFieldKey, float64(-spent), payload["point"])
	}
	delete(payload, "moneyFlag")
	delete(payload, "spent")
	_ = h.sendCallback(ctx.Connection, "onPreySoulSingle", payload)
	return nil, nil
}

func (h *Handler) ExchangeSoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	soulID, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	payload, opErr := h.service.ExchangeSoul(ctx.Context, charID, soulID)
	if opErr != nil {
		return rtmp.ErrorToResponse(opErr), nil
	}
	return payload, nil
}

func (h *Handler) PutSoulToBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	tempIndex, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	if tempIndex < 0 && boolArg(args, 1) {
		payload, opErr := h.service.PutAllSoulToBag(ctx.Context, charID)
		if opErr != nil {
			return rtmp.ErrorToResponse(opErr), nil
		}
		_ = h.sendCallback(ctx.Connection, "onPutAllSoulToBag", payload)
		return nil, nil
	}
	payload, opErr := h.service.PutSoulToBag(ctx.Context, charID, tempIndex)
	if opErr != nil {
		return rtmp.ErrorToResponse(opErr), nil
	}
	_ = h.sendCallback(ctx.Connection, "onPutSoulToBag", payload)
	return nil, nil
}

func (h *Handler) OpenPetSoulBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 1 {
		return nil, nil
	}
	petID, err := parseInt64Arg(args[0])
	if err != nil || petID <= 0 {
		return nil, nil
	}
	payload, opErr := h.service.OpenPetSoulBag(ctx.Context, charID, petID)
	if opErr != nil {
		return rtmp.ErrorToResponse(opErr), nil
	}
	return payload, nil
}

func (h *Handler) MoveSoul(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	if len(args) < 2 {
		return nil, nil
	}
	sid, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}
	newSid, err := parseIntArg(args[1])
	if err != nil {
		return nil, nil
	}
	var petID int64
	if len(args) >= 3 {
		if id, perr := parseInt64Arg(args[2]); perr == nil && id > 0 {
			petID = id
		}
	}
	payload, opErr := h.service.MoveSoul(ctx.Context, charID, petID, sid, newSid)
	if opErr != nil {
		return rtmp.ErrorToResponse(opErr), nil
	}
	_ = h.sendCallback(ctx.Connection, "onUpdateSoulSlot", payload)
	return nil, nil
}
