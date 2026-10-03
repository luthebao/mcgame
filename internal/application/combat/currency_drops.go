// Open-sourced by BaoLT

// Currency / exp reward drops from creature_loot or boss_loot.
// Mirrors the box-items award_picker type scheme: type 30 = basic currency
// (item_id ∈ {0,1,2}), type 31 = experience, type 35 = game currency
// (item_id = currency type id). Application returns a CurrencyDrop so the
// combat handler can emit onAddMoney to the Flash client.
package combat

import (
	"context"
	"math/rand"

	domainchar "mcgame-server/internal/domain/character"
	domcombat "mcgame-server/internal/domain/combat"

	"go.uber.org/zap"
)

type currencyLootSpec struct {
	RewardType int
	AwardID    int
	QtyMin     int
	QtyMax     int
	Bound      bool
}

func rollLootAmount(spec currencyLootSpec) int {
	minQty := spec.QtyMin
	if minQty < 1 {
		minQty = 1
	}
	maxQty := spec.QtyMax
	if maxQty < minQty {
		maxQty = minQty
	}
	if maxQty == minQty {
		return minQty
	}
	return minQty + rand.Intn(maxQty-minQty+1)
}

func (s *Service) applyCurrencyLootSpec(ctx context.Context, characterID int64, spec currencyLootSpec) (*domcombat.CurrencyDrop, error) {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}

	amount := rollLootAmount(spec)
	if amount <= 0 {
		return nil, nil
	}

	drop := &domcombat.CurrencyDrop{
		CharacterID: characterID,
		Delta:       int64(amount),
	}

	switch spec.RewardType {
	case 30:
		descriptor, ok := domainchar.BasicCurrencyDescriptor(spec.AwardID)
		if !ok {
			s.logger.Warn("loot currency: unknown basic currency id", zap.Int("award_id", spec.AwardID))
			return nil, nil
		}
		if spec.Bound && spec.AwardID == domainchar.BasicCurrencyMoney {
			char.MoneyBind += int64(amount)
			drop.ClientKey = "moneyBind"
			drop.Label = "Bạc khóa"
			drop.Total = char.MoneyBind
		} else if spec.Bound && spec.AwardID == domainchar.BasicCurrencyGold {
			char.GoldBind += int64(amount)
			drop.ClientKey = "goldBind"
			drop.Label = "Vàng khóa"
			drop.Total = char.GoldBind
		} else {
			total, applied := char.AddBasicCurrency(spec.AwardID, int64(amount))
			if !applied {
				return nil, nil
			}
			drop.ClientKey = descriptor.ClientKey
			drop.Label = descriptor.Label
			drop.Total = total
		}
	case 31:
		leveled := char.GainExperience(int64(amount))
		drop.ClientKey = "exp"
		drop.Label = "Kinh nghiệm"
		drop.Total = char.Experience
		drop.IsExp = true
		drop.LeveledUp = leveled
	case 35:
		accessor, ok := domainchar.LookupGameKVAccessor(spec.AwardID)
		if !ok {
			s.logger.Warn("loot currency: unknown game currency id", zap.Int("award_id", spec.AwardID))
			return nil, nil
		}
		current := accessor.Get(char)
		accessor.Set(char, current+int64(amount))
		drop.ClientKey = accessor.Descriptor.ClientKey
		drop.Label = accessor.Descriptor.Label
		drop.Total = current + int64(amount)
	default:
		return nil, nil
	}

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	return drop, nil
}

func appendCurrencyDrop(result *domcombat.BattleResult, drop *domcombat.CurrencyDrop) {
	if result == nil || drop == nil {
		return
	}
	result.CurrencyRewards = append(result.CurrencyRewards, *drop)
	reward := result.EnsureCharacterReward(drop.CharacterID)
	reward.CurrencyRewards = append(reward.CurrencyRewards, *drop)
}
