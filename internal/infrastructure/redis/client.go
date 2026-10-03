// Open-sourced by BaoLT

package redis

import (
	"context"
	"fmt"
	"time"

	"github.com/redis/go-redis/v9"
	"go.uber.org/zap"

	"mcgame-server/internal/infrastructure/config"
)

type Client struct {
	client *redis.Client
	logger *zap.Logger
}

func NewClient(cfg config.RedisConfig, logger *zap.Logger) (*Client, error) {
	rdb := redis.NewClient(&redis.Options{
		Addr:     cfg.Address(),
		Password: cfg.Password,
		DB:       cfg.DB,
	})

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	if err := rdb.Ping(ctx).Err(); err != nil {
		return nil, fmt.Errorf("failed to connect to redis: %w", err)
	}

	logger.Info("Connected to Redis",
		zap.String("addr", cfg.Address()),
		zap.Int("db", cfg.DB))

	return &Client{
		client: rdb,
		logger: logger,
	}, nil
}

func (c *Client) Close() error {
	return c.client.Close()
}

func (c *Client) GetClient() *redis.Client {
	return c.client
}
