// Open-sourced by BaoLT

package cache

import (
	"bytes"
	"context"
	"encoding/gob"
	"fmt"
	"sync"
	"time"

	infraredis "mcgame-server/internal/infrastructure/redis"

	"go.uber.org/zap"
)

const (
	hotStateRedisKey = "player:hot:"
	hotStateTTL      = 5 * time.Minute
	syncInterval     = 5 * time.Second
)

type PlayerHotState struct {
	CharID     int64
	MapID      int32
	PosX       float32
	PosY       float32
	CurrentHP  int32
	CurrentMP  int32
	MaxHP      int32
	MaxMP      int32
	Buffs      []int64
	Debuffs    []int64
	TargetID   int64
	LastTick   int64
	TempBagSlots int
	MxTempBagSlots int
}

type HotStateBuffer struct {
	current  *PlayerHotState
	pending  *PlayerHotState
	lastSync time.Time
	mu       sync.RWMutex
	stopCh   chan struct{}
}

func NewHotStateBuffer(charID int64) *HotStateBuffer {
	state := &PlayerHotState{
		CharID: charID,
		Buffs:  make([]int64, 0, 8),
		Debuffs: make([]int64, 0, 8),
	}

	return &HotStateBuffer{
		current:  state,
		pending:  deepCopyHotState(state),
		lastSync: time.Now(),
		stopCh:   make(chan struct{}),
	}
}

func deepCopyHotState(src *PlayerHotState) *PlayerHotState {
	dst := &PlayerHotState{
		CharID:     src.CharID,
		MapID:      src.MapID,
		PosX:       src.PosX,
		PosY:       src.PosY,
		CurrentHP:  src.CurrentHP,
		CurrentMP:  src.CurrentMP,
		MaxHP:      src.MaxHP,
		MaxMP:      src.MaxMP,
		TargetID:   src.TargetID,
		LastTick:   src.LastTick,
		TempBagSlots: src.TempBagSlots,
		MxTempBagSlots: src.MxTempBagSlots,
	}

	if src.Buffs != nil {
		dst.Buffs = make([]int64, len(src.Buffs))
		copy(dst.Buffs, src.Buffs)
	}

	if src.Debuffs != nil {
		dst.Debuffs = make([]int64, len(src.Debuffs))
		copy(dst.Debuffs, src.Debuffs)
	}

	return dst
}

func (b *HotStateBuffer) Get() *PlayerHotState {
	b.mu.RLock()
	defer b.mu.RUnlock()
	return b.current
}

func (b *HotStateBuffer) Update(fn func(*PlayerHotState)) {
	b.mu.Lock()
	defer b.mu.Unlock()

	fn(b.current)
	b.pending = deepCopyHotState(b.current)
}

func (b *HotStateBuffer) StopSync() {
	close(b.stopCh)
}

func (b *HotStateBuffer) StartSync(ctx context.Context, redisClient *infraredis.Client, logger *zap.Logger) {
	ticker := time.NewTicker(syncInterval)
	defer ticker.Stop()

	for {
		select {
		case <-ticker.C:
			if err := b.syncToRedis(ctx, redisClient, logger); err != nil {
				logger.Warn("Hot state sync failed, will retry",
					zap.Int64("char_id", b.current.CharID),
					zap.Error(err))
			}
		case <-b.stopCh:
			b.syncToRedis(ctx, redisClient, logger)
			return
		case <-ctx.Done():
			return
		}
	}
}

func (b *HotStateBuffer) syncToRedis(ctx context.Context, redisClient *infraredis.Client, logger *zap.Logger) error {
	b.mu.Lock()
	stateToSync := b.pending
	b.lastSync = time.Now()
	b.mu.Unlock()

	if redisClient == nil {
		return nil
	}

	var buf bytes.Buffer
	encoder := gob.NewEncoder(&buf)
	if err := encoder.Encode(stateToSync); err != nil {
		return fmt.Errorf("gob encode failed: %w", err)
	}

	key := fmt.Sprintf("%s%d", hotStateRedisKey, stateToSync.CharID)
	err := redisClient.GetClient().Set(ctx, key, buf.Bytes(), hotStateTTL).Err()
	if err != nil {
		return fmt.Errorf("redis set failed: %w", err)
	}

	return nil
}

func LoadHotStateFromRedis(ctx context.Context, redisClient *infraredis.Client, charID int64) (*PlayerHotState, error) {
	if redisClient == nil {
		return nil, nil
	}

	key := fmt.Sprintf("%s%d", hotStateRedisKey, charID)
	data, err := redisClient.GetClient().Get(ctx, key).Bytes()
	if err != nil {
		return nil, err
	}

	decoder := gob.NewDecoder(bytes.NewReader(data))
	var state PlayerHotState
	if err := decoder.Decode(&state); err != nil {
		return nil, err
	}

	return &state, nil
}

func DeleteHotStateFromRedis(ctx context.Context, redisClient *infraredis.Client, charID int64) error {
	if redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", hotStateRedisKey, charID)
	return redisClient.GetClient().Del(ctx, key).Err()
}
