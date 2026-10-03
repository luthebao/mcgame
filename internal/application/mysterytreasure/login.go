// Open-sourced by BaoLT

// Login snapshot assembly for the cData.mysTreasure blob. BuildLoginBlob emits the
// seven keys the Flash client parses, sourcing the persisted halves from real state:
// mysBag + makeData (learnedRec/skiLvl/skiPt) + activeObj + addTimes + makeLimitTimes +
// mysBook (all this feature's persisted state), plus chipBag from the rune chip store via
// the injected ChipBagProvider (the panel shares that store — see the mysterytreasure
// handler's onGetChipBagData delegation).
//
// addTimes / makeLimitTimes emit {n, t:"month0idx|day"}; the client compares t to today and
// treats a stale date as a daily reset, so a previous-day blob re-emits harmlessly.
package mysterytreasure

import "context"

type ChipBagProvider interface {
	ChipBagLoginWire(ctx context.Context, charID int64) map[string]interface{}
}

func (s *Service) BuildLoginBlob(ctx context.Context, charID int64) map[string]interface{} {
	st, err := s.Load(ctx, charID)
	if err != nil {
		s.logger.Warn("mysteryTreasure: login blob load failed; emitting defaults")
		st = DefaultState()
	}

	learnedRec := make(map[string]interface{}, len(st.LearnedRec))
	for k, v := range st.LearnedRec {
		learnedRec[k] = float64(v)
	}

	chipBag := map[string]interface{}{}
	if s.chipProvider != nil {
		if wire := s.chipProvider.ChipBagLoginWire(ctx, charID); wire != nil {
			chipBag = wire
		}
	}

	return map[string]interface{}{
		"mysBag":  BagToWire(st.Bag),
		"chipBag": chipBag,
		"makeData": map[string]interface{}{
			"learnedRec": learnedRec,
			"skiLvl":     float64(st.SkilLvl),
			"skiPt":      float64(st.SkiPt),
		},
		"activeObj":      ActiveObjToWire(st.ActiveObj),
		"addTimes":       dailyCounterToWire(st.AddTimes),
		"makeLimitTimes": dailyCounterToWire(st.MakeLimit),
		"mysBook":        MysBookToWire(st.MysBook),
	}
}
