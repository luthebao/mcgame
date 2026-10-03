// Open-sourced by BaoLT

// Activity broadcast endpoint pushes data_tbl_activity changes to all online clients.
// "create" / "delete" rebuild the full startedActList and use updateActivityList.
// "update" pushes a single-row payload via updateActivityState.
package adminhttp

import (
	"encoding/json"
	"fmt"
	"net/http"

	"go.uber.org/zap"
)

type activityBroadcastRequest struct {
	Action string `json:"action"`
	ID     int    `json:"id"`
}

type activityBroadcastResponse struct {
	OK       bool   `json:"ok"`
	Action   string `json:"action"`
	ID       int    `json:"id"`
	Method   string `json:"method"`
	RowCount int    `json:"rowCount,omitempty"`
}

const (
	activityActionCreate = "create"
	activityActionUpdate = "update"
	activityActionDelete = "delete"

	callbackUpdateActivityList  = "updateActivityList"
	callbackUpdateActivityState = "updateActivityState"
)

func (s *Server) handleActivityBroadcast(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodPost {
		http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
		return
	}

	var req activityBroadcastRequest
	if err := json.NewDecoder(r.Body).Decode(&req); err != nil {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: "invalid JSON body",
		})
		return
	}

	switch req.Action {
	case activityActionCreate, activityActionUpdate, activityActionDelete:
	default:
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: fmt.Sprintf("unknown action: %s", req.Action),
		})
		return
	}

	if req.ID <= 0 && req.Action == activityActionUpdate {
		s.writeJSON(w, http.StatusBadRequest, adminErrorResponse{
			OK:      false,
			Message: "id is required for update",
		})
		return
	}

	if s.activityService == nil || s.sessionProvider == nil {
		s.writeJSON(w, http.StatusServiceUnavailable, adminErrorResponse{
			OK:      false,
			Message: "broadcast not available",
		})
		return
	}

	ctx := r.Context()

	if req.Action == activityActionUpdate {
		result, err := s.activityService.BuildChangeViewEntry(ctx, req.ID)
		if err != nil {
			s.logger.Error("activity broadcast: failed to load row",
				zap.Int("id", req.ID),
				zap.Error(err))
			s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
				OK:      false,
				Message: "failed to load activity row",
			})
			return
		}
		if !result.Found {
			s.writeJSON(w, http.StatusNotFound, adminErrorResponse{
				OK:      false,
				Message: "activity row not found",
			})
			return
		}

		if !result.Fallback {
			s.sessionProvider.BroadcastToAll(callbackUpdateActivityState, result.Entry)
			s.logger.Info("activity broadcast: per-row push",
				zap.Int("id", req.ID),
				zap.String("method", callbackUpdateActivityState))
			s.writeJSON(w, http.StatusOK, activityBroadcastResponse{
				OK:     true,
				Action: req.Action,
				ID:     req.ID,
				Method: callbackUpdateActivityState,
			})
			return
		}
	}

	list, err := s.activityService.BuildStartedActList(ctx)
	if err != nil {
		s.logger.Error("activity broadcast: failed to build full list",
			zap.String("action", req.Action),
			zap.Error(err))
		s.writeJSON(w, http.StatusInternalServerError, adminErrorResponse{
			OK:      false,
			Message: "failed to build activity list",
		})
		return
	}

	s.sessionProvider.BroadcastToAll(callbackUpdateActivityList, list)
	s.logger.Info("activity broadcast: full list push",
		zap.String("action", req.Action),
		zap.Int("id", req.ID),
		zap.Int("row_count", len(list)),
		zap.String("method", callbackUpdateActivityList))
	s.writeJSON(w, http.StatusOK, activityBroadcastResponse{
		OK:       true,
		Action:   req.Action,
		ID:       req.ID,
		Method:   callbackUpdateActivityList,
		RowCount: len(list),
	})
}
