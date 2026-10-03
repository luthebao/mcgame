// Open-sourced by BaoLT

package auth

import (
	"context"
	"fmt"
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const (
	interfaceSettingsPMKey = "interfaceData"
	tblSkillID             = 52
)

func (h *Handler) UpdateSettings(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	changes := normalizeSettingsMap(args[0])
	if len(changes) == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if err := h.updateCharacterSettings(ctx.Context, charID, changes); err != nil {
		return nil, err
	}

	h.logger.Debug("UpdateSettings received",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.Int("arg_count", len(args)),
		zap.Int("change_count", len(changes)))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) UpdateInterfaceSetting(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	key, ok := args[0].(string)
	if !ok || key == "" {
		return nil, pkgerrors.ErrInvalidArgs
	}

	value := normalizeSettingValue(args[1])
	isPet := false
	if len(args) >= 3 {
		parsed, ok := parseBoolSettingArg(args[2])
		if !ok {
			return nil, pkgerrors.ErrInvalidArgs
		}
		isPet = parsed
	}

	if isPet {
		if err := h.updateActivePetSettings(ctx.Context, charID, map[string]interface{}{key: value}); err != nil {
			return nil, err
		}
	} else {
		if err := h.updateCharacterSettings(ctx.Context, charID, map[string]interface{}{key: value}); err != nil {
			return nil, err
		}
	}

	h.logger.Debug("UpdateInterfaceSetting received",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.String("key", key),
		zap.Bool("is_pet", isPet))

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) SkillSetUserBar(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 3 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	skillID, ok := parseIntArg(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if _, ok := parseIntArg(args[1]); !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	slot, ok := parseIntArg(args[2])
	if !ok || slot < 1 || slot > 4 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if h.skillService != nil {
		hasSkill, err := h.skillService.HasSkill(ctx.Context, charID, skillID)
		if err != nil {
			return nil, err
		}
		if !hasSkill {
			return nil, pkgerrors.ErrNotFound
		}
	}

	if err := h.updateCharacterSettings(ctx.Context, charID, map[string]interface{}{
		fmt.Sprintf("st%d", slot):  tblSkillID,
		fmt.Sprintf("sid%d", slot): skillID,
	}); err != nil {
		return nil, err
	}

	h.logger.Debug("SkillSetUserBar received",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.Int("skill_id", skillID),
		zap.Int("slot", slot))

	return true, nil
}

func (h *Handler) SkillSetBattle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 4 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	skillID, ok := parseIntArg(args[0])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if _, ok := parseIntArg(args[1]); !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	slot, ok := parseIntArg(args[2])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	isPet, ok := parseBoolSettingArg(args[3])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if isPet {
		if slot != 2 && slot != 4 && slot != 6 && slot != 8 {
			return nil, pkgerrors.ErrInvalidArgs
		}
		if err := h.updatePetBattleSkillSetting(ctx.Context, charID, skillID, slot); err != nil {
			return nil, err
		}
	} else {
		if slot != 1 && slot != 3 && slot != 5 && slot != 7 {
			return nil, pkgerrors.ErrInvalidArgs
		}
		if h.skillService != nil {
			hasSkill, err := h.skillService.HasSkill(ctx.Context, charID, skillID)
			if err != nil {
				return nil, err
			}
			if !hasSkill {
				return nil, pkgerrors.ErrNotFound
			}
		}
		if err := h.updateCharacterSettings(ctx.Context, charID, map[string]interface{}{
			fmt.Sprintf("bt%d", slot): tblSkillID,
			fmt.Sprintf("bs%d", slot): skillID,
		}); err != nil {
			return nil, err
		}
	}

	h.logger.Debug("SkillSetBattle received",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", charID),
		zap.Int("skill_id", skillID),
		zap.Int("slot", slot),
		zap.Bool("is_pet", isPet))

	return true, nil
}

func currentCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	if ctx == nil {
		return 0, pkgerrors.ErrUnauthorized
	}
	if ctx.CharacterID != "" {
		characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
		if err == nil && characterID > 0 {
			return characterID, nil
		}
	}
	if ctx.Connection != nil {
		if characterID := ctx.Connection.GetCharacterID(); characterID > 0 {
			return characterID, nil
		}
	}
	return 0, pkgerrors.ErrUnauthorized
}

func (h *Handler) buildInterfaceData(ctx context.Context, char *domainchar.Character) map[string]interface{} {
	settings := defaultInterfaceData()
	if char == nil {
		return settings
	}

	mergeSettings(settings, characterInterfaceSettings(char))
	if h.petService != nil {
		activePet, err := h.petService.GetActivePet(ctx, char.ID)
		if err != nil {
			h.logger.Warn("Failed to load active pet interface settings",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		} else {
			mergeSettings(settings, activePetInterfaceSettings(activePet))
		}
	}
	return settings
}

func (h *Handler) updateCharacterSettings(ctx context.Context, charID int64, changes map[string]interface{}) error {
	if h.charService == nil {
		return pkgerrors.ErrNotFound
	}

	char, err := h.charService.GetByID(ctx, charID)
	if err != nil {
		return err
	}

	settings := characterInterfaceSettings(char)
	for key, value := range changes {
		switch key {
		case "defaultMoney":
			if asInt(value) == 2 {
				char.SelectedMoneyType = 2
			} else {
				char.SelectedMoneyType = 1
			}
		case "defaultGold":
			if asInt(value) == 2 {
				char.SelectedGoldType = 4
			} else {
				char.SelectedGoldType = 3
			}
		default:
			settings[key] = normalizeSettingValue(value)
		}
	}
	storeCharacterInterfaceSettings(char, settings)
	if err := h.charService.Save(ctx, char); err != nil {
		return err
	}
	if h.settingsRepo != nil {
		if upsertErr := h.settingsRepo.Upsert(ctx, charID, settings); upsertErr != nil {
			h.logger.Warn("updateCharacterSettings: failed to persist interface settings",
				zap.Int64("character_id", charID),
				zap.Error(upsertErr))
		}
	}
	return nil
}

func (h *Handler) updateActivePetSettings(ctx context.Context, charID int64, changes map[string]interface{}) error {
	if h.petService == nil {
		return pkgerrors.ErrNotFound
	}

	activePet, err := h.petService.GetActivePet(ctx, charID)
	if err != nil {
		return err
	}
	if activePet == nil {
		return pkgerrors.ErrNotFound
	}
	if activePet.Property == nil {
		activePet.Property = map[string]interface{}{}
	}
	for key, value := range changes {
		activePet.Property[key] = normalizeSettingValue(value)
	}
	return h.petService.Save(ctx, activePet)
}

func (h *Handler) updatePetBattleSkillSetting(ctx context.Context, charID int64, skillID, slot int) error {
	if h.petService == nil {
		return pkgerrors.ErrNotFound
	}

	activePet, err := h.petService.GetActivePet(ctx, charID)
	if err != nil {
		return err
	}
	if activePet == nil {
		return pkgerrors.ErrNotFound
	}
	if !petHasSkill(activePet, skillID) {
		return pkgerrors.ErrNotFound
	}

	if activePet.Property == nil {
		activePet.Property = map[string]interface{}{}
	}
	activePet.Property[fmt.Sprintf("bt%d", slot)] = tblSkillID
	activePet.Property[fmt.Sprintf("bs%d", slot)] = skillID
	return h.petService.Save(ctx, activePet)
}

func defaultInterfaceData() map[string]interface{} {
	settings := map[string]interface{}{
		"ac":      1,
		"am":      1,
		"he":      0,
		"hm":      0,
		"c0":      1,
		"c1":      0,
		"c2":      0,
		"c3":      0,
		"maxView": 100,
		"apvp":    false,
	}

	for slot := 1; slot <= 30; slot++ {
		settings[fmt.Sprintf("sid%d", slot)] = 0
		settings[fmt.Sprintf("st%d", slot)] = 0
	}
	for slot := 2; slot <= 9; slot++ {
		settings[fmt.Sprintf("p%d", slot)] = 10
	}
	for slot := 1; slot <= 6; slot++ {
		settings[fmt.Sprintf("bt%d", slot)] = 0
	}
	for slot := 1; slot <= 10; slot++ {
		settings[fmt.Sprintf("bs%d", slot)] = 0
	}

	return settings
}

func characterInterfaceSettings(char *domainchar.Character) map[string]interface{} {
	if char == nil {
		return map[string]interface{}{}
	}
	if char.PMProcessData == nil {
		char.PMProcessData = map[string]interface{}{}
	}

	settings := normalizeSettingsMap(char.PMProcessData[interfaceSettingsPMKey])
	if settings == nil {
		settings = map[string]interface{}{}
	}

	return settings
}

func storeCharacterInterfaceSettings(char *domainchar.Character, settings map[string]interface{}) {
	if char == nil {
		return
	}
	if char.PMProcessData == nil {
		char.PMProcessData = map[string]interface{}{}
	}
	char.PMProcessData[interfaceSettingsPMKey] = settings
}

func activePetInterfaceSettings(activePet *domainpet.Pet) map[string]interface{} {
	if activePet == nil || activePet.Property == nil {
		return map[string]interface{}{}
	}

	settings := map[string]interface{}{}
	for slot := 6; slot <= 9; slot++ {
		key := fmt.Sprintf("p%d", slot)
		settings[key] = normalizeSettingValue(activePet.Property[key])
		if settings[key] == nil {
			settings[key] = 10
		}
	}
	for _, slot := range []int{2, 4, 6} {
		typeKey := fmt.Sprintf("bt%d", slot)
		skillKey := fmt.Sprintf("bs%d", slot)
		settings[typeKey] = normalizeSettingValue(activePet.Property[typeKey])
		settings[skillKey] = normalizeSettingValue(activePet.Property[skillKey])
		if settings[typeKey] == nil {
			settings[typeKey] = 0
		}
		if settings[skillKey] == nil {
			settings[skillKey] = 0
		}
	}
	for _, slot := range []int{8, 10} {
		skillKey := fmt.Sprintf("bs%d", slot)
		settings[skillKey] = normalizeSettingValue(activePet.Property[skillKey])
		if settings[skillKey] == nil {
			settings[skillKey] = 0
		}
	}

	return settings
}

func normalizeSettingsMap(raw interface{}) map[string]interface{} {
	switch value := raw.(type) {
	case map[string]interface{}:
		normalized := make(map[string]interface{}, len(value))
		for key, item := range value {
			normalized[key] = normalizeSettingValue(item)
		}
		return normalized
	case map[interface{}]interface{}:
		normalized := make(map[string]interface{}, len(value))
		for key, item := range value {
			keyString, ok := key.(string)
			if !ok {
				continue
			}
			normalized[keyString] = normalizeSettingValue(item)
		}
		return normalized
	default:
		return nil
	}
}

func normalizeSettingValue(value interface{}) interface{} {
	switch v := value.(type) {
	case float64:
		return int(v)
	case float32:
		return int(v)
	case int64:
		return int(v)
	case int32:
		return int(v)
	default:
		return v
	}
}

func mergeSettings(dst map[string]interface{}, src map[string]interface{}) {
	for key, value := range src {
		dst[key] = normalizeSettingValue(value)
	}
}

func petHasSkill(activePet *domainpet.Pet, skillID int) bool {
	if activePet == nil || activePet.Property == nil {
		return false
	}
	for slot := 1; slot <= 15; slot++ {
		if asInt(activePet.Property[fmt.Sprintf("skill%d", slot)]) == skillID {
			return true
		}
	}
	return false
}

func asInt(value interface{}) int {
	switch v := value.(type) {
	case int:
		return v
	case int64:
		return int(v)
	case int32:
		return int(v)
	case float64:
		return int(v)
	case float32:
		return int(v)
	default:
		return 0
	}
}
