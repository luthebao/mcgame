// Open-sourced by BaoLT

package utils

import (
	"context"

	appchar "mcgame-server/internal/application/character"
	appscene "mcgame-server/internal/application/scene"
	"mcgame-server/internal/infrastructure/rtmp"
)

type ScenePopulationDeps struct {
	CharService     *appchar.Service
	SceneService    *appscene.Service
	SceneManager    *rtmp.SceneManager
	AttachSceneMeta func(ctx context.Context, characterID int64, payload map[string]interface{})
}

func (d *ScenePopulationDeps) PushOnCreateChars(ctx context.Context, conn *rtmp.Connection, channelID, mapID int, selfCharID int64) {
	if d == nil || conn == nil || d.SceneManager == nil || d.CharService == nil || d.SceneService == nil {
		return
	}

	channelCharIDs := d.SceneManager.GetSceneCharacterIDs(channelID, mapID)
	result := make([]map[string]interface{}, 0, len(channelCharIDs))
	for otherID := range channelCharIDs {
		if otherID == selfCharID {
			continue
		}
		other, err := d.CharService.GetByID(ctx, otherID)
		if err != nil || other == nil {
			continue
		}
		data := d.SceneService.GetCharacterForClient(other)
		if d.AttachSceneMeta != nil {
			d.AttachSceneMeta(ctx, otherID, data)
		}
		result = append(result, data)
	}
	_ = conn.SendCallback("onCreateChars", result)
}
