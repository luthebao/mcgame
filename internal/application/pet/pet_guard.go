// Open-sourced by BaoLT

package pet

import (
	"context"
	"strconv"

	"mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

var petGuardLevelKeys = []string{"0", "1", "2", "3", "4"}

var petGuardPetKeys = []string{
	"0", "1", "2", "3", "4",
	"11", "12", "13", "14", "15",
	"21", "22", "23", "24", "25",
	"31", "32", "33", "34", "35",
	"41", "42", "43", "44", "45",
}

type petGuardState struct {
	LvData  map[string]int
	PetData map[string]int64
}

func NormalizePetGuardPayload(char *character.Character) map[string]interface{} {
	if char == nil {
		return defaultPetGuardState().toPayload()
	}
	return normalizePetGuardState(char.PetGuardData).toPayload()
}

func (s *Service) GetPetGuardData(ctx context.Context, charID int64) (map[string]interface{}, error) {
	_, state, err := s.loadPetGuardCharacterState(ctx, charID)
	if err != nil {
		return nil, err
	}
	return state.toPayload(), nil
}

func (s *Service) PutDownPet(ctx context.Context, charID int64, sid int) (map[string]interface{}, error) {
	if !isPetGuardSidAllowed(sid) {
		return nil, pkgerrors.ErrInvalidInput
	}

	char, state, err := s.loadPetGuardCharacterState(ctx, charID)
	if err != nil {
		return nil, err
	}

	sidKey := strconv.Itoa(sid)
	if state.PetData[sidKey] == 0 {
		return state.toPayload(), nil
	}

	state.PetData[sidKey] = 0
	char.PetGuardData = state.toStoredData()

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	s.logger.Info("Pet removed from pet guard slot",
		zap.Int64("character_id", charID),
		zap.Int("sid", sid))

	return state.toPayload(), nil
}

func (s *Service) MovePetToPetGuardSid(ctx context.Context, charID int64, petID int64, sid int) (map[string]interface{}, error) {
	if !isPetGuardSidAllowed(sid) {
		return nil, pkgerrors.ErrInvalidInput
	}
	if s.petRepo == nil {
		return nil, pkgerrors.ErrSystemError
	}

	char, state, err := s.loadPetGuardCharacterState(ctx, charID)
	if err != nil {
		return nil, err
	}

	p, err := s.getPetAndValidate(ctx, charID, petID)
	if err != nil {
		return nil, err
	}
	if !isPetEligibleForGuard(p) {
		return nil, pkgerrors.ErrInvalidInput
	}

	sidKey := strconv.Itoa(sid)
	if state.PetData[sidKey] == petID {
		return state.toPayload(), nil
	}
	if state.hasPet(petID) {
		return nil, pkgerrors.ErrInvalidInput
	}

	state.PetData[sidKey] = petID
	char.PetGuardData = state.toStoredData()

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	s.logger.Info("Pet assigned to pet guard slot",
		zap.Int64("character_id", charID),
		zap.Int64("pet_id", petID),
		zap.Int("sid", sid))

	return state.toPayload(), nil
}

func (s *Service) loadPetGuardCharacterState(ctx context.Context, charID int64) (*character.Character, petGuardState, error) {
	if s.charRepo == nil {
		return nil, petGuardState{}, pkgerrors.ErrSystemError
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, petGuardState{}, err
	}
	if char == nil {
		return nil, petGuardState{}, pkgerrors.ErrNotFound
	}

	return char, normalizePetGuardState(char.PetGuardData), nil
}

const (
	PetGuardCostTypeToken = 1
	PetGuardCostTypeGold  = 2
	PetGuardMaxLevel      = 5
)

type PetGuardUpgradeResult struct {
	Payload map[string]interface{}
	NewGold int64
	GoldSpent int64
}

func (s *Service) UpgradePetGuardSid(ctx context.Context, charID int64, sid int, costType int) (*PetGuardUpgradeResult, error) {
	if sid < 0 || sid > 4 {
		return nil, pkgerrors.ErrInvalidInput
	}
	if costType != PetGuardCostTypeGold {
		return nil, pkgerrors.ErrInvalidInput
	}
	if s.gameDataManager == nil {
		return nil, pkgerrors.ErrSystemError
	}

	char, state, err := s.loadPetGuardCharacterState(ctx, charID)
	if err != nil {
		return nil, err
	}

	sidKey := strconv.Itoa(sid)
	currentLevel := state.LvData[sidKey]
	if currentLevel >= PetGuardMaxLevel {
		return nil, pkgerrors.ErrInvalidInput
	}
	targetLevel := currentLevel + 1

	tpl := s.gameDataManager.FindPetGuardByLevSid(targetLevel, sid+1)
	if tpl == nil {
		return nil, pkgerrors.ErrNotFound
	}
	cost := int64(tpl.Gold)
	if cost <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}
	if char.Gold < cost {
		return nil, pkgerrors.ErrInsufficientFunds
	}

	char.Gold -= cost
	state.LvData[sidKey] = targetLevel
	char.PetGuardData = state.toStoredData()

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	s.logger.Info("Pet guard slot upgraded via gold",
		zap.Int64("character_id", charID),
		zap.Int("sid", sid),
		zap.Int("new_level", targetLevel),
		zap.Int64("gold_spent", cost))

	return &PetGuardUpgradeResult{
		Payload:   state.toPayload(),
		NewGold:   char.Gold,
		GoldSpent: cost,
	}, nil
}

func defaultPetGuardState() petGuardState {
	state := petGuardState{
		LvData:  make(map[string]int, len(petGuardLevelKeys)),
		PetData: make(map[string]int64, len(petGuardPetKeys)),
	}

	for _, key := range petGuardLevelKeys {
		state.LvData[key] = 0
	}
	for _, key := range petGuardPetKeys {
		state.PetData[key] = 0
	}

	return state
}

func normalizePetGuardState(source map[string]interface{}) petGuardState {
	state := defaultPetGuardState()
	if source == nil {
		return state
	}

	forEachPetGuardEntry(source["lvData"], func(key string, value interface{}) {
		if _, ok := state.LvData[key]; !ok {
			return
		}
		if parsed, ok := parsePetGuardNumber(value); ok && parsed >= 0 {
			state.LvData[key] = int(parsed)
		}
	})

	forEachPetGuardEntry(source["petData"], func(key string, value interface{}) {
		if _, ok := state.PetData[key]; !ok {
			return
		}
		if parsed, ok := parsePetGuardNumber(value); ok && parsed >= 0 {
			state.PetData[key] = parsed
		}
	})

	return state
}

func (s petGuardState) toStoredData() map[string]interface{} {
	return map[string]interface{}{
		"lvData":  s.levelDataObject(),
		"petData": s.petDataObject(),
	}
}

func (s petGuardState) toPayload() map[string]interface{} {
	return map[string]interface{}{
		"lvData":  s.levelDataObject(),
		"petData": s.petDataObject(),
	}
}

func (s petGuardState) levelDataObject() map[string]interface{} {
	result := make(map[string]interface{}, len(s.LvData))
	for _, key := range petGuardLevelKeys {
		result[key] = s.LvData[key]
	}
	return result
}

func (s petGuardState) petDataObject() map[string]interface{} {
	result := make(map[string]interface{}, len(s.PetData))
	for _, key := range petGuardPetKeys {
		result[key] = s.PetData[key]
	}
	return result
}

func (s petGuardState) hasPet(petID int64) bool {
	for _, key := range petGuardPetKeys {
		if s.PetData[key] == petID {
			return true
		}
	}
	return false
}

func isPetGuardSidAllowed(sid int) bool {
	switch {
	case sid >= 0 && sid <= 4:
		return true
	case sid >= 11 && sid <= 45:
		return sid%10 >= 1 && sid%10 <= 5 && sid/10 >= 1 && sid/10 <= 4
	default:
		return false
	}
}

func isPetEligibleForGuard(p *domainpet.Pet) bool {
	if p == nil {
		return false
	}

	classIDs, ok := parsePetGuardNumber(p.CreatureData["classIds"])
	if !ok {
		classIDs, ok = parsePetGuardNumber(p.CreatureData["class_ids"])
	}
	if !ok || classIDs != 10 {
		return false
	}

	useLevel, ok := parsePetGuardNumber(p.CreatureData["useLv"])
	if !ok {
		useLevel, ok = parsePetGuardNumber(p.CreatureData["use_lv"])
	}
	return ok && useLevel >= 50
}

func parsePetGuardNumber(value interface{}) (int64, bool) {
	switch typed := value.(type) {
	case int:
		return int64(typed), true
	case int32:
		return int64(typed), true
	case int64:
		return typed, true
	case float32:
		return int64(typed), true
	case float64:
		return int64(typed), true
	case string:
		if typed == "" {
			return 0, false
		}
		parsed, err := strconv.ParseInt(typed, 10, 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func forEachPetGuardEntry(value interface{}, visit func(string, interface{})) {
	switch typed := value.(type) {
	case map[string]interface{}:
		for key, item := range typed {
			visit(key, item)
		}
	case map[string]int:
		for key, item := range typed {
			visit(key, item)
		}
	case map[string]int64:
		for key, item := range typed {
			visit(key, item)
		}
	case map[string]float64:
		for key, item := range typed {
			visit(key, item)
		}
	case map[int]interface{}:
		for key, item := range typed {
			visit(strconv.Itoa(key), item)
		}
	case map[int]int:
		for key, item := range typed {
			visit(strconv.Itoa(key), item)
		}
	case map[int]int64:
		for key, item := range typed {
			visit(strconv.Itoa(key), item)
		}
	case map[int]float64:
		for key, item := range typed {
			visit(strconv.Itoa(key), item)
		}
	}
}
