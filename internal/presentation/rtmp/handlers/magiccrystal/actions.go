// Open-sourced by BaoLT

package magiccrystal

import (
	"strconv"

	appmagiccrystal "mcgame-server/internal/application/magiccrystal"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const genericFailureMessage = "operation failed"

func (h *Handler) MagicCrystalActive(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MagicCrystalActive called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return errResponse("missing index parameter"), nil
	}
	slot, err := parseCrystalIndex(args[0])
	if err != nil {
		return errResponse("invalid crystal index"), nil
	}
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}
	if h.service == nil {
		return errResponse(genericFailureMessage), nil
	}
	result, err := h.service.Activate(ctx.Context, charID, slot)
	if err != nil {
		h.logger.Error("MagicCrystalActive failed", zap.Int64("character_id", charID), zap.Int("slot", slot), zap.Error(err))
		return errResponse(genericFailureMessage), nil
	}
	h.pushDeltas(ctx, result.Deltas)
	return successResponse(result.Crystal, nil), nil
}

func (h *Handler) MagicCrystalUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MagicCrystalUp called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return errResponse("missing index parameter"), nil
	}
	slot, err := parseCrystalIndex(args[0])
	if err != nil {
		return errResponse("invalid crystal index"), nil
	}
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}
	if h.service == nil {
		return errResponse(genericFailureMessage), nil
	}
	result, err := h.service.LevelUp(ctx.Context, charID, slot)
	if err != nil {
		h.logger.Error("MagicCrystalUp failed", zap.Int64("character_id", charID), zap.Int("slot", slot), zap.Error(err))
		return errResponse(genericFailureMessage), nil
	}
	h.pushDeltas(ctx, result.Deltas)
	return successResponse(result.Crystal, nil), nil
}

func (h *Handler) MagicCrystalAddPower(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MagicCrystalAddPower called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 3 {
		return errResponse("missing parameters"), nil
	}
	slot, err := parseCrystalIndex(args[0])
	if err != nil {
		return errResponse("invalid crystal index"), nil
	}
	amount, err := parsePowerAmount(args[1])
	if err != nil {
		return errResponse("invalid amount"), nil
	}
	pointType, ok := args[2].(string)
	if !ok || (pointType != appmagiccrystal.PointTypePower && pointType != appmagiccrystal.PointTypeSoul) {
		return errResponse("invalid point type (must be '1' or '2')"), nil
	}
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}
	if h.service == nil {
		return errResponse(genericFailureMessage), nil
	}
	result, err := h.service.AddPower(ctx.Context, charID, slot, amount, pointType)
	if err != nil {
		h.logger.Error("MagicCrystalAddPower failed", zap.Int64("character_id", charID), zap.Int("slot", slot), zap.Error(err))
		return errResponse(genericFailureMessage), nil
	}
	h.pushDeltas(ctx, result.Deltas)
	extras := map[string]interface{}{
		"amount":     amount,
		"point_type": pointType,
	}
	return successResponse(result.Crystal, extras), nil
}

func (h *Handler) MagicCrystalRecovery(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MagicCrystalRecovery called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if len(args) < 1 {
		return errResponse("missing index parameter"), nil
	}
	slot, err := parseCrystalIndex(args[0])
	if err != nil {
		return errResponse("invalid crystal index"), nil
	}
	charID, ok := characterIDFromCtx(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}
	if h.service == nil {
		return errResponse(genericFailureMessage), nil
	}
	result, err := h.service.Recover(ctx.Context, charID, slot)
	if err != nil {
		h.logger.Error("MagicCrystalRecovery failed", zap.Int64("character_id", charID), zap.Int("slot", slot), zap.Error(err))
		return errResponse(genericFailureMessage), nil
	}
	h.pushDeltas(ctx, result.Deltas)
	return successResponse(result.Crystal, nil), nil
}

func (h *Handler) pushDeltas(ctx *rtmp.RPCContext, deltas []appmagiccrystal.ResourceDelta) {
	if ctx == nil || ctx.Connection == nil || len(deltas) == 0 {
		return
	}
	payload := make(map[string]interface{}, len(deltas))
	for _, d := range deltas {
		if d.Field == "" {
			continue
		}
		payload[d.Field] = d.NewTotal
	}
	if len(payload) == 0 {
		return
	}
	_ = ctx.Connection.SendCallback("onUPP", payload)
}

func errResponse(msg string) map[string]interface{} {
	return map[string]interface{}{"success": false, "error": msg}
}

func successResponse(c appmagiccrystal.Crystal, extras map[string]interface{}) map[string]interface{} {
	resp := appmagiccrystal.CrystalToMap(c)
	resp["success"] = true
	for k, v := range extras {
		resp[k] = v
	}
	return resp
}

func characterIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}
