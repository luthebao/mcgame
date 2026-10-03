// Open-sourced by BaoLT

// Wish-Tree draw RPCs (getLottoData / lottoByClient). The draw pool is TBL_PLAN filtered
// by the t (type) column and weighted by the r column; a single draw picks one plan row
// proportional to r and deposits {ti,ii,n,q,b} into the lotto holding-bag, from where the
// player claims it via the existing getSingle/getAll RPCs.
//
// Costs and the daily free-quota are not in any data table; they are taken verbatim from
// the client (Language.as wish-button labels): per draw-type x{1,5,10} gold (vàng) costs,
// and a 5-per-day free allowance for type-1 single wishes. Both are documented calibration
// constants — retune against a live-log if the real values differ.
//
// Draw deducts gold (DB-backed char update) before depositing winnings (feature-state
// upsert) — consume-then-credit, so a save failure cannot mint free items. The two writes
// are not in one transaction; like every other feature service here it relies on the
// per-connection serial RTMP dispatch (monolith deploy) to avoid a same-character race.
package lotto

import (
	"context"
	"errors"
	"sort"
	"strconv"
	"time"

	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const (
	lottoTypeMin      = 1
	lottoTypeMax      = 3
	lottoDisplaySlots = 18
	lottoDisplayTypes = 4
	lottoBagCap       = 500
	freeWishType      = 1
	freeWishDailyMax  = 5
)

var (
	ErrLottoInvalidType  = errors.New("lotto: invalid wish type")
	ErrLottoInvalidNum   = errors.New("lotto: invalid wish count")
	ErrLottoNoPool       = errors.New("lotto: empty draw pool")
	ErrLottoNoGameData   = errors.New("lotto: game data unavailable")
	ErrLottoNoCharRepo   = errors.New("lotto: character repository unavailable")
	ErrLottoInsufficient = errors.New("lotto: not enough gold")
	ErrLottoBagFull      = errors.New("lotto: holding bag full")
)

var lottoGoldCost = map[int]map[int]int64{
	1: {1: 20, 5: 90, 10: 160},
	2: {1: 100, 5: 450, 10: 800},
	3: {1: 200, 5: 900, 10: 1600},
}

func lottoToday() string { return time.Now().Format("2006-01-02") }

func (s *Service) GetLottoData(ctx context.Context, charID int64) (map[string]any, error) {
	if s.gameData == nil {
		return nil, ErrLottoNoGameData
	}
	award := make([]any, 0, lottoDisplayTypes)
	for t := 1; t <= lottoDisplayTypes; t++ {
		award = append(award, s.displayPoolIDs(t))
	}
	return map[string]any{
		"lottoAward":      award,
		"highestAwardArr": []any{},
	}, nil
}

func (s *Service) displayPoolIDs(t int) []any {
	pool := s.gameData.PlansByType(t)
	sort.Slice(pool, func(i, j int) bool { return pool[i].ID < pool[j].ID })
	ids := make([]any, 0, lottoDisplaySlots)
	for _, p := range pool {
		if len(ids) >= lottoDisplaySlots {
			break
		}
		ids = append(ids, p.ID)
	}
	return ids
}

func (s *Service) Draw(ctx context.Context, charID int64, drawType, num int) ([]any, error) {
	if drawType < lottoTypeMin || drawType > lottoTypeMax {
		return nil, ErrLottoInvalidType
	}
	cost, ok := lottoGoldCost[drawType][num]
	if !ok {
		return nil, ErrLottoInvalidNum
	}
	if s.gameData == nil {
		return nil, ErrLottoNoGameData
	}
	pool := s.gameData.PlansByType(drawType)
	if len(pool) == 0 {
		return nil, ErrLottoNoPool
	}

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	today := lottoToday()
	if state.FreeWishDay != today {
		state.FreeWishN = 0
		state.FreeWishDay = today
	}

	bag := state.bag(BagLotto)
	if len(*bag)+num > lottoBagCap {
		return nil, ErrLottoBagFull
	}

	free := drawType == freeWishType && num == 1 && state.FreeWishN < freeWishDailyMax
	if free {
		cost = 0
	}

	if cost > 0 {
		if s.chars == nil {
			return nil, ErrLottoNoCharRepo
		}
		char, cerr := s.chars.FindByID(ctx, charID)
		if cerr != nil {
			return nil, cerr
		}
		if char == nil {
			return nil, ErrLottoNoCharRepo
		}
		if char.Gold < cost {
			return nil, ErrLottoInsufficient
		}
		char.Gold -= cost
		if uerr := s.chars.Update(ctx, char); uerr != nil {
			return nil, uerr
		}
	}

	for i := 0; i < num; i++ {
		*bag = append(*bag, planToEntry(s.rollPlan(pool)))
	}
	if free {
		state.FreeWishN++
	}
	if serr := s.saveState(ctx, charID, state); serr != nil {
		s.logger.Error("lotto: draw rolled but bag save failed; gold already deducted",
			zap.Int64("char_id", charID),
			zap.Int("type", drawType),
			zap.Int("num", num),
			zap.Error(serr))
		return nil, serr
	}
	return entriesToList(*bag), nil
}

func (s *Service) rollPlan(pool []*models.PlanTemplate) *models.PlanTemplate {
	total := 0.0
	for _, p := range pool {
		if p.R > 0 {
			total += p.R
		}
	}
	if total <= 0 {
		s.rngMu.Lock()
		idx := s.rng.Intn(len(pool))
		s.rngMu.Unlock()
		return pool[idx]
	}
	s.rngMu.Lock()
	roll := s.rng.Float64() * total
	s.rngMu.Unlock()
	acc := 0.0
	for _, p := range pool {
		if p.R <= 0 {
			continue
		}
		acc += p.R
		if roll < acc {
			return p
		}
	}
	return pool[len(pool)-1]
}

func planToEntry(p *models.PlanTemplate) LottoEntry {
	n := int(p.N)
	if n <= 0 {
		n = 1
	}
	return LottoEntry{
		Ti: strconv.Itoa(int(p.Ti)),
		Ii: strconv.Itoa(int(p.Ii)),
		N:  n,
		Q:  strconv.FormatFloat(p.Q, 'f', -1, 64),
		B:  int(p.B),
	}
}
