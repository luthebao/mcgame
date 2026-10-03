// Open-sourced by BaoLT

// Admin economy actions: wallet currency updates and resource slots / points.
package adminhttp

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"time"

	"go.uber.org/zap"

	"mcgame-server/internal/domain/character"
)

type setCurrencyPayload struct {
	Currency string `json:"currency"`
	Amount   int64  `json:"amount"`
	Mode     string `json:"mode"`
}

type setResourcesPayload struct {
	BagSlotNum     *int `json:"bagSlotNum,omitempty"`
	BankSlotNum    *int `json:"bankSlotNum,omitempty"`
	PetSlots       *int `json:"petSlots,omitempty"`
	TempBagSlots   *int `json:"tempBagSlots,omitempty"`
	MxTempBagSlots *int `json:"mxTempBagSlots,omitempty"`
	BagSlots       *int `json:"bagSlots,omitempty"`
	BankSlots      *int `json:"bankSlots,omitempty"`
}

func (s *Server) executeSetCurrency(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setCurrencyPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_currency payload"})
		return
	}

	accessor, ok := character.LookupCurrencyAccessor(payload.Currency)
	if !ok {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: fmt.Sprintf("unknown currency: %s", payload.Currency),
		})
		return
	}

	if payload.Mode != "add" && payload.Mode != "set" {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "mode must be 'add' or 'set'"})
		return
	}

	oldValue := accessor.Get(char)
	var newValue int64
	if payload.Mode == "add" {
		newValue = oldValue + payload.Amount
	} else {
		newValue = payload.Amount
	}
	if newValue < 0 {
		newValue = 0
	}

	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := "Currency updated in database. Player is offline."

	if conn != nil && s.characterCacheUpdater != nil {
		updated := s.characterCacheUpdater.UpdateCachedCharacter(char.ID, func(c *character.Character) {
			accessor.Set(c, newValue)
		})
		s.pushUPPToConnection(conn, updated)
		deliveryMode = "live_session"
		statusMessage = "Currency updated and client notified."
	} else {
		accessor.Set(char, newValue)

		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer cancel()

		if err := s.characterUpdater.Update(ctx, char); err != nil {
			s.logger.Error("admin set_currency: failed to update character",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update currency"})
			return
		}
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "set_currency",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"currency":  payload.Currency,
			"oldValue":  oldValue,
			"newValue":  newValue,
			"mode":      payload.Mode,
			"requested": payload.Amount,
		},
	})
}

func (s *Server) executeSetResources(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setResourcesPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_resources payload"})
		return
	}

	bagSlotNum, err := resolveContainerCount("bagSlotNum", payload.BagSlotNum, "bagSlots", payload.BagSlots, character.SlotsPerBag, 1, character.MaxBagTabs)
	if err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: err.Error()})
		return
	}
	bankSlotNum, err := resolveContainerCount("bankSlotNum", payload.BankSlotNum, "bankSlots", payload.BankSlots, character.SlotsPerBank, 1, character.MaxBankTabs)
	if err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: err.Error()})
		return
	}

	changes := map[string]interface{}{}
	addContainerChange(changes, "bagSlotNum", "bagSlots", bagSlotNum, character.SlotsPerBag)
	addContainerChange(changes, "bankSlotNum", "bankSlots", bankSlotNum, character.SlotsPerBank)
	addIntChange(changes, "petSlots", payload.PetSlots)
	addIntChange(changes, "tempBagSlots", payload.TempBagSlots)
	addIntChange(changes, "mxTempBagSlots", payload.MxTempBagSlots)

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no resource fields provided"})
		return
	}

	applyFn := func(c *character.Character) {
		if bagSlotNum != nil {
			c.SetBagSlotNum(*bagSlotNum)
		}
		if bankSlotNum != nil {
			c.SetBankSlotNum(*bankSlotNum)
		}
		if payload.PetSlots != nil {
			c.PetSlots = *payload.PetSlots
			c.PetMaxNum = *payload.PetSlots
		}
		assignInt(&c.TempBagSlots, payload.TempBagSlots)
		assignInt(&c.MxTempBagSlots, payload.MxTempBagSlots)
	}

	s.applyCharacterChange(w, "set_resources", char, applyFn, true, changes)
}

func resolveContainerCount(countField string, count *int, slotsField string, slots *int, slotsPer int, minCount int, maxCount int) (*int, error) {
	if count == nil && slots == nil {
		return nil, nil
	}

	if count != nil {
		if *count < minCount || *count > maxCount {
			return nil, fmt.Errorf("%s must be between %d and %d", countField, minCount, maxCount)
		}
		resolved := *count
		if slots != nil && *slots != resolved*slotsPer {
			return nil, fmt.Errorf("%s must equal %s * %d", slotsField, countField, slotsPer)
		}
		return &resolved, nil
	}

	if *slots <= 0 {
		return nil, fmt.Errorf("%s must be greater than 0", slotsField)
	}
	if *slots%slotsPer != 0 {
		return nil, fmt.Errorf("%s must be a multiple of %d", slotsField, slotsPer)
	}

	resolved := *slots / slotsPer
	if resolved < minCount || resolved > maxCount {
		return nil, fmt.Errorf("%s must convert to %s between %d and %d", slotsField, countField, minCount, maxCount)
	}
	return &resolved, nil
}

func addContainerChange(changes map[string]interface{}, countKey string, slotsKey string, count *int, slotsPer int) {
	if count == nil {
		return
	}
	changes[countKey] = *count
	changes[slotsKey] = *count * slotsPer
}

