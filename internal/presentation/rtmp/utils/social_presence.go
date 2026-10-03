// Open-sourced by BaoLT

package utils

import (
	"context"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
)

func UpsertSocialPresence(ctx context.Context, store *redisstore.SocialPresenceStore, characterID int64, name string, mapID int, x int, y int, line int) error {
	if store == nil || characterID <= 0 || mapID <= 0 {
		return nil
	}

	return store.Save(ctx, &redisstore.SocialPresence{
		CharacterID: characterID,
		Name:        name,
		MapID:       mapID,
		X:           x,
		Y:           y,
		Line:        line,
		UpdatedAt:   time.Now().UnixMilli(),
	})
}

func UpsertSocialPresenceFromCharacter(ctx context.Context, store *redisstore.SocialPresenceStore, char *domainchar.Character, line int) error {
	if char == nil {
		return nil
	}

	return UpsertSocialPresence(ctx, store, char.ID, char.Name, char.MapID, char.PosX, char.PosY, line)
}

func DeleteSocialPresence(ctx context.Context, store *redisstore.SocialPresenceStore, characterID int64) error {
	if store == nil || characterID <= 0 {
		return nil
	}

	return store.Delete(ctx, characterID)
}
