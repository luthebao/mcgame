// Open-sourced by BaoLT

package item

import (
	"fmt"
	"strconv"
	"strings"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	redisstore "mcgame-server/internal/infrastructure/persistence/redis"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

const (
	flowerTemplateID        = 724
	eggTemplateID           = 783
	seekTemplateID          = 1033
	seekMonthTemplateID     = 1482
	trackTemplateID         = 1034
	trackMonthTemplateID    = 1483
	footleTemplateID        = 1405
	antiFootleTemplateID    = 1406
	festFoolTemplateID      = 2799
	halloweenCardTemplateID = 3553
	snowBallTemplateID      = 3590
	playerLinkCode          = 8
	flowerVerb              = "\u0111\u00e3 t\u1eb7ng"
	flowerItemName          = "\u0111\u00f3a Ti\u00ean hoa"
	eggVerb                 = "\u0111\u00e3 n\u00e9m"
	eggItemName             = "qu\u1ea3 Tr\u1ee9ng th\u00fai"
	footleMessageFormat     = "%s \u0111\u00e3 d\u00f9ng Th\u1ebb M\u00ea Ng\u1eef l\u00ean ng\u01b0\u1eddi %s, %s tr\u00f4ng b\u1eaft \u0111\u1ea7u c\u00f3 v\u1ebb cho\u00e1ng v\u00e1ng r\u1ed3i."
	antiFootleMessageFormat = "%s \u0111\u00e3 d\u00f9ng Th\u1ebb Ch\u1ed1ng M\u00ea Ng\u1eef gi\u1ea3i tr\u1ea1ng th\u00e1i cho %s."
	snowBallMessageFormat   = "%s \u0111\u00e3 n\u00e9m m\u1ed9t qu\u1ea3 c\u1ea7u tuy\u1ebft v\u00e0o %s."
	halloweenMessageFormat  = "%s \u0111\u00e3 t\u1eb7ng %s m\u1ed9t Th\u1ebb Halloween, ch\u00fac %s m\u00f9a Halloween vui v\u1ebb!"
	festFoolMessageFormat   = "%s \u0111\u00e3 ch\u01a1i kh\u0103m %s nh\u00e2n ng\u00e0y C\u00e1 Th\u00e1ng T\u01b0."
)

func (h *Handler) UseSeek(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	targetName, ok := firstStringArg(args)
	if !ok {
		return nil, nil
	}

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	targetChar, err := h.resolveTargetCharacter(ctx, targetName)
	if err != nil || targetChar == nil || targetChar.ID == characterID {
		_ = ctx.Connection.SendCallback("onCharPos", nil)
		return nil, nil
	}

	presence, err := h.lookupPresence(ctx, targetChar)
	if err != nil || presence == nil {
		_ = ctx.Connection.SendCallback("onCharPos", nil)
		return nil, nil
	}

	consumedItem, templateID, err := h.consumePreferredItem(ctx, characterID, []int{seekTemplateID, seekMonthTemplateID})
	if err != nil {
		return nil, err
	}
	if consumedItem == nil {
		h.logger.Warn("UseSeek: missing item",
			zap.Int64("character_id", characterID),
			zap.String("target_name", targetChar.Name))
		return nil, nil
	}

	h.sendConsumedItemCallback(ctx, consumedItem)
	_ = ctx.Connection.SendCallback("onCharPos", h.buildCharPosPayload(targetChar, presence))

	h.logger.Info("UseSeek completed",
		zap.Int64("character_id", characterID),
		zap.Int64("target_id", targetChar.ID),
		zap.Int("template_id", templateID))

	return nil, nil
}

func (h *Handler) UseTrack(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	targetName, ok := firstStringArg(args)
	if !ok {
		return nil, nil
	}

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	targetChar, err := h.resolveTargetCharacter(ctx, targetName)
	if err != nil || targetChar == nil || targetChar.ID == characterID {
		_ = ctx.Connection.SendCallback("onTrack", false)
		return nil, nil
	}

	if h.rtmpServer == nil {
		_ = ctx.Connection.SendCallback("onTrack", false)
		return nil, nil
	}

	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetChar.ID, 10))
	if targetConn == nil || targetConn.GetChannelID() != ctx.Connection.GetChannelID() {
		_ = ctx.Connection.SendCallback("onTrack", false)
		return nil, nil
	}

	consumedItem, templateID, err := h.consumePreferredItem(ctx, characterID, []int{trackTemplateID, trackMonthTemplateID})
	if err != nil {
		return nil, err
	}
	if consumedItem == nil {
		h.logger.Warn("UseTrack: missing item",
			zap.Int64("character_id", characterID),
			zap.String("target_name", targetChar.Name))
		return nil, nil
	}

	h.sendConsumedItemCallback(ctx, consumedItem)
	if err := h.trackToTarget(ctx, characterID, targetChar, targetConn); err != nil {
		return nil, err
	}

	h.logger.Info("UseTrack completed",
		zap.Int64("character_id", characterID),
		zap.Int64("target_id", targetChar.ID),
		zap.Int("template_id", templateID))

	return nil, nil
}

func (h *Handler) AddPopNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applyPopularityItem(ctx, args, flowerTemplateID, 1, flowerVerb, flowerItemName)
}

func (h *Handler) DelPopNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applyPopularityItem(ctx, args, eggTemplateID, -1, eggVerb, eggItemName)
}

func (h *Handler) UseFootle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applySocialPrank(ctx, args, []int{footleTemplateID}, func(src, target *domainchar.Character) string {
		return fmt.Sprintf(footleMessageFormat,
			buildPlayerLink(src),
			buildPlayerLink(target),
			buildPlayerLink(target),
		)
	})
}

func (h *Handler) UseAntiFootle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applySocialPrank(ctx, args, []int{antiFootleTemplateID}, func(src, target *domainchar.Character) string {
		return fmt.Sprintf(antiFootleMessageFormat, buildPlayerLink(src), buildPlayerLink(target))
	})
}

func (h *Handler) UseSnowBall(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applySocialPrank(ctx, args, []int{snowBallTemplateID}, func(src, target *domainchar.Character) string {
		return fmt.Sprintf(snowBallMessageFormat, buildPlayerLink(src), buildPlayerLink(target))
	})
}

func (h *Handler) UseHalloweenCard(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applySocialPrank(ctx, args, []int{halloweenCardTemplateID}, func(src, target *domainchar.Character) string {
		return fmt.Sprintf(halloweenMessageFormat,
			buildPlayerLink(src),
			buildPlayerLink(target),
			buildPlayerLink(target),
		)
	})
}

func (h *Handler) UseFestFootle(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	return h.applySocialPrank(ctx, args, []int{festFoolTemplateID}, func(src, target *domainchar.Character) string {
		return fmt.Sprintf(festFoolMessageFormat, buildPlayerLink(src), buildPlayerLink(target))
	})
}

func (h *Handler) applySocialPrank(
	ctx *rtmp.RPCContext,
	args []interface{},
	templateIDs []int,
	buildMessage func(src, target *domainchar.Character) string,
) (interface{}, error) {
	targetName, ok := firstStringArg(args)
	if !ok {
		return nil, nil
	}

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	sourceChar, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	targetChar, err := h.resolveTargetCharacter(ctx, targetName)
	if err != nil || targetChar == nil || targetChar.ID == characterID {
		return nil, nil
	}

	if h.rtmpServer == nil {
		return nil, nil
	}

	currentMapID, _ := ctx.Connection.GetSceneInfo()
	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetChar.ID, 10))
	if targetConn == nil || targetConn.GetChannelID() != ctx.Connection.GetChannelID() {
		return nil, nil
	}

	targetMapID, _ := targetConn.GetSceneInfo()
	if currentMapID <= 0 || targetMapID != currentMapID {
		return nil, nil
	}

	consumedItem, templateID, err := h.consumePreferredItem(ctx, characterID, templateIDs)
	if err != nil {
		return nil, err
	}
	if consumedItem == nil {
		return nil, nil
	}

	h.sendConsumedItemCallback(ctx, consumedItem)

	payload := map[string]interface{}{
		"eid": strconv.FormatInt(targetChar.ID, 10),
		"str": buildMessage(sourceChar, targetChar),
	}

	if h.sceneManager != nil {
		h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), currentMapID, 0, "onExcludeRedMsg", payload)
	} else {
		_ = ctx.Connection.SendCallback("onExcludeRedMsg", payload)
		_ = targetConn.SendCallback("onExcludeRedMsg", payload)
	}

	h.logger.Info("Social prank applied",
		zap.Int64("character_id", characterID),
		zap.Int64("target_id", targetChar.ID),
		zap.Int("template_id", templateID))

	return nil, nil
}

func (h *Handler) applyPopularityItem(ctx *rtmp.RPCContext, args []interface{}, templateID int, direction int64, verb string, itemName string) (interface{}, error) {
	targetName, quantity, ok := parseTargetQuantityArgs(args)
	if !ok {
		return nil, nil
	}

	characterID, err := currentItemCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	sourceChar, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	targetChar, err := h.resolveTargetCharacter(ctx, targetName)
	if err != nil || targetChar == nil || targetChar.ID == characterID {
		return nil, nil
	}

	sourceItem, err := h.findBagItemByTemplateID(ctx, characterID, templateID)
	if err != nil || sourceItem == nil {
		return nil, err
	}

	consumed, err := h.itemService.ConsumeItemsByTemplateID(ctx.Context, characterID, templateID, quantity)
	if err != nil {
		return nil, err
	}
	if !consumed {
		return nil, nil
	}

	h.sendStackDeltaCallback(ctx, sourceItem, sourceItem.StackCount-quantity)

	delta := int64(quantity) * direction
	targetChar.Pop += delta
	if targetChar.Pop < 0 {
		targetChar.Pop = 0
	}
	if err := h.charService.Update(ctx.Context, targetChar); err != nil {
		return nil, err
	}

	message := fmt.Sprintf("%s %s %s %d %s.",
		buildPlayerLink(sourceChar),
		verb,
		buildPlayerLink(targetChar),
		quantity,
		itemName,
	)
	_ = ctx.Connection.SendCallback("onBlueMsg", message)

	h.logger.Info("Popularity item applied",
		zap.Int64("character_id", characterID),
		zap.Int64("target_id", targetChar.ID),
		zap.Int("template_id", templateID),
		zap.Int("quantity", quantity),
		zap.Int64("new_pop", targetChar.Pop))

	return nil, nil
}

func (h *Handler) consumePreferredItem(ctx *rtmp.RPCContext, characterID int64, templateIDs []int) (*domainitem.Item, int, error) {
	return h.itemService.ConsumeItemByTemplateIDs(ctx.Context, characterID, templateIDs)
}

func (h *Handler) resolveTargetCharacter(ctx *rtmp.RPCContext, rawName string) (*domainchar.Character, error) {
	name := strings.TrimSpace(rawName)
	if name == "" {
		return nil, nil
	}

	targetID, _, err := h.charService.GetCharacterIDByName(ctx.Context, name)
	if err != nil {
		return nil, err
	}

	return h.charService.GetByID(ctx.Context, targetID)
}

func (h *Handler) sendConsumedItemCallback(ctx *rtmp.RPCContext, consumedItem *domainitem.Item) {
	if consumedItem == nil {
		return
	}

	sid := float64(consumedItem.CalculateSID())
	if consumedItem.StackCount <= 0 {
		_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(consumedItem.ID), sid)
		return
	}

	_ = ctx.Connection.SendCallback("onUpChaSlotStackNum", float64(consumedItem.ID), float64(consumedItem.StackCount), sid)
}

func (h *Handler) lookupPresence(ctx *rtmp.RPCContext, targetChar *domainchar.Character) (*redisstore.SocialPresence, error) {
	if h.presenceStore != nil {
		presence, err := h.presenceStore.Get(ctx.Context, targetChar.ID)
		if err != nil {
			return nil, err
		}
		if presence != nil {
			return presence, nil
		}
	}

	if h.rtmpServer == nil {
		return nil, nil
	}

	targetConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(targetChar.ID, 10))
	if targetConn == nil {
		return nil, nil
	}

	mapID, _ := targetConn.GetSceneInfo()
	if mapID <= 0 {
		mapID = targetChar.MapID
	}

	return &redisstore.SocialPresence{
		CharacterID: targetChar.ID,
		Name:        targetChar.Name,
		MapID:       mapID,
		X:           targetChar.PosX,
		Y:           targetChar.PosY,
		Line:        targetConn.GetChannelID(),
	}, nil
}

func (h *Handler) buildCharPosPayload(targetChar *domainchar.Character, presence *redisstore.SocialPresence) map[string]interface{} {
	mapName := ""
	if h.gameData != nil {
		if mapData := h.gameData.GetMap(presence.MapID); mapData != nil {
			mapName = mapData.Name
		}
	}

	return map[string]interface{}{
		"name":  targetChar.Name,
		"mName": mapName,
		"mid":   strconv.Itoa(presence.MapID),
		"y":     strconv.Itoa(presence.Y),
		"x":     strconv.Itoa(presence.X),
		"cid":   strconv.FormatInt(targetChar.ID, 10),
		"line":  presence.Line,
	}
}

func (h *Handler) trackToTarget(ctx *rtmp.RPCContext, characterID int64, targetChar *domainchar.Character, targetConn *rtmp.Connection) error {
	targetMapID, _ := targetConn.GetSceneInfo()
	if targetMapID <= 0 {
		targetMapID = targetChar.MapID
	}

	targetX := targetChar.PosX
	targetY := targetChar.PosY
	if targetX <= 0 || targetY <= 0 {
		targetX, targetY = h.sceneService.GetSafePoint(targetMapID)
	}

	oldRoomID, _ := ctx.Connection.GetSceneInfo()
	isRoomChange := oldRoomID != 0 && oldRoomID != targetMapID

	pos := domainchar.Position{MapID: targetMapID, X: targetX, Y: targetY, Direction: 0}
	if err := h.charService.UpdatePosition(ctx.Context, characterID, pos); err != nil {
		return err
	}

	if isRoomChange {
		channelID := ctx.Connection.GetChannelID()
		h.sceneManager.BroadcastToScene(channelID, oldRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
		ctx.Connection.SetSceneInfo(targetMapID, characterID)
		h.sceneManager.MoveToScene(channelID, oldRoomID, targetMapID, ctx.Connection)
		if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
			h.logger.Error("trackToTarget: failed to send scene reset", zap.Error(err))
		}
		if err := ctx.Connection.SendCallback("onSceneEnter", targetMapID, targetX, targetY, -1); err != nil {
			h.logger.Error("trackToTarget: failed to send scene enter", zap.Error(err))
		}
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err == nil {
			char.MapID = targetMapID
			char.PosX = targetX
			char.PosY = targetY
			playerData := h.sceneService.GetCharacterForClient(char)
			h.sceneManager.BroadcastToScene(channelID, targetMapID, ctx.ConnID, "onScenePlayerEntered", playerData)
			_ = rtmputils.UpsertSocialPresenceFromCharacter(ctx.Context, h.presenceStore, char, channelID)
		}
		return nil
	}

	if oldRoomID == 0 {
		ctx.Connection.SetSceneInfo(targetMapID, characterID)
		h.sceneManager.AddToScene(ctx.Connection.GetChannelID(), targetMapID, ctx.Connection)
	}

	_ = ctx.Connection.SendCallback("onSceneTo", targetX, targetY)
	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), targetMapID, ctx.ConnID, "onCharTeleport", map[string]interface{}{
		"cid":  characterID,
		"posX": targetX,
		"posY": targetY,
	})

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err == nil {
		char.MapID = targetMapID
		char.PosX = targetX
		char.PosY = targetY
		_ = rtmputils.UpsertSocialPresenceFromCharacter(ctx.Context, h.presenceStore, char, ctx.Connection.GetChannelID())
	}

	return nil
}

func currentItemCharacterID(ctx *rtmp.RPCContext) (int64, error) {
	return strconv.ParseInt(ctx.CharacterID, 10, 64)
}

func firstStringArg(args []interface{}) (string, bool) {
	if len(args) < 1 {
		return "", false
	}

	value, ok := args[0].(string)
	if !ok {
		return "", false
	}

	value = strings.TrimSpace(value)
	return value, value != ""
}

func parseTargetQuantityArgs(args []interface{}) (string, int, bool) {
	if len(args) < 2 {
		return "", 0, false
	}

	targetName, ok := firstStringArg(args[:1])
	if !ok {
		return "", 0, false
	}

	quantityRaw, ok := parseFlexibleInt64(args[1])
	if !ok || quantityRaw <= 0 {
		return "", 0, false
	}

	return targetName, int(quantityRaw), true
}

func buildPlayerLink(char *domainchar.Character) string {
	if char == nil {
		return ""
	}

	return fmt.Sprintf("[@PID|%d|%s|%d|0|0]", char.ID, char.Name, playerLinkCode)
}

func (h *Handler) findBagItemByTemplateID(ctx *rtmp.RPCContext, characterID int64, templateID int) (*domainitem.Item, error) {
	items, err := h.itemService.GetAllItems(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	for _, item := range items {
		if item.TemplateID == templateID && item.SlotType == domainitem.SlotTypeBag {
			return item, nil
		}
	}

	return nil, nil
}

func (h *Handler) sendStackDeltaCallback(ctx *rtmp.RPCContext, item *domainitem.Item, remaining int) {
	if item == nil {
		return
	}

	sid := float64(item.CalculateSID())
	if remaining <= 0 {
		_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(item.ID), sid)
		return
	}

	_ = ctx.Connection.SendCallback("onUpChaSlotStackNum", float64(item.ID), float64(remaining), sid)
}
