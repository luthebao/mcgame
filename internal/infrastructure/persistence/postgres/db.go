// Open-sourced by BaoLT

// PostgreSQL database connection pool management.
// Provides connection pooling with configurable limits and health checks.
// Uses pgx driver for efficient PostgreSQL connectivity.
package postgres

import (
	"context"
	"fmt"
	"net/url"

	"mcgame-server/internal/infrastructure/config"

	"github.com/jackc/pgx/v5/pgxpool"
	"go.uber.org/zap"
)

type Database struct {
	pool   *pgxpool.Pool
	logger *zap.Logger
}

func NewDatabase(cfg config.DatabaseConfig, logger *zap.Logger) (*Database, error) {
	connectionString, err := connectionStringWithSearchPath(cfg.ConnectionString())
	if err != nil {
		return nil, fmt.Errorf("failed to configure database connection string: %w", err)
	}

	poolConfig, err := pgxpool.ParseConfig(connectionString)
	if err != nil {
		return nil, fmt.Errorf("failed to parse connection string: %w", err)
	}

	poolConfig.MaxConns = int32(cfg.MaxConnections)
	poolConfig.MinConns = int32(cfg.MaxIdleConns)
	poolConfig.MaxConnLifetime = cfg.ConnMaxLifetime

	pool, err := pgxpool.NewWithConfig(context.Background(), poolConfig)
	if err != nil {
		return nil, fmt.Errorf("failed to create connection pool: %w", err)
	}

	if err := pool.Ping(context.Background()); err != nil {
		pool.Close()
		return nil, fmt.Errorf("failed to ping database: %w", err)
	}

	logger.Info("Database connection established",
		zap.String("host", cfg.Host),
		zap.Int("port", cfg.Port),
		zap.String("database", cfg.Database))

	return &Database{
		pool:   pool,
		logger: logger,
	}, nil
}

func connectionStringWithSearchPath(connectionString string) (string, error) {
	parsedURL, err := url.Parse(connectionString)
	if err != nil {
		return "", err
	}

	query := parsedURL.Query()
	query.Set("search_path", "public,player,data")
	parsedURL.RawQuery = query.Encode()

	return parsedURL.String(), nil
}

func (db *Database) Pool() *pgxpool.Pool {
	return db.pool
}

func (db *Database) Close() {
	db.pool.Close()
	db.logger.Info("Database connection closed")
}

func (db *Database) HealthCheck(ctx context.Context) error {
	return db.pool.Ping(ctx)
}
