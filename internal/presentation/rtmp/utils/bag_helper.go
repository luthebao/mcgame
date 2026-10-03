// Open-sourced by BaoLT

// Bag capacity helper for sending low-slot warnings to Flash client.
package utils

import (
	"context"
	"fmt"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/infrastructure/rtmp"
)

func CheckBagCapacityWarning(ctx context.Context, conn *rtmp.Connection, itemService *appitem.Service, charID int64) {
	remaining, err := itemService.GetBagRemainingSlots(ctx, charID)
	if err != nil {
		return
	}
	if remaining <= appitem.BagLowSlotThreshold {
		_ = conn.SendCallback("onSystemSay", fmt.Sprintf("Túi đồ còn %d ô trống!", remaining))
	}
}
