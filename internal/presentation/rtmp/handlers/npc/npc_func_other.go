// Open-sourced by BaoLT

// NPC functional interaction handler (healing, transport, tutor).
package npc

import (
	"fmt"
	"math"
	"strconv"
	"strings"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/creature"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/predef"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) NpcFuncOther(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var npcID int
	switch v := args[0].(type) {
	case float64:
		npcID = int(v)
	case int:
		npcID = v
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	var funcID int
	switch v := args[1].(type) {
	case float64:
		funcID = int(v)
	case int:
		funcID = v
	case string:
		parsed, parseErr := strconv.Atoi(v)
		if parseErr != nil {
			return nil, pkgerrors.ErrInvalidArgs
		}
		funcID = parsed
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	if h.gameData == nil {
		return nil, pkgerrors.ErrInvalidArgs
	}

	npc := h.gameData.GetNPC(npcID)
	if npc == nil {
		h.logger.Warn("NpcFuncOther: NPC not found", zap.Int("npc_id", npcID))
		return nil, pkgerrors.ErrInvalidArgs
	}

	npcType := creature.NPCType(npc.Type)

	switch npcType {
	case creature.NPCTypeHeal:
		return h.handleNpcHeal(ctx, npcID, funcID)
	case creature.NPCTypeTransport:
		return h.handleNpcTransport(ctx, npcID, funcID)
	case creature.NPCTypeTutor:
		return h.handleNpcTutor(ctx, npcID, funcID)
	default:
		h.logger.Warn("NpcFuncOther: unsupported NPC type",
			zap.Int("npc_id", npcID),
			zap.Int("npc_type", int(npcType)),
			zap.Int("func_id", funcID))
		return nil, nil
	}
}

func (h *Handler) handleNpcHeal(ctx *rtmp.RPCContext, npcID, funcID int) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	effectiveMaxHP := char.MaxHP
	effectiveMaxMP := char.MaxMP
	if h.itemService != nil {
		effective := *char
		effective.RecalculateStats()
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, characterID)
		effective.ApplyEquipmentBonuses(bonuses)
		effectiveMaxHP = effective.MaxHP
		effectiveMaxMP = effective.MaxMP
	}

	level := char.Level
	if level < 0 || level > 160 {
		level = 0
	}

	costMultiplier := float64(predef.BasicGetMoney[level]) / 70000.0
	if costMultiplier > 1 {
		costMultiplier = 1
	}

	missingHP := effectiveMaxHP - char.CurrentHP
	missingMP := effectiveMaxMP - char.CurrentMP
	charCost := int64(math.Ceil((float64(missingHP) + (float64(missingMP) * 1.3)) * costMultiplier))
	healPet, pet, petCost := h.resolveNpcHealPet(ctx, characterID, funcID, costMultiplier)

	var totalCost int64

	switch funcID {
	case 1:
		totalCost = charCost
	case 2:
		totalCost = 0
	case 3:
		totalCost = charCost + petCost
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	if totalCost < 0 {
		totalCost = 0
	}

	currencyKey := "moneyBind"
	currencyLabel := "ngan phieu"
	remainingCurrency := char.MoneyBind
	if char.SelectedMoneyType == 2 {
		currencyKey = "money"
		currencyLabel = "bac"
		remainingCurrency = char.Money
	}

	if totalCost > 0 {
		if remainingCurrency < totalCost {
			ctx.Connection.SendCallback("onSystemSay", "Khong du "+currencyLabel+"!")
			return nil, nil
		}
		if currencyKey == "money" {
			char.Money -= totalCost
			remainingCurrency = char.Money
		} else {
			char.MoneyBind -= totalCost
			remainingCurrency = char.MoneyBind
		}
	}

	healChar := funcID == 1 || funcID == 3
	if healChar {
		char.CurrentHP = effectiveMaxHP
		char.CurrentMP = effectiveMaxMP
	}
	if healPet {
		pet.CurrentHP = pet.MaxHP
		pet.CurrentMP = pet.MaxMP
	}

	if err := h.charService.Save(ctx.Context, char); err != nil {
		h.logger.Warn("Failed to save character after NPC heal", zap.Error(err))
	}
	if healPet {
		if err := h.petService.Save(ctx.Context, pet); err != nil {
			h.logger.Warn("Failed to save pet after NPC heal", zap.Error(err))
		}
	}

	if healChar {
		ctx.Connection.SendCallback("onUPP", map[string]interface{}{
			"currentHp": char.CurrentHP,
			"currentMp": char.CurrentMP,
		})
	}
	if healPet {
		sendNpcHealPetCallbacks(ctx, pet)
	}

	if totalCost > 0 {
		ctx.Connection.SendCallback("onAddMoney", float64(characterID), currencyKey, float64(-totalCost), float64(remainingCurrency))
	}

	h.logger.Info("NPC heal completed",
		zap.Int64("character_id", characterID),
		zap.Int("npc_id", npcID),
		zap.Int("func_id", funcID),
		zap.Int64("cost", totalCost))

	return nil, nil
}

func (h *Handler) resolveNpcHealPet(ctx *rtmp.RPCContext, characterID int64, funcID int, costMultiplier float64) (bool, *domainpet.Pet, int64) {
	if funcID != 3 || h.petService == nil {
		return false, nil, 0
	}

	pet, err := h.petService.GetActivePetForRecovery(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("Failed to load active pet for NPC heal",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return false, nil, 0
	}
	if pet == nil {
		return false, nil, 0
	}

	missingHP := pet.MaxHP - pet.CurrentHP
	missingMP := pet.MaxMP - pet.CurrentMP
	petCost := int64(math.Ceil((float64(missingHP) + (float64(missingMP) * 1.3)) * costMultiplier))
	return true, pet, petCost
}

func sendNpcHealPetCallbacks(ctx *rtmp.RPCContext, pet *domainpet.Pet) {
	if ctx == nil || ctx.Connection == nil || pet == nil {
		return
	}

	dto := pet.ToDTO()
	_ = ctx.Connection.SendCallback("updateActivatePetObj", dto)
	_ = ctx.Connection.SendCallback("onUpdatePet", float64(pet.ID), "currentHp", strconv.Itoa(pet.CurrentHP))
	_ = ctx.Connection.SendCallback("onUpdatePet", float64(pet.ID), "currentMp", strconv.Itoa(pet.CurrentMP))

	petDTO := dto
	if data, ok := dto["data"].(map[string]interface{}); ok {
		petDTO = data
	}
	if prop, ok := petDTO["property"]; ok {
		_ = ctx.Connection.SendCallback("onRefreshPetProp", map[string]interface{}{
			"id": pet.ID,
			"s":  prop,
		})
	}
}

func (h *Handler) handleNpcTransport(ctx *rtmp.RPCContext, npcID, funcID int) (interface{}, error) {
	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	npc := h.gameData.GetNPC(npcID)
	if npc == nil || npc.FuncInfo == "" {
		return nil, pkgerrors.ErrInvalidArgs
	}

	entries := strings.Split(npc.FuncInfo, "|")
	if funcID < 0 || funcID >= len(entries) {
		h.logger.Warn("NpcFuncOther transport: invalid funcID",
			zap.Int("npc_id", npcID),
			zap.Int("func_id", funcID),
			zap.Int("entries_len", len(entries)))
		return nil, pkgerrors.ErrInvalidArgs
	}

	entry := entries[funcID]
	if entry == "" {
		return nil, pkgerrors.ErrInvalidArgs
	}

	parts := strings.Split(entry, ",")
	if len(parts) < 5 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	mapID, _ := strconv.Atoi(parts[0])
	cost, _ := strconv.Atoi(parts[2])
	destX, _ := strconv.Atoi(parts[3])
	destY, _ := strconv.Atoi(parts[4])

	if mapID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return rtmp.ErrorToResponse(err), nil
	}

	currencyKey := "moneyBind"
	remainingCurrency := char.MoneyBind
	if char.SelectedMoneyType == 2 {
		currencyKey = "money"
		remainingCurrency = char.Money
	}

	if cost > 0 {
		if remainingCurrency < int64(cost) {
			ctx.Connection.SendCallback("onSystemSay", "Không đủ tiền để di chuyển!")
			return nil, nil
		}
		if currencyKey == "money" {
			char.Money -= int64(cost)
			remainingCurrency = char.Money
		} else {
			char.MoneyBind -= int64(cost)
			remainingCurrency = char.MoneyBind
		}

		if err := h.charService.Save(ctx.Context, char); err != nil {
			h.logger.Warn("Failed to save character after transport cost", zap.Error(err))
		}

		ctx.Connection.SendCallback("onAddMoney", float64(characterID), currencyKey, float64(-int64(cost)), float64(remainingCurrency))
		ctx.Connection.SendCallback("onBlueMsg", fmt.Sprintf("Mất %d %s.", cost, currencyDisplayName(currencyKey)))
	}

	if err := h.teleportToPosition(ctx, characterID, mapID, destX, destY); err != nil {
		h.logger.Error("Transport teleport failed",
			zap.Int64("character_id", characterID),
			zap.Int("map_id", mapID),
			zap.Error(err))
		return nil, err
	}

	h.logger.Info("NPC transport completed",
		zap.Int64("character_id", characterID),
		zap.Int("npc_id", npcID),
		zap.Int("map_id", mapID),
		zap.Int("cost", cost))

	return nil, nil
}

func (h *Handler) teleportToPosition(ctx *rtmp.RPCContext, characterID int64, mapID, x, y int) error {
	if x <= 0 || y <= 0 {
		x, y = h.sceneService.GetSafePoint(mapID)
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return err
	}

	oldRoomID, _ := ctx.Connection.GetSceneInfo()
	channelID := ctx.Connection.GetChannelID()

	if oldRoomID != 0 && oldRoomID != mapID {
		h.sceneManager.BroadcastToScene(channelID, oldRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
		ctx.Connection.SetSceneInfo(mapID, characterID)
		h.sceneManager.MoveToScene(channelID, oldRoomID, mapID, ctx.Connection)
	} else if oldRoomID == 0 {
		ctx.Connection.SetSceneInfo(mapID, characterID)
		h.sceneManager.AddToScene(channelID, mapID, ctx.Connection)
	}

	if err := h.charService.UpdatePosition(ctx.Context, characterID, character.Position{MapID: mapID, X: x, Y: y}); err != nil {
		h.logger.Error("Failed to update position after transport", zap.Error(err))
	}
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, char.Name, mapID, x, y, channelID)
	if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
		h.logger.Error("Failed to send scene reset callbacks", zap.Error(err))
	}
	ctx.Connection.ResetSceneEntryRateLimits()

	if err := ctx.Connection.SendCallback("onSceneEnter", mapID, x, y, -1); err != nil {
		h.logger.Error("Failed to send onSceneEnter callback", zap.Error(err))
	}

	h.scenePopulationDeps().PushOnCreateChars(ctx.Context, ctx.Connection, channelID, mapID, characterID)

	if oldRoomID != 0 && oldRoomID != mapID {
		char.MapID = mapID
		char.PosX = x
		char.PosY = y
		playerData := h.sceneService.GetCharacterForClient(char)
		h.sceneManager.BroadcastToScene(channelID, mapID, ctx.ConnID, "onScenePlayerEntered", playerData)

		h.groupTransportDeps().FollowLeaderToMap(ctx.Context, characterID, oldRoomID, mapID, x, y)
	}
	return nil
}

func currencyDisplayName(key string) string {
	if key == "money" {
		return "Bạc"
	}
	return "Ngân phiếu"
}

func (h *Handler) handleNpcTutor(ctx *rtmp.RPCContext, npcID, funcID int) (interface{}, error) {
	h.logger.Debug("NpcFuncOther tutor stub",
		zap.Int("npc_id", npcID),
		zap.Int("func_id", funcID))
	return nil, nil
}
