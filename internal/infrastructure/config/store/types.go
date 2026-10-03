// Open-sourced by BaoLT

// Typed value snapshots backing the live config Store.
// Public surface for handlers that need runtime-tunable values.
package store

import (
	"encoding/json"
	"time"
)

type GatewayLine struct {
	ID         int
	Name       string
	URL        string
	MaxClients int
	Auction    bool
	Guild      bool
	Status     string
	SortOrder  int
	UpdatedAt  time.Time
}

func (g GatewayLine) IsOnline() bool { return g.Status == "online" }

type snapshot struct {
	Lines []GatewayLine

	MaintenanceMode    bool
	LoginEnabled       bool
	AnnouncementBanner string
	GlobalMaxPlayers   int

	ExpMultiplier       float64
	DropMultiplier      float64
	GoldMultiplier      float64
	ScheduleBossEnabled bool
	ScheduleBossTick    time.Duration
	FeaturesEnabled     map[string]bool

	AuditRetentionDays   int
	LoginLockoutAttempts int
	LoginLockoutWindow   time.Duration
}

func defaultSnapshot() snapshot {
	return snapshot{
		Lines:                nil,
		MaintenanceMode:      false,
		LoginEnabled:         true,
		AnnouncementBanner:   "",
		GlobalMaxPlayers:     0,
		ExpMultiplier:        1.0,
		DropMultiplier:       1.0,
		GoldMultiplier:       1.0,
		ScheduleBossEnabled:  true,
		ScheduleBossTick:     30 * time.Second,
		FeaturesEnabled:      map[string]bool{},
		AuditRetentionDays:   90,
		LoginLockoutAttempts: 5,
		LoginLockoutWindow:   15 * time.Minute,
	}
}

func decodeBool(raw json.RawMessage, fallback bool) bool {
	if len(raw) == 0 {
		return fallback
	}
	var v bool
	if err := json.Unmarshal(raw, &v); err != nil {
		return fallback
	}
	return v
}

func decodeString(raw json.RawMessage, fallback string) string {
	if len(raw) == 0 {
		return fallback
	}
	var v string
	if err := json.Unmarshal(raw, &v); err != nil {
		return fallback
	}
	return v
}

func decodeFloat(raw json.RawMessage, fallback float64) float64 {
	if len(raw) == 0 {
		return fallback
	}
	var v float64
	if err := json.Unmarshal(raw, &v); err != nil {
		return fallback
	}
	return v
}

func decodeInt(raw json.RawMessage, fallback int) int {
	if len(raw) == 0 {
		return fallback
	}
	var v float64
	if err := json.Unmarshal(raw, &v); err != nil {
		return fallback
	}
	return int(v)
}

const (
	TableGateway        = "gateway_config"
	TableServerSettings = "server_settings"
	TableGameTuning     = "game_tuning"
	TableGMSettings     = "gm_settings"
	NotifyChannel       = "config_change"
)
