// Open-sourced by BaoLT

// DB-backed line list provider sourced from the runtime config store.
// Live client counts come from the RTMP connection tracker.
package rtmp

import (
	"context"

	"mcgame-server/internal/infrastructure/config/store"
)

type ConnectionTracker interface {
	GetChannelConnectionCount(channelID int) int
}

type DBLineProvider struct {
	store       *store.Store
	connTracker ConnectionTracker
}

func NewDBLineProvider(s *store.Store, connTracker ConnectionTracker) *DBLineProvider {
	return &DBLineProvider{store: s, connTracker: connTracker}
}

func (p *DBLineProvider) GetLineList(ctx context.Context) ([]map[string]interface{}, error) {
	lines := p.store.GatewayLines()
	out := make([]map[string]interface{}, 0, len(lines))
	for _, line := range lines {
		clients := 0
		if p.connTracker != nil {
			clients = p.connTracker.GetChannelConnectionCount(line.ID)
		}

		out = append(out, map[string]interface{}{
			"id":      line.ID,
			"name":    line.Name,
			"url":     line.URL,
			"clients": clients,
			"max":     line.MaxClients,
			"status":  statusCodeFor(line.Status),
			"auction": line.Auction,
			"guild":   line.Guild,
		})
	}
	return out, nil
}

func statusCodeFor(status string) int {
	switch status {
	case "offline", "maintenance":
		return 20
	default:
		return 10
	}
}
