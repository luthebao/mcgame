// Open-sourced by BaoLT

package quest

import (
	"errors"
	"strconv"

	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) TakeCBQuest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	sIndex, err := parseIntArg(args[0])
	if err != nil {
		h.logger.Error("TakeCBQuest: invalid arg type", zap.Any("arg", args[0]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	h.logger.Info("TakeCBQuest called", zap.Int64("character_id", characterID), zap.Int("s_index", sIndex))

	questID, err := h.questService.GetCallBoardQuestID(characterID, sIndex+1)
	if err != nil {
		h.logger.Warn("TakeCBQuest: Cache miss/invalid, attempting reload", zap.Error(err))
		availableQuests, loadErr := h.questService.LoadCallBoard(ctx.Context, characterID)
		if loadErr == nil && len(availableQuests) > 0 && sIndex >= 0 && sIndex < len(availableQuests) {
			questID = int(availableQuests[sIndex].ID)
		}
	}

	if questID == 0 {
		h.logger.Error("TakeCBQuest: Could not resolve quest ID")
		return map[string]interface{}{"f": false}, nil
	}

	h.logger.Info("Resolved CallBoard quest", zap.Int("s_index", sIndex), zap.Int("resolved_id", questID))

	qp, err := h.questService.AcceptQuest(ctx.Context, characterID, questID, h.getDefaultObjectives(questID))
	if err != nil {
		h.logger.Error("Failed to accept CB quest", zap.Error(err))
		return map[string]interface{}{"f": false}, nil
	}

	h.sendAddQuestCallback(ctx, characterID, qp)

	return map[string]interface{}{"f": true, "i": sIndex}, nil
}

func (h *Handler) InitCB(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.charService == nil {
		return nil, errors.New("character service not set")
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("InitCB called", zap.Int64("character_id", characterID))

	availableQuests, err := h.questService.LoadCallBoard(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("InitCB: failed to load quests", zap.Error(err))
		availableQuests = []*models.QuestTemplate{}
	}

	questList := make([]map[string]interface{}, 0)
	for i, q := range availableQuests {
		questList = append(questList, map[string]interface{}{
			"id":     int(q.ID),
			"qid":    strconv.FormatInt(q.ID, 10),
			"state":  102,
			"sIndex": i + 1,
			"c":      int(q.Color),
			"data":   q.ToDTO(),
		})
	}

	h.logger.Info("InitCB: sending quest list", zap.Int("count", len(questList)))

	return map[string]interface{}{"f": true, "n": 10, "data": questList}, nil
}

func (h *Handler) InitCBByItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	refreshType, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}

	h.logger.Info("InitCBByItem called", zap.Int64("character_id", characterID), zap.Int("refresh_type", refreshType))

	itemConsumed, result, err := h.questService.RefreshCallBoard(ctx.Context, characterID, refreshType)
	if err != nil {
		h.logger.Error("RefreshCallBoard failed", zap.Error(err))
		return rtmp.ErrorToResponse(err), nil
	}

	if itemConsumed != nil {
		sid := itemConsumed.CalculateSID()
		if itemConsumed.StackCount <= 0 {
			ctx.Connection.SendCallback("onDelCharactorSlot", float64(itemConsumed.ID), float64(sid))
		} else {
			ctx.Connection.SendCallback("onUpChaSlotStackNum", float64(itemConsumed.ID), float64(itemConsumed.StackCount), float64(sid))
		}
	}

	return result, nil
}
