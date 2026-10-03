// Open-sourced by BaoLT

// Loop-quest system (TBL_QUEST_LOOP + TBL_QUEST type=7 children), the
// "Nhiệm Vụ Vòng" repeatable series. All server-side gates (level, cooldown,
// guild membership, active-instance) live here; the client trusts
// loopInfo.d[lid].canTake and fires takeLoop/cancelLoop with zero local
// validation. See docs/plans/2026-07-04_01_QUEST_LOOP_SYSTEM.md.
package quest

import (
	"context"
	"errors"
	"strconv"
	"time"

	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/gamedata/predef"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

// loopGuildLid is the only live loop requiring guild membership (Nhiệm Vụ
// Bang Hội). loopChildPoolLid1Override handles the one pool/lid mismatch:
// the disabled "60 Vòng" loop (lid 1) draws children from pool 10.
const (
	loopGuildLid              = 2
	loopChildPoolLid1         = 1
	loopChildPoolLid1Override = 10
)

// GuildMembership is a narrow seam into the guild service so this package
// never depends on internal/application/guild directly; wired in main.go.
type GuildMembership interface {
	IsInGuild(ctx context.Context, characterID int64) (bool, error)
}

func (s *Service) SetLoopRepository(repo quest.LoopRepository) {
	s.loopRepo = repo
}

func (s *Service) SetGuildMembership(gm GuildMembership) {
	s.guildMembership = gm
}

// IsLoopChild reports whether questID is a TBL_QUEST type=7 round.
func (s *Service) IsLoopChild(questID int) bool {
	if s.gameDataManager == nil {
		return false
	}
	tpl := s.gameDataManager.GetQuest(questID)
	return tpl != nil && int(tpl.Type) == predef.QuestTypeLoop
}

func loopChildPool(lid int) int {
	if lid == loopChildPoolLid1 {
		return loopChildPoolLid1Override
	}
	return lid
}

func nowMs() int64 {
	return time.Now().UnixMilli()
}

// CanTakeLoop mirrors the server-authoritative gate the client's
// loopInfo.d[lid].canTake boolean folds every check into.
func (s *Service) CanTakeLoop(ctx context.Context, charID int64, lid int) (bool, string) {
	if s.gameDataManager == nil || s.loopRepo == nil {
		return false, "loop system not configured"
	}
	loopTpl := s.gameDataManager.GetQuestLoop(lid)
	if loopTpl == nil {
		return false, "unknown loop"
	}
	char, err := s.GetCharacter(ctx, charID)
	if err != nil || char == nil {
		return false, "character not found"
	}

	minLevel := int(loopTpl.MinLevel)
	maxLevel := int(loopTpl.MaxLevel)
	if minLevel > 0 && char.Level < minLevel {
		return false, "level too low"
	}
	if maxLevel > 0 && char.Level > maxLevel {
		return false, "level too high"
	}

	if lid == loopGuildLid {
		if s.guildMembership == nil {
			return false, "guild membership check unavailable"
		}
		inGuild, err := s.guildMembership.IsInGuild(ctx, charID)
		if err != nil || !inGuild {
			return false, "guild membership required"
		}
	}

	states, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return false, "failed to load loop state"
	}
	for _, st := range states {
		if st.LoopID != lid {
			continue
		}
		if st.Active {
			return false, "loop already active"
		}
		if nowMs() < st.CooldownEndsAtMs(int(loopTpl.Refresh)) {
			return false, "cooldown active"
		}
	}

	return true, ""
}

// TakeLoop creates a new active loop instance and grants its first round.
func (s *Service) TakeLoop(ctx context.Context, charID int64, lid int) (*quest.LoopState, *quest.QuestProgress, error) {
	canTake, reason := s.CanTakeLoop(ctx, charID, lid)
	if !canTake {
		return nil, nil, pkgerrors.Wrap(pkgerrors.ErrInvalidInput, reason)
	}

	child := s.pickNextChild(ctx, charID, lid, 0)
	if child == nil {
		return nil, nil, errors.New("no eligible loop child quest")
	}

	state := quest.NewLoopState(charID, lid, nowMs())
	state.ActiveQuestID = int(child.ID)
	saved, err := s.loopRepo.Upsert(ctx, state)
	if err != nil {
		return nil, nil, err
	}

	qp, err := s.grantLoopChild(ctx, charID, int(child.ID))
	if err != nil {
		return nil, nil, err
	}

	s.logger.Info("Loop taken",
		zap.Int64("character_id", charID), zap.Int("loop_id", lid), zap.Int("child_quest_id", int(child.ID)))
	return saved, qp, nil
}

// CancelLoop deactivates the active instance and drops its current round.
// take_date_ms is preserved so the refresh cooldown still anchors correctly.
func (s *Service) CancelLoop(ctx context.Context, charID int64, lid int) (*quest.LoopState, *quest.QuestProgress, error) {
	if s.loopRepo == nil {
		return nil, nil, errors.New("loop system not configured")
	}
	states, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return nil, nil, err
	}
	var state *quest.LoopState
	for _, st := range states {
		if st.LoopID == lid && st.Active {
			state = st
			break
		}
	}
	if state == nil {
		return nil, nil, pkgerrors.ErrNotFound
	}

	var childQP *quest.QuestProgress
	if state.ActiveQuestID > 0 {
		childQP, err = s.questRepo.FindByCharacterAndQuest(ctx, charID, state.ActiveQuestID)
		if err != nil && !errors.Is(err, pkgerrors.ErrNotFound) {
			return nil, nil, err
		}
		if childQP != nil {
			if err := s.questRepo.Delete(ctx, childQP.ID); err != nil {
				return nil, nil, err
			}
		}
	}

	if _, err := s.loopRepo.Deactivate(ctx, charID, lid); err != nil {
		return nil, nil, err
	}

	s.logger.Info("Loop cancelled", zap.Int64("character_id", charID), zap.Int("loop_id", lid))
	return state, childQP, nil
}

// GetActiveLoopStates returns every currently-active loop instance, used to
// seed the client's player.loopList at login (initQuestManager's "l" field).
func (s *Service) GetActiveLoopStates(ctx context.Context, charID int64) ([]*quest.LoopState, error) {
	if s.loopRepo == nil {
		return nil, nil
	}
	all, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return nil, err
	}
	active := make([]*quest.LoopState, 0, len(all))
	for _, st := range all {
		if st.Active {
			active = append(active, st)
		}
	}
	return active, nil
}

// RepairLoop backs the loopRepaire RPC (§11.3): if the active instance's
// current round has no live QuestProgress (a lost child), it is
// re-created; if it already exists, it is returned unchanged so the caller
// can simply re-push onAddChaQuest. No active instance is a no-op.
func (s *Service) RepairLoop(ctx context.Context, charID int64, lid int) (*quest.QuestProgress, error) {
	if s.loopRepo == nil {
		return nil, nil
	}
	states, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return nil, err
	}
	var state *quest.LoopState
	for _, st := range states {
		if st.LoopID == lid && st.Active {
			state = st
			break
		}
	}
	if state == nil || state.ActiveQuestID <= 0 {
		return nil, nil
	}

	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, state.ActiveQuestID)
	if err != nil && !errors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}
	if qp == nil {
		qp, err = s.grantLoopChild(ctx, charID, state.ActiveQuestID)
		if err != nil {
			return nil, err
		}
	}
	if err := s.syncCollectObjectives(ctx, qp); err != nil {
		return nil, err
	}
	return qp, nil
}

// GetLoopInfoForNpc builds the {flag, d: {<lid>: {canTake}}} payload for
// npcFuncInit when npcID hosts one or more TBL_QUEST_LOOP entries. The
// client reads only the canTake boolean, so every gate must land here.
func (s *Service) GetLoopInfoForNpc(ctx context.Context, charID int64, npcID int) (map[string]interface{}, bool) {
	if s.gameDataManager == nil {
		return nil, false
	}
	d := make(map[string]interface{})
	for _, loopTpl := range s.gameDataManager.GetAllQuestLoops() {
		if loopTpl == nil || int(loopTpl.Nid) != npcID {
			continue
		}
		canTake, _ := s.CanTakeLoop(ctx, charID, int(loopTpl.ID))
		d[strconv.Itoa(int(loopTpl.ID))] = map[string]interface{}{"canTake": canTake}
	}
	if len(d) == 0 {
		return nil, false
	}
	return map[string]interface{}{"flag": true, "d": d}, true
}
