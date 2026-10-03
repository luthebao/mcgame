// Open-sourced by BaoLT

// Admin operational actions: kick, transport, set_gm_level, player_detail.
package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"
	"time"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
)

type transportPayload struct {
	MapID int `json:"mapId"`
	X     int `json:"x"`
	Y     int `json:"y"`
}

type setGMLevelPayload struct {
	GMLevel int `json:"gmLevel"`
}

type adminPlayerDetailData struct {
	Character map[string]interface{} `json:"character"`
	Online    bool                   `json:"online"`
	Session   *adminPlayerSession    `json:"session,omitempty"`
}

func enrichAdminDTO(dto map[string]interface{}, c *character.Character) {
	dto["baseAttack"] = c.Attack
	dto["baseDefense"] = c.Defense
	dto["baseMagicAttack"] = c.MagicAttack
	dto["baseMagicDefense"] = c.MagicDefense
	dto["baseCriticalDmg"] = c.CriticalDmg
	dto["rebirthLvl"] = c.RebirthLvl
	dto["rebirthExp"] = c.RebirthExp
	dto["awakenLevel"] = c.AwakenLevel
	dto["awakenPoints"] = c.AwakenPoints
	dto["awakenPointsUsed"] = c.AwakenPointsUsed
	dto["soulLevel"] = c.SoulLevel
	dto["soulExp"] = c.SoulExp
	dto["soulPoints"] = c.SoulPoints
	dto["experience"] = c.Experience
	dto["bagSlotsBase"] = c.MaxBagSlots()
	dto["bankSlotsBase"] = c.MaxBankSlots()
	dto["petSlots"] = maxPetSlots(c)
	enrichAdminDressDTO(dto, c.DressInfo)
}

type adminPlayerSession struct {
	MapID       int    `json:"mapId"`
	ChannelID   int    `json:"channelId"`
	PositionX   int    `json:"positionX"`
	PositionY   int    `json:"positionY"`
	ConnectedAt string `json:"connectedAt,omitempty"`
}

func (s *Server) executeKick(w http.ResponseWriter, _ context.Context, char *character.Character) {
	conn := s.getConnection(char.ID)
	if conn == nil {
		s.writeJSON(w, http.StatusConflict, adminActionResponse{
			OK:            false,
			Action:        "kick",
			TargetID:      char.ID,
			StatusMessage: "player is not online",
		})
		return
	}

	if err := conn.SendCallbackSync("onRedMsg", "Bạn đã bị kick khỏi server bởi GM."); err != nil {
		s.logger.Warn("admin kick: failed to send onRedMsg",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
	}
	if err := conn.SendCallbackSync("onKickChar", int64(2)); err != nil {
		s.logger.Warn("admin kick: failed to send onKickChar",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
	}
	closedStatus := map[string]interface{}{
		"level":       "status",
		"code":        "NetConnection.Connect.Closed",
		"description": "kicked by GM",
		"application": "",
	}
	if err := conn.SendCallbackSync("onStatus", closedStatus); err != nil {
		s.logger.Warn("admin kick: failed to send onStatus Closed",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
	}

	go func() {
		time.Sleep(1 * time.Second)
		conn.Close()
	}()

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "kick",
		TargetID:      char.ID,
		DeliveryMode:  "live_session",
		StatusMessage: "player kicked and connection closed",
	})
}

func (s *Server) executeTransport(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload transportPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid transport payload"})
		return
	}
	if payload.MapID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "mapId must be greater than 0"})
		return
	}

	deliveryMode := "database_only"
	statusMessage := "Position updated in database. Player is offline."

	if s.playerTransporter != nil && s.playerTransporter.TransportPlayer(char.ID, payload.MapID, payload.X, payload.Y) {
		if s.characterCacheUpdater != nil {
			s.characterCacheUpdater.UpdateCachedCharacter(char.ID, func(c *character.Character) {
				c.MapID = payload.MapID
				c.PosX = payload.X
				c.PosY = payload.Y
			})
		}
		deliveryMode = "live_session"
		statusMessage = "Player transported and client notified."
	} else {
		char.MapID = payload.MapID
		char.PosX = payload.X
		char.PosY = payload.Y

		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer cancel()

		if err := s.characterUpdater.Update(ctx, char); err != nil {
			s.logger.Error("admin transport: failed to update character",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update position"})
			return
		}
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "transport",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"mapId": payload.MapID,
			"x":     payload.X,
			"y":     payload.Y,
		},
	})
}

func (s *Server) executeSetGMLevel(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setGMLevelPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_gm_level payload"})
		return
	}
	if payload.GMLevel < 0 || payload.GMLevel > 10 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "gmLevel must be between 0 and 10"})
		return
	}

	oldLevel := char.GMLevel

	s.applyCharacterChange(
		w,
		"set_gm_level",
		char,
		func(c *character.Character) { c.GMLevel = payload.GMLevel },
		true,
		map[string]interface{}{
			"oldLevel": oldLevel,
			"newLevel": payload.GMLevel,
		},
	)
}

func (s *Server) executePlayerDetail(w http.ResponseWriter, _ context.Context, char *character.Character) {
	conn := s.getConnection(char.ID)
	dto := char.ToDTO()
	enrichAdminDTO(dto, char)
	data := adminPlayerDetailData{
		Character: dto,
		Online:    conn != nil,
	}

	if conn != nil {
		session := conn.GetSession()
		sessionData := &adminPlayerSession{
			ConnectedAt: session.ConnectedAt.UTC().Format(time.RFC3339),
		}
		if s.hotStateProvider != nil {
			if hotState := s.hotStateProvider.GetHotState(char.ID); hotState != nil {
				sessionData.PositionX = int(hotState.PosX)
				sessionData.PositionY = int(hotState.PosY)
				if hotState.MapID > 0 {
					sessionData.MapID = int(hotState.MapID)
				}
			}
		}
		sessionData.ChannelID = conn.GetChannelID()
		if sessionData.MapID == 0 {
			sessionData.MapID = char.MapID
		}
		data.Session = sessionData
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:       true,
		Action:   "player_detail",
		TargetID: char.ID,
		Data:     data,
	})
}
