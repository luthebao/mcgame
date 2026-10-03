// Open-sourced by BaoLT

package npc

import "mcgame-server/internal/infrastructure/rtmp"

const (
	guildBuildConstructNPCID    = 1098
	guildBuildInfoNPCID         = 1099
	guildBuildWarehouseNPCID    = 1102
	guildBuildConstructID       = 10
	guildBuildConstructType     = 1
	guildBuildInfoID            = 169
	guildBuildWarehouseID       = 5
	guildBuildInfoType          = 4
	guildBuildWarehouseType     = 5
	guildBuildPrompt            = "Hãy gọi bang chủ đến mở nhiệm vụ bang hội đi."
	guildBuildListTitle         = "Công trình bang hội"
	guildBuildListContent       = "Mọi người hãy đến xây dựng"
	guildBuildInfoFallbackID    = 169
	guildBuildWarehouseFallback = 5
)

func (h *Handler) tryHandleGuildBuildingNPCClick(ctx *rtmp.RPCContext, npcID int) (bool, error) {
	switch npcID {
	case guildBuildConstructNPCID:
		ctx.Connection.SetLastGuildBuildContext(guildBuildConstructID, guildBuildConstructType)
		options := []map[string]interface{}{
			{"label": "Bắt đầu xây", "func": "startConstruction"},
		}
		if err := ctx.Connection.SendCallbackSync("onList", npcID, guildBuildListTitle, guildBuildListContent, options); err != nil {
			return true, err
		}
		return true, nil
	case guildBuildInfoNPCID:
		ctx.Connection.SetLastGuildBuildContext(guildBuildInfoID, guildBuildInfoType)
		_ = ctx.Connection.SendCallback("onNpcMsg", npcID, guildBuildPrompt)
		options := []map[string]interface{}{
			{"label": "Thông tin công trình", "func": "buildInfo"},
		}
		if err := ctx.Connection.SendCallbackSync("onList", npcID, guildBuildListTitle, guildBuildListContent, options); err != nil {
			return true, err
		}
		return true, nil
	case guildBuildWarehouseNPCID:
		ctx.Connection.SetLastGuildBuildContext(guildBuildWarehouseID, guildBuildWarehouseType)
		_ = ctx.Connection.SendCallback("onNpcMsg", npcID, guildBuildPrompt)
		options := []map[string]interface{}{
			{"label": "Kho bang", "func": "showGuildWarehouse"},
			{"label": "Quyên góp", "func": "showDonatePanel"},
			{"label": "Thông tin công trình", "func": "buildInfo"},
		}
		if err := ctx.Connection.SendCallbackSync("onList", npcID, guildBuildListTitle, guildBuildListContent, options); err != nil {
			return true, err
		}
		return true, nil
	default:
		return false, nil
	}
}

func guildBuildCallbackID(conn *rtmp.Connection, fallback int) int {
	buildID, _ := conn.GetLastGuildBuildContext()
	if buildID <= 0 {
		return fallback
	}
	return buildID
}
