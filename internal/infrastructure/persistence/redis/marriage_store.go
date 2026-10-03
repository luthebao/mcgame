// Open-sourced by BaoLT

// Redis-backed transient marriage panel storage.
package redisstore

import (
	"context"
	"encoding/json"
	"fmt"
	"strconv"
	"time"

	domainmarriage "mcgame-server/internal/domain/marriage"
	infraredis "mcgame-server/internal/infrastructure/redis"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/redis/go-redis/v9"
)

const (
	marriageSeekingIndexKey = "marriage:seeking:index"
	marriageRequestSeqKey   = "marriage:request:seq"
	marriagePanelTTL        = 30 * 24 * time.Hour
)

type MarriageStore struct {
	client *infraredis.Client
}

func NewMarriageStore(client *infraredis.Client) *MarriageStore {
	return &MarriageStore{client: client}
}

func (s *MarriageStore) SaveSeeking(ctx context.Context, entry *domainmarriage.SeekingEntry) error {
	payload, err := json.Marshal(entry)
	if err != nil {
		return err
	}

	pipe := s.rdb().Pipeline()
	pipe.Set(ctx, seekingKey(entry.CharacterID), payload, marriagePanelTTL)
	pipe.ZAdd(ctx, marriageSeekingIndexKey, redis.Z{
		Score:  float64(entry.AddDate),
		Member: strconv.FormatInt(entry.CharacterID, 10),
	})
	pipe.Expire(ctx, marriageSeekingIndexKey, marriagePanelTTL)

	_, err = pipe.Exec(ctx)
	return err
}

func (s *MarriageStore) GetSeeking(ctx context.Context, characterID int64) (*domainmarriage.SeekingEntry, error) {
	data, err := s.rdb().Get(ctx, seekingKey(characterID)).Bytes()
	if err != nil {
		if err == redis.Nil {
			return nil, nil
		}
		return nil, err
	}

	entry := &domainmarriage.SeekingEntry{}
	if err := json.Unmarshal(data, entry); err != nil {
		return nil, err
	}

	return entry, nil
}

func (s *MarriageStore) DeleteSeeking(ctx context.Context, characterID int64) error {
	pipe := s.rdb().Pipeline()
	pipe.Del(ctx, seekingKey(characterID))
	pipe.ZRem(ctx, marriageSeekingIndexKey, strconv.FormatInt(characterID, 10))
	_, err := pipe.Exec(ctx)
	return err
}

func (s *MarriageStore) ListSeeking(ctx context.Context, limit int64) ([]*domainmarriage.SeekingEntry, error) {
	ids, err := s.rdb().ZRevRange(ctx, marriageSeekingIndexKey, 0, limit-1).Result()
	if err != nil {
		if err == redis.Nil {
			return []*domainmarriage.SeekingEntry{}, nil
		}
		return nil, err
	}

	result := make([]*domainmarriage.SeekingEntry, 0, len(ids))
	for _, rawID := range ids {
		characterID, parseErr := strconv.ParseInt(rawID, 10, 64)
		if parseErr != nil {
			continue
		}
		entry, getErr := s.GetSeeking(ctx, characterID)
		if getErr != nil || entry == nil {
			continue
		}
		result = append(result, entry)
	}

	return result, nil
}

func (s *MarriageStore) NextRequestID(ctx context.Context) (int64, error) {
	return s.rdb().Incr(ctx, marriageRequestSeqKey).Result()
}

func (s *MarriageStore) SaveRequest(ctx context.Context, entry *domainmarriage.RequestEntry) error {
	payload, err := json.Marshal(entry)
	if err != nil {
		return err
	}

	member := strconv.FormatInt(entry.ID, 10)
	score := float64(entry.AddDate)
	pipe := s.rdb().Pipeline()
	pipe.Set(ctx, requestKey(entry.ID), payload, marriagePanelTTL)
	pipe.ZAdd(ctx, requestIndexKey(entry.FromID), redis.Z{Score: score, Member: member})
	pipe.ZAdd(ctx, requestIndexKey(entry.ToID), redis.Z{Score: score, Member: member})
	pipe.Expire(ctx, requestIndexKey(entry.FromID), marriagePanelTTL)
	pipe.Expire(ctx, requestIndexKey(entry.ToID), marriagePanelTTL)
	_, err = pipe.Exec(ctx)
	return err
}

func (s *MarriageStore) GetRequest(ctx context.Context, requestID int64) (*domainmarriage.RequestEntry, error) {
	data, err := s.rdb().Get(ctx, requestKey(requestID)).Bytes()
	if err != nil {
		if err == redis.Nil {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, err
	}

	entry := &domainmarriage.RequestEntry{}
	if err := json.Unmarshal(data, entry); err != nil {
		return nil, err
	}

	return entry, nil
}

func (s *MarriageStore) ListRequestsForCharacter(ctx context.Context, characterID int64) ([]*domainmarriage.RequestEntry, error) {
	ids, err := s.rdb().ZRevRange(ctx, requestIndexKey(characterID), 0, -1).Result()
	if err != nil {
		if err == redis.Nil {
			return []*domainmarriage.RequestEntry{}, nil
		}
		return nil, err
	}

	result := make([]*domainmarriage.RequestEntry, 0, len(ids))
	for _, rawID := range ids {
		requestID, parseErr := strconv.ParseInt(rawID, 10, 64)
		if parseErr != nil {
			continue
		}
		entry, getErr := s.GetRequest(ctx, requestID)
		if getErr != nil || entry == nil {
			continue
		}
		result = append(result, entry)
	}

	return result, nil
}

func (s *MarriageStore) rdb() *redis.Client {
	return s.client.GetClient()
}

func seekingKey(characterID int64) string {
	return fmt.Sprintf("marriage:seeking:%d", characterID)
}

func requestKey(requestID int64) string {
	return fmt.Sprintf("marriage:request:%d", requestID)
}

func requestIndexKey(characterID int64) string {
	return fmt.Sprintf("marriage:request:index:%d", characterID)
}
