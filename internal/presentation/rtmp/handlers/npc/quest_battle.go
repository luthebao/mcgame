// Open-sourced by BaoLT

package npc

import (
	"context"
	"slices"
	"strconv"

	appcombat "mcgame-server/internal/application/combat"
	combatdomain "mcgame-server/internal/domain/combat"
	"mcgame-server/internal/domain/creature"
	domainquest "mcgame-server/internal/domain/quest"
	"mcgame-server/internal/infrastructure/rtmp"
)

const clientCharStateBattle = 5

func (h *Handler) tryHandleQuestBattleNPCClick(ctx *rtmp.RPCContext, characterID int64, npcID int) (bool, interface{}, error) {
	if h.combatService == nil || h.questService == nil || h.gameData == nil {
		return false, nil, nil
	}

	npcTemplate := h.gameData.GetNPC(npcID)
	if npcTemplate == nil || !isQuestBattleNPCType(creature.NPCType(npcTemplate.Type)) {
		return false, nil, nil
	}

	questIDs := npcTemplate.ParsePipeDelimitedInts(npcTemplate.SubType)

	matchedQuestID, creatureIDs, ok := h.resolveQuestBattleCreatureIDs(ctx.Context, characterID, npcID, questIDs)
	if !ok || len(creatureIDs) == 0 {
		return false, nil, nil
	}

	encounterLevel := h.questEncounterLevel(matchedQuestID)

	enemyTemplates := make([]appcombat.NPCTemplateData, 0, len(creatureIDs))
	for _, cid := range creatureIDs {
		var tpl appcombat.NPCTemplateData
		var err error
		if encounterLevel > 0 {
			tpl, err = h.combatService.BuildCreatureTemplateAtLevel(ctx.Context, characterID, cid, encounterLevel)
		} else {
			tpl, err = h.combatService.BuildCreatureTemplateForCharacter(ctx.Context, characterID, cid)
		}
		if err != nil {
			return true, rtmp.ErrorToResponse(err), nil
		}
		enemyTemplates = append(enemyTemplates, tpl)
	}

	mapID := 0
	channelID := 0
	playerInFront := true
	if ctx.Connection != nil {
		mapID, _ = ctx.Connection.GetSceneInfo()
		playerInFront = ctx.Connection.IsPlayerInFront()
		channelID = ctx.Connection.GetChannelID()
	}

	battle, err := h.combatService.StartPVEBattleWithMultipleEnemies(ctx.Context, characterID, mapID, channelID, enemyTemplates, playerInFront)
	if err != nil {
		return true, rtmp.ErrorToResponse(err), nil
	}

	h.notifyQuestBattleStarted(ctx, battle)

	return true, map[string]interface{}{
		"success":    true,
		"battleId":   battle.ID,
		"battleData": battle.ToDTO(),
	}, nil
}

func (h *Handler) resolveQuestBattleCreatureIDs(ctx context.Context, characterID int64, npcID int, questIDs []int) (int, []int, bool) {
	if h.questService == nil || h.gameData == nil {
		return 0, nil, false
	}

	activeQuests, err := h.questService.GetActiveQuests(ctx, characterID)
	if err != nil {
		return 0, nil, false
	}

	for _, progress := range activeQuests {
		if progress == nil {
			continue
		}
		if !h.questBattleMatchesNPC(progress.QuestID, npcID, questIDs) {
			continue
		}

		targets, sawKill := incompleteKillObjectiveTargets(progress.Objectives)
		if len(targets) > 0 {
			return progress.QuestID, targets, true
		}
		if sawKill {
			continue
		}

		var fallback []int
		for _, requirement := range h.gameData.GetQuestRequire(progress.QuestID) {
			if int(requirement.Kind) != 2 {
				continue
			}
			if cid := int(requirement.ItemID); cid > 0 {
				fallback = append(fallback, cid)
			}
		}
		if len(fallback) > 0 {
			return progress.QuestID, fallback, true
		}
	}

	return 0, nil, false
}

func (h *Handler) questEncounterLevel(questID int) int {
	if questID <= 0 || h.gameData == nil {
		return 0
	}
	quest := h.gameData.GetQuest(questID)
	if quest == nil {
		return 0
	}
	minLevel := int(quest.MinLevel)
	if minLevel <= 0 {
		return 0
	}
	level := minLevel / 2
	if level <= 0 {
		level = 1
	}
	return level
}

func incompleteKillObjectiveTargets(objectives []domainquest.Objective) ([]int, bool) {
	var targets []int
	sawKill := false
	for _, o := range objectives {
		if o.Type != domainquest.ObjectiveKillMonster {
			continue
		}
		sawKill = true
		if o.IsComplete() || o.Target <= 0 {
			continue
		}
		targets = append(targets, o.Target)
	}
	return targets, sawKill
}

func isQuestBattleNPCType(npcType creature.NPCType) bool {
	return npcType == creature.NPCTypeQuestBattle || npcType == creature.NPCTypeBattle || npcType == creature.NPCTypeStoryBattle
}

func (h *Handler) questBattleMatchesNPC(questID, npcID int, questIDs []int) bool {
	if len(questIDs) > 0 {
		return slices.Contains(questIDs, questID)
	}
	if h.questService != nil {
		if pairedQuestID, ok := h.questService.LoopBossNpcQuest(npcID); ok {
			return pairedQuestID == questID
		}
	}
	qTpl := h.gameData.GetQuest(questID)
	if qTpl == nil {
		return false
	}
	return int(qTpl.StartNPC) == npcID || int(qTpl.FinishNPC) == npcID
}

func (h *Handler) notifyQuestBattleStarted(ctx *rtmp.RPCContext, battle *combatdomain.Battle) {
	if ctx == nil || ctx.Connection == nil || battle == nil {
		return
	}

	battle.AddWatcher(ctx.Connection)
	ctx.Connection.SetBattleID(battle.ID)
	sendQuestBattleStartCallbacks(ctx.Connection, ctx.CharacterID, battle.Participants)
	h.broadcastQuestBattleCharState(ctx.Connection, ctx.CharacterID, clientCharStateBattle)
	_ = ctx.Connection.SendCallback("onBattleStart", buildQuestBattleStartData(battle))
}

func buildQuestBattleStartData(battle *combatdomain.Battle) map[string]interface{} {
	battleDTO := battle.ToDTO()
	return map[string]interface{}{
		"battleFieldId": battle.BattleFieldID,
		"cList":         battleDTO["cList"],
		"guest":         false,
		"sneakFlag":     0,
		"bossFlag":      false,
		"airBattle":     false,
	}
}

func sendQuestBattleStartCallbacks(conn *rtmp.Connection, characterID string, participants []*combatdomain.Participant) {
	if conn == nil {
		return
	}

	if petParticipant, ok := questBattlePetParticipantByOwner(participants, characterID); ok {
		_ = conn.SendCallback("onUpdatePet", float64(petParticipant.EntityID), "currentHp", strconv.Itoa(petParticipant.CurrentHP))
		_ = conn.SendCallback("onUpdatePet", float64(petParticipant.EntityID), "currentMp", strconv.Itoa(petParticipant.CurrentMP))
	}

	_ = conn.SendCallback("onSetCharState", map[string]interface{}{
		"cid":   characterID,
		"state": clientCharStateBattle,
	})
}

func questBattlePetParticipantByOwner(participants []*combatdomain.Participant, ownerID string) (*combatdomain.Participant, bool) {
	for _, participant := range participants {
		if participant == nil {
			continue
		}
		if participant.Side != combatdomain.SidePlayer || participant.EntityType != combatdomain.ParticipantTypePet {
			continue
		}
		if strconv.FormatInt(participant.OwnerID, 10) != ownerID {
			continue
		}
		return participant, true
	}
	return nil, false
}

func (h *Handler) broadcastQuestBattleCharState(conn *rtmp.Connection, characterID string, state int) {
	if h.sceneManager == nil || conn == nil || characterID == "" {
		return
	}

	mapID, _ := conn.GetSceneInfo()
	if mapID == 0 {
		return
	}

	h.sceneManager.BroadcastToScene(conn.GetChannelID(), mapID, conn.ID, "onSetCharState", map[string]interface{}{
		"cid":   characterID,
		"state": state,
	})
}
