// Open-sourced by BaoLT

package auth

import (
	"context"
	"fmt"
	"strconv"

	amf0 "github.com/yutopp/go-amf0"
	"go.uber.org/zap"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func defaultInterfaceSettings() map[string]interface{} {
	settings := map[string]interface{}{
		"ac":        1,
		"am":        1,
		"he":        0,
		"hm":        0,
		"c0":        1,
		"c1":        0,
		"c2":        0,
		"c3":        0,
		"pid":       0,
		"glid":      0,
		"p1":        0,
		"maxView":   100,
		"dressHide": 0,
		"flyEffect": true,
		"hpmf":      true,
		"nlws":      true,
		"au":        0,
		"ubl":       false,
		"apvp":      0,
	}

	for idx := 1; idx <= 8; idx++ {
		settings[fmt.Sprintf("sid%d", idx)] = 0
		settings[fmt.Sprintf("st%d", idx)] = 0
		settings[fmt.Sprintf("bt%d", idx)] = 0
		settings[fmt.Sprintf("bs%d", idx)] = 0
	}

	for idx := 2; idx <= 9; idx++ {
		settings[fmt.Sprintf("p%d", idx)] = 10
	}

	for idx := 9; idx <= 10; idx++ {
		settings[fmt.Sprintf("bt%d", idx)] = 0
		settings[fmt.Sprintf("bs%d", idx)] = 0
	}

	return settings
}

func mergeInterfaceSettings(base map[string]interface{}, overrides map[string]interface{}) map[string]interface{} {
	merged := cloneInterfaceSettings(base)
	for key, value := range overrides {
		if value == nil {
			delete(merged, key)
			continue
		}
		merged[key] = value
	}
	return merged
}

func cloneInterfaceSettings(input map[string]interface{}) map[string]interface{} {
	if len(input) == 0 {
		return map[string]interface{}{}
	}

	cloned := make(map[string]interface{}, len(input))
	for key, value := range input {
		cloned[key] = value
	}
	return cloned
}

func normalizeInterfaceSettingsValue(value interface{}) interface{} {
	switch typed := value.(type) {
	case nil:
		return nil
	case bool:
		return typed
	case string:
		return typed
	case int:
		return typed
	case int8:
		return int(typed)
	case int16:
		return int(typed)
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case uint:
		return int(typed)
	case uint8:
		return int(typed)
	case uint16:
		return int(typed)
	case uint32:
		return int(typed)
	case uint64:
		return int(typed)
	case float32:
		if float32(int(typed)) == typed {
			return int(typed)
		}
		return float64(typed)
	case float64:
		if float64(int(typed)) == typed {
			return int(typed)
		}
		return typed
	default:
		return fmt.Sprint(typed)
	}
}

func normalizeInterfaceSettingsMap(value interface{}) map[string]interface{} {
	switch typed := value.(type) {
	case map[string]interface{}:
		normalized := make(map[string]interface{}, len(typed))
		for key, item := range typed {
			normalized[key] = normalizeInterfaceSettingsValue(item)
		}
		return normalized
	case map[interface{}]interface{}:
		normalized := make(map[string]interface{}, len(typed))
		for key, item := range typed {
			normalized[fmt.Sprint(key)] = normalizeInterfaceSettingsValue(item)
		}
		return normalized
	case amf0.ECMAArray:
		normalized := make(map[string]interface{}, len(typed))
		for key, item := range typed {
			normalized[key] = normalizeInterfaceSettingsValue(item)
		}
		return normalized
	default:
		return nil
	}
}

func parseInterfaceSettingsCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil || characterID <= 0 {
		return 0, pkgerrors.ErrUnauthorized
	}
	return characterID, nil
}

func (h *Handler) loadPersistedInterfaceSettings(ctx context.Context, characterID int64) map[string]interface{} {
	if h.settingsRepo == nil {
		return map[string]interface{}{}
	}

	settings, err := h.settingsRepo.GetByCharacterID(ctx, characterID)
	if err != nil {
		if h.logger != nil {
			h.logger.Warn("Failed to load interface settings",
				zap.Int64("character_id", characterID),
				zap.Error(err))
		}
		return map[string]interface{}{}
	}

	return settings
}
