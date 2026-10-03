// Open-sourced by BaoLT

package combat

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/combat"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (s *Service) StartPVPBattle(ctx context.Context, attackerID, targetID int64, mapID, channelID int) (*combat.Battle, error) {
	if attackerID == 0 || targetID == 0 || attackerID == targetID {
		return nil, pkgerrors.ErrInvalidArgs
	}

	for _, charID := range []int64{attackerID, targetID} {
		existing, _ := s.battleRepo.GetByParticipant(fmt.Sprintf("%d", charID))
		if existing != nil && existing.IsActive() {
			if !s.resolveDefeatedPlayerBattle(ctx, charID, existing) {
				return nil, pkgerrors.ErrInBattle
			}
		}
	}

	battle := combat.NewBattle(combat.BattleTypePVP, mapID)
	battle.ChannelID = channelID

	attackerChar, err := s.buildPlayerParticipant(ctx, attackerID, combat.PosPlayerCharCenter.ToInt())
	if err != nil {
		return nil, err
	}
	battle.AddParticipant(attackerChar)
	s.addPetParticipant(ctx, battle, attackerID, combat.PosPlayerPetCenter.ToInt())

	targetChar, err := s.buildPlayerParticipant(ctx, targetID, combat.PosEnemyCharCenter.ToInt())
	if err != nil {
		return nil, err
	}
	targetChar.Side = combat.SideEnemy
	battle.AddParticipant(targetChar)

	if targetPet, _ := s.getBattlePet(ctx, targetID); targetPet != nil {
		targetPetParticipant := s.buildPetParticipantFromPet(targetPet, targetID, combat.PosEnemyPetCenter.ToInt())
		if targetPetParticipant != nil {
			targetPetParticipant.Side = combat.SideEnemy
			battle.AddParticipant(targetPetParticipant)
		}
	}

	battle.Start()
	s.initBattleFieldID(ctx, battle, attackerID)

	if err := s.battleRepo.Store(battle); err != nil {
		return nil, err
	}

	s.logger.Info("PVP battle started",
		zap.String("battle_id", battle.ID),
		zap.String("battle_field_id", battle.BattleFieldID),
		zap.Int64("attacker", attackerID),
		zap.Int64("target", targetID),
		zap.Int("map_id", mapID))

	return battle, nil
}
