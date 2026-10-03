// Open-sourced by BaoLT

// Fairy adoption: the NPC-driven free-fairy grant. The adopt_free_fairy NPC dialog
// option (there is no client RPC for adoption) creates a fairy instance from a
// TBL_FAIRY_TEMPALTE row and returns its wire DTO for the onAddFairy push; the
// client appends it to the roster by id and refreshes, with no initCharFairy
// re-fetch. One instance per template id: a duplicate adopt is refused so the free
// angel fairy can be granted exactly once. Base stats come from the template (the
// new instance starts at level 1 / grow level 0); daily counters are initialised via
// refreshDaily so the immediate onAddFairy DTO and the login roster agree.
//
// BuyFairy is the paid variant for the server-owned "buy_other_fairy" NPC option:
// same build path, but it charges FairyBuyGoldCost (a documented assumption) before
// granting, consume-then-credit so a save failure leaves the player charged, never
// the reverse. PurchasableFairies lists every template except the free angel.
package fairy

import (
	"context"
	"errors"
	"fmt"
	"sort"
)

// FreeFairyTid is the default free "angel" fairy (TBL_FAIRY_TEMPALTE id 1,
// "Thiên Sứ Poli"), granted by the adopt_free_fairy NPC option.
const FreeFairyTid = 1

var ErrFairyAlreadyOwned = errors.New("tinh linh: đã sở hữu tinh linh này")

func (s *Service) Adopt(ctx context.Context, charID int64, tid int) (map[string]interface{}, error) {
	if tid <= 0 {
		return nil, ErrFairyMissing
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	for _, f := range state.Fairies {
		if f != nil && f.Tid == tid {
			return nil, ErrFairyAlreadyOwned
		}
	}
	adopted := s.buildAdoptedFairy(tid, nextFairyID(state))
	state.Fairies[adopted.ID] = adopted
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return adopted.toWire(), nil
}

func (s *Service) buildAdoptedFairy(tid int, id int64) *Fairy {
	f := newFairy(id)
	f.Tid = tid
	s.refreshDaily(f)
	if s.gameData != nil {
		if tpl := s.gameData.GetFairyTempalte(tid); tpl != nil {
			f.Name = tpl.Name
			f.Sta, f.StaG = tpl.Sta, tpl.StaG
			f.Ste, f.SteG = tpl.Ste, tpl.SteG
			f.Agi, f.AgiG = tpl.Agi, tpl.AgiG
			f.Inte, f.InteG = tpl.Inte, tpl.InteG
			f.Ener, f.EnerG = tpl.Ener, tpl.EnerG
			f.Cc = int(tpl.Cc)
		}
	}
	return f
}

func nextFairyID(state *State) int64 {
	var maxID int64
	for id := range state.Fairies {
		if id > maxID {
			maxID = id
		}
	}
	return maxID + 1
}

// FairyBuyGoldCost is the gold price for buying a non-free fairy from the NPC.
// TBL_FAIRY_TEMPALTE carries no price column and "buy_other_fairy" appears in no
// client .as file (the NPC dialog is server-owned), so this is a documented
// assumption pinned to the client's 550-gold fairy-skin unlock cost
// (Language.FAIRY_MANAGER_PANEL_U[93]). Tune if a live capture shows otherwise.
const FairyBuyGoldCost = 550

// PurchasableFairy describes a fairy offered for sale by the NPC dialog.
type PurchasableFairy struct {
	Tid  int
	Name string
	Cost int
}

func (s *Service) PurchasableFairies() []PurchasableFairy {
	if s == nil || s.gameData == nil {
		return nil
	}
	tpls := s.gameData.GetAllFairyTempaltes()
	out := make([]PurchasableFairy, 0, len(tpls))
	for _, t := range tpls {
		if t == nil || t.GetID() == FreeFairyTid {
			continue
		}
		out = append(out, PurchasableFairy{Tid: t.GetID(), Name: t.Name, Cost: FairyBuyGoldCost})
	}
	sort.Slice(out, func(i, j int) bool { return out[i].Tid < out[j].Tid })
	return out
}

func (s *Service) BuyFairy(ctx context.Context, charID int64, tid int) (map[string]interface{}, error) {
	if tid <= 0 || tid == FreeFairyTid {
		return nil, ErrFairyMissing
	}
	if s.gameData == nil || s.gameData.GetFairyTempalte(tid) == nil {
		return nil, ErrFairyMissing
	}
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	for _, f := range state.Fairies {
		if f != nil && f.Tid == tid {
			return nil, ErrFairyAlreadyOwned
		}
	}
	char, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if err := deductGold(char, FairyBuyGoldCost); err != nil {
		return nil, err
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, fmt.Errorf("fairy: deduct buy cost: %w", err)
	}
	adopted := s.buildAdoptedFairy(tid, nextFairyID(state))
	state.Fairies[adopted.ID] = adopted
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return adopted.toWire(), nil
}
