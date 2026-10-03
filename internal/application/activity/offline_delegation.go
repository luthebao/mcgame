// Open-sourced by BaoLT

// Offline delegation service applies character and pet offline reward rules from AutoExpPanel.
package activity

import (
	"context"
	"errors"
	"math"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

var (
	ErrOfflineDelegationLevelTooLow   = errors.New("offline delegation level too low")
	ErrOfflineDelegationNoPet         = errors.New("offline delegation pet not found")
	ErrOfflineDelegationPetTooHigh    = errors.New("offline delegation pet level too high")
	ErrOfflineDelegationPetNotBound   = errors.New("offline delegation pet not bound")
	ErrOfflineDelegationPetExpCapped  = errors.New("offline delegation pet exp capped")
	ErrOfflineDelegationSilverMissing = errors.New("offline delegation silver missing")
	ErrOfflineDelegationGoldMissing   = errors.New("offline delegation gold missing")
)

type OfflineDelegationService struct {
	charRepo domainchar.Repository
	petRepo  domainpet.Repository
	logger   *zap.Logger
	nowFn    func() time.Time
}

type OfflineCharacterClaimResult struct {
	Character        *domainchar.Character
	ExpGained        int64
	LeveledUp        bool
	OldLevel         int
	RemainingSeconds int64
	CurrencyKey      string
	CurrencyDelta    int64
	CurrencyTotal    int64
}

type OfflinePetClaimResult struct {
	Character        *domainchar.Character
	Pet              *domainpet.Pet
	ExpGained        int64
	LeveledUp        bool
	RemainingSeconds int64
	CurrencyKey      string
	CurrencyDelta    int64
	CurrencyTotal    int64
}

func NewOfflineDelegationService(charRepo domainchar.Repository, petRepo domainpet.Repository, logger *zap.Logger) *OfflineDelegationService {
	return &OfflineDelegationService{
		charRepo: charRepo,
		petRepo:  petRepo,
		logger:   logger,
		nowFn:    time.Now,
	}
}

func (s *OfflineDelegationService) SetNowFunc(nowFn func() time.Time) {
	if nowFn != nil {
		s.nowFn = nowFn
	}
}

func (s *OfflineDelegationService) OfflineSeconds(char *domainchar.Character) int64 {
	if char == nil {
		return 0
	}
	now := s.nowFn()
	if char.LastActive.IsZero() || !now.After(char.LastActive) {
		return 0
	}
	return int64(now.Sub(char.LastActive).Seconds())
}

func (s *OfflineDelegationService) ClaimCharacterExp(ctx context.Context, characterID int64, availableSeconds int64, mode int, hours float64) (*OfflineCharacterClaimResult, error) {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if char.Level < 30 {
		return nil, ErrOfflineDelegationLevelTooLow
	}

	secondsToConsume, hoursToConsume, remainingSeconds, err := s.normalizeConsumption(char, availableSeconds, hours)
	if err != nil {
		return nil, err
	}

	expPerHour, err := s.characterExpPerHour(char.Level, mode)
	if err != nil {
		return nil, err
	}

	currencyKey, currencyDelta, currencyTotal, err := s.consumeCharacterCurrency(char, mode, hoursToConsume)
	if err != nil {
		return nil, err
	}

	expGained := int64(math.Round(expPerHour * hoursToConsume))
	oldLevel := char.Level
	leveledUp := grantOfflineCharacterExperience(char, expGained)
	char.LastActive = s.nowFn().Add(-time.Duration(remainingSeconds) * time.Second)

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	if s.logger != nil {
		s.logger.Info("Offline character exp claimed",
			zap.Int64("character_id", characterID),
			zap.Int("mode", mode),
			zap.Int64("consume_seconds", secondsToConsume),
			zap.Int64("exp_gained", expGained),
			zap.Int64("remaining_seconds", remainingSeconds))
	}

	return &OfflineCharacterClaimResult{
		Character:        char,
		ExpGained:        expGained,
		LeveledUp:        leveledUp,
		OldLevel:         oldLevel,
		RemainingSeconds: remainingSeconds,
		CurrencyKey:      currencyKey,
		CurrencyDelta:    currencyDelta,
		CurrencyTotal:    currencyTotal,
	}, nil
}

func (s *OfflineDelegationService) ClaimPetExp(ctx context.Context, characterID int64, availableSeconds int64, mode int, hours float64) (*OfflinePetClaimResult, error) {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if char.Level < 30 {
		return nil, ErrOfflineDelegationLevelTooLow
	}

	pet, err := s.petRepo.FindFollowingPet(ctx, characterID)
	if err != nil || pet == nil {
		return nil, ErrOfflineDelegationNoPet
	}
	if !pet.IsBound() {
		return nil, ErrOfflineDelegationPetNotBound
	}
	if pet.Level > char.Level+5 {
		return nil, ErrOfflineDelegationPetTooHigh
	}
	if pet.Level >= domainpet.MaxPetLevel {
		return nil, ErrOfflineDelegationPetExpCapped
	}

	_, hoursToConsume, remainingSeconds, err := s.normalizeConsumption(char, availableSeconds, hours)
	if err != nil {
		return nil, err
	}

	expPerHour, err := s.petExpPerHour(pet.Level, mode)
	if err != nil {
		return nil, err
	}

	currencyKey, currencyDelta, currencyTotal, err := s.consumePetCurrency(char, mode, hoursToConsume)
	if err != nil {
		return nil, err
	}

	expGained := int64(math.Round(expPerHour * hoursToConsume))
	leveledUp := pet.GainExperience(expGained)
	char.LastActive = s.nowFn().Add(-time.Duration(remainingSeconds) * time.Second)

	if err := s.petRepo.Save(ctx, pet); err != nil {
		return nil, err
	}
	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	if s.logger != nil {
		s.logger.Info("Offline pet exp claimed",
			zap.Int64("character_id", characterID),
			zap.Int64("pet_id", pet.ID),
			zap.Int("mode", mode),
			zap.Int64("exp_gained", expGained),
			zap.Int64("remaining_seconds", remainingSeconds))
	}

	return &OfflinePetClaimResult{
		Character:        char,
		Pet:              pet,
		ExpGained:        expGained,
		LeveledUp:        leveledUp,
		RemainingSeconds: remainingSeconds,
		CurrencyKey:      currencyKey,
		CurrencyDelta:    currencyDelta,
		CurrencyTotal:    currencyTotal,
	}, nil
}

func (s *OfflineDelegationService) normalizeConsumption(char *domainchar.Character, availableSeconds int64, hours float64) (int64, float64, int64, error) {
	if char == nil {
		return 0, 0, 0, pkgerrors.ErrInvalidInput
	}
	if availableSeconds <= 0 {
		availableSeconds = s.OfflineSeconds(char)
	}
	if availableSeconds <= 0 {
		return 0, 0, 0, pkgerrors.ErrInvalidInput
	}
	if hours <= 0 {
		return 0, 0, 0, pkgerrors.ErrInvalidInput
	}

	secondsToConsume := int64(math.Round(hours * 3600))
	if secondsToConsume <= 0 {
		return 0, 0, 0, pkgerrors.ErrInvalidInput
	}
	if secondsToConsume > availableSeconds {
		secondsToConsume = availableSeconds
	}

	hoursToConsume := float64(secondsToConsume) / 3600
	remainingSeconds := availableSeconds - secondsToConsume
	return secondsToConsume, hoursToConsume, remainingSeconds, nil
}

func (s *OfflineDelegationService) characterExpPerHour(level int, mode int) (float64, error) {
	base := float64(offlineTableValue(offlineBasicExpByLevel, level))
	switch mode {
	case 0:
		return base * 0.3, nil
	case 1:
		return base, nil
	case 2:
		return base * 2, nil
	case 3:
		return base * 3, nil
	default:
		return 0, pkgerrors.ErrInvalidInput
	}
}

func (s *OfflineDelegationService) petExpPerHour(level int, mode int) (float64, error) {
	base := float64(offlineTableValue(offlineBasicExpByLevel, level))
	switch mode {
	case 0:
		return base * 2, nil
	case 1:
		return base * 3, nil
	case 2:
		return base * 5, nil
	default:
		return 0, pkgerrors.ErrInvalidInput
	}
}

func (s *OfflineDelegationService) consumeCharacterCurrency(char *domainchar.Character, mode int, hours float64) (string, int64, int64, error) {
	switch mode {
	case 0:
		return "", 0, 0, nil
	case 1:
		cost := int64(math.Ceil(float64(offlineTableValue(offlineBasicMoneyByLevel, char.Level)) * 0.2 * hours))
		if cost <= 0 {
			return "", 0, 0, nil
		}
		moneyType := char.SelectedMoneyType
		if moneyType != 1 && moneyType != 2 {
			moneyType = 1
		}
		if moneyType == 1 {
			if char.MoneyBind < cost {
				return "", 0, 0, ErrOfflineDelegationSilverMissing
			}
			char.MoneyBind -= cost
			return "moneyBind", -cost, char.MoneyBind, nil
		}
		if char.Money < cost {
			return "", 0, 0, ErrOfflineDelegationSilverMissing
		}
		char.Money -= cost
		return "money", -cost, char.Money, nil
	case 2:
		return consumeOfflineGold(char, int64(math.Ceil(10*hours)))
	case 3:
		return consumeOfflineGold(char, int64(math.Ceil(20*hours)))
	default:
		return "", 0, 0, pkgerrors.ErrInvalidInput
	}
}

func (s *OfflineDelegationService) consumePetCurrency(char *domainchar.Character, mode int, hours float64) (string, int64, int64, error) {
	switch mode {
	case 0:
		return consumeOfflineGold(char, int64(math.Ceil(10*hours)))
	case 1:
		return consumeOfflineGold(char, int64(math.Ceil(20*hours)))
	case 2:
		return consumeOfflineGold(char, int64(math.Ceil(40*hours)))
	default:
		return "", 0, 0, pkgerrors.ErrInvalidInput
	}
}

func consumeOfflineGold(char *domainchar.Character, cost int64) (string, int64, int64, error) {
	if cost <= 0 {
		return "", 0, 0, nil
	}
	goldType := char.SelectedGoldType
	if goldType != 3 && goldType != 4 {
		goldType = 3
	}
	if goldType == 3 {
		if char.GoldBind < cost {
			return "", 0, 0, ErrOfflineDelegationGoldMissing
		}
		char.GoldBind -= cost
		return "goldBind", -cost, char.GoldBind, nil
	}
	if char.Gold < cost {
		return "", 0, 0, ErrOfflineDelegationGoldMissing
	}
	char.Gold -= cost
	return "gold", -cost, char.Gold, nil
}

func grantOfflineCharacterExperience(char *domainchar.Character, amount int64) bool {
	if char == nil || amount <= 0 {
		return false
	}

	if char.Level < domainchar.AutoLevelCap {
		return char.GainExperience(amount)
	}

	char.Experience += amount
	return false
}

func offlineTableValue(values []int64, level int) int64 {
	if len(values) == 0 {
		return 0
	}
	if level < 0 {
		level = 0
	}
	if level >= len(values) {
		level = len(values) - 1
	}
	return values[level]
}
