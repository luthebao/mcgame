// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"
	"time"

	"go.uber.org/zap"

	appbuff "mcgame-server/internal/application/buff"
	domainbuff "mcgame-server/internal/domain/buff"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

func currencyName(currencyType int) string {
	switch currencyType {
	case 0:
		return "bạc"
	case 1:
		return "vàng"
	case 2:
		return "danh vọng"
	default:
		return "tiền"
	}
}

type awardEffectHandler struct {
	gameData    *gamedata.Manager
	itemService *Service
}

type petAwardQualityContractService interface {
	ContractPetsWithAwardQuality(ctx context.Context, charID int64, templateIDs []int, quality float64) ([]*domainpet.Pet, error)
}

type petCapacityChecker interface {
	HasPetCapacity(ctx context.Context, charID int64, incomingPets int) (bool, error)
}

type MedalGranter interface {
	AddMedalToBag(ctx context.Context, charID int64, tid, count int) (slot int, total int, err error)
}

const awardTypeMedal = 36

type resolvedItemAward struct {
	AwardID     int
	AwardType   int
	Count       int
	ItemQuality int
	PetQuality  float64
	PreNameType int
	Payload     map[string]interface{}
}

func (h *awardEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	if tpl == nil || h.gameData == nil {
		return false
	}
	awards := h.gameData.GetItemAwardsByItemID(int(tpl.ID))
	return len(awards) > 0
}

func (h *awardEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character,
	it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {

	result := NewEffectResult()

	awards := h.gameData.GetItemAwardsByItemID(int(tpl.ID))
	if len(awards) == 0 {
		return result, nil
	}

	selectedAwards := h.resolveAwards(int(tpl.ID), awards)
	if err := h.ensureAwardCapacity(ctx, char.ID, selectedAwards); err != nil {
		return nil, err
	}

	for _, award := range selectedAwards {
		switch award.AwardType {
		case 12:
			pets, err := h.grantPetAward(ctx, char.ID, award.AwardID, award.Count, award.PetQuality)
			if err != nil {
				return nil, err
			}
			result.Pets = append(result.Pets, pets...)
		case 30:
			descriptor, ok := character.BasicCurrencyDescriptor(award.AwardID)
			if !ok {
				return nil, fmt.Errorf("unsupported basic currency id: %d", award.AwardID)
			}
			newTotal, applied := char.AddBasicCurrency(award.AwardID, int64(award.Count))
			if !applied {
				return nil, fmt.Errorf("failed to add basic currency %d", award.AwardID)
			}
			result.GrantedCurrencies = append(result.GrantedCurrencies, GrantedCurrencyResult{
				ClientKey: descriptor.ClientKey,
				Delta:     int64(award.Count),
				Total:     float64(newTotal),
				Label:     descriptor.Label,
			})
			result.RefreshCharacterView = true
		case 31:
			char.Experience += int64(award.Count)
			result.RefreshCharacterView = true
			if result.Message == "" {
				result.Message = fmt.Sprintf("Nhận được %d kinh nghiệm.", award.Count)
			}
		case 32:
			buff, err := h.grantBuffAward(ctx, char.ID, award.AwardID, award.Count, award.Payload)
			if err != nil {
				return nil, err
			}
			if buff != nil {
				result.GrantedBuffs = append(result.GrantedBuffs, buff)
				result.RefreshCharacterView = true
			}
			if result.Message == "" {
				result.Message = fmt.Sprintf("Đã áp dụng hiệu ứng %d.", award.AwardID)
			}
		case 33:
			titleGrant, err := h.grantTitleAward(ctx, char.ID, award.AwardID)
			if err != nil {
				return nil, err
			}
			if titleGrant != nil && titleGrant.Added {
				result.GrantedTitles = append(result.GrantedTitles, *titleGrant)
				if result.Message == "" {
					titleName := fmt.Sprintf("danh hiệu %d", award.AwardID)
					if h.gameData != nil {
						if tpl := h.gameData.GetTitle(award.AwardID); tpl != nil && tpl.N != "" {
							titleName = tpl.N
						}
					}
					result.Message = fmt.Sprintf("Nhận được %s.", titleName)
				}
			}
		case 34:
			skillID, added, err := h.grantSkillAward(ctx, char.ID, award.AwardID)
			if err != nil {
				return nil, err
			}
			if added {
				result.GrantedSkillIDs = append(result.GrantedSkillIDs, skillID)
				if result.Message == "" {
					skillName := fmt.Sprintf("kỹ năng %d", award.AwardID)
					if h.gameData != nil {
						if tpl := h.gameData.GetSkill(award.AwardID); tpl != nil && tpl.Name != "" {
							skillName = tpl.Name
						}
					}
					result.Message = fmt.Sprintf("Học được %s.", skillName)
				}
			}
		case 35:
			descriptor, ok := character.GameCurrencyDescriptor(award.AwardID)
			if !ok {
				return nil, fmt.Errorf("unsupported game currency id: %d", award.AwardID)
			}
			if err := h.grantGameCurrencyAward(char, award.AwardID, award.Count); err != nil {
				return nil, err
			}
			newTotal, _ := char.GetGameCurrencyTotal(award.AwardID)
			result.GrantedCurrencies = append(result.GrantedCurrencies, GrantedCurrencyResult{
				ClientKey: descriptor.ClientKey,
				Delta:     int64(award.Count),
				Total:     float64(newTotal),
				Label:     descriptor.Label,
			})
			result.RefreshCharacterView = true
		case awardTypeMedal:
			granted, slot, total, err := h.grantMedalAward(ctx, char.ID, award.AwardID, award.Count)
			if err != nil {
				return nil, err
			}
			if granted {
				result.GrantedMedals = append(result.GrantedMedals, GrantedMedalResult{Slot: slot, TemplateID: award.AwardID, Count: total})
				result.RefreshCharacterView = true
				if result.Message == "" {
					result.Message = "Nhận được Ấn Chương."
				}
			}
		default:
			grantedItems, err := h.grantItemAward(ctx, char.ID, award.AwardID, award.AwardType, award.Count, award.ItemQuality, award.PreNameType)
			if err != nil {
				return nil, err
			}
			result.GrantedItems = append(result.GrantedItems, grantedItems...)
		}
	}

	if result.Message == "" && (len(result.GrantedItems) > 0 || len(result.Pets) > 0) {
		result.Message = fmt.Sprintf("Đã mở %s.", tpl.Name)
	}

	return result, nil
}

func (h *awardEffectHandler) resolveAwards(itemID int, awards []*models.ItemAwardTemplate) []resolvedItemAward {
	var rng func(minValue, maxValue int) int
	var log *zap.Logger
	if h.itemService != nil {
		rng = h.itemService.randomIntInclusive
		log = h.itemService.logger
	}
	chosen := newAwardPicker(rng, log).Pick(itemID, awards)

	selectedAwards := make([]resolvedItemAward, 0, len(chosen))
	for _, award := range chosen {
		count := int(award.Count)
		if count <= 0 {
			count = 1
		}

		selectedAwards = append(selectedAwards, resolvedItemAward{
			AwardID:     int(award.AwardID),
			AwardType:   int(award.Type),
			Count:       count,
			ItemQuality: normalizeAwardQuality(int(award.Quality)),
			PetQuality:  normalizePetAwardQuality(award.Quality),
			PreNameType: domainitem.NormalizeEquipmentPrefixType(int(award.PreNameType)),
			Payload:     award.Payload,
		})
	}

	return selectedAwards
}

func (h *awardEffectHandler) ensureAwardCapacity(ctx context.Context, charID int64, awards []resolvedItemAward) error {
	if h.itemService == nil {
		return nil
	}

	petCount := 0
	bagRewards := make([]bagRewardSpec, 0)
	for _, award := range awards {
		switch award.AwardType {
		case 12:
			petCount += award.Count
		case 30, 31, 32, 33, 34, 35, awardTypeMedal:
			continue
		case 19:
			colorCode := 0
			if award.ItemQuality > 0 {
				colorCode = domainitem.EquipmentColorCodeFromQuality(award.ItemQuality)
			}
			bagRewards = append(bagRewards, bagRewardSpec{
				TemplateID: award.AwardID,
				ItemType:   domainitem.ItemTypeEquipment,
				Count:      award.Count,
				ColorCode:  colorCode,
			})
		default:
			colorCode := 0
			if award.ItemQuality > 0 {
				colorCode = domainitem.EquipmentColorCodeFromQuality(award.ItemQuality)
			}
			bagRewards = append(bagRewards, bagRewardSpec{
				TemplateID: award.AwardID,
				ItemType:   domainitem.ItemTypeConsumable,
				Count:      award.Count,
				ColorCode:  colorCode,
			})
		}
	}

	if petCount > 0 && h.itemService.petService != nil {
		if checker, ok := h.itemService.petService.(petCapacityChecker); ok {
			hasCapacity, err := checker.HasPetCapacity(ctx, charID, petCount)
			if err != nil {
				return err
			}
			if !hasCapacity {
				return pkgerrors.ErrInventoryFull
			}
		}
	}

	return h.itemService.ensureBagCapacityForRewards(ctx, charID, bagRewards)
}

func (h *awardEffectHandler) grantPetAward(ctx context.Context, charID int64, templateID int, count int, quality float64) ([]*domainpet.Pet, error) {
	if h.itemService == nil || h.itemService.petService == nil {
		return nil, nil
	}

	templateIDs := make([]int, count)
	for i := range templateIDs {
		templateIDs[i] = templateID
	}

	if quality > 0 {
		if awardPetService, ok := h.itemService.petService.(petAwardQualityContractService); ok {
			return awardPetService.ContractPetsWithAwardQuality(ctx, charID, templateIDs, quality)
		}

		scaledQuality := int(quality*10 + 0.5)
		if scaledQuality > 0 {
			return h.itemService.petService.ContractPetsWithQuality(ctx, charID, templateIDs, scaledQuality)
		}
	}

	return h.itemService.petService.ContractPets(ctx, charID, templateIDs)
}

func (h *awardEffectHandler) grantItemAward(ctx context.Context, charID int64, templateID int, awardType int, count int, quality int, preNameType int) ([]*GrantedItemResult, error) {
	if h.itemService == nil {
		return nil, nil
	}

	if awardType == 19 {
		return h.grantEquipmentAward(ctx, charID, templateID, count, quality, preNameType)
	}

	colorCode := 0
	if quality > 0 {
		colorCode = domainitem.EquipmentColorCodeFromQuality(quality)
	}

	var (
		rewardItem *domainitem.Item
		err        error
	)
	if colorCode > 0 {
		rewardItem, err = h.itemService.AddItemWithColor(ctx, charID, templateID, domainitem.ItemTypeConsumable, count, colorCode)
	} else {
		rewardItem, err = h.itemService.AddItem(ctx, charID, templateID, domainitem.ItemTypeConsumable, count)
	}
	if err != nil {
		return nil, err
	}

	return []*GrantedItemResult{{
		TemplateID: templateID,
		Count:      count,
		Item:       rewardItem,
	}}, nil
}

func (h *awardEffectHandler) grantEquipmentAward(ctx context.Context, charID int64, templateID int, count int, quality int, preNameType int) ([]*GrantedItemResult, error) {
	if h.itemService == nil {
		return nil, nil
	}

	colorCode := 0
	if quality > 0 {
		colorCode = domainitem.EquipmentColorCodeFromQuality(quality)
	}

	results := make([]*GrantedItemResult, 0, count)
	for range count {
		rewardItem, err := h.itemService.AddItemWithColor(ctx, charID, templateID, domainitem.ItemTypeEquipment, 1, colorCode)
		if err != nil {
			return nil, err
		}

		if quality > 0 || preNameType > 0 {
			rewardItem, err = h.itemService.ApplyEquipmentAwardAttributes(ctx, rewardItem.ID, quality, preNameType)
			if err != nil {
				return nil, err
			}
		}

		results = append(results, &GrantedItemResult{
			TemplateID: templateID,
			Count:      1,
			Item:       rewardItem,
		})
	}

	return results, nil
}

func normalizeAwardQuality(quality int) int {
	if quality < 0 {
		return 0
	}
	if quality > 25 {
		return 25
	}
	return quality
}

func normalizePetAwardQuality(quality float64) float64 {
	if quality <= 0 {
		return 0
	}
	return quality
}

func (h *awardEffectHandler) grantTitleAward(ctx context.Context, charID int64, titleID int) (*GrantedTitleResult, error) {
	if h.itemService == nil || h.itemService.titleService == nil {
		return nil, fmt.Errorf("title service not available")
	}

	result, err := h.itemService.titleService.GrantTitle(ctx, charID, titleID)
	if err != nil {
		return nil, err
	}

	return &GrantedTitleResult{
		TitleID:       result.TitleID,
		Titles:        result.Titles,
		SpecialTitles: result.SpecialTitles,
		IsSpecial:     result.IsSpecial,
		Added:         result.Added,
	}, nil
}

func (h *awardEffectHandler) grantSkillAward(ctx context.Context, charID int64, skillID int) (int, bool, error) {
	if h.itemService == nil || h.itemService.skillService == nil {
		return 0, false, fmt.Errorf("skill service not available")
	}

	hasSkill, err := h.itemService.skillService.HasSkill(ctx, charID, skillID)
	if err != nil {
		return 0, false, err
	}

	learned, err := h.itemService.skillService.LearnSkill(ctx, charID, skillID)
	if err != nil {
		return 0, false, err
	}
	if learned == nil {
		return 0, false, nil
	}

	return learned.SkillID, !hasSkill, nil
}

func (h *awardEffectHandler) grantBuffAward(ctx context.Context, charID int64, buffID int, count int, payload map[string]interface{}) (*domainbuff.Buff, error) {
	if h.itemService == nil || h.itemService.buffService == nil {
		return nil, fmt.Errorf("buff service not available")
	}

	durationSeconds := count
	if override, ok := awardPayloadInt(payload, "durationSeconds"); ok {
		durationSeconds = override
	}
	if durationSeconds < 0 {
		durationSeconds = 0
	}

	buffType := domainbuff.TypeTimed
	if durationSeconds <= 0 {
		buffType = domainbuff.TypePermanent
	}
	if override, ok := awardPayloadInt(payload, "buffType"); ok && override > 0 {
		buffType = override
	}

	stackCount := 1
	if override, ok := awardPayloadInt(payload, "stackCount"); ok && override > 0 {
		stackCount = override
	}

	request := appbuff.AddRequest{
		BuffID:      buffID,
		BuffType:    buffType,
		Source:      awardPayloadString(payload, "source", "item_award"),
		StackCount:  stackCount,
		BattlesLeft: awardPayloadOptionalInt(payload, "battlesLeft"),
		RoundsLeft:  awardPayloadOptionalInt(payload, "roundsLeft"),
	}
	if durationSeconds > 0 {
		request.Duration = time.Duration(durationSeconds) * time.Second
	}

	return h.itemService.buffService.AddOrRefresh(ctx, charID, request)
}

func (h *awardEffectHandler) grantGameCurrencyAward(char *character.Character, currencyType int, amount int) error {
	if char == nil {
		return fmt.Errorf("character not available")
	}
	return char.AddCurrency(currencyType, amount)
}

func (h *awardEffectHandler) grantMedalAward(ctx context.Context, charID int64, tid, count int) (bool, int, int, error) {
	if h.itemService == nil || h.itemService.medalGranter == nil {
		return false, 0, 0, nil
	}
	if h.gameData == nil || h.gameData.GetMedal(tid) == nil {
		return false, 0, 0, nil
	}
	slot, total, err := h.itemService.medalGranter.AddMedalToBag(ctx, charID, tid, count)
	if err != nil {
		return false, 0, 0, err
	}
	return true, slot, total, nil
}

func awardPayloadInt(payload map[string]interface{}, key string) (int, bool) {
	if payload == nil {
		return 0, false
	}
	value, ok := payload[key]
	if !ok {
		return 0, false
	}

	switch typed := value.(type) {
	case float64:
		return int(typed), true
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	default:
		return 0, false
	}
}

func awardPayloadOptionalInt(payload map[string]interface{}, key string) *int {
	value, ok := awardPayloadInt(payload, key)
	if !ok {
		return nil
	}
	result := value
	return &result
}

func awardPayloadString(payload map[string]interface{}, key string, fallback string) string {
	if payload == nil {
		return fallback
	}
	value, ok := payload[key]
	if !ok {
		return fallback
	}
	text, ok := value.(string)
	if !ok || text == "" {
		return fallback
	}
	return text
}
