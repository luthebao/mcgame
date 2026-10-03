// Open-sourced by BaoLT

// Medal (Ấn Chương) upgrade / break operations: upMedal and breakMedal.
//
// medalExp is the feature-state value state.Exp (NOT a character currency).
//
// upMedal: deducts state.Exp by GetMedal(t).UpExp and advances the medal to the next
// level in its family. The Flash client (MedalPanel.upMedal) resolves the next level
// by scanning gameDataIndex[TBL_MEDAL][basicTid] for the row whose level == level+1.
// The server Manager only exposes GetMedal(id) (no family scan accessor, and adding
// one is disallowed), so the next-level template is probed as the next sequential id
// t+1 and accepted only when GetMedal(t+1) shares the same basic_tid and has
// level == current.level+1 — i.e. families are assumed to be laid out as
// consecutive ids ordered by level (the same sequential-id assumption PRS soul-tree
// uses). If the probe fails the medal is treated as max level. See assumptions.
//
// breakMedal: credits state.Exp by GetMedal(t).Exp*count and removes/reduces the bag
// entry. Quality from GetMedal(t).Q: rare medals (Q >= rareBreakQuality) are refused
// and the RPC replies with the literal string "ban" (ErrRareProtected).
package medal

import "context"

const rareBreakQuality = 4

type OpResult struct {
	MedalExp int
	Del      int
	HasDel   bool
	BA       map[int]BagEntry
}

type medalView struct {
	basicTid float64
	level    float64
	upExp    float64
	exp      float64
	q        float64
}

func (s *Service) medal(tid int) *medalView {
	if s.gameData == nil || tid <= 0 {
		return nil
	}
	tpl := s.gameData.GetMedal(tid)
	if tpl == nil {
		return nil
	}
	return &medalView{
		basicTid: tpl.BasicTid,
		level:    tpl.Level,
		upExp:    tpl.UpExp,
		exp:      tpl.Exp,
		q:        tpl.Q,
	}
}

func (s *Service) nextLevelID(tid int) (int, bool) {
	cur := s.medal(tid)
	if cur == nil {
		return 0, false
	}
	next := s.medal(tid + 1)
	if next == nil {
		return 0, false
	}
	if next.basicTid == cur.basicTid && int(next.level) == int(cur.level)+1 {
		return tid + 1, true
	}
	return 0, false
}

func (s *Service) UpMedal(ctx context.Context, charID int64, index int) (*OpResult, error) {
	if index <= 0 {
		return nil, ErrInvalidArgs
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := state.Bag[index]
	if !ok {
		return nil, ErrSlotEmpty
	}
	tpl := s.medal(entry.T)
	if tpl == nil {
		return nil, ErrUnknownMedal
	}
	nextID, ok := s.nextLevelID(entry.T)
	if !ok {
		return nil, ErrMaxLevel
	}
	upExp := int(tpl.upExp)
	if state.Exp < upExp {
		return nil, ErrInsufficient
	}
	state.Exp -= upExp
	entry.T = nextID
	state.Bag[index] = entry
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return &OpResult{MedalExp: state.Exp, BA: map[int]BagEntry{index: entry}}, nil
}

func (s *Service) BreakMedal(ctx context.Context, charID int64, index, count, breakType int) (*OpResult, error) {
	if index <= 0 || count <= 0 {
		return nil, ErrInvalidArgs
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	entry, ok := state.Bag[index]
	if !ok {
		return nil, ErrSlotEmpty
	}
	tpl := s.medal(entry.T)
	if tpl == nil {
		return nil, ErrUnknownMedal
	}
	if int(tpl.q) >= rareBreakQuality {
		return nil, ErrRareProtected
	}
	if count > entry.N {
		count = entry.N
	}
	state.Exp += int(tpl.exp) * count

	res := &OpResult{BA: map[int]BagEntry{}}
	entry.N -= count
	if entry.N <= 0 {
		delete(state.Bag, index)
		res.Del = index
		res.HasDel = true
	} else {
		state.Bag[index] = entry
		res.BA[index] = entry
	}
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	res.MedalExp = state.Exp
	return res, nil
}
