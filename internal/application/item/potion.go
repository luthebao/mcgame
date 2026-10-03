// Open-sourced by BaoLT

// Potion heal-amount lookup tables and bulk recovery service method.
// Heal amounts are hardcoded to match the Flash client (PortraitCanvas.as)
// because item templates in the database have I1=I2=0 for all potions.
package item

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"

	"go.uber.org/zap"
)

type PotionHealKind int

const (
	PotionHealHP PotionHealKind = iota
	PotionHealMP
)

var hpPotionHealAmounts = map[int]int{
	1:    300,
	2:    600,
	4:    600,
	110:  1000,
	113:  2000,
	321:  3000,
	371:  6000,
	1975: 9000,
}

var mpPotionHealAmounts = map[int]int{
	158:  300,
	125:  600,
	126:  1000,
	127:  2000,
	322:  3000,
	370:  5000,
	1974: 7000,
}

func GetPotionHealAmount(templateID int) (amount int, kind PotionHealKind, ok bool) {
	if amt, found := hpPotionHealAmounts[templateID]; found {
		return amt, PotionHealHP, true
	}
	if amt, found := mpPotionHealAmounts[templateID]; found {
		return amt, PotionHealMP, true
	}
	return 0, PotionHealHP, false
}

type RecoverItemEntry struct {
	ItemDatabaseID int64
	Priority       int
}

type ConsumedItemResult struct {
	ItemID    int64
	SID       int
	Deleted   bool
	Remaining int
	Item      *domainitem.Item
}

func (s *Service) computeEffectiveMax(ctx context.Context, char *character.Character) (int, int) {
	computed := *char
	computed.RecalculateStats()
	bonuses := s.AggregateEquipmentStats(ctx, char.ID)
	computed.ApplyEquipmentBonuses(bonuses)
	return computed.MaxHP, computed.MaxMP
}

func (s *Service) FullRecoverByItem(
	ctx context.Context,
	char *character.Character,
	pet *domainpet.Pet,
	entries []RecoverItemEntry,
	kind PotionHealKind,
) ([]ConsumedItemResult, error) {
	effectiveMaxHP, effectiveMaxMP := s.computeEffectiveMax(ctx, char)
	targetLabel := "character"
	targetID := char.ID
	currentHP := &char.CurrentHP
	currentMP := &char.CurrentMP
	if pet != nil {
		targetLabel = "pet"
		targetID = pet.ID
		effectiveMaxHP = pet.MaxHP
		effectiveMaxMP = pet.MaxMP
		currentHP = &pet.CurrentHP
		currentMP = &pet.CurrentMP
	}

	var deficit int
	var effectiveMax int
	if kind == PotionHealHP {
		deficit = effectiveMaxHP - *currentHP
		effectiveMax = effectiveMaxHP
	} else {
		deficit = effectiveMaxMP - *currentMP
		effectiveMax = effectiveMaxMP
	}

	s.logger.Info("FullRecoverByItem",
		zap.Int64("char_id", char.ID),
		zap.String("target_type", targetLabel),
		zap.Int64("target_id", targetID),
		zap.Int("deficit", deficit),
		zap.Int("effective_max", effectiveMax),
		zap.Int("current_hp", *currentHP),
		zap.Int("current_mp", *currentMP),
		zap.Int("entry_count", len(entries)))

	if deficit <= 0 || len(entries) == 0 {
		return nil, nil
	}

	var results []ConsumedItemResult

	for _, entry := range entries {
		if deficit <= 0 {
			break
		}

		it, err := s.GetItemByID(ctx, char.ID, entry.ItemDatabaseID)
		if err != nil {
			s.logger.Debug("FullRecoverByItem: skip invalid item",
				zap.Int64("item_id", entry.ItemDatabaseID),
				zap.Error(err))
			continue
		}

		if !it.IsConsumable() {
			continue
		}

		healAmount, healKind, ok := GetPotionHealAmount(it.TemplateID)
		if !ok || healKind != kind {
			continue
		}

		needed := (deficit + healAmount - 1) / healAmount
		if needed > it.StackCount {
			needed = it.StackCount
		}

		for i := 0; i < needed; i++ {
			if kind == PotionHealHP {
				*currentHP += healAmount
				if *currentHP > effectiveMaxHP {
					*currentHP = effectiveMaxHP
				}
			} else {
				*currentMP += healAmount
				if *currentMP > effectiveMaxMP {
					*currentMP = effectiveMaxMP
				}
			}
			deficit -= healAmount
			if deficit < 0 {
				deficit = 0
			}
		}

		sid := it.CalculateSID()
		it.StackCount -= needed

		if it.StackCount <= 0 {
			if err := s.itemRepo.Delete(ctx, it.ID); err != nil {
				s.logger.Error("FullRecoverByItem: failed to delete item",
					zap.Int64("item_id", it.ID), zap.Error(err))
				continue
			}
			results = append(results, ConsumedItemResult{
				ItemID:  it.ID,
				SID:     sid,
				Deleted: true,
				Item:    it,
			})
		} else {
			if err := s.itemRepo.UpdateStack(ctx, it.ID, it.StackCount); err != nil {
				s.logger.Error("FullRecoverByItem: failed to update stack",
					zap.Int64("item_id", it.ID), zap.Error(err))
				continue
			}
			results = append(results, ConsumedItemResult{
				ItemID:    it.ID,
				SID:       sid,
				Deleted:   false,
				Remaining: it.StackCount,
				Item:      it,
			})
		}
	}

	return results, nil
}
