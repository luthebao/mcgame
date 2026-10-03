// Open-sourced by BaoLT

// NPC shop routing helpers.
package npc

import "mcgame-server/internal/infrastructure/rtmp"

const directNPCShopCallback = "onOpenShop"

func callbackForDirectNPCShop(_ int) string {
	return directNPCShopCallback
}

func sendDirectNPCShop(ctx *rtmp.RPCContext, shopID int) error {
	return ctx.Connection.SendCallbackSync(callbackForDirectNPCShop(shopID), shopID)
}
