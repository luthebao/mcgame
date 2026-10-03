// Open-sourced by BaoLT

// Admin pet actions: get_pets, update_pet, delete_pet.
package adminhttp

import (
	"context"
	"encoding/json"
	"net/http"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
)

type updatePetPayload struct {
	PetID             int64   `json:"petId"`
	Name              *string `json:"name,omitempty"`
	Level             *int    `json:"level,omitempty"`
	Experience        *int64  `json:"experience,omitempty"`
	UpgradeNum        *int    `json:"upgradeNum,omitempty"`
	EvolutionLv       *int    `json:"evolutionLv,omitempty"`
	AptStrength       *int    `json:"aptStrength,omitempty"`
	AptAgility        *int    `json:"aptAgility,omitempty"`
	AptStamina        *int    `json:"aptStamina,omitempty"`
	AptIntelligence   *int    `json:"aptIntelligence,omitempty"`
	AptEnergy         *int    `json:"aptEnergy,omitempty"`
	AptStrengthEx     *int    `json:"aptStrengthEx,omitempty"`
	AptAgilityEx      *int    `json:"aptAgilityEx,omitempty"`
	AptStaminaEx      *int    `json:"aptStaminaEx,omitempty"`
	AptIntelligenceEx *int    `json:"aptIntelligenceEx,omitempty"`
	AptEnergyEx       *int    `json:"aptEnergyEx,omitempty"`
	Element           *int    `json:"element,omitempty"`
	IsFollowing       *bool   `json:"isFollowing,omitempty"`
	IsMounting        *bool   `json:"isMounting,omitempty"`
	IsBound           *bool   `json:"isBound,omitempty"`
}

type deletePetPayload struct {
	PetID int64 `json:"petId"`
}

func (s *Server) executeGetPets(w http.ResponseWriter, ctx context.Context, char *character.Character) {
	if s.petProvider == nil {
		s.writeJSON(w, http.StatusNotImplemented, adminErrorResponse{OK: false, Message: "pet provider not configured"})
		return
	}

	pets, err := s.petProvider.FindByCharacterID(ctx, char.ID)
	if err != nil {
		s.logger.Error("admin get_pets: failed to load pets",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to load pets"})
		return
	}

	views := make([]map[string]interface{}, 0, len(pets))
	for _, p := range pets {
		if p == nil {
			continue
		}
		views = append(views, p.ToDetailDTO())
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:       true,
		Action:   "get_pets",
		TargetID: char.ID,
		Data: map[string]interface{}{
			"petSlots": char.PetSlots,
			"pets":     views,
		},
	})
}

func (s *Server) executeUpdatePet(w http.ResponseWriter, ctx context.Context, char *character.Character, raw json.RawMessage) {
	if s.petProvider == nil {
		s.writeJSON(w, http.StatusNotImplemented, adminErrorResponse{OK: false, Message: "pet provider not configured"})
		return
	}

	var payload updatePetPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid update_pet payload"})
		return
	}
	if payload.PetID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "petId must be greater than 0"})
		return
	}

	target, err := s.petProvider.FindByID(ctx, payload.PetID)
	if err != nil || target == nil {
		s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "pet not found"})
		return
	}
	if target.CharacterID != char.ID {
		s.writeJSON(w, http.StatusForbidden, adminErrorResponse{OK: false, Message: "pet does not belong to this character"})
		return
	}

	changes := map[string]interface{}{}
	if payload.Name != nil {
		target.Name = *payload.Name
		changes["name"] = *payload.Name
	}
	if payload.Level != nil {
		target.Level = *payload.Level
		changes["level"] = *payload.Level
	}
	if payload.Experience != nil {
		target.Experience = *payload.Experience
		changes["experience"] = *payload.Experience
	}
	if payload.UpgradeNum != nil {
		target.UpgradeNum = *payload.UpgradeNum
		changes["upgradeNum"] = *payload.UpgradeNum
	}
	if payload.EvolutionLv != nil {
		target.EvolutionLv = *payload.EvolutionLv
		changes["evolutionLv"] = *payload.EvolutionLv
	}
	if payload.AptStrength != nil {
		target.AptStrength = *payload.AptStrength
		changes["aptStrength"] = *payload.AptStrength
	}
	if payload.AptAgility != nil {
		target.AptAgility = *payload.AptAgility
		changes["aptAgility"] = *payload.AptAgility
	}
	if payload.AptStamina != nil {
		target.AptStamina = *payload.AptStamina
		changes["aptStamina"] = *payload.AptStamina
	}
	if payload.AptIntelligence != nil {
		target.AptIntelligence = *payload.AptIntelligence
		changes["aptIntelligence"] = *payload.AptIntelligence
	}
	if payload.AptEnergy != nil {
		target.AptEnergy = *payload.AptEnergy
		changes["aptEnergy"] = *payload.AptEnergy
	}
	if payload.AptStrengthEx != nil {
		target.AptStrengthEx = *payload.AptStrengthEx
		changes["aptStrengthEx"] = *payload.AptStrengthEx
	}
	if payload.AptAgilityEx != nil {
		target.AptAgilityEx = *payload.AptAgilityEx
		changes["aptAgilityEx"] = *payload.AptAgilityEx
	}
	if payload.AptStaminaEx != nil {
		target.AptStaminaEx = *payload.AptStaminaEx
		changes["aptStaminaEx"] = *payload.AptStaminaEx
	}
	if payload.AptIntelligenceEx != nil {
		target.AptIntelligenceEx = *payload.AptIntelligenceEx
		changes["aptIntelligenceEx"] = *payload.AptIntelligenceEx
	}
	if payload.AptEnergyEx != nil {
		target.AptEnergyEx = *payload.AptEnergyEx
		changes["aptEnergyEx"] = *payload.AptEnergyEx
	}
	if payload.Element != nil {
		target.Element = *payload.Element
		changes["element"] = *payload.Element
	}
	if payload.IsFollowing != nil {
		target.IsFollowing = *payload.IsFollowing
		changes["isFollowing"] = *payload.IsFollowing
	}
	if payload.IsMounting != nil {
		target.IsMounting = *payload.IsMounting
		changes["isMounting"] = *payload.IsMounting
	}
	if payload.IsBound != nil {
		target.SetBinded(*payload.IsBound)
		changes["isBound"] = *payload.IsBound
	}

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no fields to update"})
		return
	}

	target.RecalculateStats()

	if err := s.petProvider.Save(ctx, target); err != nil {
		s.logger.Error("admin update_pet: failed to save pet",
			zap.Int64("pet_id", payload.PetID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update pet"})
		return
	}

	s.saveAndFlush(char.ID)

	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := "Pet updated in database. Player may need to relog to see changes."
	if conn != nil {
		if err := conn.SendCallback("onUpdatePet", target.ToDetailDTO()); err != nil {
			s.logger.Warn("admin update_pet: failed to push onUpdatePet",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		} else {
			deliveryMode = "live_session"
			statusMessage = "Pet updated and client notified."
		}
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "update_pet",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"petId":   payload.PetID,
			"changes": changes,
		},
	})
}

func (s *Server) executeDeletePet(w http.ResponseWriter, ctx context.Context, char *character.Character, raw json.RawMessage) {
	if s.petProvider == nil {
		s.writeJSON(w, http.StatusNotImplemented, adminErrorResponse{OK: false, Message: "pet provider not configured"})
		return
	}

	var payload deletePetPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid delete_pet payload"})
		return
	}
	if payload.PetID <= 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "petId must be greater than 0"})
		return
	}

	target, err := s.petProvider.FindByID(ctx, payload.PetID)
	if err != nil || target == nil {
		s.writeJSON(w, http.StatusNotFound, adminErrorResponse{OK: false, Message: "pet not found"})
		return
	}
	if target.CharacterID != char.ID {
		s.writeJSON(w, http.StatusForbidden, adminErrorResponse{OK: false, Message: "pet does not belong to this character"})
		return
	}

	if err := s.petProvider.Delete(ctx, payload.PetID); err != nil {
		s.logger.Error("admin delete_pet: failed to delete pet",
			zap.Int64("pet_id", payload.PetID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to delete pet"})
		return
	}

	s.saveAndFlush(char.ID)

	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := "Pet deleted from database."
	if conn != nil {
		if err := conn.SendCallback("onDeletePet", payload.PetID); err != nil {
			s.logger.Warn("admin delete_pet: failed to push onDeletePet",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		} else {
			deliveryMode = "live_session"
			statusMessage = "Pet deleted and client notified."
		}
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "delete_pet",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"petId": payload.PetID,
		},
	})
}
