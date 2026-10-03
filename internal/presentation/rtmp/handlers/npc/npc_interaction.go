// Open-sourced by BaoLT

// NPC interaction payload helpers.
package npc

import (
	"context"
	"fmt"
	"strconv"
	"strings"

	"mcgame-server/internal/domain/creature"
)

type npcInteractionResult struct {
	payload      map[string]interface{}
	directShopID int
	npcState     int
	hasQuest     bool
}

func npcInteractionIDFromScript(funcID string) (int, bool) {
	const prefix = "open_npc_interaction_"

	if !strings.HasPrefix(funcID, prefix) {
		return 0, false
	}

	npcID, err := strconv.Atoi(strings.TrimPrefix(funcID, prefix))
	if err != nil || npcID <= 0 {
		return 0, false
	}

	return npcID, true
}

func npcInteractionFuncID(npcID int) string {
	return fmt.Sprintf("open_npc_interaction_%d", npcID)
}

func (h *Handler) buildNPCInteractionData(ctx context.Context, characterID int64, npcID int) npcInteractionResult {
	npcName := fmt.Sprintf("NPC %d", npcID)
	directShopID := 0
	funcNpcType := 0

	if h.gameData != nil {
		if npc := h.gameData.GetNPC(npcID); npc != nil {
			npcName = npc.Name
			if npc.ShopID > 0 {
				directShopID = int(npc.ShopID)
			}
			nType := creature.NPCType(npc.Type)
			if nType == creature.NPCTypeShop || nType == creature.NPCTypeAuction || nType == creature.NPCTypeBank || nType == creature.NPCTypeHeal || nType == creature.NPCTypeTransport || nType == creature.NPCTypeCallboard || nType == creature.NPCTypeTutor {
				funcNpcType = int(nType)
			}
		}
	}

	npcState := -1
	questList := make(map[string]interface{})
	hasQuest := false

	if h.questService != nil {
		availableQuests, questErr := h.questService.GetAvailableQuestsForNpc(ctx, characterID, npcID)
		if questErr == nil {
			for _, q := range availableQuests {
				hasQuest = true
				if npcState < 102 {
					npcState = 102
				}
				questList[fmt.Sprintf("%d", q.ID)] = map[string]interface{}{
					"id":    q.ID,
					"qid":   q.ID,
					"name":  q.Name,
					"state": 102,
					"type":  q.Type,
				}
			}
		}

		activeQuests, questErr := h.questService.GetActiveQuests(ctx, characterID)
		if questErr == nil {
			for _, qp := range activeQuests {
				if h.gameData == nil {
					continue
				}
				qTpl := h.gameData.GetQuest(qp.QuestID)
				if qTpl == nil || int(qTpl.FinishNPC) != npcID {
					continue
				}

				hasQuest = true
				qState := 103
				if qp.IsComplete() {
					qState = 104
				}

				if qState > npcState {
					npcState = qState
				}

				questList[fmt.Sprintf("%d", qp.QuestID)] = map[string]interface{}{
					"id":    qp.QuestID,
					"qid":   qp.QuestID,
					"name":  qTpl.Name,
					"state": qState,
					"type":  qTpl.Type,
				}
			}
		}
	}

	if npcState < 0 {
		npcState = -1
	}

	loopInfo := map[string]interface{}{"d": nil, "flag": false}
	if h.questService != nil {
		if info, ok := h.questService.GetLoopInfoForNpc(ctx, characterID, npcID); ok {
			loopInfo = info
		}
	}

	payload := map[string]interface{}{
		"npcId":    npcID,
		"npcName":  npcName,
		"npcType":  funcNpcType,
		"loopInfo": loopInfo,
		"npcQuest": map[string]interface{}{
			"npcId": npcID,
			"state": npcState,
			"list":  questList,
		},
	}

	if hasQuest && funcNpcType <= 0 && directShopID > 0 {
		payload["npcType"] = int(creature.NPCTypeShop)
	}

	return npcInteractionResult{
		payload:      payload,
		directShopID: directShopID,
		npcState:     npcState,
		hasQuest:     hasQuest,
	}
}
