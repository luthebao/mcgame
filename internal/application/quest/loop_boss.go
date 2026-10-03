// Open-sourced by BaoLT

// Loop-boss pairing table and per-character summon registry for the Trị An
// (item-summon) and Trừ Ma (map-presence) loop-quest kill rounds. See
// docs/plans/2026-07-05_01_LOOP_BOSS_SUMMON.md and
// .claude/agent-memory/flash-client-researcher/reference_loop_boss_mechanism.md
// for the client-contract research behind this table. The registry is
// in-memory only by design: losing it on restart is fine because the order
// item is never consumed on use, so re-using it re-summons idempotently.
package quest

import (
	"context"
	"errors"
	"slices"

	"mcgame-server/internal/domain/quest"
	pkgerrors "mcgame-server/pkg/errors"
)

// LoopBossSpec pairs a TBL_QUEST type=7 round with its boss NPC. ItemID is 0
// for map-presence rounds (Trừ Ma); Maps is nil for item-summon rounds
// (Trị An), which instead summon on the character's current map.
type LoopBossSpec struct {
	NpcID  int
	ItemID int
	Maps   []int
}

var loopBossByQuest = map[int]LoopBossSpec{
	4671: {NpcID: 1143, ItemID: 2263},
	7667: {NpcID: 2167, ItemID: 4843},
	7668: {NpcID: 1173, Maps: []int{10, 38, 31}},
	7669: {NpcID: 2169, Maps: []int{27}},
	7670: {NpcID: 2168, Maps: []int{27}},
}

var loopBossByNPC = buildLoopBossByNPC()
var loopBossByItem = buildLoopBossByItem()

func buildLoopBossByNPC() map[int]int {
	idx := make(map[int]int, len(loopBossByQuest))
	for qid, spec := range loopBossByQuest {
		idx[spec.NpcID] = qid
	}
	return idx
}

func buildLoopBossByItem() map[int]int {
	idx := make(map[int]int, len(loopBossByQuest))
	for qid, spec := range loopBossByQuest {
		if spec.ItemID > 0 {
			idx[spec.ItemID] = qid
		}
	}
	return idx
}

// LoopBossSpec looks up the boss pairing for a loop-child quest id.
func (s *Service) LoopBossSpec(questID int) (LoopBossSpec, bool) {
	spec, ok := loopBossByQuest[questID]
	return spec, ok
}

// LoopBossItemQuest resolves an order-item template id to its paired
// loop-child quest id (Trị An only).
func (s *Service) LoopBossItemQuest(itemTemplateID int) (int, bool) {
	qid, ok := loopBossByItem[itemTemplateID]
	return qid, ok
}

// LoopBossNpcQuest resolves a boss NPC id to its paired loop-child quest id.
func (s *Service) LoopBossNpcQuest(npcID int) (int, bool) {
	qid, ok := loopBossByNPC[npcID]
	return qid, ok
}

// LoopBossSummon is one character's currently-registered Trị An summon.
type LoopBossSummon struct {
	QuestID int
	NpcID   int
	MapID   int
	X       int
	Y       int
}

// LoopBossSceneEntry is a boss ready to be pushed to the client, either from
// a live summon or from a map-presence (Trừ Ma) round.
type LoopBossSceneEntry struct {
	NpcID   int
	Name    string
	ResCode int64
	PosX    int
	PosY    int
}

func loopRoundHasUnfinishedKill(objectives []quest.Objective) bool {
	for _, o := range objectives {
		if o.Type == quest.ObjectiveKillMonster && !o.IsComplete() {
			return true
		}
	}
	return false
}

func (s *Service) isActiveLoopRound(ctx context.Context, charID int64, questID int) (bool, error) {
	states, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return false, err
	}
	for _, st := range states {
		if st.Active && st.ActiveQuestID == questID {
			return true, nil
		}
	}
	return false, nil
}

// SummonLoopBoss handles a Trị An order-item use: it validates that the item
// is paired to a boss, that the pairing quest is the character's active loop
// round, and that round's kill objective is still unfinished, then registers
// a summon at (x+80, y) replacing any previous one for this character.
func (s *Service) SummonLoopBoss(ctx context.Context, charID int64, itemTemplateID, mapID, x, y int) (*LoopBossSummon, error) {
	if s.loopRepo == nil || s.questRepo == nil {
		return nil, errors.New("loop system not configured")
	}
	qid, ok := s.LoopBossItemQuest(itemTemplateID)
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	spec, ok := s.LoopBossSpec(qid)
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	active, err := s.isActiveLoopRound(ctx, charID, qid)
	if err != nil {
		return nil, err
	}
	if !active {
		return nil, pkgerrors.ErrInvalidInput
	}
	qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, qid)
	if err != nil || qp == nil || !loopRoundHasUnfinishedKill(qp.Objectives) {
		return nil, pkgerrors.ErrInvalidInput
	}

	summon := &LoopBossSummon{QuestID: qid, NpcID: spec.NpcID, MapID: mapID, X: x + 80, Y: y}
	s.loopBossSummonsMu.Lock()
	if s.loopBossSummons == nil {
		s.loopBossSummons = make(map[int64]*LoopBossSummon)
	}
	s.loopBossSummons[charID] = summon
	s.loopBossSummonsMu.Unlock()
	return summon, nil
}

// ActiveLoopBossForScene returns every loop boss that should be present on
// mapID for charID right now: the character's registered Trị An summon (if
// it is on this map) plus any Trừ Ma boss whose allowed maps include mapID.
// Both kinds are excluded once their round's kill objective is complete.
func (s *Service) ActiveLoopBossForScene(ctx context.Context, charID int64, mapID int) []LoopBossSceneEntry {
	var entries []LoopBossSceneEntry
	if s.gameDataManager == nil {
		return entries
	}

	s.loopBossSummonsMu.Lock()
	summon := s.loopBossSummons[charID]
	s.loopBossSummonsMu.Unlock()
	if summon != nil && summon.MapID == mapID {
		if qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, summon.QuestID); err == nil && qp != nil && loopRoundHasUnfinishedKill(qp.Objectives) {
			if tpl := s.gameDataManager.GetNPC(summon.NpcID); tpl != nil {
				entries = append(entries, LoopBossSceneEntry{
					NpcID: summon.NpcID, Name: tpl.Name, ResCode: int64(tpl.ResCode), PosX: summon.X, PosY: summon.Y,
				})
			}
		}
	}

	if s.loopRepo == nil {
		return entries
	}
	states, err := s.loopRepo.GetAll(ctx, charID)
	if err != nil {
		return entries
	}
	for _, st := range states {
		if !st.Active || st.ActiveQuestID <= 0 {
			continue
		}
		spec, ok := s.LoopBossSpec(st.ActiveQuestID)
		if !ok || len(spec.Maps) == 0 || !slices.Contains(spec.Maps, mapID) {
			continue
		}
		qp, err := s.questRepo.FindByCharacterAndQuest(ctx, charID, st.ActiveQuestID)
		if err != nil || qp == nil || !loopRoundHasUnfinishedKill(qp.Objectives) {
			continue
		}
		tpl := s.gameDataManager.GetNPC(spec.NpcID)
		if tpl == nil {
			continue
		}
		posX, posY := int(tpl.PosX), int(tpl.PosY)
		if posX == 0 && posY == 0 {
			posX, posY = 1000, 1000
		}
		entries = append(entries, LoopBossSceneEntry{NpcID: spec.NpcID, Name: tpl.Name, ResCode: int64(tpl.ResCode), PosX: posX, PosY: posY})
	}
	return entries
}

// ClearLoopBossSummon drops charID's registered Trị An summon, called at
// round turn-in or cancellation.
func (s *Service) ClearLoopBossSummon(charID int64) {
	s.loopBossSummonsMu.Lock()
	delete(s.loopBossSummons, charID)
	s.loopBossSummonsMu.Unlock()
}
