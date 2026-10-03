// Open-sourced by BaoLT

package combat

import "mcgame-server/internal/infrastructure/rtmp"

func (h *Handler) broadcastSceneCharState(conn *rtmp.Connection, characterID string, state int) {
	if h.sceneManager == nil || conn == nil || characterID == "" {
		return
	}

	mapID, _ := conn.GetSceneInfo()
	if mapID == 0 {
		return
	}

	h.sceneManager.BroadcastToScene(conn.GetChannelID(), mapID, conn.ID, "onSetCharState", map[string]interface{}{
		"cid":   characterID,
		"state": state,
	})
}
