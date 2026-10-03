// Open-sourced by BaoLT

// Activity onboarding handlers cover starter login rewards and intro panel state.
package activity

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) GetTodayAward(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	response := map[string]interface{}{
		"dailyAward":    0,
		"dailyDisc":     0,
		"contiLoginDay": []interface{}{1, 0},
	}

	h.logger.Info("GetTodayAward: returning starter login award payload",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	return response, nil
}

func (h *Handler) GetCurrentFeast(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	response := map[string]interface{}{
		"id":     0,
		"enable": 0,
	}

	h.logger.Info("GetCurrentFeast: returning no active feast",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	return response, nil
}

func (h *Handler) GetDailyPanelAwardState(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	response := map[string]interface{}{
		"gameintro": true,
		"txkcBtn":   false,
		"txkcBtn2":  false,
		"fback":     false,
		"autot":     false,
		"vip":       false,
	}

	h.logger.Info("GetDailyPanelAwardState: returning default button state",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	return response, nil
}
