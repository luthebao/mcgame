// Open-sourced by BaoLT

package magiccrystal

import (
	"strconv"

	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func (h *Handler) InitMagicCrystalData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("InitMagicCrystalData called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	wire := appmagiccrystal.DefaultInitWire()

	if h.service != nil {
		charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
		if err == nil {
			crystals, loadErr := h.service.Load(ctx.Context, charID)
			if loadErr != nil {
				h.logger.Error("InitMagicCrystalData: load failed",
					zap.Int64("character_id", charID),
					zap.Error(loadErr))
			} else {
				wire = appmagiccrystal.CrystalsToInitWire(crystals, "")
			}
		}
	}

	if ctx.Connection != nil {
		if sendErr := ctx.Connection.SendCallback("onInitMagicCrystalData", wire); sendErr != nil {
			h.logger.Warn("InitMagicCrystalData: push failed",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Error(sendErr))
		}
	}

	return nil, nil
}
