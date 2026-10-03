// Open-sourced by BaoLT

// Shop purchase slot update helpers.
package shop

import (
	appshop "mcgame-server/internal/application/shop"
	"mcgame-server/internal/infrastructure/rtmp"
)

func sendPurchaseSlotUpdates(ctx *rtmp.RPCContext, res *appshop.BuyResult) {
	if res == nil {
		return
	}

	if len(res.AddedItemDTOs) > 0 {
		for _, itemDTO := range res.AddedItemDTOs {
			_ = ctx.Connection.SendCallback("onAddCharactorSlot", itemDTO)
		}
		return
	}

	if len(res.AddedItemDTO) == 0 {
		return
	}

	_ = ctx.Connection.SendCallback("onAddCharactorSlot", res.AddedItemDTO)
}
