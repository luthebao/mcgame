// Open-sourced by BaoLT

// Group battle helpers wire multi-character battle start, playback, and cleanup callbacks.
package combat

import (
	"context"
	"strconv"
	"time"

	appbattle "mcgame-server/internal/application/battle"
	combatdomain "mcgame-server/internal/domain/combat"
)

func (h *Handler) eligibleBattleRoster(ctx context.Context, initiatorID int64, mapID int) []int64 {
	roster := []int64{initiatorID}
	if h.groupService == nil || h.rtmpServer == nil {
		return roster
	}

	group, err := h.groupService.GetGroupByMember(ctx, initiatorID)
	if err != nil || group == nil || group.LeaderID != initiatorID {
		return roster
	}

	roster = roster[:0]
	for _, member := range group.Members {
		if member.AFK {
			continue
		}
		conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(member.CharID, 10))
		if conn == nil {
			continue
		}
		char, err := h.charService.GetByID(ctx, member.CharID)
		if err != nil || char == nil {
			continue
		}
		if char.MapID != mapID || char.CurrentHP <= 0 {
			continue
		}
		existingBattle, _ := h.combatService.GetPlayerBattle(member.CharID)
		if existingBattle != nil && existingBattle.IsActive() {
			if member.CharID != initiatorID {
				continue
			}
		}
		roster = append(roster, member.CharID)
	}

	if len(roster) == 0 {
		return []int64{initiatorID}
	}

	return roster
}

func (h *Handler) buildBattleStartData(battle *combatdomain.Battle) map[string]interface{} {
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

func (h *Handler) battlePlayerCharacters(battle *combatdomain.Battle) []*combatdomain.Participant {
	participants := make([]*combatdomain.Participant, 0)
	if battle == nil {
		return participants
	}

	for _, participant := range battle.Participants {
		if !battle.IsPlayerCommandActor(participant) {
			continue
		}
		participants = append(participants, participant)
	}

	return participants
}

func (h *Handler) registerBattleParticipantWatchers(battle *combatdomain.Battle) {
	if h.rtmpServer == nil || battle == nil {
		return
	}

	for _, participant := range h.battlePlayerCharacters(battle) {
		conn := h.rtmpServer.GetConnectionByCharacterID(participant.ID)
		if conn == nil {
			continue
		}
		battle.AddWatcher(conn)
	}
}

func (h *Handler) setBattleRoundDeadlines(battle *combatdomain.Battle) {
	if h.battleService == nil || battle == nil || h.rtmpServer == nil {
		return
	}

	h.battleService.ClearBattleDeadlines(battle.ID)
	for _, participant := range h.battlePlayerCharacters(battle) {
		if !participant.IsAlive {
			continue
		}
		conn := h.rtmpServer.GetConnectionByCharacterID(participant.ID)
		if conn == nil {
			continue
		}
		if battle.BattleType == combatdomain.BattleTypePVP {
			h.battleService.SetTurnDeadlineWithDuration(battle.ID, participant.ID, appbattle.DefaultPVPTurnTimeout, conn)
		} else {
			h.battleService.SetTurnDeadline(battle.ID, participant.ID, conn)
		}
	}
}

func (h *Handler) notifyBattleStarted(battle *combatdomain.Battle) map[string]interface{} {
	battleData := h.buildBattleStartData(battle)
	if battle == nil || h.rtmpServer == nil {
		return battleData
	}

	h.registerBattleParticipantWatchers(battle)
	for _, participant := range h.battlePlayerCharacters(battle) {
		if !participant.IsAlive {
			continue
		}
		conn := h.rtmpServer.GetConnectionByCharacterID(participant.ID)
		if conn == nil {
			continue
		}
		conn.SetBattleID(battle.ID)
		sendBattleStartCallbacks(conn, participant.ID, battle.Participants, h.logger)
		h.broadcastSceneCharState(conn, participant.ID, clientCharStateBattle)
		conn.SendCallback("onBattleStart", battleData)
	}
	h.setBattleRoundDeadlines(battle)

	return battleData
}

func (h *Handler) setRandomEncounterCooldownForParticipants(battle *combatdomain.Battle, until time.Time) {
	if battle == nil || h.rtmpServer == nil {
		return
	}

	for _, participant := range h.battlePlayerCharacters(battle) {
		conn := h.rtmpServer.GetConnectionByCharacterID(participant.ID)
		if conn == nil {
			continue
		}
		conn.SetRandomEncounterCooldown(until)
	}
}

func (h *Handler) sendCmdReadyToParticipants(battle *combatdomain.Battle) {
	if battle == nil || h.rtmpServer == nil {
		return
	}

	for _, participant := range h.battlePlayerCharacters(battle) {
		conn := h.rtmpServer.GetConnectionByCharacterID(participant.ID)
		if conn == nil {
			continue
		}
		conn.SendCallback("onCmdReady", participant.Position)
	}
}

func (h *Handler) sendBattleEndCallbacks(battle *combatdomain.Battle) {
	if battle == nil || h.rtmpServer == nil {
		return
	}

	for _, participant := range h.battlePlayerCharacters(battle) {
		conn := h.rtmpServer.GetConnectionByCharacterID(participant.ID)
		if conn == nil {
			continue
		}
		conn.SendCallback("onUPP", map[string]interface{}{
			"currentHp": participant.CurrentHP,
			"currentMp": participant.CurrentMP,
		})
	}
}
