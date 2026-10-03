// Open-sourced by BaoLT

// Redis-backed social presence storage for cross-line target lookup.
package redisstore

import (
	"context"
	"encoding/json"
	"fmt"
	"time"

	infraredis "mcgame-server/internal/infrastructure/redis"

	"github.com/redis/go-redis/v9"
)

const socialPresenceTTL = 10 * time.Minute

type SocialPresence struct {
	CharacterID int64  `json:"characterId"`
	Name        string `json:"name"`
	MapID       int    `json:"mapId"`
	X           int    `json:"x"`
	Y           int    `json:"y"`
	Line        int    `json:"line"`
	UpdatedAt   int64  `json:"updatedAt"`
}

type SocialPresenceStore struct {
	client *infraredis.Client
}

func NewSocialPresenceStore(client *infraredis.Client) *SocialPresenceStore {
	return &SocialPresenceStore{client: client}
}

func (s *SocialPresenceStore) Save(ctx context.Context, presence *SocialPresence) error {
	payload, err := json.Marshal(presence)
	if err != nil {
		return err
	}

	return s.rdb().Set(ctx, socialPresenceKey(presence.CharacterID), payload, socialPresenceTTL).Err()
}

func (s *SocialPresenceStore) Get(ctx context.Context, characterID int64) (*SocialPresence, error) {
	data, err := s.rdb().Get(ctx, socialPresenceKey(characterID)).Bytes()
	if err != nil {
		if err == redis.Nil {
			return nil, nil
		}
		return nil, err
	}

	presence := &SocialPresence{}
	if err := json.Unmarshal(data, presence); err != nil {
		return nil, err
	}

	return presence, nil
}

func (s *SocialPresenceStore) Delete(ctx context.Context, characterID int64) error {
	return s.rdb().Del(ctx, socialPresenceKey(characterID)).Err()
}

func (s *SocialPresenceStore) rdb() *redis.Client {
	return s.client.GetClient()
}

func socialPresenceKey(characterID int64) string {
	return fmt.Sprintf("social:presence:%d", characterID)
}
