// Open-sourced by BaoLT

// Configuration management for the game server.
// Bootstrap-only, read from MCGAME_* environment variables over the defaults below:
// DB, Redis, RTMP listener, logging, admin HTTP, performance.
// Runtime-tunable config (lines, server settings, game tuning, GM settings) lives in
// public schema tables and is served by internal/infrastructure/config/store.
package config

import (
	"fmt"
	"strings"
	"time"

	"github.com/spf13/viper"
)

type ServerMode string

const (
	ModeMonolith ServerMode = "monolith"
	ModeLine     ServerMode = "line"
)

type Config struct {
	Server       ServerConfig      `mapstructure:"server"`
	AuthDatabase DatabaseConfig    `mapstructure:"auth_database"`
	Database     DatabaseConfig    `mapstructure:"database"`
	Redis        RedisConfig       `mapstructure:"redis"`
	AdminHTTP    AdminHTTPConfig   `mapstructure:"admin_http"`
	RTMP         RTMPConfig        `mapstructure:"rtmp"`
	Logging      LoggingConfig     `mapstructure:"logging"`
	Gateway      GatewayConfig     `mapstructure:"gateway"`
	Performance  PerformanceConfig `mapstructure:"performance"`
}

type PerformanceConfig struct {
	DebugLogPlayerData bool `mapstructure:"debug_log_player_data"`
}

type GatewayConfig struct {
	Mode   ServerMode `mapstructure:"mode"`
	LineID int        `mapstructure:"line_id"`
}

type ServerConfig struct {
	Environment string `mapstructure:"environment"`
	Name        string `mapstructure:"name"`
}

type AdminHTTPConfig struct {
	Host   string `mapstructure:"host"`
	Port   int    `mapstructure:"port"`
	Secret string `mapstructure:"secret"`
}

func (c AdminHTTPConfig) Address() string {
	return fmt.Sprintf("%s:%d", c.Host, c.Port)
}

type DatabaseConfig struct {
	Host            string        `mapstructure:"host"`
	Port            int           `mapstructure:"port"`
	User            string        `mapstructure:"user"`
	Password        string        `mapstructure:"password"`
	Database        string        `mapstructure:"database"`
	SSLMode         string        `mapstructure:"ssl_mode"`
	MaxConnections  int           `mapstructure:"max_connections"`
	MaxIdleConns    int           `mapstructure:"max_idle_conns"`
	ConnMaxLifetime time.Duration `mapstructure:"conn_max_lifetime"`
}

func (c DatabaseConfig) ConnectionString() string {
	return fmt.Sprintf(
		"postgres://%s:%s@%s:%d/%s?sslmode=%s",
		c.User, c.Password, c.Host, c.Port, c.Database, c.SSLMode,
	)
}

type RedisConfig struct {
	Host     string `mapstructure:"host"`
	Port     int    `mapstructure:"port"`
	Password string `mapstructure:"password"`
	DB       int    `mapstructure:"db"`
}

func (c RedisConfig) Address() string {
	return fmt.Sprintf("%s:%d", c.Host, c.Port)
}

type RTMPConfig struct {
	Host               string        `mapstructure:"host"`
	Port               int           `mapstructure:"port"`
	ChunkSize          int           `mapstructure:"chunk_size"`
	WindowAckSize      int           `mapstructure:"window_ack_size"`
	MaxConnections     int           `mapstructure:"max_connections"`
	ReadTimeout        time.Duration `mapstructure:"read_timeout"`
	WriteTimeout       time.Duration `mapstructure:"write_timeout"`
	TrustProxyProtocol bool          `mapstructure:"trust_proxy_protocol"`
}

func (c RTMPConfig) Address() string {
	return fmt.Sprintf("%s:%d", c.Host, c.Port)
}

type LoggingConfig struct {
	Level      string `mapstructure:"level"`
	Format     string `mapstructure:"format"`
	OutputPath string `mapstructure:"output_path"`
}

func Load() (*Config, error) {
	v := viper.New()

	setDefaults(v)

	v.SetEnvPrefix("MCGAME")
	v.SetEnvKeyReplacer(strings.NewReplacer(".", "_"))
	v.AutomaticEnv()

	var cfg Config
	if err := v.Unmarshal(&cfg); err != nil {
		return nil, fmt.Errorf("failed to unmarshal config: %w", err)
	}

	return &cfg, nil
}

func setDefaults(v *viper.Viper) {
	v.SetDefault("server.environment", "development")
	v.SetDefault("server.name", "mcgame-server")

	v.SetDefault("auth_database.host", "localhost")
	v.SetDefault("auth_database.port", 5432)
	v.SetDefault("auth_database.user", "postgres")
	v.SetDefault("auth_database.password", "postgres")
	v.SetDefault("auth_database.database", "postgres")
	v.SetDefault("auth_database.ssl_mode", "disable")
	v.SetDefault("auth_database.max_connections", 20)
	v.SetDefault("auth_database.max_idle_conns", 5)
	v.SetDefault("auth_database.conn_max_lifetime", time.Hour)

	v.SetDefault("database.host", "localhost")
	v.SetDefault("database.port", 5432)
	v.SetDefault("database.user", "postgres")
	v.SetDefault("database.password", "postgres")
	v.SetDefault("database.database", "postgres")
	v.SetDefault("database.ssl_mode", "disable")
	v.SetDefault("database.max_connections", 50)
	v.SetDefault("database.max_idle_conns", 10)
	v.SetDefault("database.conn_max_lifetime", time.Hour)

	v.SetDefault("redis.host", "localhost")
	v.SetDefault("redis.port", 6379)
	v.SetDefault("redis.password", "")
	v.SetDefault("redis.db", 0)

	v.SetDefault("admin_http.host", "0.0.0.0")
	v.SetDefault("admin_http.port", 8080)
	v.SetDefault("admin_http.secret", "")

	v.SetDefault("rtmp.host", "0.0.0.0")
	v.SetDefault("rtmp.port", 1935)
	v.SetDefault("rtmp.chunk_size", 4096)
	v.SetDefault("rtmp.window_ack_size", 2500000)
	v.SetDefault("rtmp.max_connections", 1000)
	v.SetDefault("rtmp.read_timeout", 30*time.Second)
	v.SetDefault("rtmp.write_timeout", 30*time.Second)
	v.SetDefault("rtmp.trust_proxy_protocol", false)

	v.SetDefault("logging.level", "info")
	v.SetDefault("logging.format", "json")
	v.SetDefault("logging.output_path", "temp/mcgame-server.log")

	v.SetDefault("gateway.mode", "monolith")
	v.SetDefault("gateway.line_id", 0)

	v.SetDefault("performance.debug_log_player_data", false)
}
