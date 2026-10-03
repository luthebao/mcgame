// Open-sourced by BaoLT

// Scene state, attribute, and NPC-state handlers.
package scene

import (
	"fmt"
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetCharStateClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetCharStateClient called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))

	var charID int64
	var err error
	if len(args) > 0 {
		charID = int64(args[0].(float64))
	} else {
		charID, err = strconv.ParseInt(ctx.CharacterID, 10, 64)
		if err != nil {
			return nil, pkgerrors.ErrUnauthorized
		}
	}

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("Character not found for GetCharStateClient",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return 0, nil
	}

	state := 0
	if ctx.Connection != nil && charID == char.ID && ctx.Connection.IsInBattle() {
		state = clientCharStateBattle
	} else if conn := h.resolveCharacterConnection(charID, ctx.Connection); conn != nil && conn.IsInBattle() {
		state = clientCharStateBattle
	} else {
		state = clientCharStateNormal
	}

	return state, nil
}

func (h *Handler) GetCharAttributes(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("GetCharAttributes called", zap.Uint32("conn_id", ctx.ConnID), zap.Any("args", args))

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("Failed to get character attributes",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return nil, err
	}

	var attrs map[string]interface{}
	if h.itemService != nil {
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, charID)
		attrs = domainchar.BuildUPPPayloadWithEquipment(char, bonuses)
	} else {
		attrs = domainchar.BuildUPPPayload(char)
	}
	attrs["expSkill"] = char.Experience

	if err := ctx.Connection.SendCallback("onUPP", attrs); err != nil {
		h.logger.Error("Failed to send onUPP callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return attrs, nil
}

func (h *Handler) SetNpcState(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		h.logger.Warn("SetNpcState called with no arguments",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var npcID int
	switch v := args[0].(type) {
	case float64:
		npcID = int(v)
	case int:
		npcID = v
	case int64:
		npcID = int(v)
	case string:
		parsed, err := strconv.Atoi(v)
		if err != nil {
			h.logger.Warn("SetNpcState received invalid string argument",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.String("npc_id_str", v),
				zap.Error(err))
			return nil, pkgerrors.ErrInvalidArgs
		}
		npcID = parsed
	case nil:
		return nil, nil
	default:
		h.logger.Warn("SetNpcState received unsupported argument type",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.String("type", fmt.Sprintf("%T", args[0])),
			zap.Any("value", args[0]))
		return nil, pkgerrors.ErrInvalidArgs
	}

	state := h.calculateNpcQuestState(ctx, characterID, npcID)
	if err := ctx.Connection.SendCallback("onSetNpcState", npcID, state); err != nil {
		h.logger.Warn("Failed to send onSetNpcState callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int("npc_id", npcID),
			zap.Int("state", state),
			zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) getViewPropsWithEquipment(ctx *rtmp.RPCContext, characterID int64) (map[string]interface{}, error) {
	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx.Context, char)
		h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, characterID)
		return h.charService.BuildViewPropertiesWithEquipment(char, bonuses), nil
	}
	return domainchar.BuildViewPropertiesFromBase(char), nil
}

func (h *Handler) calculateNpcQuestState(ctx *rtmp.RPCContext, characterID int64, npcID int) int {
	if h.questNotify != nil {
		return h.questNotify.CalculateNpcQuestState(ctx, characterID, npcID)
	}
	return -1
}

func (h *Handler) SendPlayerAttributesUpdate(ctx *rtmp.RPCContext, charID int64) error {
	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		return err
	}

	var attrs map[string]interface{}
	if h.itemService != nil {
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, charID)
		attrs = domainchar.BuildUPPPayloadWithEquipment(char, bonuses)
	} else {
		attrs = domainchar.BuildUPPPayload(char)
	}
	attrs["expSkill"] = char.Experience

	return ctx.Connection.SendCallback("onUPP", attrs)
}
