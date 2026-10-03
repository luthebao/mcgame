// Open-sourced by BaoLT

// Shared battle-start pet callback helpers.
package combat

import (
	"fmt"
	"strconv"

	combatdomain "mcgame-server/internal/domain/combat"

	"go.uber.org/zap"
)

type battleStartCallbackSender interface {
	SendCallback(method string, args ...interface{}) error
}

const (
	clientCharStateNormal = 1
	clientCharStateBattle = 5
)

func sendBattleStartCallbacks(conn battleStartCallbackSender, characterID string, participants []*combatdomain.Participant, logger *zap.Logger) {
	if conn == nil {
		return
	}

	sendBattleStartPetCurrentHPCallback(conn, characterID, participants, logger)
	sendBattleStartStateCallback(conn, characterID, participants, logger)
}

func sendBattleStartPetCurrentHPCallback(conn battleStartCallbackSender, characterID string, participants []*combatdomain.Participant, logger *zap.Logger) {
	if conn == nil {
		return
	}

	if characterID == "" {
		participant, ok := firstPlayerCharacterParticipant(participants)
		if !ok {
			return
		}
		characterID = fmt.Sprintf("%d", participant.EntityID)
	}

	participant, ok := playerBattlePetParticipantByOwner(participants, characterID)
	if !ok {
		participant, ok = firstPlayerBattlePetParticipant(participants)
	}
	if !ok {
		return
	}

	currentHP := strconv.Itoa(participant.CurrentHP)
	if err := conn.SendCallback("onUpdatePet", float64(participant.EntityID), "currentHp", currentHP); err != nil {
		if logger != nil {
			logger.Warn("Failed to send battle-start pet HP callback", zap.Error(err))
		}
		return
	}

	currentMP := strconv.Itoa(participant.CurrentMP)
	if err := conn.SendCallback("onUpdatePet", float64(participant.EntityID), "currentMp", currentMP); err != nil {
		if logger != nil {
			logger.Warn("Failed to send battle-start pet MP callback", zap.Error(err))
		}
		return
	}

	if logger != nil {
		logger.Debug("Sent battle-start pet HP/MP callbacks",
			zap.Int64("pet_id", participant.EntityID),
			zap.String("current_hp", currentHP),
			zap.String("current_mp", currentMP))
	}
}

func sendBattleStartStateCallback(conn battleStartCallbackSender, characterID string, participants []*combatdomain.Participant, logger *zap.Logger) {
	if conn == nil {
		return
	}

	if characterID == "" {
		participant, ok := firstPlayerCharacterParticipant(participants)
		if !ok {
			return
		}
		characterID = fmt.Sprintf("%d", participant.EntityID)
	}

	payload := map[string]interface{}{
		"cid":   characterID,
		"state": clientCharStateBattle,
	}
	if err := conn.SendCallback("onSetCharState", payload); err != nil {
		if logger != nil {
			logger.Warn("Failed to send battle-start state callback", zap.Error(err))
		}
		return
	}

	if logger != nil {
		logger.Debug("Sent battle-start state callback",
			zap.String("character_id", characterID),
			zap.Int("state", clientCharStateBattle))
	}
}

func playerBattlePetParticipantByOwner(participants []*combatdomain.Participant, ownerID string) (*combatdomain.Participant, bool) {
	for _, participant := range participants {
		if participant == nil {
			continue
		}
		if participant.EntityType != combatdomain.ParticipantTypePet {
			continue
		}
		if participant.Side != combatdomain.SidePlayer {
			continue
		}
		if strconv.FormatInt(participant.OwnerID, 10) != ownerID {
			continue
		}
		return participant, true
	}
	return nil, false
}

func firstPlayerBattlePetParticipant(participants []*combatdomain.Participant) (*combatdomain.Participant, bool) {
	for _, participant := range participants {
		if participant == nil {
			continue
		}
		if participant.EntityType != combatdomain.ParticipantTypePet {
			continue
		}
		if participant.Side != combatdomain.SidePlayer {
			continue
		}
		return participant, true
	}
	return nil, false
}

func firstPlayerCharacterParticipant(participants []*combatdomain.Participant) (*combatdomain.Participant, bool) {
	for _, participant := range participants {
		if participant == nil {
			continue
		}
		if participant.EntityType != combatdomain.ParticipantTypeCharacter {
			continue
		}
		if participant.Side != combatdomain.SidePlayer {
			continue
		}
		return participant, true
	}

	return nil, false
}
