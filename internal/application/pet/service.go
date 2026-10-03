// Open-sourced by BaoLT

// Pet service handles pet lifecycle and management use cases.
// Provides pet list, following, naming, cultivation, evolution, fusion, and skills.
// Supports Phase 4A-C pet systems with stars, feathers, and aptitude improvements.
package pet

import (
	"context"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type Service struct {
	petRepo              domainpet.Repository
	itemRepo             domainitem.Repository
	charRepo             character.Repository
	featureBonusProvider FeatureBonusProvider
	soulProvider         PetSoulProvider
	gameDataManager      *gamedata.Manager
	logger               *zap.Logger
}

const (
	defaultPetSlotOpenCost = 20
	petSlotOpenItemID      = 326
)

func NewService(petRepo domainpet.Repository, logger *zap.Logger) *Service {
	return &Service{
		petRepo: petRepo,
		logger:  logger,
	}
}

type FeatureBonusProvider interface {
	AggregatePetBonuses(ctx context.Context, petID int64) (domainpet.EquipmentStatBonuses, domainpet.SkillStatBonuses)
}

type PetSoulProvider interface {
	PetSoulInfo(ctx context.Context, petID int64) map[string]interface{}
}

func (s *Service) SetCharacterRepository(repo character.Repository) {
	s.charRepo = repo
}

func (s *Service) SetItemRepository(repo domainitem.Repository) {
	s.itemRepo = repo
}

func (s *Service) SetGameDataManager(mgr *gamedata.Manager) {
	s.gameDataManager = mgr
}

func (s *Service) SetFeatureBonusProvider(provider FeatureBonusProvider) {
	s.featureBonusProvider = provider
}

func (s *Service) SetSoulProvider(provider PetSoulProvider) {
	s.soulProvider = provider
}

func (s *Service) GetPetList(ctx context.Context, charID int64) ([]*domainpet.Pet, error) {
	pets, err := s.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	for _, p := range pets {
		s.enrichPet(ctx, p)
	}

	return pets, nil
}

func (s *Service) GetPetDetail(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	return s.getPetAndValidate(ctx, charID, petID)
}

func (s *Service) GetFollowingPet(ctx context.Context, charID int64) (*domainpet.Pet, error) {
	p, err := s.petRepo.FindFollowingPet(ctx, charID)
	if err != nil || p == nil {
		return p, err
	}

	s.enrichPet(ctx, p)
	return p, nil
}

func (s *Service) GetActivePet(ctx context.Context, charID int64) (*domainpet.Pet, error) {
	pets, err := s.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	var followingPet *domainpet.Pet
	for _, candidate := range pets {
		if candidate == nil {
			continue
		}
		if candidate.ClientState() == int(domainpet.PetStateBattle) {
			s.enrichPet(ctx, candidate)
			return candidate, nil
		}
		if candidate.IsFollowing && followingPet == nil {
			followingPet = candidate
		}
	}

	if followingPet != nil {
		s.enrichPet(ctx, followingPet)
	}

	return followingPet, nil
}

func (s *Service) GetActivePetForRecovery(ctx context.Context, charID int64) (*domainpet.Pet, error) {
	pets, err := s.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	var followingPet *domainpet.Pet
	for _, candidate := range pets {
		if candidate == nil {
			continue
		}
		if candidate.ClientState() == int(domainpet.PetStateBattle) {
			return s.enrichPetPreservingVitals(ctx, candidate), nil
		}
		if candidate.IsFollowing && followingPet == nil {
			followingPet = candidate
		}
	}

	if followingPet != nil {
		return s.enrichPetPreservingVitals(ctx, followingPet), nil
	}

	return nil, nil
}

func (s *Service) Save(ctx context.Context, pet *domainpet.Pet) error {
	if pet == nil {
		return nil
	}
	return s.petRepo.Save(ctx, pet)
}

func (s *Service) StartFollow(ctx context.Context, charID int64, petID int64, currentFollowID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	if currentFollowID > 0 {
		if err := s.petRepo.UpdateFollowState(ctx, currentFollowID, false); err != nil {
			s.logger.Warn("Failed to clear previous following pet",
				zap.Int64("pet_id", currentFollowID),
				zap.Error(err))
		}
	} else {
		if err := s.petRepo.ClearFollowing(ctx, charID); err != nil {
			s.logger.Warn("Failed to clear following pets",
				zap.Int64("character_id", charID),
				zap.Error(err))
		}
	}

	if err := s.petRepo.UpdateFollowState(ctx, petID, true); err != nil {
		return nil, err
	}

	p.IsFollowing = true

	s.logger.Info("Pet started following",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.String("pet_name", p.Name))

	return p, nil
}

func (s *Service) CancelFollow(ctx context.Context, charID int64, petID int64) error {
	_, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return err
	}

	if err := s.petRepo.UpdateFollowState(ctx, petID, false); err != nil {
		return err
	}

	s.logger.Info("Pet stopped following",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID))

	return nil
}

func (s *Service) ChangeState(ctx context.Context, charID int64, petID int64, newState int) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	switch newState {
	case int(domainpet.PetStateBattle):
		if p.Life <= 0 {
			return nil, pkgerrors.ErrPetDead
		}
		pets, err := s.petRepo.FindByCharacterID(ctx, charID)
		if err != nil {
			return nil, err
		}

		for _, candidate := range pets {
			if candidate == nil || candidate.ID == petID {
				continue
			}
			if candidate.ClientState() != int(domainpet.PetStateBattle) {
				continue
			}

			candidate.SetClientState(int(domainpet.PetStateRest))
			if err := s.petRepo.Save(ctx, candidate); err != nil {
				return nil, err
			}
		}

		p.SetBinded(true)
	case int(domainpet.PetStateFollowing):
		pets, err := s.petRepo.FindByCharacterID(ctx, charID)
		if err != nil {
			return nil, err
		}

		for _, candidate := range pets {
			if candidate == nil || candidate.ID == petID {
				continue
			}
			if candidate.ClientState() != int(domainpet.PetStateFollowing) {
				continue
			}

			candidate.SetClientState(int(domainpet.PetStateRest))
			if err := s.petRepo.Save(ctx, candidate); err != nil {
				return nil, err
			}
		}
	case int(domainpet.PetStateRest):
	default:
		return nil, pkgerrors.ErrInvalidInput
	}

	p.SetClientState(newState)
	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet state changed",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("state", newState))

	return p, nil
}

func (s *Service) ChangeName(ctx context.Context, charID int64, petID int64, newName string) (*domainpet.Pet, error) {
	if len(newName) < 1 || len(newName) > 20 {
		return nil, pkgerrors.ErrInvalidInput
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	p.Name = newName
	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet name changed",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.String("new_name", newName))

	return p, nil
}

func (s *Service) PetEat(ctx context.Context, charID int64, mainPetID, costPetID int64, useLuckItem bool, luckNum int, aptType domainpet.AptitudeType) (*domainpet.Pet, error) {
	mainPet, err := s.getPetAndValidate(ctx, charID, mainPetID)
	if err != nil {
		return nil, err
	}

	costPet, err := s.petRepo.FindByID(ctx, costPetID)
	if err != nil {
		return nil, err
	}

	if costPet.CharacterID != charID {
		return nil, pkgerrors.ErrNotFound
	}

	if mainPetID == costPetID {
		return nil, pkgerrors.ErrInvalidInput
	}

	baseGain := 1 + costPet.Level/20

	if useLuckItem && luckNum > 0 {
		baseGain += luckNum
	}

	mainPet.ImproveAptitude(aptType, baseGain)

	if err := s.petRepo.Save(ctx, mainPet); err != nil {
		return nil, err
	}

	if err := s.petRepo.Delete(ctx, costPetID); err != nil {
		s.logger.Warn("Failed to delete cost pet",
			zap.Int64("pet_id", costPetID),
			zap.Error(err))
	}

	s.logger.Info("Pet ate another pet",
		zap.Int64("character_id", charID),
		zap.Int64("main_pet_id", mainPetID),
		zap.Int64("cost_pet_id", costPetID),
		zap.Int("apt_type", int(aptType)),
		zap.Int("gain", baseGain))

	return mainPet, nil
}

func (s *Service) UpgradeStar(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	if !p.AddStar() {
		return nil, pkgerrors.ErrInvalidInput
	}

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet star upgraded",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("stars", p.UpgradeNum))

	return p, nil
}

func (s *Service) BeginMounting(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	p.IsMounting = true
	p.IsFollowing = false

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet mounting started",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID))

	return p, nil
}

func (s *Service) GainExperience(ctx context.Context, charID int64, petID int64, amount int64) (*domainpet.Pet, bool, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, false, err
	}

	leveledUp := p.GainExperience(amount)

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, false, err
	}

	if leveledUp {
		s.logger.Info("Pet leveled up",
			zap.Int64("character_id", charID),
			zap.Int64("pet_id", petID),
			zap.Int("new_level", p.Level))
	}

	return p, leveledUp, nil
}

func (s *Service) DeletePet(ctx context.Context, charID int64, petID int64) error {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return err
	}

	if err := s.movePetEquipmentToBag(ctx, p); err != nil {
		return err
	}

	if err := s.petRepo.Delete(ctx, petID); err != nil {
		return err
	}

	s.logger.Info("Pet deleted",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID))

	return nil
}

func (s *Service) ClearStars(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	p.ClearStars()

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet stars cleared",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID))

	return p, nil
}

func (s *Service) FeatherUpgrade(ctx context.Context, charID int64, petID int64, materialIDs []int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	p.Property["featherInProgress"] = true
	p.Property["featherMaterials"] = materialIDs

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet feather upgrade started",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("material_count", len(materialIDs)))

	return p, nil
}

func (s *Service) FeatherNextStep(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	if _, ok := p.Property["featherInProgress"]; !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	if !p.AddFeather() {
		return nil, pkgerrors.ErrInvalidInput
	}

	delete(p.Property, "featherInProgress")
	delete(p.Property, "featherMaterials")

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet feather upgrade completed",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("feather_level", p.GetFeatherLevel()))

	return p, nil
}

func (s *Service) EvolvePet(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	if !p.Evolve() {
		return nil, pkgerrors.ErrInvalidInput
	}

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet evolved",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("evolution_level", p.EvolutionLv))

	return p, nil
}

func (s *Service) FusePets(ctx context.Context, charID int64, mainPetID, materialPetID int64) (*domainpet.Pet, error) {
	mainPet, err := s.getPetAndValidate(ctx, charID, mainPetID)
	if err != nil {
		return nil, err
	}

	materialPet, err := s.petRepo.FindByID(ctx, materialPetID)
	if err != nil {
		return nil, err
	}

	if materialPet.CharacterID != charID {
		return nil, pkgerrors.ErrNotFound
	}

	if mainPetID == materialPetID {
		return nil, pkgerrors.ErrInvalidInput
	}

	mainPet.AbsorbPet(materialPet)

	if err := s.petRepo.Save(ctx, mainPet); err != nil {
		return nil, err
	}

	if err := s.petRepo.Delete(ctx, materialPetID); err != nil {
		s.logger.Warn("Failed to delete material pet",
			zap.Int64("pet_id", materialPetID),
			zap.Error(err))
	}

	s.logger.Info("Pets fused",
		zap.Int64("character_id", charID),
		zap.Int64("main_pet_id", mainPetID),
		zap.Int64("material_pet_id", materialPetID))

	return mainPet, nil
}

func (s *Service) SeniorFusePets(ctx context.Context, charID int64, mainPetID int64, materialPetIDs []int64) (*domainpet.Pet, error) {
	mainPet, err := s.getPetAndValidate(ctx, charID, mainPetID)
	if err != nil {
		return nil, err
	}

	for _, materialPetID := range materialPetIDs {
		if materialPetID == mainPetID {
			continue
		}

		materialPet, err := s.petRepo.FindByID(ctx, materialPetID)
		if err != nil {
			s.logger.Warn("Failed to find material pet",
				zap.Int64("pet_id", materialPetID),
				zap.Error(err))
			continue
		}

		if materialPet.CharacterID != charID {
			continue
		}

		mainPet.AbsorbPet(materialPet)

		if err := s.petRepo.Delete(ctx, materialPetID); err != nil {
			s.logger.Warn("Failed to delete material pet",
				zap.Int64("pet_id", materialPetID),
				zap.Error(err))
		}
	}

	if err := s.petRepo.Save(ctx, mainPet); err != nil {
		return nil, err
	}

	s.logger.Info("Senior pet fusion completed",
		zap.Int64("character_id", charID),
		zap.Int64("main_pet_id", mainPetID),
		zap.Int("material_count", len(materialPetIDs)))

	return mainPet, nil
}

func (s *Service) Cultivate(ctx context.Context, charID int64, petID int64, cultivationType int) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	cult := p.GetCultivation()
	newProgress := cult["progress"] + 10

	if newProgress >= 100 {
		switch cultivationType {
		case 1:
			p.AptStrengthEx += 5
		case 2:
			p.AptAgilityEx += 5
		case 3:
			p.AptStaminaEx += 5
		case 4:
			p.AptIntelligenceEx += 5
		case 5:
			p.AptEnergyEx += 5
		}
		newProgress = 0
		p.RecalculateStats()
	}

	p.SetCultivation(cultivationType, newProgress)

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet cultivation performed",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("cultivation_type", cultivationType),
		zap.Int("progress", newProgress))

	return p, nil
}

func (s *Service) UseCultivationItem(ctx context.Context, charID int64, petID int64, itemID int) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	bonusAmount := itemID % 10
	if bonusAmount < 1 {
		bonusAmount = 1
	}

	p.AptStrengthEx += bonusAmount
	p.AptAgilityEx += bonusAmount
	p.AptStaminaEx += bonusAmount
	p.AptIntelligenceEx += bonusAmount
	p.AptEnergyEx += bonusAmount
	p.RecalculateStats()

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet cultivation item used",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("item_id", itemID),
		zap.Int("bonus", bonusAmount))

	return p, nil
}

func (s *Service) PetXsd(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}

	p.GrowRateAdd += 0.01
	p.RecalculateStats()

	if err := s.petRepo.Save(ctx, p); err != nil {
		return nil, err
	}

	s.logger.Info("Pet XSD performed",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID))

	return p, nil
}

func (s *Service) OpenPetSlot(ctx context.Context, charID int64) (int, int, string, int64, error) {
	if s.charRepo == nil {
		return 0, 0, "", 0, pkgerrors.ErrSystemError
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return 0, 0, "", 0, err
	}
	if char == nil {
		return 0, 0, "", 0, pkgerrors.ErrNotFound
	}
	char.NormalizeSlotFields()

	currentSlots := char.PetMaxNum
	if currentSlots > domainpet.MaxPets {
		currentSlots = domainpet.MaxPets
	}
	if currentSlots >= domainpet.MaxPets {
		return domainpet.MaxPets, 0, "", 0, pkgerrors.ErrInventoryFull
	}

	cost := s.petSlotOpenCost()
	currencyType, remaining, err := consumePetSlotCurrency(char, cost)

	if err != nil {
		return currentSlots, 0, "", 0, err
	}

	char.PetMaxNum = currentSlots + 1
	char.PetSlots = char.PetMaxNum
	char.NormalizeSlotFields()

	if err := s.charRepo.Update(ctx, char); err != nil {
		return char.PetMaxNum, 0, "", 0, err
	}

	s.logger.Info("Pet slot opened",
		zap.Int64("character_id", charID),
		zap.Int("new_slots", char.PetMaxNum),
		zap.String("currency_type", currencyType),
		zap.Int("cost", cost))

	return char.PetMaxNum, cost, currencyType, remaining, nil
}

func (s *Service) HasEmptyPetSlot(ctx context.Context, charID int64) (bool, error) {
	if s.charRepo == nil {
		// Fallback if repo not set
		return true, nil
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return false, err
	}
	char.NormalizeSlotFields()

	count, err := s.petRepo.Count(ctx, charID)
	if err != nil {
		return false, err
	}

	return count < char.PetMaxNum, nil
}

func (s *Service) GetPetSlotCount(ctx context.Context, charID int64) (int, error) {
	if s.charRepo == nil {
		return 0, pkgerrors.ErrSystemError
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return 0, err
	}
	char.NormalizeSlotFields()

	return char.PetMaxNum, nil
}

func (s *Service) petSlotOpenCost() int {
	if s.gameDataManager != nil {
		if template := s.gameDataManager.GetItem(petSlotOpenItemID); template != nil && template.Gold > 0 {
			return int(template.Gold)
		}
	}
	return defaultPetSlotOpenCost
}

func consumePetSlotCurrency(char *character.Character, cost int) (string, int64, error) {
	c := int64(cost)
	if char.GoldBind >= c {
		char.GoldBind -= c
		return "goldBind", char.GoldBind, nil
	}
	if char.Gold >= c {
		char.Gold -= c
		return "gold", char.Gold, nil
	}
	return "", 0, pkgerrors.ErrInsufficientFunds
}

func (s *Service) getPetAndValidate(ctx context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, err := s.petRepo.FindByID(ctx, petID)
	if err != nil {
		return nil, err
	}

	if p.CharacterID != charID {
		return nil, pkgerrors.ErrNotFound
	}

	s.enrichPet(ctx, p)
	return p, nil
}

func (s *Service) enrichPet(ctx context.Context, p *domainpet.Pet) {
	if p == nil {
		return
	}

	if s.soulProvider != nil {
		p.SoulInfo = s.soulProvider.PetSoulInfo(ctx, p.ID)
	}

	if s.gameDataManager == nil {
		ensurePetSkillSlots(p)
		p.SetSkillBonuses(domainpet.NewSkillStatBonuses())
		p.SetEquipmentBonuses(domainpet.NewEquipmentStatBonuses())
		p.RecalculateStats()
		return
	}

	template := s.gameDataManager.GetCreature(int(p.TemplateID))
	if template != nil {
		p.SetCreatureData(template)
	}
	ensurePetSkillSlots(p)
	s.syncPetEquipmentBonuses(ctx, p)
	s.syncPetSkillBonuses(p)
	if s.featureBonusProvider != nil {
		equipmentBonuses, skillBonuses := s.featureBonusProvider.AggregatePetBonuses(ctx, p.ID)
		p.SetEquipmentBonuses(mergePetEquipmentBonuses(pEquipmentBonuses(p), equipmentBonuses))
		p.SetSkillBonuses(mergePetSkillBonuses(pSkillBonuses(p), skillBonuses))
	}
	p.RecalculateStats()
}

func (s *Service) enrichPetPreservingVitals(ctx context.Context, p *domainpet.Pet) *domainpet.Pet {
	if p == nil {
		return nil
	}

	currentHP := p.CurrentHP
	currentMP := p.CurrentMP
	s.enrichPet(ctx, p)
	p.CurrentHP = currentHP
	p.CurrentMP = currentMP
	return p
}

func mergePetEquipmentBonuses(base, extra domainpet.EquipmentStatBonuses) domainpet.EquipmentStatBonuses {
	merged := domainpet.NewEquipmentStatBonuses()
	for propType, value := range base.Flat {
		merged.AddFlat(propType, value)
	}
	for propType, value := range base.Percent {
		merged.AddPercent(propType, value)
	}
	for propType, value := range base.Float {
		merged.AddFloat(propType, value)
	}
	for propType, value := range extra.Flat {
		merged.AddFlat(propType, value)
	}
	for propType, value := range extra.Percent {
		merged.AddPercent(propType, value)
	}
	for propType, value := range extra.Float {
		merged.AddFloat(propType, value)
	}
	return merged
}

func mergePetSkillBonuses(base, extra domainpet.SkillStatBonuses) domainpet.SkillStatBonuses {
	merged := domainpet.NewSkillStatBonuses()
	for propType, value := range base.Direct {
		merged.AddDirect(propType, value)
	}
	for propType, value := range base.Scaled {
		merged.AddScaled(propType, value)
	}
	for propType, value := range extra.Direct {
		merged.AddDirect(propType, value)
	}
	for propType, value := range extra.Scaled {
		merged.AddScaled(propType, value)
	}
	return merged
}

func pEquipmentBonuses(p *domainpet.Pet) domainpet.EquipmentStatBonuses {
	if p == nil {
		return domainpet.NewEquipmentStatBonuses()
	}
	return p.EquipmentBonuses()
}

func pSkillBonuses(p *domainpet.Pet) domainpet.SkillStatBonuses {
	if p == nil {
		return domainpet.NewSkillStatBonuses()
	}
	return p.SkillBonuses()
}
