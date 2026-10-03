// Open-sourced by BaoLT

// Admin inventory actions: remove_item, update_item.
package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"
	"time"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
)

type removeItemPayload struct {
	InstanceID int64 `json:"instanceId"`
	Count      int   `json:"count,omitempty"`
}

type updateItemPayload struct {
	InstanceID    int64                  `json:"instanceId"`
	StackCount    *int                   `json:"stackCount,omitempty"`
	IsBound       *bool                  `json:"isBound,omitempty"`
	ColorCode     *int                   `json:"colorCode,omitempty"`
	EnchantLevel  *int                   `json:"enchantLevel,omitempty"`
	StarLevel     *int                   `json:"starLevel,omitempty"`
	Durability    *int                   `json:"durability,omitempty"`
	MaxDurability *int                   `json:"maxDurability,omitempty"`
	PreNameType   *int                   `json:"preNameType,omitempty"`
	Properties    map[string]interface{} `json:"properties,omitempty"`
	ReplaceProperties bool               `json:"replaceProperties,omitempty"`
}

func (s *Server) executeRemoveItem(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload removeItemPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid remove_item payload"})
		return
	}
	if payload.InstanceID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "instanceId must be greater than 0"})
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	targetItem, err := s.itemFinder.FindByID(ctx, payload.InstanceID)
	if err != nil {
		s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "item not found"})
		return
	}
	if targetItem.CharacterID != char.ID {
		s.writeJSON(w, http.StatusForbidden, adminErrorResponse{OK: false, Message: "item does not belong to this character"})
		return
	}

	removeCount := payload.Count
	if removeCount <= 0 || removeCount >= targetItem.StackCount {
		if err := s.itemProvider.Delete(ctx, payload.InstanceID); err != nil {
			s.logger.Error("admin remove_item: failed to delete item",
				zap.Int64("item_id", payload.InstanceID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to remove item"})
			return
		}
		removeCount = targetItem.StackCount
	} else {
		targetItem.StackCount -= removeCount
		if err := s.itemProvider.UpdateStack(ctx, targetItem.ID, targetItem.StackCount); err != nil {
			s.logger.Error("admin remove_item: failed to update stack",
				zap.Int64("item_id", payload.InstanceID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update item stack"})
			return
		}
	}

	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := "Item removed from database. Player is offline."
	if conn != nil {
		sid := targetItem.CalculateSID()
		if err := conn.SendCallback("onDelCharactorSlot", float64(targetItem.ID), float64(sid)); err != nil {
			s.logger.Warn("admin remove_item: failed to push onDelCharactorSlot",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		} else {
			deliveryMode = "live_session"
			statusMessage = "Item removed and client notified."
		}
	}

	s.saveAndFlush(char.ID)

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "remove_item",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"instanceId":   payload.InstanceID,
			"removedCount": removeCount,
		},
	})
}

func (s *Server) executeUpdateItem(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload updateItemPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid update_item payload"})
		return
	}
	if payload.InstanceID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "instanceId must be greater than 0"})
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	targetItem, err := s.itemFinder.FindByID(ctx, payload.InstanceID)
	if err != nil {
		s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "item not found"})
		return
	}
	if targetItem.CharacterID != char.ID {
		s.writeJSON(w, http.StatusForbidden, adminErrorResponse{OK: false, Message: "item does not belong to this character"})
		return
	}

	changes := map[string]interface{}{}
	if payload.StackCount != nil {
		targetItem.StackCount = *payload.StackCount
		changes["stackCount"] = *payload.StackCount
	}
	if payload.IsBound != nil {
		targetItem.IsBound = *payload.IsBound
		changes["isBound"] = *payload.IsBound
	}
	if payload.ColorCode != nil {
		targetItem.ColorCode = *payload.ColorCode
		changes["colorCode"] = *payload.ColorCode
	}
	if payload.EnchantLevel != nil {
		targetItem.EnchantLevel = *payload.EnchantLevel
		changes["enchantLevel"] = *payload.EnchantLevel
	}
	if payload.StarLevel != nil {
		targetItem.StarLevel = *payload.StarLevel
		changes["starLevel"] = *payload.StarLevel
	}
	if payload.Durability != nil {
		targetItem.Durability = payload.Durability
		changes["durability"] = *payload.Durability
	}
	if payload.MaxDurability != nil {
		targetItem.MaxDurability = payload.MaxDurability
		changes["maxDurability"] = *payload.MaxDurability
	}
	if payload.PreNameType != nil {
		if targetItem.Properties == nil {
			targetItem.Properties = make(map[string]interface{})
		}
		normalized := *payload.PreNameType
		if normalized < 0 {
			normalized = 0
		}
		if normalized > 5 {
			normalized = 5
		}
		targetItem.Properties["preNameType"] = normalized
		changes["preNameType"] = normalized
	}
	if payload.Properties != nil {
		if payload.ReplaceProperties {
			targetItem.Properties = payload.Properties
		} else {
			if targetItem.Properties == nil {
				targetItem.Properties = make(map[string]interface{})
			}
			for k, v := range payload.Properties {
				if v == nil {
					delete(targetItem.Properties, k)
				} else {
					targetItem.Properties[k] = v
				}
			}
		}
		changes["properties"] = payload.Properties
	}

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no fields to update"})
		return
	}

	if err := s.itemProvider.Update(ctx, targetItem); err != nil {
		s.logger.Error("admin update_item: failed to update item",
			zap.Int64("item_id", payload.InstanceID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update item"})
		return
	}

	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := "Item updated in database. Player is offline."
	if conn != nil {
		if err := conn.SendCallback("onAddCharactorSlot", targetItem.ToDTO()); err != nil {
			s.logger.Warn("admin update_item: failed to push onAddCharactorSlot",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		} else {
			deliveryMode = "live_session"
			statusMessage = "Item updated and client notified."
		}
	}

	s.saveAndFlush(char.ID)

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "update_item",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"instanceId": payload.InstanceID,
			"changes":    changes,
		},
	})
}
