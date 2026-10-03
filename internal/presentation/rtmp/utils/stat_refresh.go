// Open-sourced by BaoLT

// Shared character stat-refresh helpers. Both recompute element and maker-set
// state and aggregate equipment bonuses; SendStatRefreshUPP emits the `onUPP`
// event, SendInitViewProp emits the `onInitViewProp` event.
package utils

import (
	"context"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
)

type StatRefreshService interface {
	ApplyCharacterElementState(ctx context.Context, char *domainchar.Character)
	ApplyCharacterMakerSetState(ctx context.Context, char *domainchar.Character)
	AggregateEquipmentStats(ctx context.Context, charID int64) domainchar.EquipmentStatBonuses
}

func SendStatRefreshUPP(ctx *rtmp.RPCContext, service StatRefreshService, char *domainchar.Character) {
	if ctx == nil || ctx.Connection == nil || char == nil {
		return
	}
	if service == nil {
		_ = ctx.Connection.SendCallback("onUPP", domainchar.BuildStatRefreshUPPPayload(char))
		return
	}
	service.ApplyCharacterElementState(ctx.Context, char)
	service.ApplyCharacterMakerSetState(ctx.Context, char)
	bonuses := service.AggregateEquipmentStats(ctx.Context, char.ID)
	_ = ctx.Connection.SendCallback("onUPP", domainchar.BuildStatRefreshUPPPayloadWithEquipment(char, bonuses))
}

func SendInitViewProp(ctx *rtmp.RPCContext, service StatRefreshService, char *domainchar.Character) {
	if ctx == nil || ctx.Connection == nil || char == nil {
		return
	}
	var bonuses domainchar.EquipmentStatBonuses
	if service != nil {
		service.ApplyCharacterElementState(ctx.Context, char)
		service.ApplyCharacterMakerSetState(ctx.Context, char)
		bonuses = service.AggregateEquipmentStats(ctx.Context, char.ID)
	}
	_ = ctx.Connection.SendCallback("onInitViewProp", domainchar.BuildViewPropertiesWithEquipment(char, bonuses))
}
