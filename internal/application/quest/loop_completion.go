// Open-sourced by BaoLT

// Round selection and the type-7 finish path for the loop-quest system.
// Split out of loop_service.go (which keeps the gate/take/cancel/repair
// surface) to stay under the repo's file-size convention.
package quest

import (
	"context"
	"errors"

	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"

	"math/rand"
)

// pickNextChild uniformly picks a level-eligible round from the lid's pool,
// avoiding the immediately-previous child when at least one alternative
// exists. See plan §7 for the documented script_get approximation.
func (s *Service) pickNextChild(ctx context.Context, charID int64, lid int, excludeQuestID int) *models.QuestTemplate {
	if s.gameDataManager == nil {
		return nil
	}
	candidates := s.gameDataManager.GetLoopChildren(loopChildPool(lid))
	if len(candidates) == 0 {
		return nil
	}
	char, err := s.GetCharacter(ctx, charID)
	if err != nil || char == nil {
		return nil
	}

	eligible := make([]*models.QuestTemplate, 0, len(candidates))
	for _, c := range candidates {
		if c == nil {
			continue
		}
		effectiveLevel := char.Level
		if int(c.IsRebirth) > 0 {
			effectiveLevel = char.RebirthLvl
		}
		if int(c.MinLevel) > 0 && effectiveLevel < int(c.MinLevel) {
			continue
		}
		if int(c.MaxLevel) > 0 && effectiveLevel > int(c.MaxLevel) {
			continue
		}
		eligible = append(eligible, c)
	}
	if len(eligible) == 0 {
		return nil
	}

	completable := make([]*models.QuestTemplate, 0, len(eligible))
	for _, c := range eligible {
		if s.loopChildIsFightable(c) {
			completable = append(completable, c)
		}
	}
	if len(completable) > 0 {
		eligible = completable
	}

	if excludeQuestID > 0 && len(eligible) > 1 {
		filtered := make([]*models.QuestTemplate, 0, len(eligible))
		for _, c := range eligible {
			if int(c.ID) != excludeQuestID {
				filtered = append(filtered, c)
			}
		}
		eligible = filtered
	}

	return eligible[rand.Intn(len(eligible))]
}

// loopChildIsFightable reports whether every kill requirement of a round
// targets a creature with a TBL_MAP_CREATURE spawn. The 12 "200 Vòng" kill
// rounds (and every Trị An / Trừ Ma round) target createBoss-only creatures
// the server cannot yet spawn; pickNextChild prefers fightable rounds and
// only falls back to the raw pool when nothing else exists, so a 924-round
// pool never deals a dead round while an all-boss pool keeps its current
// behavior until a boss-encounter channel lands.
func (s *Service) loopChildIsFightable(tpl *models.QuestTemplate) bool {
	if tpl == nil || s.gameDataManager == nil {
		return false
	}
	for _, req := range s.gameDataManager.GetQuestRequire(int(tpl.ID)) {
		if req == nil {
			continue
		}
		if int(req.Kind) == quest.RequireKindCreature && !s.gameDataManager.CreatureHasMapSpawn(int(req.ItemID)) {
			return false
		}
	}
	return true
}

// grantLoopChild creates a fresh QuestProgress for a loop round, bypassing
// CanAcceptQuest's completed/level checks since rounds are server-granted.
// A stale row (e.g. from a previous cycle) is deleted first to respect the
// unique(character_id, quest_id) constraint.
func (s *Service) grantLoopChild(ctx context.Context, charID int64, questID int) (*quest.QuestProgress, error) {
	existing, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil && !errors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}
	if existing != nil {
		if err := s.questRepo.Delete(ctx, existing.ID); err != nil {
			return nil, err
		}
	}

	objectives := s.GetInitialObjectives(questID)
	qp := quest.NewQuestProgress(charID, questID, objectives)
	if err := s.questRepo.Save(ctx, qp); err != nil {
		return nil, err
	}
	return qp, nil
}

// completeLoopChildQuest is CompleteQuest's branch for type-7 rounds
// (plan §6.2). Rewards reuse the existing consume/apply pipeline, but
// unlike a normal quest: no quest_history row is recorded and the progress
// row is always deleted (rounds repeat every cycle; recording them would
// poison completedIds/questLog and block re-grants).
func (s *Service) completeLoopChildQuest(ctx context.Context, charID int64, questID int) (*quest.QuestProgress, map[string]interface{}, error) {
	if s.loopRepo == nil || s.gameDataManager == nil {
		return nil, nil, errors.New("loop system not configured")
	}

	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, questID)
	if err != nil {
		return nil, nil, err
	}
	if err := s.syncCollectObjectives(ctx, qp); err != nil {
		return nil, nil, err
	}
	if !qp.CanComplete() {
		return nil, nil, pkgerrors.ErrInvalidInput
	}

	states, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	var state *quest.LoopState
	for _, st := range states {
		if st.Active && st.ActiveQuestID == questID {
			state = st
			break
		}
	}
	if state == nil {
		return nil, nil, pkgerrors.ErrInvalidInput
	}
	loopTpl := s.gameDataManager.GetQuestLoop(state.LoopID)
	if loopTpl == nil {
		return nil, nil, pkgerrors.ErrInvalidInput
	}

	consumedItems, deletedPetIDs, err := s.consumeCollectObjectiveItems(ctx, qp)
	if err != nil {
		return nil, nil, pkgerrors.ErrInvalidInput
	}

	rewards, err := s.applyRewards(ctx, charID, questID, qp.CompletionCount)
	if err != nil {
		s.logger.Error("Failed to apply loop child rewards", zap.Error(err))
	}
	if rewards == nil {
		rewards = make(map[string]interface{})
	}
	if len(consumedItems) > 0 {
		rewards["consumedItems"] = consumedItems
	}
	if len(deletedPetIDs) > 0 {
		rewards["consumedPets"] = deletedPetIDs
	}

	if err := s.questRepo.Delete(ctx, qp.ID); err != nil {
		s.logger.Warn("Failed to delete finished loop child progress", zap.Error(err))
	}

	npcIDs := make([]int, 0, 3)
	if int(loopTpl.Nid) > 0 {
		npcIDs = append(npcIDs, int(loopTpl.Nid))
	}
	if questTpl := s.gameDataManager.GetQuest(questID); questTpl != nil && int(questTpl.FinishNPC) > 0 {
		npcIDs = append(npcIDs, int(questTpl.FinishNPC))
	}

	newFt := state.Ft + 1
	var nextQP *quest.QuestProgress
	if newFt < int(loopTpl.Num) {
		child := s.pickNextChild(ctx, charID, state.LoopID, questID)
		if child == nil {
			s.logger.Warn("No eligible next loop child; ending cycle early",
				zap.Int64("character_id", charID), zap.Int("loop_id", state.LoopID))
			if _, err := s.loopRepo.Deactivate(ctx, charID, state.LoopID); err != nil {
				s.logger.Warn("Failed to deactivate loop after empty pool", zap.Error(err))
			}
		} else {
			state.Ft = newFt
			state.ActiveQuestID = int(child.ID)
			if _, err := s.loopRepo.Upsert(ctx, state); err != nil {
				return nil, nil, err
			}
			nextQP, err = s.grantLoopChild(ctx, charID, int(child.ID))
			if err != nil {
				return nil, nil, err
			}
			if int(child.FinishNPC) > 0 {
				npcIDs = append(npcIDs, int(child.FinishNPC))
			}
		}
	} else {
		if _, err := s.loopRepo.Deactivate(ctx, charID, state.LoopID); err != nil {
			return nil, nil, err
		}
	}

	rewards["loop"] = map[string]interface{}{"id": state.LoopID, "ft": newFt}
	rewards["loopNextQuest"] = nextQP
	rewards["loopNpcIDs"] = dedupeInts(npcIDs)

	s.logger.Info("Loop child completed",
		zap.Int64("character_id", charID), zap.Int("loop_id", state.LoopID),
		zap.Int("quest_id", questID), zap.Int("ft", newFt))

	return qp, rewards, nil
}

func dedupeInts(ids []int) []int {
	seen := make(map[int]bool, len(ids))
	result := make([]int, 0, len(ids))
	for _, id := range ids {
		if id <= 0 || seen[id] {
			continue
		}
		seen[id] = true
		result = append(result, id)
	}
	return result
}
