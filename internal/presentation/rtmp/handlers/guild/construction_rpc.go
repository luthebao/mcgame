// Open-sourced by BaoLT

package guild

import (
	"context"
	"fmt"
	"strconv"

	domainguild "mcgame-server/internal/domain/guild"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"
)

const (
	constructionCreateMode     = 2
	constructionUpgradeMode    = 1
	constructionPlaceholderTID = 10
	constructionBuildIDBase    = 1346
	constructionActorType      = 2
)

type constructionState struct {
	BuildID   int
	ExtendID  int
	TargetTID int
	MapID     int
	PosX      int
	PosY      int
	PosDir    int
	GuildID   int64
	Mode      int
}

func (h *Handler) StartConstruction(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	if len(args) < 1 {
		buildID, _ := ctx.Connection.GetLastGuildBuildContext()
		if buildID <= 0 {
			return nil, pkgerrors.ErrInvalidArgs
		}
		return buildID, nil
	}
	buildID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}
	return buildID, nil
}

func (h *Handler) ConstructBuild(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 4 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	extendID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}
	targetTID, err := parseIntArg(args[1])
	if err != nil {
		return nil, err
	}
	mode, err := parseIntArg(args[2])
	if err != nil {
		return nil, err
	}
	mapID, err := parseIntArg(args[3])
	if err != nil {
		return nil, err
	}

	guildItem, position, err := h.guildConstructionContext(ctx.Context, characterID, extendID, mapID)
	if err != nil {
		return nil, err
	}
	buildTpl := h.gameData.GetBuilding(targetTID)
	if buildTpl == nil {
		return nil, pkgerrors.ErrNotFound
	}

	buildID := constructionBuildIDBase + extendID
	if mode == constructionUpgradeMode && extendID > constructionBuildIDBase {
		buildID = extendID
	}

	state := &constructionState{
		BuildID:   buildID,
		ExtendID:  extendID,
		TargetTID: targetTID,
		MapID:     mapID,
		PosX:      int(position.PosX),
		PosY:      int(position.PosY),
		PosDir:    int(position.PosDir),
		GuildID:   guildItem.ID,
		Mode:      mode,
	}
	h.setConstructionState(state)
	ctx.Connection.SetLastGuildBuildContext(extendID, targetTID)

	createPayload := map[string]interface{}{
		"extendId":   extendID,
		"buildState": strconv.Itoa(mode),
		"mid":        strconv.Itoa(mapID),
		"posY":       strconv.Itoa(state.PosY),
		"gid":        guildItem.ID,
		"id":         buildID,
		"layer":      1,
		"posX":       strconv.Itoa(state.PosX),
		"tid":        constructionPlaceholderTID,
		"posDir":     strconv.Itoa(state.PosDir),
	}
	if err := ctx.Connection.SendCallback("onCreateBuild", createPayload); err != nil {
		return nil, err
	}

	buildNpcState := map[string]interface{}{
		"state": 1,
		"eid":   extendID,
	}
	h.broadcastConstructionCallback(ctx.Connection, "setBuildNpcState", buildNpcState)

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	h.broadcastGuild(guildItem, "onSay", h.guildConstructionChatPayload(char.ID, char.Name, h.guildConstructionGuildPayload(guildItem), fmt.Sprintf("Bắt đầu xây dựng %s, các thành viên ai có tiền góp tiền, ai có sức góp sức.", buildTpl.Name), ctx.Connection.GetChannelID()))
	return createPayload, nil
}

func (h *Handler) FinishCreate(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.finishConstruction(ctx, args, false)
}

func (h *Handler) FinishUpgrade(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.finishConstruction(ctx, args, true)
}

func (h *Handler) ResetConstruction(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	args = trimResponderArg(args)
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	buildID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}

	state := h.getConstructionState(buildID)
	if state == nil {
		return map[string]interface{}{"success": true}, nil
	}
	h.deleteConstructionState(buildID)

	payload := map[string]interface{}{
		"bid": buildID,
	}
	if err := ctx.Connection.SendCallback("onCancelUpgrade", payload); err != nil {
		return nil, err
	}
	h.broadcastConstructionCallback(ctx.Connection, "setBuildNpcState", map[string]interface{}{"state": 0, "eid": state.ExtendID})
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) finishConstruction(ctx *rtmp.RPCContext, args []interface{}, upgrade bool) (interface{}, error) {
	args = trimResponderArg(args)
	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	buildID, err := parseIntArg(args[0])
	if err != nil {
		return nil, err
	}

	state := h.getConstructionState(buildID)
	if state == nil {
		return nil, pkgerrors.ErrNotFound
	}
	buildTpl := h.gameData.GetBuilding(state.TargetTID)
	if buildTpl == nil {
		return nil, pkgerrors.ErrNotFound
	}

	updatedGuild, err := h.guildConstructionUpdatedGuild(ctx.Context, characterID, upgrade)
	if err != nil {
		return nil, err
	}

	propertyPayload := h.guildConstructionGuildPayload(updatedGuild)
	h.broadcastGuild(updatedGuild, "onGuildPropertyRefresh", propertyPayload)

	reloadPayload := map[string]interface{}{
		"extendId":   state.ExtendID,
		"buildState": "",
		"mid":        strconv.Itoa(state.MapID),
		"posY":       strconv.Itoa(state.PosY),
		"gid":        updatedGuild.ID,
		"id":         state.BuildID,
		"layer":      1,
		"timeStamp":  nil,
		"posX":       strconv.Itoa(state.PosX),
		"tid":        strconv.Itoa(state.TargetTID),
		"posDir":     strconv.Itoa(state.PosDir),
	}
	h.broadcastGuild(updatedGuild, "reloadBuild", reloadPayload)
	h.broadcastConstructionCallback(ctx.Connection, "setBuildNpcState", map[string]interface{}{"state": 0, "eid": state.ExtendID})

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	message := fmt.Sprintf("Bang hội xây dựng thành công %s", buildTpl.Name)
	if upgrade {
		message = fmt.Sprintf("Bang hội nâng cấp thành công %s", buildTpl.Name)
	}
	h.broadcastGuild(updatedGuild, "onSay", h.guildConstructionChatPayload(char.ID, char.Name, propertyPayload, message, ctx.Connection.GetChannelID()))
	h.deleteConstructionState(buildID)
	return reloadPayload, nil
}

func (h *Handler) guildConstructionContext(ctx context.Context, characterID int64, extendID int, mapID int) (*domainguild.Guild, *models.ExtendPositionTemplate, error) {
	if h.guildService == nil || h.gameData == nil {
		return nil, nil, pkgerrors.ErrSystemError
	}
	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx, characterID)
	if err != nil {
		return nil, nil, guildError(err)
	}
	if guildItem == nil {
		return nil, nil, pkgerrors.ErrNotFound
	}
	for _, position := range h.gameData.GetExtendPositionsByMapID(mapID) {
		if position != nil && int(position.ID) == extendID {
			return guildItem, position, nil
		}
	}
	return nil, nil, pkgerrors.ErrNotFound
}

func (h *Handler) guildConstructionUpdatedGuild(ctx context.Context, characterID int64, upgrade bool) (*domainguild.Guild, error) {
	if h.guildService == nil {
		return nil, pkgerrors.ErrSystemError
	}
	guildItem, _, err := h.guildService.GetGuildByMemberForClient(ctx, characterID)
	if err != nil {
		return nil, guildError(err)
	}
	if guildItem == nil {
		return nil, pkgerrors.ErrNotFound
	}
	if upgrade {
		return h.guildService.UpgradeGuildLevel(ctx, guildItem.ID, characterID)
	}
	return guildItem, nil
}

func (h *Handler) guildConstructionGuildPayload(guildItem *domainguild.Guild) map[string]interface{} {
	payload := h.guildInfoUpdateDTO(guildItem, 0)
	delete(payload, "updateType")
	return payload
}

func (h *Handler) guildConstructionChatPayload(characterID int64, name string, guildPayload map[string]interface{}, message string, channelID int) map[string]interface{} {
	return map[string]interface{}{
		"id":        characterID,
		"name":      name,
		"guildName": guildPayload,
		"type":      constructionActorType,
		"channelId": channelID,
		"pmLevel":   0,
		"footle":    false,
		"msg":       message,
	}
}

func (h *Handler) broadcastConstructionCallback(conn *rtmp.Connection, method string, payload map[string]interface{}) {
	if h.rtmpServer != nil {
		h.rtmpServer.BroadcastToAll(method, payload)
		return
	}
	_ = conn.SendCallback(method, payload)
}

func (h *Handler) setConstructionState(state *constructionState) {
	h.buildMu.Lock()
	defer h.buildMu.Unlock()
	h.buildStates[state.BuildID] = state
}

func (h *Handler) getConstructionState(buildID int) *constructionState {
	h.buildMu.RLock()
	defer h.buildMu.RUnlock()
	return h.buildStates[buildID]
}

func (h *Handler) deleteConstructionState(buildID int) {
	h.buildMu.Lock()
	defer h.buildMu.Unlock()
	delete(h.buildStates, buildID)
}
