// Open-sourced by BaoLT

package quest

import (
	appquest "mcgame-server/internal/application/quest"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type QuestNotifyHelper struct {
	questService *appquest.Service
	gameData     *gamedata.Manager
	logger       *zap.Logger
}

func NewQuestNotifyHelper(qs *appquest.Service, gd *gamedata.Manager, logger *zap.Logger) *QuestNotifyHelper {
	return &QuestNotifyHelper{
		questService: qs,
		gameData:     gd,
		logger:       logger,
	}
}

func (h *QuestNotifyHelper) PushQuestProgress(ctx *rtmp.RPCContext, charID int64) {
	if h.questService == nil {
		return
	}

	activeQuests, err := h.questService.GetActiveQuests(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("Failed to get active quests for push", zap.Error(err))
		return
	}

	for _, qp := range activeQuests {
		dto := h.questService.EnrichQuestDTO(ctx.Context, qp)
		if err := ctx.Connection.SendCallback("onAddChaQuest", dto); err != nil {
			h.logger.Warn("Failed to push quest progress callback", zap.Int("quest_id", qp.QuestID), zap.Error(err))
		}

		if qp.IsComplete() && h.gameData != nil {
			questTemplate := h.gameData.GetQuest(qp.QuestID)
			if questTemplate != nil {
				finishNPC := int(questTemplate.FinishNPC)
				if finishNPC > 0 {
					state := h.CalculateNpcQuestState(ctx, charID, finishNPC)
					_ = ctx.Connection.SendCallback("onSetNpcState", finishNPC, state)
				}
			}
		}
	}
}

func (h *QuestNotifyHelper) PushNpcQuestStates(ctx *rtmp.RPCContext, charID int64, npcIDs []int) {
	if h.questService == nil || h.gameData == nil {
		return
	}

	uniqueNpcs := make(map[int]bool)
	for _, id := range npcIDs {
		if id > 0 {
			uniqueNpcs[id] = true
		}
	}

	for npcID := range uniqueNpcs {
		state := h.CalculateNpcQuestState(ctx, charID, npcID)
		if err := ctx.Connection.SendCallback("onSetNpcState", npcID, state); err != nil {
			h.logger.Warn("Failed to push NPC state callback", zap.Int("npc_id", npcID), zap.Error(err))
		}
	}
}

func (h *QuestNotifyHelper) PushNpcQuestStatesByMap(ctx *rtmp.RPCContext, charID int64, mapID int) {
	if h.gameData == nil {
		return
	}

	mapCreatures := h.gameData.GetCache().GetMapCreaturesByMapID(mapID)
	npcIDs := make([]int, 0)
	for _, mc := range mapCreatures {
		if mc != nil && mc.Cid > 0 {
			npcIDs = append(npcIDs, int(mc.Cid))
		}
	}

	h.PushNpcQuestStates(ctx, charID, npcIDs)
}

func (h *QuestNotifyHelper) CalculateNpcQuestState(ctx *rtmp.RPCContext, charID int64, npcID int) int {
	activeQuests, _ := h.questService.GetActiveQuests(ctx.Context, charID)
	if activeQuests == nil {
		activeQuests = []*domainquest.QuestProgress{}
	}

	bestState := -1
	activeQuestIDs := make(map[int]bool, len(activeQuests))

	for _, qp := range activeQuests {
		activeQuestIDs[qp.QuestID] = true

		questTemplate := h.gameData.GetQuest(qp.QuestID)
		if questTemplate == nil {
			continue
		}

		if int(questTemplate.FinishNPC) == npcID {
			if qp.IsComplete() {
				return 104
			}
			if bestState == -1 {
				bestState = 103
			}
		}
	}

	char, err := h.questService.GetCharacter(ctx.Context, charID)
	if err != nil {
		return bestState
	}

	completedIDs, _ := h.questService.GetCompletedQuestIDs(ctx.Context, charID)
	completedMap := make(map[int]bool)
	for _, id := range completedIDs {
		completedMap[id] = true
	}

	allQuests := h.gameData.GetAllQuests()
	for _, questTemplate := range allQuests {
		if questTemplate == nil || int(questTemplate.StartNPC) != npcID {
			continue
		}

		questID := int(questTemplate.ID)
		if completedMap[questID] {
			continue
		}
		if activeQuestIDs[questID] {
			continue
		}

		canAccept, _ := h.questService.CanAcceptQuestWithSnapshot(ctx.Context, char, questTemplate, activeQuestIDs, completedMap)
		if canAccept {
			if bestState == -1 || bestState == 103 {
				bestState = 102
			}
		}
	}

	return bestState
}
