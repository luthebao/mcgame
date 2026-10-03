// Open-sourced by BaoLT

// Box award picker: applies v38-style weighted single-pick semantics.
// Guaranteed rows (payload.guaranteed == true) are always included; the
// remaining pool contributes exactly one weighted reward per box open.
package item

import (
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type awardPicker struct {
	rng    func(minValue, maxValue int) int
	logger *zap.Logger
}

func newAwardPicker(rng func(minValue, maxValue int) int, log *zap.Logger) *awardPicker {
	return &awardPicker{rng: rng, logger: log}
}

func (p *awardPicker) Pick(itemID int, awards []*models.ItemAwardTemplate) []*models.ItemAwardTemplate {
	if len(awards) == 0 {
		return nil
	}

	var (
		guaranteed []*models.ItemAwardTemplate
		pool       []*models.ItemAwardTemplate
		maxWeight  int
	)
	for _, a := range awards {
		if a == nil {
			continue
		}
		if a.IsGuaranteed() {
			guaranteed = append(guaranteed, a)
			continue
		}
		w := int(a.Rate)
		if w <= 0 {
			continue
		}
		pool = append(pool, a)
		if w > maxWeight {
			maxWeight = w
		}
	}

	if len(pool) == 0 {
		if p.logger != nil {
			p.logger.Debug("award_picker: no pool rows, returning guaranteed only",
				zap.Int("item_id", itemID),
				zap.Int("guaranteed_size", len(guaranteed)))
		}
		return guaranteed
	}

	roll := 0
	eligibleCount := len(pool)
	if maxWeight > 0 {
		roll = p.rngOrMin(1, maxWeight)
		eligibleCount = 0
		for _, a := range pool {
			if int(a.Rate) >= roll {
				eligibleCount++
			}
		}
		if eligibleCount == 0 {
			roll = 0
			eligibleCount = len(pool)
		}
	}

	target := 0
	if eligibleCount > 1 {
		target = p.rngOrMin(0, eligibleCount-1)
	}
	picked := pickNthMatch(pool, roll, target)

	result := make([]*models.ItemAwardTemplate, 0, len(guaranteed)+1)
	result = append(result, guaranteed...)
	result = append(result, picked)

	if p.logger != nil {
		p.logger.Debug("award_picker: picked pool reward",
			zap.Int("item_id", itemID),
			zap.Int("pool_size", len(pool)),
			zap.Int("guaranteed_size", len(guaranteed)),
			zap.Int("max_weight", maxWeight),
			zap.Int("rolled_value", roll),
			zap.Int("eligible_count", eligibleCount),
			zap.Int64("picked_award_id", int64(picked.AwardID)))
	}

	return result
}

func pickNthMatch(pool []*models.ItemAwardTemplate, roll int, target int) *models.ItemAwardTemplate {
	if roll <= 0 {
		return pool[target]
	}
	seen := 0
	for _, a := range pool {
		if int(a.Rate) >= roll {
			if seen == target {
				return a
			}
			seen++
		}
	}
	return pool[len(pool)-1]
}

func (p *awardPicker) rngOrMin(minValue, maxValue int) int {
	if p.rng == nil {
		return minValue
	}
	return p.rng(minValue, maxValue)
}
