// Open-sourced by BaoLT

// Scene manager for multiplayer room tracking with channel isolation.
// Each channel (line) is isolated - players on different channels cannot see each other.
// Each map within a channel is a room. Thread-safe with RWMutex for concurrent access.
package rtmp

import (
	"sync"

	"go.uber.org/zap"
)

type SceneManager struct {
	mu       sync.RWMutex
	channels map[int]map[int]map[uint32]*Connection
	logger   *zap.Logger
}

func NewSceneManager() *SceneManager {
	return &SceneManager{
		channels: make(map[int]map[int]map[uint32]*Connection),
		logger:   zap.NewNop(),
	}
}

func (sm *SceneManager) SetLogger(logger *zap.Logger) {
	sm.logger = logger
}

func (sm *SceneManager) AddToScene(channelID, mapID int, conn *Connection) {
	sm.mu.Lock()
	defer sm.mu.Unlock()

	if sm.channels[channelID] == nil {
		sm.channels[channelID] = make(map[int]map[uint32]*Connection)
	}
	if sm.channels[channelID][mapID] == nil {
		sm.channels[channelID][mapID] = make(map[uint32]*Connection)
	}
	sm.channels[channelID][mapID][conn.ID] = conn

	sm.logger.Info("Player joined room",
		zap.Int("channel_id", channelID),
		zap.Int("room_id", mapID),
		zap.Uint32("conn_id", conn.ID),
		zap.Int("room_size", len(sm.channels[channelID][mapID])))
}

func (sm *SceneManager) RemoveFromScene(channelID, mapID int, connID uint32) {
	sm.mu.Lock()
	defer sm.mu.Unlock()

	wasSize := 0
	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[mapID]; ok {
			wasSize = len(room)
			delete(room, connID)
			if len(room) == 0 {
				delete(channel, mapID)
			}
			if len(channel) == 0 {
				delete(sm.channels, channelID)
			}
		}
	}

	nowSize := 0
	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[mapID]; ok {
			nowSize = len(room)
		}
	}

	sm.logger.Info("Player left room",
		zap.Int("channel_id", channelID),
		zap.Int("room_id", mapID),
		zap.Uint32("conn_id", connID),
		zap.Int("room_was", wasSize),
		zap.Int("room_now", nowSize))
}

func (sm *SceneManager) MoveToScene(channelID, oldMapID, newMapID int, conn *Connection) {
	sm.mu.Lock()
	defer sm.mu.Unlock()

	oldRoomSize := 0
	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[oldMapID]; ok {
			oldRoomSize = len(room)
		}
	}

	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[oldMapID]; ok {
			delete(room, conn.ID)
			if len(room) == 0 {
				delete(channel, oldMapID)
			}
		}
	}

	if sm.channels[channelID] == nil {
		sm.channels[channelID] = make(map[int]map[uint32]*Connection)
	}
	if sm.channels[channelID][newMapID] == nil {
		sm.channels[channelID][newMapID] = make(map[uint32]*Connection)
	}
	sm.channels[channelID][newMapID][conn.ID] = conn

	newRoomSize := len(sm.channels[channelID][newMapID])
	remainingInOld := 0
	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[oldMapID]; ok {
			remainingInOld = len(room)
		}
	}

	sm.logger.Info("Player moved between rooms",
		zap.Uint32("conn_id", conn.ID),
		zap.Int("channel_id", channelID),
		zap.Int("old_room_id", oldMapID),
		zap.Int("new_room_id", newMapID),
		zap.Int("old_room_was", oldRoomSize),
		zap.Int("old_room_now", remainingInOld),
		zap.Int("new_room_size", newRoomSize))
}

func (sm *SceneManager) GetSceneConnections(channelID, mapID int, excludeConnID uint32) []*Connection {
	sm.mu.RLock()
	defer sm.mu.RUnlock()

	var room map[uint32]*Connection
	if channel, ok := sm.channels[channelID]; ok {
		room = channel[mapID]
	}

	if room == nil {
		return nil
	}

	result := make([]*Connection, 0, len(room))
	for connID, conn := range room {
		if excludeConnID == 0 || connID != excludeConnID {
			result = append(result, conn)
		}
	}
	return result
}

func (sm *SceneManager) BroadcastToScene(channelID, mapID int, excludeConnID uint32, callback string, args ...any) {
	conns := sm.GetSceneConnections(channelID, mapID, excludeConnID)


	for _, conn := range conns {
		if err := conn.SendCallback(callback, args...); err != nil {
			sm.logger.Error("Failed to send callback",
				zap.Uint32("conn_id", conn.ID),
				zap.String("callback", callback),
				zap.Error(err))
		}
	}
}

func (sm *SceneManager) GetScenePlayerCount(channelID, mapID int) int {
	sm.mu.RLock()
	defer sm.mu.RUnlock()

	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[mapID]; ok {
			return len(room)
		}
	}
	return 0
}

func (sm *SceneManager) GetConnectionRoom(channelID int, connID uint32) int {
	sm.mu.RLock()
	defer sm.mu.RUnlock()

	if channel, ok := sm.channels[channelID]; ok {
		for mapID, room := range channel {
			if _, exists := room[connID]; exists {
				return mapID
			}
		}
	}
	return 0
}

func (sm *SceneManager) IsConnectionInRoom(channelID, mapID int, connID uint32) bool {
	sm.mu.RLock()
	defer sm.mu.RUnlock()

	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[mapID]; ok {
			_, exists := room[connID]
			return exists
		}
	}
	return false
}

// GetSceneCharacterIDs returns a set of character IDs currently in the specified channel+room.
// This is used to filter database queries to only include players in the same channel.
func (sm *SceneManager) GetSceneCharacterIDs(channelID, mapID int) map[int64]struct{} {
	sm.mu.RLock()
	defer sm.mu.RUnlock()

	result := make(map[int64]struct{})
	if channel, ok := sm.channels[channelID]; ok {
		if room, ok := channel[mapID]; ok {
			for _, conn := range room {
				if charID := conn.GetCharacterID(); charID > 0 {
					result[charID] = struct{}{}
				}
			}
		}
	}
	return result
}
