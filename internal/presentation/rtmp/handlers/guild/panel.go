// Open-sourced by BaoLT

package guild

import (
	"strconv"

	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) InitViewGuildP(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		h.logger.Warn("InitViewGuildP: invalid character ID", zap.String("char_id", ctx.CharacterID), zap.Error(err))
		return nil, err
	}

	response, _, _, err := h.buildGuildPanelResponse(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("InitViewGuildP: failed to build panel response", zap.Error(err))
		return nil, guildError(err)
	}

	if err := ctx.Connection.SendCallback("onInitViewGuildP", response); err != nil {
		h.logger.Error("InitViewGuildP: failed to send callback", zap.Error(err))
	}

	return response, nil
}

func (h *Handler) GetGuildMemberList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		h.logger.Warn("GetGuildMemberList: invalid character ID", zap.String("char_id", ctx.CharacterID), zap.Error(err))
		return nil, err
	}

	response, guildItem, _, err := h.buildGuildPanelResponse(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("GetGuildMemberList: failed to build member list", zap.Error(err))
		return nil, guildError(err)
	}
	if guildItem == nil {
		return map[string]interface{}{}, nil
	}

	memberList, _ := response["memberList"].([]interface{})
	result := map[string]interface{}{}
	for _, item := range memberList {
		member, ok := item.(map[string]interface{})
		if !ok {
			continue
		}
		if id, ok := member["id"]; ok {
			result[strconvKey(id)] = member
		}
	}

	return result, nil
}

func (h *Handler) InitGuildList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	if ctx.CharacterID == "" {
		return nil, pkgerrors.ErrUnauthorized
	}

	if h.guildService == nil {
		result := map[string]interface{}{}
		_ = ctx.Connection.SendCallback("onInitGuildList", result)
		return result, nil
	}

	guilds, err := h.guildService.ListGuilds(ctx.Context)
	if err != nil {
		h.logger.Error("InitGuildList: failed to list guilds", zap.Error(err))
		return nil, guildError(err)
	}

	result := map[string]interface{}{}
	for _, guildItem := range guilds {
		if guildItem == nil {
			continue
		}
		result[strconv.FormatInt(guildItem.ID, 10)] = h.guildDTO(guildItem)
	}

	if err := ctx.Connection.SendCallback("onInitGuildList", result); err != nil {
		h.logger.Error("InitGuildList: failed to send callback", zap.Error(err))
	}

	return result, nil
}

func (h *Handler) GetInitGuildSlot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if h.guildService == nil {
		return map[string]interface{}{}, nil
	}

	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil {
		return map[string]interface{}{}, nil
	}

	return guildItem.Warehouse, nil
}

func (h *Handler) GetGuildPrivateSkillData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if h.guildService == nil {
		return map[string]interface{}{}, nil
	}

	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil {
		return map[string]interface{}{}, nil
	}

	return map[string]interface{}{
		"gid":          guildItem.ID,
		"skillDevData": h.filteredSkillDevData(guildItem.SkillDevData),
	}, nil
}

func strconvKey(value interface{}) string {
	switch typed := value.(type) {
	case string:
		return typed
	case int:
		return strconv.Itoa(typed)
	case int64:
		return strconv.FormatInt(typed, 10)
	case float64:
		return strconv.Itoa(int(typed))
	default:
		return ""
	}
}
