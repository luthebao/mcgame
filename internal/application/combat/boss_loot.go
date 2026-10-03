// Open-sourced by BaoLT

// Boss loot rolling at battle end.
// Two trigger paths feed the same calculator:
//   schedule path - enemy.EntityID matches a schedule_boss row (tier read from config)
//   daily path    - battle.BossCtx populated by the daily handler (tier nil)
// Rate scale and quest-gating semantics mirror calculateCreatureLootDrops in rewards.go.
package combat

import (
	"context"
	"math/rand"

	domainbossloot "mcgame-server/internal/domain/bossloot"
	domcombat "mcgame-server/internal/domain/combat"
	domainitem "mcgame-server/internal/domain/item"
	domquest "mcgame-server/internal/domain/quest"

	"go.uber.org/zap"
)

func (s *Service) ApplyBossLootDrops(ctx context.Context, battle *domcombat.Battle, result *domcombat.BattleResult) {
	if s.bossLoot == nil || s.itemService == nil {
		return
	}
	if result.WinnerSide != domcombat.SidePlayer {
		return
	}
	recipients := survivingRewardParticipants(battle)
	if len(recipients) == 0 {
		return
	}

	kills := s.detectBossKills(battle)
	if len(kills) == 0 {
		return
	}

	drops := s.calculateBossLootDrops(ctx, battle, recipients, kills, result)
	if len(drops) > 0 {
		s.logger.Info("Boss loot drops calculated",
			zap.String("battle_id", battle.ID),
			zap.Int("drop_count", len(drops)),
			zap.Int("boss_count", len(kills)))
	}

	for _, drop := range drops {
		result.ItemRewards = append(result.ItemRewards, drop)
		reward := result.EnsureCharacterReward(drop.CharacterID)
		reward.ItemRewards = append(reward.ItemRewards, drop)
	}
}

type bossKill struct {
	BossNID int
	Source  domainbossloot.Source
	Tier    string
}

func (s *Service) detectBossKills(battle *domcombat.Battle) []bossKill {
	kills := make([]bossKill, 0, 2)
	seen := make(map[int]struct{})

	if battle.BossCtx != nil && battle.BossCtx.BossNID > 0 {
		seen[battle.BossCtx.BossNID] = struct{}{}
		kills = append(kills, bossKill{
			BossNID: battle.BossCtx.BossNID,
			Source:  domainbossloot.Source(battle.BossCtx.Source),
			Tier:    battle.BossCtx.Tier,
		})
	}

	if s.scheduleBoss != nil {
		for _, enemy := range battle.GetParticipantsBySide(domcombat.SideEnemy) {
			if enemy == nil || enemy.IsAlive || enemy.EntityType != domcombat.ParticipantTypeCreature {
				continue
			}
			nid := int(enemy.EntityID)
			if nid <= 0 {
				continue
			}
			if _, ok := seen[nid]; ok {
				continue
			}
			cfg, ok := s.scheduleBoss.LookupConfig(nid)
			if !ok || cfg == nil {
				continue
			}
			seen[nid] = struct{}{}
			kills = append(kills, bossKill{
				BossNID: nid,
				Source:  domainbossloot.SourceSchedule,
				Tier:    string(cfg.Tier),
			})
		}
	}

	return kills
}

func (s *Service) calculateBossLootDrops(
	ctx context.Context,
	battle *domcombat.Battle,
	recipients []*domcombat.Participant,
	kills []bossKill,
	result *domcombat.BattleResult,
) []domcombat.ItemDrop {
	activeQuestsByCharacter := make(map[int64][]*domquest.QuestProgress, len(recipients))
	questIDsByCharacter := make(map[int64]map[int]struct{}, len(recipients))
	for _, recipient := range recipients {
		quests := s.activeQuestsFor(ctx, recipient.EntityID)
		activeQuestsByCharacter[recipient.EntityID] = quests
		questIDsByCharacter[recipient.EntityID] = questIDSet(quests)
	}

	type rolled struct {
		templateID int
		itemType   domainitem.ItemType
		quality    int
		bound      bool
		lootType   int
		quantity   int
		eligible   []*domcombat.Participant
	}

	type rolledCurrency struct {
		spec     currencyLootSpec
		eligible []*domcombat.Participant
	}

	picks := make([]rolled, 0)
	currencyPicks := make([]rolledCurrency, 0)
	for _, kill := range kills {
		entries := s.bossLoot.EntriesForBoss(kill.BossNID, kill.Source, kill.Tier)
		for _, entry := range entries {
			if entry.Rate <= 0 {
				continue
			}
			eligibleRecipients := s.filterEligibleLootRecipients(recipients, questIDsByCharacter, entry.Qid)
			if len(eligibleRecipients) == 0 {
				continue
			}

			effectiveRate := entry.Rate
			if !domainbossloot.IsCurrencyRewardType(entry.Type) {
				if anyRecipientNeedsItemForQuest(eligibleRecipients, activeQuestsByCharacter, entry.ItemID) {
					effectiveRate = min(effectiveRate*questItemDropRateMultiplier, 50000)
				}
			}
			if rand.Intn(50000)+1 > effectiveRate {
				continue
			}

			if domainbossloot.IsCurrencyRewardType(entry.Type) {
				currencyPicks = append(currencyPicks, rolledCurrency{
					spec: currencyLootSpec{
						RewardType: entry.Type,
						AwardID:    entry.ItemID,
						QtyMin:     entry.QtyMin,
						QtyMax:     entry.QtyMax,
						Bound:      entry.Bound,
					},
					eligible: eligibleRecipients,
				})
				continue
			}

			templateID := entry.ItemID
			itemType := s.resolveRewardItemType(templateID, entry.Type)
			if itemType == 0 {
				continue
			}
			quantity := entry.QtyMin
			if entry.QtyMax > entry.QtyMin {
				quantity = entry.QtyMin + rand.Intn(entry.QtyMax-entry.QtyMin+1)
			}
			if quantity < 1 {
				quantity = 1
			}
			picks = append(picks, rolled{
				templateID: templateID,
				itemType:   itemType,
				quality:    entry.Quality,
				bound:      entry.Bound,
				lootType:   entry.Type,
				quantity:   quantity,
				eligible:   eligibleRecipients,
			})
		}
	}

	currencyNextEligible := make(map[string]int)
	for _, candidate := range currencyPicks {
		recipient := candidate.eligible[0]
		if len(candidate.eligible) > 1 {
			key := lootRecipientKey(candidate.eligible)
			recipient = candidate.eligible[currencyNextEligible[key]%len(candidate.eligible)]
			currencyNextEligible[key]++
		}
		drop, err := s.applyCurrencyLootSpec(ctx, recipient.EntityID, candidate.spec)
		if err != nil {
			s.logger.Warn("Failed to apply boss loot currency",
				zap.String("battle_id", battle.ID),
				zap.Int64("character_id", recipient.EntityID),
				zap.Int("reward_type", candidate.spec.RewardType),
				zap.Int("award_id", candidate.spec.AwardID),
				zap.Error(err))
			continue
		}
		appendCurrencyDrop(result, drop)
	}

	if len(picks) == 0 {
		return nil
	}

	drops := make([]domcombat.ItemDrop, 0, len(picks))
	nextEligibleIndex := make(map[string]int)
	for _, candidate := range picks {
		recipient := candidate.eligible[0]
		if len(candidate.eligible) > 1 {
			key := lootRecipientKey(candidate.eligible)
			recipient = candidate.eligible[nextEligibleIndex[key]%len(candidate.eligible)]
			nextEligibleIndex[key]++
		}

		colorCode := rewardColorCode(candidate.itemType, candidate.quality)
		slotType := s.resolveRewardSlotType(candidate.templateID)
		var (
			addedItem *domainitem.Item
			err       error
		)
		if slotType == domainitem.SlotTypeBag {
			addedItem, err = s.itemService.AddItemWithBindAndColor(ctx, recipient.EntityID, candidate.templateID, candidate.itemType, candidate.quantity, candidate.bound, colorCode)
		} else {
			addedItem, err = s.itemService.AddItemToSlot(ctx, recipient.EntityID, candidate.templateID, candidate.itemType, candidate.quantity, candidate.bound, slotType)
		}
		if err != nil {
			s.logger.Warn("Failed to persist boss loot",
				zap.String("battle_id", battle.ID),
				zap.Int64("character_id", recipient.EntityID),
				zap.Int("template_id", candidate.templateID),
				zap.Error(err))
			continue
		}

		var itemData map[string]any
		if addedItem != nil {
			itemData = addedItem.ToDTO()
		}

		drops = append(drops, domcombat.ItemDrop{
			CharacterID: recipient.EntityID,
			TemplateID:  candidate.templateID,
			Type:        candidate.lootType,
			Quality:     candidate.quality,
			Bound:       candidate.bound,
			StackCount:  candidate.quantity,
			ItemData:    itemData,
		})
	}

	return drops
}
