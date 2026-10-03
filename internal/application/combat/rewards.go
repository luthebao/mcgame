// Open-sourced by BaoLT

package combat

import (
	"context"
	"math/rand"
	"strings"

	domainbossloot "mcgame-server/internal/domain/bossloot"
	domcombat "mcgame-server/internal/domain/combat"
	domainitem "mcgame-server/internal/domain/item"
	domquest "mcgame-server/internal/domain/quest"

	"go.uber.org/zap"
)

const petExpShareRatio = 0.5

const questItemDropRateMultiplier = 5

func (s *Service) applyCharacterRewards(ctx context.Context, battle *domcombat.Battle, result *domcombat.BattleResult) {
	if result.WinnerSide != domcombat.SidePlayer {
		return
	}
	recipients := survivingRewardParticipants(battle)
	if len(recipients) == 0 {
		result.ExpReward = 0
		result.MoneyReward = 0
		return
	}

	result.ExpReward = splitReward(result.ExpReward, len(recipients))
	result.MoneyReward = splitReward(result.MoneyReward, len(recipients))
	if result.ExpReward <= 0 && result.MoneyReward <= 0 {
		return
	}

	for _, p := range recipients {
		if p.EntityType != domcombat.ParticipantTypeCharacter {
			continue
		}

		charID := p.EntityID
		char, err := s.charRepo.FindByID(ctx, charID)
		if err != nil {
			s.logger.Warn("Failed to load character for reward",
				zap.Int64("char_id", charID),
				zap.Error(err))
			continue
		}

		leveledUp := false
		if result.ExpReward > 0 {
			leveledUp = char.GainExperience(result.ExpReward)
		}

		if result.MoneyReward > 0 {
			char.MoneyBind += result.MoneyReward
		}

		if err := s.charRepo.Update(ctx, char); err != nil {
			s.logger.Warn("Failed to save character rewards",
				zap.Int64("char_id", charID),
				zap.Error(err))
			continue
		}

		reward := result.EnsureCharacterReward(charID)
		reward.ExpReward = result.ExpReward
		reward.MoneyReward = result.MoneyReward
		reward.LeveledUp = leveledUp

		s.logger.Info("Character rewards applied",
			zap.Int64("char_id", charID),
			zap.Int64("exp", result.ExpReward),
			zap.Int64("money", result.MoneyReward),
			zap.Bool("leveled_up", leveledUp),
			zap.Int("new_level", char.Level))
	}
}

func (s *Service) applyPetRewards(ctx context.Context, battle *domcombat.Battle, result *domcombat.BattleResult) {
	if result.WinnerSide != domcombat.SidePlayer {
		return
	}
	if result.ExpReward <= 0 {
		return
	}

	petExp := int64(float64(result.ExpReward) * petExpShareRatio)
	if petExp <= 0 {
		return
	}

	for _, p := range survivingRewardParticipants(battle) {
		var petParticipant *domcombat.Participant
		for _, pp := range battle.Participants {
			if pp.EntityType == domcombat.ParticipantTypePet && pp.OwnerID == p.EntityID {
				petParticipant = pp
				break
			}
		}
		if petParticipant == nil {
			continue
		}

		battlePet, err := s.petRepo.FindByID(ctx, petParticipant.EntityID)
		if err != nil || battlePet == nil {
			continue
		}

		leveledUp := battlePet.GainExperience(petExp)
		if err := s.petRepo.Save(ctx, battlePet); err != nil {
			s.logger.Warn("Failed to save pet rewards",
				zap.Int64("pet_id", battlePet.ID),
				zap.Error(err))
			continue
		}

		s.logger.Info("Pet rewards applied",
			zap.Int64("pet_id", battlePet.ID),
			zap.Int64("exp", petExp),
			zap.Bool("leveled_up", leveledUp),
			zap.Int("new_level", battlePet.Level))
	}
}

func (s *Service) ApplyItemDrops(ctx context.Context, battle *domcombat.Battle, result *domcombat.BattleResult) {
	if result.WinnerSide != domcombat.SidePlayer || s.itemService == nil {
		return
	}

	recipients := survivingRewardParticipants(battle)
	if len(recipients) == 0 {
		return
	}

	drops := s.calculateCreatureLootDrops(ctx, battle, recipients, result)
	if len(drops) == 0 {
		return
	}

	s.logger.Info("Item drops calculated",
		zap.String("battle_id", battle.ID),
		zap.Int("drop_count", len(drops)))

	for _, drop := range drops {
		result.ItemRewards = append(result.ItemRewards, drop)
		reward := result.EnsureCharacterReward(drop.CharacterID)
		reward.ItemRewards = append(reward.ItemRewards, drop)
	}
}

func (s *Service) calculateCreatureLootDrops(ctx context.Context, battle *domcombat.Battle, recipients []*domcombat.Participant, result *domcombat.BattleResult) []domcombat.ItemDrop {
	gm := s.getGameDataManager()
	if gm == nil || len(recipients) == 0 {
		return nil
	}

	activeQuestsByCharacter := make(map[int64][]*domquest.QuestProgress, len(recipients))
	questIDsByCharacter := make(map[int64]map[int]struct{}, len(recipients))
	for _, recipient := range recipients {
		quests := s.activeQuestsFor(ctx, recipient.EntityID)
		activeQuestsByCharacter[recipient.EntityID] = quests
		questIDsByCharacter[recipient.EntityID] = questIDSet(quests)
	}

	type rolledLoot struct {
		templateID int
		itemType   domainitem.ItemType
		quality    int
		bound      bool
		lootType   int
		qtyMin     int
		qtyMax     int
		eligible   []*domcombat.Participant
	}

	rolled := make([]rolledLoot, 0)
	currencyRolls := make([]struct {
		spec     currencyLootSpec
		eligible []*domcombat.Participant
	}, 0)
	enemies := battle.GetParticipantsBySide(domcombat.SideEnemy)

	for _, enemy := range enemies {
		if enemy.IsAlive {
			continue
		}

		lootEntries := gm.GetCreatureLootByCreatureID(int(enemy.EntityID))
		if len(lootEntries) == 0 {
			continue
		}

		for _, lootEntry := range lootEntries {
			rate := int(lootEntry.Rate)
			if rate <= 0 {
				continue
			}

			tableType := int(lootEntry.Type)
			eligibleRecipients := s.filterEligibleLootRecipients(recipients, questIDsByCharacter, int(lootEntry.Qid))
			if len(eligibleRecipients) == 0 {
				continue
			}

			effectiveRate := rate
			if !domainbossloot.IsCurrencyRewardType(tableType) {
				templateID := int(lootEntry.ItemID)
				if anyRecipientNeedsItemForQuest(eligibleRecipients, activeQuestsByCharacter, templateID) {
					effectiveRate = min(rate*questItemDropRateMultiplier, 50000)
				}
			}
			if rand.Intn(50000)+1 > effectiveRate {
				continue
			}

			if domainbossloot.IsCurrencyRewardType(tableType) {
				currencyRolls = append(currencyRolls, struct {
					spec     currencyLootSpec
					eligible []*domcombat.Participant
				}{
					spec: currencyLootSpec{
						RewardType: tableType,
						AwardID:    int(lootEntry.ItemID),
						QtyMin:     int(lootEntry.QtyMin),
						QtyMax:     int(lootEntry.QtyMax),
						Bound:      int(lootEntry.B) == 1,
					},
					eligible: eligibleRecipients,
				})
				continue
			}

			templateID := int(lootEntry.ItemID)
			itemType := s.resolveRewardItemType(templateID, tableType)
			if itemType == 0 {
				continue
			}

			qtyMin := int(lootEntry.QtyMin)
			if qtyMin < 1 {
				qtyMin = 1
			}
			qtyMax := int(lootEntry.QtyMax)
			if qtyMax < qtyMin {
				qtyMax = qtyMin
			}

			rolled = append(rolled, rolledLoot{
				templateID: templateID,
				itemType:   itemType,
				quality:    int(lootEntry.Quality),
				bound:      int(lootEntry.B) == 1,
				lootType:   tableType,
				qtyMin:     qtyMin,
				qtyMax:     qtyMax,
				eligible:   eligibleRecipients,
			})
		}
	}

	currencyNextEligible := make(map[string]int)
	for _, candidate := range currencyRolls {
		recipient := candidate.eligible[0]
		if len(candidate.eligible) > 1 {
			key := lootRecipientKey(candidate.eligible)
			recipient = candidate.eligible[currencyNextEligible[key]%len(candidate.eligible)]
			currencyNextEligible[key]++
		}
		drop, err := s.applyCurrencyLootSpec(ctx, recipient.EntityID, candidate.spec)
		if err != nil {
			s.logger.Warn("Failed to apply creature loot currency",
				zap.String("battle_id", battle.ID),
				zap.Int64("character_id", recipient.EntityID),
				zap.Int("reward_type", candidate.spec.RewardType),
				zap.Int("award_id", candidate.spec.AwardID),
				zap.Error(err))
			continue
		}
		appendCurrencyDrop(result, drop)
	}

	if len(rolled) == 0 {
		return nil
	}

	drops := make([]domcombat.ItemDrop, 0, len(rolled))
	nextEligibleIndex := make(map[string]int)
	for _, candidate := range rolled {
		recipient := candidate.eligible[0]
		if len(candidate.eligible) > 1 {
			key := lootRecipientKey(candidate.eligible)
			recipient = candidate.eligible[nextEligibleIndex[key]%len(candidate.eligible)]
			nextEligibleIndex[key]++
		}

		colorCode := rewardColorCode(candidate.itemType, candidate.quality)
		slotType := s.resolveRewardSlotType(candidate.templateID)
		quantity := candidate.qtyMin
		if candidate.qtyMax > candidate.qtyMin {
			quantity = candidate.qtyMin + rand.Intn(candidate.qtyMax-candidate.qtyMin+1)
		}
		if quantity < 1 {
			quantity = 1
		}
		var (
			addedItem *domainitem.Item
			err       error
		)
		if slotType == domainitem.SlotTypeBag {
			addedItem, err = s.itemService.AddItemWithBindAndColor(ctx, recipient.EntityID, candidate.templateID, candidate.itemType, quantity, candidate.bound, colorCode)
		} else {
			addedItem, err = s.itemService.AddItemToSlot(ctx, recipient.EntityID, candidate.templateID, candidate.itemType, quantity, candidate.bound, slotType)
		}
		if err != nil {
			s.logger.Warn("Failed to persist battle loot",
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
			StackCount:  quantity,
			ItemData:    itemData,
		})
	}

	return drops
}

func (s *Service) activeQuestsFor(ctx context.Context, characterID int64) []*domquest.QuestProgress {
	if s.questService == nil {
		return nil
	}
	activeQuests, err := s.questService.GetActiveQuests(ctx, characterID)
	if err != nil {
		return nil
	}
	return activeQuests
}

func questIDSet(quests []*domquest.QuestProgress) map[int]struct{} {
	ids := make(map[int]struct{}, len(quests))
	for _, qp := range quests {
		if qp == nil {
			continue
		}
		ids[qp.QuestID] = struct{}{}
	}
	return ids
}

func anyRecipientNeedsItemForQuest(recipients []*domcombat.Participant, activeQuestsByCharacter map[int64][]*domquest.QuestProgress, templateID int) bool {
	for _, recipient := range recipients {
		for _, qp := range activeQuestsByCharacter[recipient.EntityID] {
			if qp == nil || qp.Status != domquest.QuestStatusActive {
				continue
			}
			for _, obj := range qp.Objectives {
				if obj.Type == domquest.ObjectiveCollectItem && obj.Target == templateID && obj.Current < obj.Required {
					return true
				}
			}
		}
	}
	return false
}

func (s *Service) filterEligibleLootRecipients(recipients []*domcombat.Participant, questIDsByCharacter map[int64]map[int]struct{}, requiredQuestID int) []*domcombat.Participant {
	if requiredQuestID <= 0 {
		return recipients
	}

	filtered := make([]*domcombat.Participant, 0, len(recipients))
	for _, recipient := range recipients {
		if _, ok := questIDsByCharacter[recipient.EntityID][requiredQuestID]; ok {
			filtered = append(filtered, recipient)
		}
	}
	return filtered
}

func lootRecipientKey(recipients []*domcombat.Participant) string {
	var b strings.Builder
	for _, recipient := range recipients {
		b.WriteByte('|')
		b.WriteString(recipient.ID)
	}
	return b.String()
}

func (s *Service) resolveRewardItemType(templateID int, tableType int) domainitem.ItemType {
	gm := s.getGameDataManager()
	if gm == nil {
		return 0
	}
	if tableType == 19 {
		if gm.GetEquipment(templateID) != nil {
			return domainitem.ItemTypeEquipment
		}
	}
	if tpl := gm.GetItem(templateID); tpl != nil {
		switch int(tpl.Type) {
		case 508, 509:
			return domainitem.ItemTypeQuest
		}
		return domainitem.ItemTypeConsumable
	}
	if gm.GetEquipment(templateID) != nil {
		return domainitem.ItemTypeEquipment
	}
	return 0
}

func (s *Service) resolveRewardSlotType(templateID int) domainitem.SlotType {
	gm := s.getGameDataManager()
	if gm == nil {
		return domainitem.SlotTypeBag
	}
	tpl := gm.GetItem(templateID)
	if tpl == nil {
		return domainitem.SlotTypeBag
	}
	switch int(tpl.Type) {
	case 508, 509:
		return domainitem.SlotTypeQuestBag
	case 550:
		return domainitem.SlotTypePetItemBag
	}
	return domainitem.SlotTypeBag
}

func rewardColorCode(itemType domainitem.ItemType, quality int) int {
	if quality <= 0 {
		return 0
	}
	if itemType != domainitem.ItemTypeEquipment {
		return quality
	}
	if quality >= 6 {
		return 5
	}
	if quality >= 5 {
		return 4
	}
	return quality
}

func (s *Service) applyCaughtPetRewards(ctx context.Context, battle *domcombat.Battle, result *domcombat.BattleResult) {
	pendingRewards := battle.GetPendingPetRewards()
	if len(pendingRewards) == 0 {
		return
	}

	for _, reward := range pendingRewards {
		if reward.PetID > 0 && s.petRepo != nil {
			petEntity, err := s.petRepo.FindByID(ctx, reward.PetID)
			if err == nil && petEntity != nil {
				reward.PetData = petEntity.ToDTO()
			}
		}

		result.PetRewards = append(result.PetRewards, reward)
		charReward := result.EnsureCharacterReward(reward.CharacterID)
		charReward.PetRewards = append(charReward.PetRewards, reward)
	}
}

func survivingRewardParticipants(battle *domcombat.Battle) []*domcombat.Participant {
	recipients := make([]*domcombat.Participant, 0)
	if battle == nil {
		return recipients
	}

	for _, participant := range battle.Participants {
		if participant == nil {
			continue
		}
		if participant.Side != domcombat.SidePlayer || participant.EntityType != domcombat.ParticipantTypeCharacter {
			continue
		}
		if !participant.IsAlive && participant.MaxHP > 0 {
			continue
		}
		recipients = append(recipients, participant)
	}

	return recipients
}

func splitReward(total int64, recipients int) int64 {
	if total <= 0 || recipients <= 0 {
		return 0
	}
	return total / int64(recipients)
}

const petBattleLifeDrain = 10

func (s *Service) applyPetLifeDrain(ctx context.Context, battle *domcombat.Battle) {
	if s.petRepo == nil || battle == nil {
		return
	}

	for _, p := range battle.Participants {
		if p == nil || p.Side != domcombat.SidePlayer || p.EntityType != domcombat.ParticipantTypePet {
			continue
		}

		pet, err := s.petRepo.FindByID(ctx, p.EntityID)
		if err != nil || pet == nil {
			continue
		}

		pet.Life -= petBattleLifeDrain
		if pet.Life < 0 {
			pet.Life = 0
		}

		if err := s.petRepo.Save(ctx, pet); err != nil {
			s.logger.Warn("Failed to save pet life drain",
				zap.Int64("pet_id", pet.ID),
				zap.Error(err))
		}
	}
}
