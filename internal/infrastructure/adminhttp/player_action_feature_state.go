// Open-sourced by BaoLT

// Admin feature-state actions expose and override persisted character feature state via the StatFeatureRepository.
// get_feature_states reads allow-listed feature states; set_feature_state upserts a single allow-listed state.
// Value validation stays permissive (GM override): only the allow-list and JSON-object shape are enforced.
package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/statfeature"
)

var featureStateAllowList = map[string]bool{
	statfeature.FeatureMonsterHeart:    true,
	statfeature.FeatureRune:            true,
	statfeature.FeatureRuneChip:        true,
	statfeature.FeatureMagicArray:      true,
	statfeature.FeatureMysteryTreasure: true,
	statfeature.FeatureDecoHole:        true,
	statfeature.FeatureExplorerMedal:   true,
	statfeature.FeaturePetPVE:          true,
}

type setFeatureStatePayload struct {
	FeatureKey string          `json:"featureKey"`
	State      json.RawMessage `json:"state"`
}

type featureStateView struct {
	FeatureKey string                 `json:"featureKey"`
	State      map[string]interface{} `json:"state"`
}

func (s *Server) executeGetFeatureStates(w http.ResponseWriter, ctx context.Context, char *character.Character) {
	if !s.storeReady(w, s.statFeatureStore != nil, "stat feature store") {
		return
	}

	stored, err := s.statFeatureStore.ListCharacterFeatureStates(ctx, char.ID)
	if err != nil {
		s.logger.Error("admin get_feature_states: failed to list feature states",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to load feature states"})
		return
	}

	views := make([]featureStateView, 0, len(stored))
	for _, state := range stored {
		if state == nil || !featureStateAllowList[state.FeatureKey] {
			continue
		}
		views = append(views, featureStateView{
			FeatureKey: state.FeatureKey,
			State:      normalizeFeatureStateMap(state.State),
		})
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:       true,
		Action:   "get_feature_states",
		TargetID: char.ID,
		Data: map[string]interface{}{
			"states": views,
		},
	})
}

func (s *Server) executeSetFeatureState(w http.ResponseWriter, ctx context.Context, char *character.Character, raw json.RawMessage) {
	if !s.storeReady(w, s.statFeatureStore != nil, "stat feature store") {
		return
	}

	var payload setFeatureStatePayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_feature_state payload"})
		return
	}

	if !featureStateAllowList[payload.FeatureKey] {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "featureKey is not in the allow-list"})
		return
	}

	state := map[string]interface{}{}
	if err := json.Unmarshal(payload.State, &state); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "state must be a JSON object"})
		return
	}

	if err := s.statFeatureStore.UpsertCharacterFeatureState(ctx, &statfeature.CharacterFeatureState{
		CharacterID: char.ID,
		FeatureKey:  payload.FeatureKey,
		State:       state,
	}); err != nil {
		s.logger.Error("admin set_feature_state: failed to upsert feature state",
			zap.Int64("character_id", char.ID),
			zap.String("feature_key", payload.FeatureKey),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update feature state"})
		return
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "set_feature_state",
		TargetID:      char.ID,
		DeliveryMode:  "database_only",
		StatusMessage: "Feature state written to database. Online players see changes on next panel open / relog.",
		Data: map[string]interface{}{
			"featureKey": payload.FeatureKey,
			"state":      state,
		},
	})
}

func normalizeFeatureStateMap(state map[string]interface{}) map[string]interface{} {
	if state == nil {
		return map[string]interface{}{}
	}
	return state
}
