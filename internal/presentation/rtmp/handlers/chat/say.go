// Open-sourced by BaoLT

package chat

import (
	"fmt"
	"strconv"
	"strings"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const gmCommandMinLevel = 5

func (h *Handler) Say(ctx *rtmp.RPCContext, args []any) (any, error) {
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	channelID, message := parseSayPayload(args)
	if message == "" {
		h.logger.Warn("Say: Empty message or parsing failed", zap.Any("args", args))
		return nil, nil
	}

	characterID, err := currentCharacterID(ctx)
	if err != nil {
		return nil, err
	}

	if handled, err := h.handleAddCommand(ctx, characterID, message); handled || err != nil {
		return nil, err
	}

	if handled, err := h.handleStatCommand(ctx, characterID, message); handled || err != nil {
		return nil, err
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}

	if channelID == ChatChannelGlobal {
		if err := h.consumeGlobalSpeaker(ctx, characterID, char); err != nil {
			return nil, err
		}
	}

	chatData := map[string]any{
		"id":        characterID,
		"name":      char.Name,
		"type":      TBL_CHARACTOR,
		"channelId": channelID,
		"pmLevel":   char.CurrentPMLevel(time.Now()),
		"msg":       message,
	}

	h.broadcastChat(ctx, channelID, currentRoomID(ctx, char), characterID, chatData)
	return nil, nil
}

func (h *Handler) handleAddCommand(ctx *rtmp.RPCContext, characterID int64, message string) (bool, error) {
	if !strings.HasPrefix(message, "/add ") {
		return false, nil
	}

	if _, blocked, err := h.requireGMCommandCharacter(ctx, characterID); blocked || err != nil {
		return true, err
	}

	parts := splitNonEmpty(message)
	if len(parts) < 3 {
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Cú pháp: /add <templateID> <count> [type]")
		return true, nil
	}

	templateID, err1 := strconv.Atoi(parts[1])
	count, err2 := strconv.Atoi(parts[2])
	itemType := item.ItemTypeConsumable
	if len(parts) >= 4 {
		switch strings.ToLower(parts[3]) {
		case "1":
			itemType = item.ItemTypeEquipment
		case "2":
			itemType = item.ItemTypeMaterial
		}
	}

	if err1 != nil || err2 != nil || templateID <= 0 || count <= 0 {
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Cú pháp: /add <templateID> <count> [type]")
		return true, nil
	}

	addedItem, err := h.itemService.AddItem(ctx.Context, characterID, templateID, itemType, count)
	if err != nil {
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Lỗi thêm item: "+err.Error())
		return true, nil
	}

	ctx.Connection.SendCallback("onAddCharactorSlot", addedItem.ToDTO())
	ctx.Connection.SendCallback("onSystemMidMsgOrNote", fmt.Sprintf("Đã thêm %s x%d", h.itemDisplayName(templateID, addedItem.ItemType), count))
	rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)
	return true, nil
}

func (h *Handler) handleStatCommand(ctx *rtmp.RPCContext, characterID int64, message string) (bool, error) {
	parts := splitNonEmpty(message)
	if len(parts) == 0 || strings.ToLower(parts[0]) != "/stat" {
		return false, nil
	}

	char, blocked, err := h.requireGMCommandCharacter(ctx, characterID)
	if blocked || err != nil {
		return true, err
	}

	if len(parts) != 3 {
		_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Cú pháp: /stat <field> <amount>")
		return true, nil
	}

	amount, err := strconv.ParseInt(parts[2], 10, 64)
	if err != nil || amount <= 0 {
		_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Số lượng không hợp lệ")
		return true, nil
	}

	fieldKey := ""
	currentTotal := float64(0)
	leveledUp := false

	switch strings.ToLower(parts[1]) {
	case "money":
		char.Money += amount
		fieldKey = "money"
		currentTotal = float64(char.Money)
	case "moneybind":
		char.MoneyBind += amount
		fieldKey = "moneyBind"
		currentTotal = float64(char.MoneyBind)
	case "gold":
		char.Gold += amount
		fieldKey = "gold"
		currentTotal = float64(char.Gold)
	case "goldbind":
		char.GoldBind += amount
		fieldKey = "goldBind"
		currentTotal = float64(char.GoldBind)
	case "exp":
		leveledUp = char.GainExperience(amount)
	case "level":
		targetLevel := int(amount)
		if targetLevel > domainchar.MaxLevel {
			_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Level không hợp lệ")
			return true, nil
		}
		if targetLevel <= char.Level {
			_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Level đích phải lớn hơn level hiện tại")
			return true, nil
		}
		if !char.RaiseLevelTo(targetLevel) {
			_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Level không hợp lệ")
			return true, nil
		}
		amount = 0
		leveledUp = true
	default:
		_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Field không hợp lệ")
		return true, nil
	}

	if err := h.charService.Save(ctx.Context, char); err != nil {
		return true, err
	}

	if fieldKey != "" {
		_ = h.sendCallback(ctx.Connection, "onAddMoney", float64(characterID), fieldKey, float64(amount), currentTotal)
		_ = h.sendCallback(ctx.Connection, "onUPP", map[string]interface{}{fieldKey: currentTotal})
	} else {
		if h.itemService != nil {
			h.itemService.ApplyCharacterElementState(ctx.Context, char)
			h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
			bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, characterID)
			rtmputils.SendExpAndLevelUpCallbacksWithEquipment(&chatExpSender{conn: ctx.Connection, h: h}, char, amount, leveledUp, &bonuses)
		} else {
			rtmputils.SendExpAndLevelUpCallbacks(&chatExpSender{conn: ctx.Connection, h: h}, char, amount, leveledUp)
		}
		h.sendSkillStateUpdate(ctx, characterID, leveledUp)
	}

	_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Đã cập nhật chỉ số")
	return true, nil
}

func (h *Handler) sendSkillStateUpdate(ctx *rtmp.RPCContext, characterID int64, leveledUp bool) {
	if h == nil || !leveledUp || h.skillService == nil || ctx == nil || ctx.Connection == nil {
		return
	}

	skills, err := h.skillService.GetSkillsForCallback(ctx.Context, characterID)
	if err != nil {
		if h.logger != nil {
			h.logger.Warn("Failed to build skill callback payload after gm level up",
				zap.Int64("character_id", characterID),
				zap.Error(err))
		}
		return
	}

	_ = h.sendCallback(ctx.Connection, "onSkillUpdate", skills)
	_ = h.sendCallback(ctx.Connection, "onMWeaponSkillUpdate", skills, true)
}

func (h *Handler) requireGMCommandCharacter(ctx *rtmp.RPCContext, characterID int64) (*domainchar.Character, bool, error) {
	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil {
		return nil, false, err
	}
	if char.GMLevel < gmCommandMinLevel {
		_ = h.sendCallback(ctx.Connection, "onSystemMidMsgOrNote", "Bạn cần gmLevel >= 5 để dùng lệnh GM")
		return nil, true, nil
	}
	return char, false, nil
}

func (h *Handler) itemDisplayName(templateID int, itemType item.ItemType) string {
	itemName := fmt.Sprintf("Item #%d", templateID)
	itemInfo := ""
	if h.gameData != nil {
		if template := h.gameData.GetItem(templateID); template != nil {
			itemName = template.Name
			itemTypeName := ""
			switch int(itemType) {
			case 1:
				itemTypeName = "Tiêu hao"
			case 2:
				itemTypeName = "Trang bị"
			case 3:
				itemTypeName = "Nguyên liệu"
			}

			colorName := ""
			switch int(template.Color) {
			case 1:
				colorName = "Xám"
			case 3:
				colorName = "Xanh lá"
			case 4:
				colorName = "Tím"
			case 5:
				colorName = "Cam"
			case 6:
				colorName = "Đỏ"
			}

			if colorName != "" && itemTypeName != "" {
				levelInfo := ""
				if int(template.ItemLevel) > 0 {
					levelInfo = fmt.Sprintf(" [Cấp %d]", int(template.ItemLevel))
				}
				itemInfo = fmt.Sprintf(" (%s %s%s)", colorName, itemTypeName, levelInfo)
			}
		}
	}
	return itemName + itemInfo
}

func (h *Handler) consumeGlobalSpeaker(ctx *rtmp.RPCContext, characterID int64, char *domainchar.Character) error {
	inventory, err := h.itemService.GetInventory(ctx.Context, characterID)
	if err != nil {
		h.logger.Error("Failed to get inventory for speaker check", zap.Error(err))
		return err
	}

	var speakerItem *item.Item
	for _, inventoryItem := range inventory {
		if inventoryItem.TemplateID == ITEM_SPEAKER_ID {
			speakerItem = inventoryItem
			break
		}
	}

	if speakerItem == nil {
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Bạn cần có Loa để chat kênh thế giới!")
		return nil
	}

	usedItem, _, err := h.itemService.UseItem(ctx.Context, char, speakerItem.ID, nil)
	if err != nil {
		h.logger.Warn("Failed to use speaker", zap.Error(err))
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Lỗi sử dụng Loa!")
		return nil
	}

	itemSID := usedItem.CalculateSID()
	if usedItem.StackCount <= 0 {
		ctx.Connection.SendCallback("onDelCharactorSlot", float64(usedItem.ID), itemSID)
	} else {
		ctx.Connection.SendCallback("onAddCharactorSlot", usedItem.ToDTO())
	}

	return nil
}

func (h *Handler) broadcastChat(ctx *rtmp.RPCContext, channelID int, roomID int, characterID int64, chatData map[string]any) {
	connChannelID := ctx.Connection.GetChannelID()
	switch channelID {
	case ChatChannelLocal:
		h.sceneManager.BroadcastToScene(connChannelID, roomID, 0, "onSay", chatData)
	case ChatChannelGlobal:
		h.rtmpServer.BroadcastToAll("onSay", chatData)
	case ChatChannelGuild:
		h.broadcastGuildChat(ctx, characterID, chatData)
	case ChatChannelTeam:
		h.broadcastTeamChat(ctx, characterID, chatData)
	case ChatChannelTop:
		h.rtmpServer.BroadcastToAll("onSay", chatData)
	default:
		h.sceneManager.BroadcastToScene(connChannelID, roomID, 0, "onSay", chatData)
	}
}

func (h *Handler) broadcastGuildChat(ctx *rtmp.RPCContext, characterID int64, chatData map[string]any) {
	if h.guildService == nil {
		h.logger.Warn("Guild service not available for guild chat")
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Tính năng chat guild chưa khả dụng!")
		return
	}

	guild, err := h.guildService.GetGuildByMember(ctx.Context, characterID)
	if err != nil || guild == nil {
		h.logger.Debug("Player not in a guild", zap.Int64("char_id", characterID), zap.Error(err))
		_ = ctx.Connection.SendCallback("onBlueMsg", "Chưa có bang hội")
		return
	}

	for _, member := range guild.Members {
		memberConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(member.CharacterID, 10))
		if memberConn == nil {
			continue
		}
		if err := memberConn.SendCallback("onSay", chatData); err != nil {
			h.logger.Warn("Failed to send guild chat to member", zap.Int64("member_id", member.CharacterID), zap.Error(err))
		}
	}
}

func (h *Handler) broadcastTeamChat(ctx *rtmp.RPCContext, characterID int64, chatData map[string]any) {
	if h.groupService == nil {
		h.logger.Warn("Group service not available for team chat")
		ctx.Connection.SendCallback("onSystemMidMsgOrNote", "Tính năng chat nhóm chưa khả dụng!")
		return
	}

	group, err := h.groupService.GetGroupByMember(ctx.Context, characterID)
	if err != nil || group == nil {
		h.logger.Debug("Player not in a group", zap.Int64("char_id", characterID), zap.Error(err))
		_ = ctx.Connection.SendCallback("onBlueMsg", "Chưa có nhóm")
		return
	}

	for _, member := range group.Members {
		memberConn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(member.CharID, 10))
		if memberConn == nil {
			continue
		}
		if err := memberConn.SendCallback("onSay", chatData); err != nil {
			h.logger.Warn("Failed to send team chat to member", zap.Int64("member_id", member.CharID), zap.Error(err))
		}
	}
}
