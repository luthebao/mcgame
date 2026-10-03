// Open-sourced by BaoLT

package guild

import (
	appguild "mcgame-server/internal/application/guild"
	"mcgame-server/internal/domain/guild"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) AddGuild(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	guildData, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	guildName, _ := guildData["name"].(string)
	if guildName == "" {
		return nil, pkgerrors.ErrInvalidInput
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, pkgerrors.ErrSystemError
	}
	if char == nil {
		return nil, pkgerrors.ErrCharacterNotFound
	}
	if char.Level < 50 {
		_ = ctx.Connection.SendCallback("a", msgGuildCreateInsufficientLevel)
		return nil, nil
	}
	if char.Money < 1000000 && char.MoneyBind < 1000000 {
		_ = ctx.Connection.SendCallback("a", msgGuildCreateInsufficientFunds)
		return nil, nil
	}

	guildItem, err := h.guildService.CreateGuild(ctx.Context, characterID, guildName)
	if err != nil {
		switch guildError(err) {
		case appguild.ErrGuildNameTaken:
			_ = ctx.Connection.SendCallback("a", msgGuildNameTaken)
			return nil, nil
		case appguild.ErrAlreadyInGuild:
			_ = ctx.Connection.SendCallback("a", msgAlreadyInGuild)
			return nil, nil
		default:
			return nil, guildError(err)
		}
	}
	h.syncCharacterGuildMembership(ctx.Context, characterID, int64Ptr(guildItem.ID))

	char, err = h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, pkgerrors.ErrSystemError
	}
	if char == nil {
		return nil, pkgerrors.ErrCharacterNotFound
	}

	if char.MoneyBind >= 1000000 {
		char.MoneyBind -= 1000000
	} else {
		char.Money -= 1000000
	}
	char.GuildID = int64Ptr(guildItem.ID)
	if err := h.charService.Update(ctx.Context, char); err != nil {
		_ = h.guildService.DisbandGuild(ctx.Context, guildItem.ID, characterID)
		h.syncCharacterGuildMembership(ctx.Context, characterID, nil)
		return nil, pkgerrors.ErrSystemError
	}

	guildItem, _, err = h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}

	response := h.guildDTO(guildItem)
	if err := ctx.Connection.SendCallback("onUPP", map[string]interface{}{"money": char.Money, "moneyBind": char.MoneyBind, "guildContrib": char.GuildContrib, "donateContrib": char.DonateContrib}); err != nil {
		h.logger.Warn("AddGuild: failed to send onUPP", zap.Error(err))
	}
	if h.rtmpServer != nil {
		h.rtmpServer.BroadcastToAll("onAddGuild", response)
	}

	panelResponse, _, _, buildErr := h.buildGuildPanelResponse(ctx.Context, characterID)
	if buildErr == nil {
		_ = ctx.Connection.SendCallback("onInitViewGuildP", panelResponse)
	}
	_ = ctx.Connection.SendCallback("a", msgGuildCreateGuide)
	if char.GuildContrib > 0 || char.DonateContrib > 0 {
		_ = ctx.Connection.SendCallback("a", msgGuildRestoreApplied)
	}

	return response, nil
}

func (h *Handler) AddGuildMember(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	request, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}

	guildIDValue, ok := request["gid"]
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	guildID, err := parseInt64Arg(guildIDValue)
	if err != nil {
		return nil, err
	}

	application, err := h.guildService.ApplyToGuild(ctx.Context, guildID, characterID)
	if err != nil {
		return nil, guildError(err)
	}

	response := h.applicationDTO(application)
	_ = ctx.Connection.SendCallback("onAddGuildMember", response)

	guildItem, guildErr := h.guildService.GetGuildForClient(ctx.Context, guildID)
	if guildErr == nil {
		h.broadcastGuild(guildItem, "onAddGuildMember", response)
	}

	return response, nil
}

func (h *Handler) QuitGuild(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	memberID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	member, err := h.guildService.GetMemberByID(ctx.Context, memberID)
	if err != nil {
		return nil, guildError(err)
	}
	if member == nil {
		application, appGuild, appErr := h.guildService.GetPendingApplicationByCharacterID(ctx.Context, characterID)
		if appErr != nil {
			return nil, guildError(appErr)
		}
		if application == nil || application.ID != memberID {
			return nil, pkgerrors.ErrNotFound
		}
		if _, err := h.guildService.CancelApplication(ctx.Context, application.ID, characterID); err != nil {
			return nil, guildError(err)
		}
		payload := map[string]interface{}{
			"id":   application.ID,
			"gid":  application.GuildID,
			"cid":  application.CharacterID,
			"name": application.CharacterName,
			"type": 4,
		}
		_ = ctx.Connection.SendCallback("onDelGuildMember", payload)
		if appGuild != nil {
			h.broadcastGuild(appGuild, "onDelGuildMember", payload)
		}
		return payload, nil
	}

	if member.CharacterID != characterID {
		return nil, pkgerrors.ErrUnauthorized
	}

	if member.Rank == guild.RankLeader {
		return nil, guildError(appguild.ErrNotGuildLeader)
	}

	if err := h.guildService.LeaveMember(ctx.Context, member.GuildID, member.CharacterID); err != nil {
		return nil, guildError(err)
	}
	h.syncCharacterGuildMembership(ctx.Context, member.CharacterID, nil)

	payload := map[string]interface{}{
		"id":   member.ID,
		"gid":  member.GuildID,
		"cid":  member.CharacterID,
		"name": member.CharacterName,
		"type": 2,
	}

	guildItem, guildErr := h.guildService.GetGuildForClient(ctx.Context, member.GuildID)
	if guildErr == nil {
		h.broadcastGuild(guildItem, "onDelGuildMember", payload)
	}
	h.sendToCharacter(member.CharacterID, "onDelGuildMember", payload)
	h.sendContributionState(member.CharacterID, msgGuildLeaveStateApplied)

	return payload, nil
}

func (h *Handler) ConfirmGuildApply(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	request, ok := args[0].(map[string]interface{})
	if !ok {
		return nil, pkgerrors.ErrInvalidInput
	}
	applicationID, err := parseInt64Arg(request["tableId"])
	if err != nil {
		return nil, err
	}

	application, member, err := h.guildService.ApproveApplication(ctx.Context, applicationID, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	h.syncCharacterGuildMembership(ctx.Context, application.CharacterID, int64Ptr(application.GuildID))

	payload := map[string]interface{}{
		"gid":     application.GuildID,
		"tableId": application.ID,
		"cid":     application.CharacterID,
		"gData":   h.memberDTO(member),
	}

	guildItem, guildErr := h.guildService.GetGuildForClient(ctx.Context, application.GuildID)
	if guildErr == nil {
		h.broadcastGuild(guildItem, "onConfirmGuildApply", payload)
	}
	h.sendToCharacter(application.CharacterID, "onConfirmGuildApply", payload)
	h.sendContributionState(application.CharacterID, msgGuildRestoreApplied)

	return payload, nil
}

func (h *Handler) RefuseGuildMember(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	applicationID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	application, err := h.guildService.RefuseApplication(ctx.Context, applicationID, characterID)
	if err != nil {
		return nil, guildError(err)
	}

	payload := map[string]interface{}{
		"id":   application.ID,
		"gid":  application.GuildID,
		"cid":  application.CharacterID,
		"name": application.CharacterName,
		"type": 3,
	}

	guildItem, guildErr := h.guildService.GetGuildForClient(ctx.Context, application.GuildID)
	if guildErr == nil {
		h.broadcastGuild(guildItem, "onDelGuildMember", payload)
	}
	h.sendToCharacter(application.CharacterID, "onDelGuildMember", payload)
	h.sendContributionState(application.CharacterID, msgGuildLeaveStateApplied)

	return payload, nil
}

func (h *Handler) KickGuildMember(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	memberID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	member, err := h.guildService.GetMemberByID(ctx.Context, memberID)
	if err != nil {
		return nil, guildError(err)
	}
	if member == nil {
		return nil, pkgerrors.ErrNotFound
	}

	if err := h.guildService.KickMember(ctx.Context, member.GuildID, characterID, member.CharacterID); err != nil {
		return nil, guildError(err)
	}
	h.syncCharacterGuildMembership(ctx.Context, member.CharacterID, nil)

	payload := map[string]interface{}{
		"id":   member.ID,
		"gid":  member.GuildID,
		"cid":  member.CharacterID,
		"name": member.CharacterName,
		"type": 1,
	}

	guildItem, guildErr := h.guildService.GetGuildForClient(ctx.Context, member.GuildID)
	if guildErr == nil {
		h.broadcastGuild(guildItem, "onDelGuildMember", payload)
	}
	h.sendToCharacter(member.CharacterID, "onDelGuildMember", payload)
	h.sendContributionState(member.CharacterID, msgGuildLeaveStateApplied)

	return payload, nil
}

func (h *Handler) DemiseTo(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	newLeaderID, err := parseInt64Arg(args[0])
	if err != nil {
		return nil, err
	}

	guildItem, selfMember, err := h.guildService.GetGuildByMemberForClient(ctx.Context, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil || selfMember == nil {
		return nil, pkgerrors.ErrNotFound
	}

	updatedGuild, err := h.guildService.TransferLeadership(ctx.Context, guildItem.ID, characterID, newLeaderID)
	if err != nil {
		return nil, guildError(err)
	}

	leaderName := ""
	for _, member := range updatedGuild.Members {
		if member != nil && member.CharacterID == newLeaderID {
			leaderName = member.CharacterName
			break
		}
	}

	payload := map[string]interface{}{
		"gid":    updatedGuild.ID,
		"oldCid": characterID,
		"newCid": newLeaderID,
		"ln":     leaderName,
	}

	h.broadcastGuild(updatedGuild, "onDemise", payload)
	if h.rtmpServer != nil {
		h.rtmpServer.BroadcastToAll("updateGuildInfo", h.guildDTO(updatedGuild))
	}

	return payload, nil
}
