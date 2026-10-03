// Open-sourced by BaoLT

// Handler for changeProperty RPC — stat point allocation from Character Panel.
package character

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	"mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) ChangeProperty(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	obj := utils.NormalizeAMFMap(args[0])
	if obj == nil {
		h.logger.Warn("changeProperty: invalid arg type", zap.Any("type", args[0]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	addStr := utils.ParseStatString(obj["addStrength"])
	addAgi := utils.ParseStatString(obj["addAgility"])
	addSta := utils.ParseStatString(obj["addStamina"])
	addInt := utils.ParseStatString(obj["addIntelligence"])
	addEng := utils.ParseStatString(obj["addEnergy"])
	total := addStr + addAgi + addSta + addInt + addEng

	if total <= 0 {
		return nil, nil
	}

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	if total > char.AttrPoints {
		h.logger.Warn("changeProperty: not enough points",
			zap.Int("requested", total),
			zap.Int("available", char.AttrPoints))
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Không đủ điểm thuộc tính!")
		return nil, nil
	}

	allocations := []struct {
		attr  string
		count int
	}{
		{"strength", addStr},
		{"agility", addAgi},
		{"stamina", addSta},
		{"intelligence", addInt},
		{"spirit", addEng},
	}

	for _, a := range allocations {
		for i := 0; i < a.count; i++ {
			char.AllocateAttribute(a.attr)
		}
	}

	if err := h.charService.Save(ctx.Context, char); err != nil {
		h.logger.Error("changeProperty: failed to save", zap.Error(err))
		return nil, err
	}

	var payload map[string]interface{}
	if h.itemService != nil {
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, charID)
		payload = domainchar.BuildStatRefreshUPPPayloadWithEquipment(char, bonuses)
	} else {
		payload = domainchar.BuildStatRefreshUPPPayload(char)
	}
	ctx.Connection.SendCallback("onUPP", payload)

	h.logger.Info("changeProperty applied",
		zap.Int64("char_id", charID),
		zap.Int("str", addStr),
		zap.Int("agi", addAgi),
		zap.Int("sta", addSta),
		zap.Int("int", addInt),
		zap.Int("eng", addEng),
		zap.Int("remaining", char.AttrPoints))

	return nil, nil
}

