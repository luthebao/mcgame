// Open-sourced by BaoLT

package npc

import (
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
)

func (h *Handler) groupTransportDeps() *rtmputils.GroupTransportDeps {
	if h == nil {
		return nil
	}

	var lookupConn func(characterID string) *rtmp.Connection
	if h.rtmpServer != nil {
		lookupConn = h.rtmpServer.GetConnectionByCharacterID
	}

	return &rtmputils.GroupTransportDeps{
		Logger:            h.logger,
		GroupService:      h.groupService,
		CharService:       h.charService,
		SceneService:      h.sceneService,
		SceneManager:      h.sceneManager,
		PresenceStore:     h.presenceStore,
		LookupConn:        lookupConn,
		RefreshGroupState: h.groupStateRefresher,
	}
}

func (h *Handler) scenePopulationDeps() *rtmputils.ScenePopulationDeps {
	if h == nil {
		return nil
	}
	return &rtmputils.ScenePopulationDeps{
		CharService:  h.charService,
		SceneService: h.sceneService,
		SceneManager: h.sceneManager,
	}
}
