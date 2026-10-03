// Open-sourced by BaoLT

// Admin dress panel actions expose and update persisted DRESS_PANEL state.
package adminhttp

import (
	"context"
	"encoding/json"
	"fmt"
	"net/http"
	"strconv"
	"time"

	"mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"

	"go.uber.org/zap"
)

type setDressPanelPayload struct {
	BagCrystal     *int            `json:"bagCrystal,omitempty"`
	BagJewel       *int            `json:"bagJewel,omitempty"`
	Extract        *int            `json:"extract,omitempty"`
	Score          *int            `json:"score,omitempty"`
	FakeDressID    *int64          `json:"fakeDressId,omitempty"`
	FakeFlyDressID *int64          `json:"fakeFlyDressId,omitempty"`
	Book           *map[string]int `json:"book,omitempty"`
	Recipe         *map[string]int `json:"recipe,omitempty"`
}

func enrichAdminDressDTO(dto map[string]interface{}, raw string) {
	info := decodeDressInfoForAdmin(raw)
	clientEncoded, err := info.EncodeClient()
	if err != nil {
		clientEncoded = `{"book":{},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`
	}

	dto["dressInfoClient"] = clientEncoded
	dto["dressBagCrystal"] = info.Bag.Crystal
	dto["dressBagJewel"] = info.Bag.Jewel
	dto["dressExtract"] = info.Extract
	dto["dressScore"] = info.Score
	dto["dressFakeDressId"] = info.FakeDressID
	dto["dressFakeFlyDressId"] = info.FakeFlyDressID
	dto["dressBook"] = cloneDressCounterMap(info.Book)
	dto["dressRecipe"] = cloneDressCounterMap(info.Recipe)
}

func decodeDressInfoForAdmin(raw string) *domaindress.Info {
	info, err := domaindress.Decode(raw)
	if err != nil {
		return domaindress.NewInfo()
	}
	return info
}

func cloneDressCounterMap(src map[string]int) map[string]int {
	if len(src) == 0 {
		return map[string]int{}
	}
	out := make(map[string]int, len(src))
	for key, value := range src {
		out[key] = value
	}
	return out
}

func normalizeDressCounterMap(name string, src map[string]int) (map[string]int, error) {
	if src == nil {
		return map[string]int{}, nil
	}
	out := make(map[string]int, len(src))
	for key, value := range src {
		if _, err := strconv.ParseInt(key, 10, 64); err != nil {
			return nil, fmt.Errorf("%s keys must be numeric strings", name)
		}
		if value < 0 {
			return nil, fmt.Errorf("%s values must be greater than or equal to 0", name)
		}
		if value == 0 {
			continue
		}
		out[key] = value
	}
	return out, nil
}

func (s *Server) executeSetDressPanel(w http.ResponseWriter, _ context.Context, char *character.Character, raw json.RawMessage) {
	var payload setDressPanelPayload
	if err := json.Unmarshal(raw, &payload); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "invalid set_dress_panel payload"})
		return
	}

	info := decodeDressInfoForAdmin(char.DressInfo)
	changes := map[string]interface{}{}

	if payload.BagCrystal != nil {
		if *payload.BagCrystal < 0 {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "bagCrystal must be greater than or equal to 0"})
			return
		}
		info.Bag.Crystal = *payload.BagCrystal
		changes["bagCrystal"] = *payload.BagCrystal
	}
	if payload.BagJewel != nil {
		if *payload.BagJewel < 0 {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "bagJewel must be greater than or equal to 0"})
			return
		}
		info.Bag.Jewel = *payload.BagJewel
		changes["bagJewel"] = *payload.BagJewel
	}
	if payload.Extract != nil {
		if *payload.Extract < 0 {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "extract must be greater than or equal to 0"})
			return
		}
		info.Extract = *payload.Extract
		changes["extract"] = *payload.Extract
	}
	if payload.Score != nil {
		if *payload.Score < 0 {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "score must be greater than or equal to 0"})
			return
		}
		info.Score = *payload.Score
		changes["score"] = *payload.Score
	}
	if payload.FakeDressID != nil {
		if *payload.FakeDressID < 0 {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "fakeDressId must be greater than or equal to 0"})
			return
		}
		info.FakeDressID = *payload.FakeDressID
		changes["fakeDressId"] = *payload.FakeDressID
	}
	if payload.FakeFlyDressID != nil {
		if *payload.FakeFlyDressID < 0 {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "fakeFlyDressId must be greater than or equal to 0"})
			return
		}
		info.FakeFlyDressID = *payload.FakeFlyDressID
		changes["fakeFlyDressId"] = *payload.FakeFlyDressID
	}
	if payload.Book != nil {
		normalized, err := normalizeDressCounterMap("book", *payload.Book)
		if err != nil {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: err.Error()})
			return
		}
		info.Book = normalized
		changes["book"] = normalized
	}
	if payload.Recipe != nil {
		normalized, err := normalizeDressCounterMap("recipe", *payload.Recipe)
		if err != nil {
			s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: err.Error()})
			return
		}
		info.Recipe = normalized
		changes["recipe"] = normalized
	}

	if len(changes) == 0 {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{OK: false, Message: "no dress panel fields provided"})
		return
	}

	storageEncoded, err := info.Encode()
	if err != nil {
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to encode dress panel storage"})
		return
	}
	clientEncoded, err := info.EncodeClient()
	if err != nil {
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to encode dress panel client payload"})
		return
	}

	char.DressInfo = storageEncoded

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := s.characterUpdater.Update(ctx, char); err != nil {
		s.logger.Error("admin set_dress_panel: failed to update character",
			zap.Int64("character_id", char.ID),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{OK: false, Message: "failed to update dress panel data"})
		return
	}

	conn := s.getConnection(char.ID)
	deliveryMode := "database_only"
	statusMessage := "Dress panel data updated in database. Player is offline."
	if conn != nil {
		if s.characterCacheUpdater != nil {
			s.characterCacheUpdater.UpdateCachedCharacter(char.ID, func(c *character.Character) {
				c.DressInfo = storageEncoded
			})
		}
		if err := conn.SendCallback("onUpdateDressInto", clientEncoded); err != nil {
			s.logger.Warn("admin set_dress_panel: failed to push onUpdateDressInto",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
			statusMessage = "Dress panel data updated in database, but client refresh failed."
		} else {
			deliveryMode = "live_session"
			statusMessage = "Dress panel data updated and client notified."
		}
	}

	s.writeJSON(w, http.StatusOK, adminActionResponse{
		OK:            true,
		Action:        "set_dress_panel",
		TargetID:      char.ID,
		DeliveryMode:  deliveryMode,
		StatusMessage: statusMessage,
		Data: map[string]interface{}{
			"dressInfoClient":     clientEncoded,
			"dressBagCrystal":     info.Bag.Crystal,
			"dressBagJewel":       info.Bag.Jewel,
			"dressExtract":        info.Extract,
			"dressScore":          info.Score,
			"dressFakeDressId":    info.FakeDressID,
			"dressFakeFlyDressId": info.FakeFlyDressID,
			"dressBook":           cloneDressCounterMap(info.Book),
			"dressRecipe":         cloneDressCounterMap(info.Recipe),
		},
	})
}
