// Open-sourced by BaoLT

// Loop-quest RPC handlers (takeLoop, cancelLoop, loopRepaire) for the
// TBL_QUEST_LOOP series ("Nhiệm Vụ Vòng"). All three are fire-and-forget:
// the client sends no Responder and only reacts to the pushed onXxx
// callback, so every path below — including failures — must push a reply.
package quest

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) TakeLoop(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		h.pushOnTakeLoopFailure(ctx)
		return nil, nil
	}
	lid, err := parseIntArg(args[0])
	if err != nil {
		h.pushOnTakeLoopFailure(ctx)
		return nil, nil
	}
	npcID := 0
	if len(args) >= 2 {
		if v, err := parseIntArg(args[1]); err == nil {
			npcID = v
		}
	}

	state, qp, err := h.questService.TakeLoop(ctx.Context, characterID, lid)
	if err != nil {
		h.logger.Warn("takeLoop rejected", zap.Int64("character_id", characterID), zap.Int("loop_id", lid), zap.Error(err))
		h.pushOnTakeLoopFailure(ctx)
		return nil, nil
	}

	if err := ctx.Connection.SendCallback("onTakeLoop", map[string]interface{}{"flag": true, "d": state.ToClientDTO()}); err != nil {
		h.logger.Error("Failed to send onTakeLoop callback", zap.Error(err))
	}
	h.sendAddQuestCallback(ctx, characterID, qp)
	h.grantQuestStartItems(ctx, characterID, qp.QuestID)
	h.pushLoopBossOnIfMapMode(ctx, characterID, qp.QuestID)

	if h.questNotify != nil {
		npcIDs := make([]int, 0, 3)
		if npcID > 0 {
			npcIDs = append(npcIDs, npcID)
		}
		if h.gameDataManager != nil {
			if loopTpl := h.gameDataManager.GetQuestLoop(lid); loopTpl != nil && int(loopTpl.Nid) > 0 {
				npcIDs = append(npcIDs, int(loopTpl.Nid))
			}
			if questTpl := h.gameDataManager.GetQuest(qp.QuestID); questTpl != nil && int(questTpl.FinishNPC) > 0 {
				npcIDs = append(npcIDs, int(questTpl.FinishNPC))
			}
		}
		if len(npcIDs) > 0 {
			h.questNotify.PushNpcQuestStates(ctx, characterID, npcIDs)
		}
	}

	h.logger.Info("takeLoop", zap.Int64("character_id", characterID), zap.Int("loop_id", lid), zap.Int("child_quest_id", qp.QuestID))
	return nil, nil
}

func (h *Handler) pushOnTakeLoopFailure(ctx *rtmp.RPCContext) {
	if err := ctx.Connection.SendCallback("onTakeLoop", map[string]interface{}{"flag": false}); err != nil {
		h.logger.Error("Failed to send onTakeLoop failure callback", zap.Error(err))
	}
}

func (h *Handler) CancelLoop(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		h.pushOnCancelLoopFailure(ctx, 0)
		return nil, nil
	}
	lid, err := parseIntArg(args[0])
	if err != nil {
		h.pushOnCancelLoopFailure(ctx, 0)
		return nil, nil
	}

	_, childQP, err := h.questService.CancelLoop(ctx.Context, characterID, lid)
	if err != nil {
		h.logger.Warn("cancelLoop rejected", zap.Int64("character_id", characterID), zap.Int("loop_id", lid), zap.Error(err))
		h.pushOnCancelLoopFailure(ctx, lid)
		return nil, nil
	}

	if childQP != nil {
		activeQuests, _ := h.questService.GetActiveQuests(ctx.Context, characterID)
		if err := ctx.Connection.SendCallback("onCancelQuest", map[string]interface{}{"flag": true, "qid": strconv.Itoa(childQP.QuestID), "qn": len(activeQuests)}); err != nil {
			h.logger.Error("Failed to send onCancelQuest callback for loop child", zap.Error(err))
		}
		h.clearLoopBossForRound(ctx, characterID, childQP.QuestID)
	}

	if err := ctx.Connection.SendCallback("onCancelLoopQuest", map[string]interface{}{"flag": true, "id": lid}); err != nil {
		h.logger.Error("Failed to send onCancelLoopQuest callback", zap.Error(err))
	}

	if h.questNotify != nil && h.gameDataManager != nil {
		if loopTpl := h.gameDataManager.GetQuestLoop(lid); loopTpl != nil && int(loopTpl.Nid) > 0 {
			h.questNotify.PushNpcQuestStates(ctx, characterID, []int{int(loopTpl.Nid)})
		}
	}

	h.logger.Info("cancelLoop", zap.Int64("character_id", characterID), zap.Int("loop_id", lid))
	return nil, nil
}

func (h *Handler) pushOnCancelLoopFailure(ctx *rtmp.RPCContext, lid int) {
	if err := ctx.Connection.SendCallback("onCancelLoopQuest", map[string]interface{}{"flag": false, "id": lid}); err != nil {
		h.logger.Error("Failed to send onCancelLoopQuest failure callback", zap.Error(err))
	}
}

func (h *Handler) LoopRepaire(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, nil
	}
	lid, err := parseIntArg(args[0])
	if err != nil {
		return nil, nil
	}

	qp, err := h.questService.RepairLoop(ctx.Context, characterID, lid)
	if err != nil {
		h.logger.Warn("loopRepaire failed", zap.Int64("character_id", characterID), zap.Int("loop_id", lid), zap.Error(err))
		return nil, nil
	}
	if qp == nil {
		h.logger.Info("loopRepaire: no active instance", zap.Int64("character_id", characterID), zap.Int("loop_id", lid))
		return nil, nil
	}

	h.sendAddQuestCallback(ctx, characterID, qp)
	h.logger.Info("loopRepaire", zap.Int64("character_id", characterID), zap.Int("loop_id", lid), zap.Int("quest_id", qp.QuestID))
	return nil, nil
}
