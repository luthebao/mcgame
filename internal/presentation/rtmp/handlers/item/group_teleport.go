// Open-sourced by BaoLT

package item

import (
	"context"

	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
)

func (h *Handler) groupTransportDeps() *rtmputils.GroupTransportDeps {
	if h == nil {
		return nil
	}
	return &rtmputils.GroupTransportDeps{
		Logger:            h.logger,
		GroupService:      h.groupService,
		CharService:       h.charService,
		SceneService:      h.sceneService,
		SceneManager:      h.sceneManager,
		PresenceStore:     h.presenceStore,
		LookupConn:        h.lookupConnFn,
		AttachSceneMeta:   h.attachFollowingPetForMember,
		RefreshGroupState: h.groupStateRefresher,
	}
}

func (h *Handler) scenePopulationDeps() *rtmputils.ScenePopulationDeps {
	if h == nil {
		return nil
	}
	return &rtmputils.ScenePopulationDeps{
		CharService:     h.charService,
		SceneService:    h.sceneService,
		SceneManager:    h.sceneManager,
		AttachSceneMeta: h.attachFollowingPetForMember,
	}
}

func (h *Handler) attachFollowingPetForMember(ctx context.Context, characterID int64, payload map[string]interface{}) {
	if h == nil || h.petService == nil || payload == nil {
		return
	}

	followingPet, err := h.petService.GetFollowingPet(ctx, characterID)
	if err != nil || followingPet == nil {
		return
	}
	payload["showPetId"] = followingPet.ID
	payload["showPetObj"] = followingPet.ToSceneDTO()
}

func (h *Handler) removeSelfFromPlainGroup(ctx context.Context, characterID int64) {
	if h == nil || h.groupPersonalLeave == nil {
		return
	}
	h.groupPersonalLeave(ctx, characterID)
}
