// Open-sourced by BaoLT

// Unified admin player action endpoint handles all GM management operations.
// Uses action + typed payload pattern for extensibility and validation.
// Delivers realtime updates to online players via RTMP callbacks.
// Executor implementations are split by domain across sibling files:
//
//	player_action_ops.go        - kick, transport, set_gm_level, player_detail
//	player_action_character.go  - set_attributes, set_progression, set_combat_stats, set_life_skills
//	player_action_economy.go    - set_currency, set_resources
//	player_action_inventory.go  - remove_item, update_item
package adminhttp

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"strconv"
	"time"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

type adminPlayerActionRequest struct {
	Action   string          `json:"action"`
	TargetID int64           `json:"targetId"`
	Payload  json.RawMessage `json:"payload"`
}

type adminActionResponse struct {
	OK            bool        `json:"ok"`
	Action        string      `json:"action"`
	TargetID      int64       `json:"targetId"`
	DeliveryMode  string      `json:"deliveryMode,omitempty"`
	StatusMessage string      `json:"statusMessage,omitempty"`
	Data          interface{} `json:"data,omitempty"`
}

var validActions = map[string]bool{
	"kick":                true,
	"transport":           true,
	"set_currency":        true,
	"set_attributes":      true,
	"advance_progression": true,
	"set_progression":     true,
	"set_combat_stats":    true,
	"set_resources":       true,
	"set_dress_panel":     true,
	"set_life_skills":     true,
	"set_gm_level":        true,
	"remove_item":         true,
	"update_item":         true,
	"get_inventory":       true,
	"get_pets":            true,
	"update_pet":          true,
	"delete_pet":          true,
	"player_detail":       true,
	"get_feature_states":  true,
	"set_feature_state":   true,
	"get_relationships":   true,
	"set_relationship":    true,
	"delete_relationship": true,
}

func (s *Server) handlePlayerAction(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
		return
	}

	var req adminPlayerActionRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: "invalid JSON body",
		})
		return
	}

	if req.TargetID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: "targetId must be greater than 0",
		})
		return
	}

	if !validActions[req.Action] {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: fmt.Sprintf("unknown action: %s", req.Action),
		})
		return
	}

	ctx := r.Context()

	charData, err := s.characterProvider.FindByID(ctx, req.TargetID)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrCharacterNotFound) {
			s.writeJSON(w, http.StatusNotFound, adminErrorResponse{
				OK:      false,
				Message: "character not found",
			})
			return
		}
		s.logger.Error("admin action: failed to load character",
			zap.Int64("target_id", req.TargetID),
			zap.String("action", req.Action),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
			OK:      false,
			Message: "failed to load character",
		})
		return
	}

	switch req.Action {
	case "kick":
		s.executeKick(w, ctx, charData)
	case "transport":
		s.executeTransport(w, ctx, charData, req.Payload)
	case "set_currency":
		s.executeSetCurrency(w, ctx, charData, req.Payload)
	case "set_attributes":
		s.executeSetAttributes(w, ctx, charData, req.Payload)
	case "advance_progression":
		s.executeAdvanceProgression(w, ctx, charData, req.Payload)
	case "set_progression":
		s.executeSetProgression(w, ctx, charData, req.Payload)
	case "set_combat_stats":
		s.executeSetCombatStats(w, ctx, charData, req.Payload)
	case "set_resources":
		s.executeSetResources(w, ctx, charData, req.Payload)
	case "set_dress_panel":
		s.executeSetDressPanel(w, ctx, charData, req.Payload)
	case "set_life_skills":
		s.executeSetLifeSkills(w, ctx, charData, req.Payload)
	case "set_gm_level":
		s.executeSetGMLevel(w, ctx, charData, req.Payload)
	case "remove_item":
		s.executeRemoveItem(w, ctx, charData, req.Payload)
	case "update_item":
		s.executeUpdateItem(w, ctx, charData, req.Payload)
	case "get_inventory":
		s.executeGetInventory(w, ctx, charData)
	case "get_pets":
		s.executeGetPets(w, ctx, charData)
	case "update_pet":
		s.executeUpdatePet(w, ctx, charData, req.Payload)
	case "delete_pet":
		s.executeDeletePet(w, ctx, charData, req.Payload)
	case "player_detail":
		s.executePlayerDetail(w, ctx, charData)
	case "get_feature_states":
		s.executeGetFeatureStates(w, ctx, charData)
	case "set_feature_state":
		s.executeSetFeatureState(w, ctx, charData, req.Payload)
	case "get_relationships":
		s.executeGetRelationships(w, ctx, charData)
	case "set_relationship":
		s.executeSetRelationship(w, ctx, charData, req.Payload)
	case "delete_relationship":
		s.executeDeleteRelationship(w, ctx, charData, req.Payload)
	}
}

func (s *Server) getConnection(charID int64) *rtmp.Connection {
	if s.sessionProvider == nil {
		s.logger.Warn("admin getConnection: sessionProvider is nil", zap.Int64("character_id", charID))
		return nil
	}
	charIDStr := strconv.FormatInt(charID, 10)
	return s.sessionProvider.GetConnectionByCharacterID(charIDStr)
}

func (s *Server) pushUPPToConnection(conn *rtmp.Connection, char *character.Character) {
	if conn == nil || char == nil {
		return
	}
	payload := character.BuildUPPPayload(char)
	if err := conn.SendCallback("onUPP", payload); err != nil {
		s.logger.Warn("admin action: failed to push onUPP",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
	}
}

func (s *Server) saveAndFlush(charID int64) {
	if s.playerDataSaver == nil {
		return
	}
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := s.playerDataSaver.SavePlayer(ctx, charID); err != nil {
		s.logger.Warn("admin action: failed to flush player cache",
			zap.Int64("character_id", charID),
			zap.Error(err))
	}
}

func (s *Server) applyCharacterChange(
	w http.ResponseWriter,
	action string,
	char *character.Character,
	applyFn func(*character.Character),
	pushUPP bool,
	data interface{},
) {
	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := fmt.Sprintf("%s updated in database. Player is offline.", action)

	if conn != nil && s.characterCacheUpdater != nil {
		updated := s.characterCacheUpdater.UpdateCachedCharacter(char.ID, applyFn)
		if pushUPP {
			s.pushUPPToConnection(conn, updated)
		}
		deliveryMode = "live_session"
		statusMessage = fmt.Sprintf("%s updated and client notified.", action)
	} else {
		applyFn(char)

		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer cancel()

		if err := s.characterUpdater.Update(ctx, char); err != nil {
			s.logger.Error("admin action: failed to update character",
				zap.Int64("character_id", char.ID),
				zap.String("action", action),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
				OK:      false,
				Message: fmt.Sprintf("failed to update %s", action),
			})
			return
		}
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        action,
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data:          data,
	})
}
