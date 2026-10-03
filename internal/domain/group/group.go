// Open-sourced by BaoLT

package group

import "time"

type Application struct {
	CharacterID int64
	CreatedAt   time.Time
}

type Member struct {
	CharID   int64
	Name     string
	IsLeader bool
	AFK      bool
}

type Group struct {
	ID           int64
	LeaderID     int64
	MapID        int
	Members      []Member
	RoomOpen     bool
	RoomFID      int
	RoomType     int
	MinLevel     int
	MaxLevel     int
	ScheduledAt  time.Time
	Applications []Application
	CreatedAt    time.Time
	UpdatedAt    time.Time
}

func (g *Group) ToDTO() map[string]interface{} {
	members := make([]map[string]interface{}, 0, len(g.Members))
	for _, m := range g.Members {
		members = append(members, map[string]interface{}{
			"cid":      m.CharID,
			"name":     m.Name,
			"isLeader": m.IsLeader,
			"afk":      m.AFK,
		})
	}
	dto := map[string]interface{}{
		"id":       g.ID,
		"leaderId": g.LeaderID,
		"mapId":    g.MapID,
		"members":  members,
	}
	if g.RoomOpen {
		dto["roomOpen"] = true
		dto["roomFid"] = g.RoomFID
		dto["roomType"] = g.RoomType
		dto["minLevel"] = g.MinLevel
		dto["maxLevel"] = g.MaxLevel
		if !g.ScheduledAt.IsZero() {
			dto["scheduledAt"] = g.ScheduledAt.UnixMilli()
		}
		applications := make([]map[string]interface{}, 0, len(g.Applications))
		for _, app := range g.Applications {
			applications = append(applications, map[string]interface{}{
				"cid":       app.CharacterID,
				"createdAt": app.CreatedAt.UnixMilli(),
			})
		}
		dto["applications"] = applications
	}
	return dto
}
