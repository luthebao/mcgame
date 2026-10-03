// Open-sourced by BaoLT

// Admin relationship actions read and mutate a character's social graph (friends + blocks) via RelationshipStore.
// get_relationships lists all rows; set_relationship creates (typed friend or block) or updates an existing row by relationshipId;
// delete_relationship removes a row by id. Writes are database_only: online players observe changes after relog.
// Type enum: 0 Friend, 1 Black, 2 Enemy, 3 Couple, 4 Tutor, 5 Brother.
package adminhttp

import (
	"context"
	"encoding/json"
	"errors"
	"net/http"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/social"
	pkgerrors "mcgame-server/pkg/errors"
)

type relationshipView struct {
	ID        int64  `json:"id"`
	OtherID   int64  `json:"otherId"`
	OtherName string `json:"otherName"`
	Type      int    `json:"type"`
	GroupID   int    `json:"groupId"`
	Nickname  string `json:"nickname"`
	Intimacy  int    `json:"intimacy"`
	CreatedAt string `json:"createdAt"`
}

type setRelationshipPayload struct {
	RelationshipID int64   `json:"relationshipId"`
	OtherID        int64   `json:"otherId"`
	OtherName      string  `json:"otherName"`
	Type           *int    `json:"type"`
	GroupID        *int    `json:"groupId"`
	Nickname       *string `json:"nickname"`
	Intimacy       *int    `json:"intimacy"`
	Mirror         bool    `json:"mirror"`
}

type deleteRelationshipPayload struct {
	RelationshipID int64 `json:"relationshipId"`
}

func relationshipTypeValid(t int) bool {
	return t >= social.RelationshipTypeFriend && t <= social.RelationshipTypeBrother
}

func (s *Server) executeGetRelationships(w http.ResponseWriter, ctx context.Context, char *character.Character) {
	if !s.storeReady(w, s.relationshipStore != nil, "relationship store") {
		return
	}

	rels, err := s.relationshipStore.ListByCharacterAll(ctx, char.ID)
	if err != nil {
		s.logger.Error("admin get_relationships: failed to list relationships",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to load relationships"})
		return
	}

	views := make([]relationshipView, 0, len(rels))
	for _, rel := range rels {
		if rel == nil {
			continue
		}
		views = append(views, toRelationshipView(rel))
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:       true,
		Action:   "get_relationships",
		TargetID: char.ID,
		Data: map[string]interface{}{
			"relationships": views,
		},
	})
}

func (s *Server) executeSetRelationship(w http.ResponseWriter, ctx context.Context, char *character.Character, raw json.RawMessage) {
	if !s.storeReady(w, s.relationshipStore != nil, "relationship store") {
		return
	}

	var payload setRelationshipPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_relationship payload"})
		return
	}

	if payload.RelationshipID > 0 {
		s.updateRelationship(w, ctx, char, payload)
		return
	}

	s.createRelationship(w, ctx, char, payload)
}

func (s *Server) updateRelationship(w http.ResponseWriter, ctx context.Context, char *character.Character, payload setRelationshipPayload) {
	applied := false

	if payload.Type != nil {
		if !relationshipTypeValid(*payload.Type) {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "type must be between 0 and 5"})
			return
		}
		if *payload.Type == social.RelationshipTypeBlack {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "cannot change type to blacklist; delete this relationship and create a block instead"})
			return
		}
		if err := s.relationshipStore.ChangeType(ctx, payload.RelationshipID, *payload.Type); err != nil {
			s.writeRelationshipUpdateError(w, char, payload.RelationshipID, "change type", err)
			return
		}
		applied = true
	}
	if payload.Intimacy != nil {
		if err := s.relationshipStore.UpdateIntimacy(ctx, payload.RelationshipID, *payload.Intimacy); err != nil {
			s.writeRelationshipUpdateError(w, char, payload.RelationshipID, "update intimacy", err)
			return
		}
		applied = true
	}
	if payload.Nickname != nil {
		if err := s.relationshipStore.UpdateNickname(ctx, payload.RelationshipID, *payload.Nickname); err != nil {
			s.writeRelationshipUpdateError(w, char, payload.RelationshipID, "update nickname", err)
			return
		}
		applied = true
	}
	if payload.GroupID != nil {
		if err := s.relationshipStore.UpdateGroup(ctx, payload.RelationshipID, *payload.GroupID); err != nil {
			s.writeRelationshipUpdateError(w, char, payload.RelationshipID, "update group", err)
			return
		}
		applied = true
	}

	if !applied {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no relationship fields provided"})
		return
	}

	s.writeRelationshipResponse(w, "set_relationship", char.ID, map[string]interface{}{
		"created": false,
		"relationship": map[string]interface{}{
			"id": payload.RelationshipID,
		},
	})
}

func (s *Server) createRelationship(w http.ResponseWriter, ctx context.Context, char *character.Character, payload setRelationshipPayload) {
	if payload.Type == nil || !relationshipTypeValid(*payload.Type) {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "type must be between 0 and 5"})
		return
	}
	relType := *payload.Type

	otherID, otherName, ok := s.resolveOther(w, ctx, payload)
	if !ok {
		return
	}
	if otherID == char.ID {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "otherId must differ from the target character"})
		return
	}

	rel := &social.Relationship{
		CharacterID: char.ID,
		OtherID:     otherID,
		OtherName:   otherName,
		Type:        relType,
	}
	if payload.GroupID != nil {
		rel.GroupID = *payload.GroupID
	}
	if payload.Nickname != nil {
		rel.Nickname = *payload.Nickname
	}
	if payload.Intimacy != nil {
		rel.Intimacy = *payload.Intimacy
	}

	if relType == social.RelationshipTypeBlack {
		if err := s.relationshipStore.Create(ctx, rel); err != nil {
			s.writeRelationshipCreateError(w, char, err)
			return
		}
	} else {
		if err := s.relationshipStore.CreateTyped(ctx, rel); err != nil {
			s.writeRelationshipCreateError(w, char, err)
			return
		}
		if payload.Mirror {
			mirror := &social.Relationship{
				CharacterID: otherID,
				OtherID:     char.ID,
				OtherName:   char.Name,
				Type:        relType,
				GroupID:     rel.GroupID,
				Nickname:    rel.Nickname,
				Intimacy:    rel.Intimacy,
			}
			if err := s.relationshipStore.CreateTyped(ctx, mirror); err != nil {
				s.logger.Warn("admin set_relationship: failed to create mirror relationship",
					zap.Int64("character_id", char.ID),
					zap.Int64("other_id", otherID),
					zap.Error(err))
			}
		}
	}

	s.writeRelationshipResponse(w, "set_relationship", char.ID, map[string]interface{}{
		"created": true,
		"relationship": map[string]interface{}{
			"id":        rel.ID,
			"otherId":   rel.OtherID,
			"otherName": rel.OtherName,
			"type":      rel.Type,
		},
	})
}

func (s *Server) resolveOther(w http.ResponseWriter, ctx context.Context, payload setRelationshipPayload) (int64, string, bool) {
	if payload.OtherID > 0 {
		return payload.OtherID, payload.OtherName, true
	}
	if payload.OtherName == "" {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "otherId or otherName is required"})
		return 0, "", false
	}

	id, exactName, err := s.relationshipStore.GetCharacterIDByName(ctx, payload.OtherName)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrCharacterNotFound) {
			s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "target character not found"})
			return 0, "", false
		}
		s.logger.Error("admin set_relationship: failed to resolve character by name",
			zap.String("other_name", payload.OtherName),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to resolve target character"})
		return 0, "", false
	}
	return id, exactName, true
}

func (s *Server) executeDeleteRelationship(w http.ResponseWriter, ctx context.Context, char *character.Character, raw json.RawMessage) {
	if !s.storeReady(w, s.relationshipStore != nil, "relationship store") {
		return
	}

	var payload deleteRelationshipPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid delete_relationship payload"})
		return
	}
	if payload.RelationshipID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "relationshipId must be greater than 0"})
		return
	}

	if err := s.relationshipStore.DeleteByIDAny(ctx, payload.RelationshipID); err != nil {
		if errors.Is(err, pkgerrors.ErrNotFound) {
			s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "relationship not found"})
			return
		}
		s.logger.Error("admin delete_relationship: failed to delete relationship",
			zap.Int64("character_id", char.ID),
			zap.Int64("relationship_id", payload.RelationshipID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to delete relationship"})
		return
	}

	s.writeRelationshipResponse(w, "delete_relationship", char.ID, map[string]interface{}{
		"relationshipId": payload.RelationshipID,
	})
}

func (s *Server) writeRelationshipResponse(w http.ResponseWriter, action string, charID int64, data map[string]interface{}) {
	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        action,
		TargetID:      charID,
		DeliveryMode:  "database_only",
		StatusMessage: "Relationship change written to database. Online players see changes on relog.",
		Data:          data,
	})
}

func (s *Server) writeRelationshipUpdateError(w http.ResponseWriter, char *character.Character, relationshipID int64, op string, err error) {
	if errors.Is(err, pkgerrors.ErrNotFound) {
		s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "relationship not found"})
		return
	}
	s.logger.Error("admin set_relationship: failed to "+op,
		zap.Int64("character_id", char.ID),
		zap.Int64("relationship_id", relationshipID),
		zap.Error(err))
	s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to " + op})
}

func (s *Server) writeRelationshipCreateError(w http.ResponseWriter, char *character.Character, err error) {
	s.logger.Error("admin set_relationship: failed to create relationship",
		zap.Int64("character_id", char.ID),
		zap.Error(err))
	s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to create relationship"})
}

func toRelationshipView(rel *social.Relationship) relationshipView {
	view := relationshipView{
		ID:        rel.ID,
		OtherID:   rel.OtherID,
		OtherName: rel.OtherName,
		Type:      rel.Type,
		GroupID:   rel.GroupID,
		Nickname:  rel.Nickname,
		Intimacy:  rel.Intimacy,
	}
	if !rel.CreatedAt.IsZero() {
		view.CreatedAt = rel.CreatedAt.UTC().Format("2006-01-02T15:04:05Z07:00")
	}
	return view
}
