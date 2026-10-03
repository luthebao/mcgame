// Open-sourced by BaoLT

package character

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

func (h *Handler) GetCharDetailData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, err := detailCharacterID(ctx, args)
	if err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, charID)
	if err != nil {
		return nil, err
	}

	props := h.characterDetailProps(ctx, char)
	return domainchar.DetailStatPropPayload(props), nil
}

func detailCharacterID(ctx *rtmp.RPCContext, args []interface{}) (int64, error) {
	if len(args) > 0 {
		return detailInt64Arg(args[0])
	}

	charID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, pkgerrors.ErrUnauthorized
	}

	return charID, nil
}

func detailInt64Arg(value interface{}) (int64, error) {
	switch typed := value.(type) {
	case float64:
		return int64(typed), nil
	case int:
		return int64(typed), nil
	case int32:
		return int64(typed), nil
	case int64:
		return typed, nil
	case uint:
		return int64(typed), nil
	case uint32:
		return int64(typed), nil
	case uint64:
		return int64(typed), nil
	case string:
		return strconv.ParseInt(typed, 10, 64)
	default:
		return 0, pkgerrors.ErrInvalidArgs
	}
}

func (h *Handler) characterDetailProps(ctx *rtmp.RPCContext, char *domainchar.Character) map[string]interface{} {
	if h.itemService == nil {
		return domainchar.BuildViewPropertiesFromBase(char)
	}

	h.itemService.ApplyCharacterElementState(ctx.Context, char)
	h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
	bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, char.ID)

	return h.charService.BuildViewPropertiesWithEquipment(char, bonuses)
}
