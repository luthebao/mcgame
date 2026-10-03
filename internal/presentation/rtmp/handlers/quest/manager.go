// Open-sourced by BaoLT

package quest

import (
	"strconv"
	"time"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) InitQuestManager(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	activeQuests, err := h.questService.GetActiveQuests(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	completedIDs, err := h.questService.GetCompletedQuestIDs(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	questMap := make(map[string]interface{})
	for _, qp := range activeQuests {
		baseDTO := h.questService.EnrichQuestDTO(ctx.Context, qp)
		finalDTO := make(map[string]interface{})
		for k, v := range baseDTO {
			finalDTO[k] = v
		}
		finalDTO["qid"] = strconv.Itoa(qp.QuestID)
		finalDTO["st"] = baseDTO["state"]
		questMap[strconv.Itoa(qp.QuestID)] = finalDTO
	}

	loopMap := make(map[string]interface{})
	loopStates, err := h.questService.GetActiveLoopStates(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("InitQuestManager: failed to load loop states", zap.Error(err))
	}
	for _, st := range loopStates {
		loopMap[strconv.Itoa(st.LoopID)] = st.ToClientDTO()
	}

	return map[string]interface{}{"q": questMap, "completedIds": completedIDs, "l": loopMap}, nil
}

func (h *Handler) GetLoopQuestStartTime(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	questType := 1
	if len(args) >= 1 {
		if value, err := parseIntArg(args[0]); err == nil {
			questType = value
		}
	}

	startTime := h.questService.GetLoopQuestStartTime(questType)

	if ctx.Connection != nil {
		now := time.Now()
		midnight := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
		payload := map[string]interface{}{"51": midnight.UnixMilli()}
		if err := ctx.Connection.SendCallback("onGetLoopQuestStartTime", payload); err != nil {
			h.logger.Error("Failed to send onGetLoopQuestStartTime callback", zap.Error(err))
		}
	}

	return map[string]interface{}{"startTime": startTime}, nil
}

func (h *Handler) CanQuest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	questID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}

	canAccept, reason, err := h.questService.CanAcceptQuest(ctx.Context, characterID, questID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	return map[string]interface{}{"canAccept": canAccept, "reason": reason}, nil
}
