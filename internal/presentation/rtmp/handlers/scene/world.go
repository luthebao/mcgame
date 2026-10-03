// Open-sourced by BaoLT

// Scene world-object, NPC, and boss handlers.
package scene

import (
	"context"
	"strconv"
	"strings"
	"time"

	appscene "mcgame-server/internal/application/scene"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	farmhandler "mcgame-server/internal/presentation/rtmp/handlers/farm"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) CreateNpcs(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	mapID, _ := ctx.Connection.GetSceneInfo()
	if mapID == 0 {
		mapID = char.MapID
	}

	npcList, err := h.buildNPCList(ctx.Context, characterID, mapID, ctx.Connection.GetChannelID())
	if err != nil {
		h.logger.Error("Failed to get map NPCs", zap.Error(err))
		if sendErr := ctx.Connection.SendCallback("onCreateNpcs", map[string]interface{}{}); sendErr != nil {
			h.logger.Error("Failed to send onCreateNpcs callback", zap.Error(sendErr))
		}
		return nil, nil
	}

	if err := ctx.Connection.SendCallback("onCreateNpcs", npcList); err != nil {
		h.logger.Error("Failed to send onCreateNpcs callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) buildNPCList(ctx context.Context, _ int64, mapID, channelID int) (map[string]interface{}, error) {
	npcs, err := h.sceneService.GetMapNPCsForClient(ctx, mapID)
	if err != nil {
		return nil, err
	}

	var hidden map[int]struct{}
	if h.scheduleBoss != nil {
		candidates := make([]int, 0, len(npcs))
		for _, n := range npcs {
			candidates = append(candidates, n.NID)
		}
		got, err := h.scheduleBoss.HiddenScheduleBosses(ctx, channelID, candidates)
		if err != nil {
			h.logger.Warn("HiddenScheduleBosses failed", zap.Int("channel_id", channelID), zap.Error(err))
		} else {
			hidden = got
		}
	}

	npcList := make(map[string]interface{}, len(npcs))
	npcByInstance := make(map[int]appscene.NPCClientData, len(npcs))
	for _, n := range npcs {
		if _, skip := hidden[n.NID]; skip {
			continue
		}
		npcByInstance[n.InstanceID] = n
		npcList[strconv.Itoa(n.InstanceID)] = map[string]interface{}{
			"nid":     n.NID,
			"x":       n.X,
			"y":       n.Y,
			"name":    n.Name,
			"resCode": n.ResCode,
			"type":    n.Type,
		}
	}

	if h.farmService == nil || !farmhandler.IsFarmMap(mapID) {
		return npcList, nil
	}

	plots, err := h.farmService.GetScenePlots(ctx)
	if err != nil {
		return nil, err
	}

	now := time.Now()
	for _, plot := range plots {
		if plot == nil || plot.PlotNPCID <= 0 || plot.CropNPCID <= 0 {
			continue
		}

		baseNPC, ok := npcByInstance[plot.PlotNPCID]
		if !ok {
			continue
		}

		resCode := baseNPC.ResCode
		if h.gameData != nil {
			if cropNPC := h.gameData.GetNPC(plot.CropNPCID); cropNPC != nil {
				resCode = int64(cropNPC.ResCode)
			}
		}

		x, y := farmhandler.VisualPositionForPlot(plot.PlotNPCID, baseNPC.X, baseNPC.Y)
		npcList[strconv.Itoa(farmhandler.VisualNPCID(plot.PlotNPCID))] = map[string]interface{}{
			"nid":     plot.CropNPCID,
			"x":       x,
			"y":       y,
			"name":    " ",
			"resCode": farmhandler.VisualResCode(plot, resCode, now),
			"type":    baseNPC.Type,
		}
	}

	return npcList, nil
}

func (h *Handler) CreateSceneItems(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	items, err := h.sceneService.GetMapItems(ctx.Context, char.MapID)
	if err != nil {
		h.logger.Error("Failed to get map items", zap.Error(err))
		return []interface{}{}, nil
	}

	result := make([]map[string]interface{}, len(items))
	for i, item := range items {
		result[i] = item.ToDTO()
	}

	h.logger.Debug("CreateSceneItems", zap.Int("map_id", char.MapID), zap.Int("count", len(result)))

	return result, nil
}

func (h *Handler) CreateBoss(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	if h.gameData == nil {
		h.logger.Warn("Game data manager not set, cannot load bosses")
		if sendErr := ctx.Connection.SendCallback("onCreateBoss", map[string]interface{}{}); sendErr != nil {
			h.logger.Error("Failed to send onCreateBoss callback", zap.Error(sendErr))
		}
		return nil, nil
	}

	mapID, _ := ctx.Connection.GetSceneInfo()
	if mapID == 0 {
		mapID = char.MapID
	}

	npcTemplates := h.gameData.GetNPCsByMapID(mapID)
	bossList := make(map[string]interface{})
	now := time.Now()
	for _, npc := range npcTemplates {
		if !npc.IsActiveAt(now) {
			continue
		}

		isBoss := false
		if npc.Type == 4 {
			isBoss = true
		} else if npc.SubType != "" {
			subTypeLower := strings.ToLower(npc.SubType)
			if strings.Contains(subTypeLower, "boss") || strings.Contains(subTypeLower, "wb") {
				isBoss = true
			}
		}

		if !isBoss {
			continue
		}

		npcID := npc.GetID()
		bossList[strconv.Itoa(npcID)] = map[string]interface{}{
			"id":      npcID,
			"nid":     npcID,
			"x":       int(npc.PosX),
			"y":       int(npc.PosY),
			"name":    npc.Name,
			"resCode": int64(npc.ResCode),
			"type":    npc.Type,
			"lv":      npc.Lv,
			"classId": npc.ClassID,
		}
	}

	if h.questService != nil {
		for _, entry := range h.questService.ActiveLoopBossForScene(ctx.Context, characterID, mapID) {
			key := strconv.Itoa(entry.NpcID)
			if _, exists := bossList[key]; exists {
				continue
			}
			bossList[key] = map[string]interface{}{
				"id":      entry.NpcID,
				"nid":     entry.NpcID,
				"name":    entry.Name,
				"resCode": entry.ResCode,
				"posX":    entry.PosX,
				"posY":    entry.PosY,
				"x":       entry.PosX,
				"y":       entry.PosY,
			}
		}
	}

	if err := ctx.Connection.SendCallback("onCreateBoss", bossList); err != nil {
		h.logger.Error("Failed to send onCreateBoss callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) ClickBoss(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	var bossID int
	switch v := args[0].(type) {
	case float64:
		bossID = int(v)
	case int:
		bossID = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	h.logger.Info("ClickBoss",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("boss_id", bossID),
		zap.Int("map_id", char.MapID))

	if h.gameData == nil {
		h.logger.Warn("Game data manager not set, cannot get boss info")
		return nil, pkgerrors.ErrSystemError
	}

	var bossTemplate *models.NpcTemplate
	npcTemplates := h.gameData.GetNPCsByMapID(char.MapID)
	for _, npc := range npcTemplates {
		if npc.GetID() == bossID {
			bossTemplate = npc
			break
		}
	}

	if bossTemplate == nil {
		h.logger.Warn("Boss not found",
			zap.Int("boss_id", bossID),
			zap.Int("map_id", char.MapID))
		return nil, pkgerrors.ErrNotFound
	}

	bossData := map[string]interface{}{
		"nid":     bossID,
		"name":    bossTemplate.Name,
		"resCode": int64(bossTemplate.ResCode),
		"lv":      bossTemplate.Lv,
		"classId": bossTemplate.ClassID,
		"x":       int(bossTemplate.PosX),
		"y":       int(bossTemplate.PosY),
	}

	if err := ctx.Connection.SendCallback("onClickBoss", bossData); err != nil {
		h.logger.Warn("Failed to send onClickBoss callback",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Error(err))
	}

	return map[string]interface{}{
		"success": true,
		"bossId":  bossID,
	}, nil
}

func (h *Handler) CanEnterWbMap(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	var characterID int64
	var err error

	if len(args) > 0 {
		switch v := args[0].(type) {
		case float64:
			characterID = int64(v)
		case int:
			characterID = int64(v)
		case int64:
			characterID = v
		default:
			return nil, pkgerrors.ErrInvalidArgs
		}
	} else {
		characterID, err = strconv.ParseInt(ctx.CharacterID, 10, 64)
		if err != nil {
			return nil, pkgerrors.ErrUnauthorized
		}
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	h.logger.Debug("CanEnterWbMap",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.Int64("character_id", characterID),
		zap.Int("level", char.Level))

	canEnter := true
	reason := ""
	if char.Level < 30 {
		canEnter = false
		reason = "Level requirement not met (minimum level 30)"
	}

	result := map[string]interface{}{
		"canEnter": canEnter,
	}
	if !canEnter && reason != "" {
		result["reason"] = reason
	}

	h.logger.Info("CanEnterWbMap result",
		zap.Int64("character_id", characterID),
		zap.Bool("can_enter", canEnter),
		zap.String("reason", reason))

	return result, nil
}
