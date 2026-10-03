// Open-sourced by BaoLT

// Long-lived LISTEN goroutine for the runtime config Store.
// Reconnects with exponential backoff; surface the last good snapshot while disconnected.
package store

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"go.uber.org/zap"
)

const (
	listenInitialBackoff = 500 * time.Millisecond
	listenMaxBackoff     = 30 * time.Second
	listenWaitTimeout    = 60 * time.Second
)

type notifyPayload struct {
	Table string `json:"table"`
	Key   string `json:"key"`
	Op    string `json:"op"`
}

func (s *Store) runListener(ctx context.Context) {
	defer close(s.done)

	backoff := listenInitialBackoff
	for {
		if ctx.Err() != nil {
			return
		}

		err := s.listenLoop(ctx)
		if ctx.Err() != nil {
			return
		}
		if err != nil {
			s.log.Warn("config store listener reconnecting", zap.Error(err), zap.Duration("backoff", backoff))
		}

		select {
		case <-ctx.Done():
			return
		case <-time.After(backoff):
		}
		backoff *= 2
		if backoff > listenMaxBackoff {
			backoff = listenMaxBackoff
		}
	}
}

func (s *Store) listenLoop(ctx context.Context) error {
	conn, err := s.pool.Acquire(ctx)
	if err != nil {
		return err
	}
	defer conn.Release()

	pgConn := conn.Conn()
	if _, err := pgConn.Exec(ctx, "listen "+NotifyChannel); err != nil {
		return err
	}

	if err := s.refreshAll(ctx); err != nil {
		s.log.Warn("config store post-listen refresh failed", zap.Error(err))
	}
	s.log.Info("config store listener ready", zap.String("channel", NotifyChannel))

	for {
		if ctx.Err() != nil {
			return ctx.Err()
		}

		waitCtx, cancel := context.WithTimeout(ctx, listenWaitTimeout)
		notification, err := pgConn.WaitForNotification(waitCtx)
		cancel()
		if err != nil {
			if errors.Is(err, context.DeadlineExceeded) {
				continue
			}
			return err
		}

		var payload notifyPayload
		if err := json.Unmarshal([]byte(notification.Payload), &payload); err != nil {
			s.log.Warn("config notify payload decode failed",
				zap.String("payload", notification.Payload),
				zap.Error(err))
			continue
		}

		refreshCtx, refreshCancel := context.WithTimeout(ctx, 5*time.Second)
		if err := s.refreshByTable(refreshCtx, payload.Table); err != nil {
			s.log.Warn("config refresh after notify failed",
				zap.String("table", payload.Table),
				zap.String("key", payload.Key),
				zap.Error(err))
		} else {
			s.log.Debug("config refreshed",
				zap.String("table", payload.Table),
				zap.String("key", payload.Key),
				zap.String("op", payload.Op))
		}
		refreshCancel()
	}
}

