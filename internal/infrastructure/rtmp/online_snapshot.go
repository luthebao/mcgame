// Open-sourced by BaoLT

// Online session snapshots expose the current RTMP in-memory player presence for admin tooling.
package rtmp

import "time"

type OnlineSessionSnapshot struct {
	ConnID         uint32
	SessionID      string
	AccountID      string
	Username       string
	CharacterID    string
	CharacterIDNum int64
	MapID          int
	ChannelID      int
	LastActive     time.Time
	ConnectedAt    time.Time
	AppName        string
}

func (s *Server) GetOnlineSessionSnapshots() []OnlineSessionSnapshot {
	snapshots := make([]OnlineSessionSnapshot, 0, s.ConnectionCount())

	s.sessions.Range(func(key, value interface{}) bool {
		conn, ok := value.(*Connection)
		if !ok {
			return true
		}

		session := conn.GetSession()
		if session == nil || session.CharacterID == "" {
			return true
		}

		mapID, charID := conn.GetSceneInfo()
		if mapID <= 0 || charID <= 0 {
			return true
		}

		snapshots = append(snapshots, OnlineSessionSnapshot{
			ConnID:         conn.ID,
			SessionID:      session.SessionID,
			AccountID:      session.AccountID,
			Username:       session.Username,
			CharacterID:    session.CharacterID,
			CharacterIDNum: charID,
			MapID:          mapID,
			ChannelID:      conn.GetChannelID(),
			LastActive:     conn.GetLastActive(),
			ConnectedAt:    session.ConnectedAt,
			AppName:        conn.GetAppName(),
		})

		return true
	})

	return snapshots
}
