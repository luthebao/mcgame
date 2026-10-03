// Open-sourced by BaoLT

// Magic estate RPC handlers expose Fazenda callbacks and bag responder payloads.
package farm

import (
	"fmt"
	"sort"
	"strconv"
	"time"

	appfarm "mcgame-server/internal/application/farm"
	appitem "mcgame-server/internal/application/item"
	domainfarm "mcgame-server/internal/domain/farm"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) GetFriendFarm(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	views, err := h.magicEstateService.GetFriendEstateViews(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("Failed to get friend magic estates",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make(map[string]interface{}, len(views))
	friendIDs := make([]int64, 0, len(views))
	for friendID := range views {
		friendIDs = append(friendIDs, friendID)
	}
	sort.Slice(friendIDs, func(i, j int) bool { return friendIDs[i] < friendIDs[j] })

	for _, friendID := range friendIDs {
		view := views[friendID]
		if view == nil {
			continue
		}
		result[strconv.FormatInt(friendID, 10)] = map[string]interface{}{
			"farm": h.buildMagicEstatePayload(view)["farm"],
			"st":   false,
			"lv":   view.Character.Level,
		}
	}

	if err := ctx.Connection.SendCallback("onGetFriendFarm", result); err != nil {
		h.logger.Warn("Failed to send onGetFriendFarm callback", zap.Error(err))
	}

	return result, nil
}

func (h *Handler) AddMineral(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	slotID, ok := FindFirstIntArg(args[:1])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}
	mineralID, ok := FindFirstIntArg(args[1:2])
	if !ok {
		return nil, pkgerrors.ErrInvalidArgs
	}

	result, err := h.magicEstateService.AddMineral(ctx.Context, characterID, slotID, mineralID)
	if err != nil {
		switch err {
		case appfarm.ErrMagicEstateSlotCoolingDown:
			payload := map[string]interface{}{
				"fail": true,
				"time": result.CooldownAt,
			}
			_ = ctx.Connection.SendCallback("onAddMineral", payload)
			return nil, nil
		case appfarm.ErrMagicEstateInsufficientMoney:
			_ = ctx.Connection.SendCallback("onSystemSay", "Không đủ ngân phiếu")
			return nil, nil
		case appfarm.ErrMagicEstateInsufficientAction:
			_ = ctx.Connection.SendCallback("onSystemSay", "Không đủ điểm Năng Lượng")
			return nil, nil
		default:
			return nil, err
		}
	}

	_ = ctx.Connection.SendCallback("onMinusMoney", float64(characterID), "moneyBind", float64(result.SpentMoney), float64(result.Character.MoneyBind))
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"actpoint": result.Profile.Actpoint})
	_ = ctx.Connection.SendCallback("addFarmLog", "Đã mất 100 điểm Năng Lượng")

	payload := map[string]interface{}{
		"f":    true,
		"mid":  result.Slot.MineralID,
		"exp":  strconv.Itoa(result.Profile.Exp),
		"fid":  result.Slot.SlotID,
		"time": result.Slot.CooldownEndsAt,
	}
	if err := ctx.Connection.SendCallback("onAddMineral", payload); err != nil {
		h.logger.Warn("Failed to send onAddMineral callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) AddFarmNum(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, err := h.magicEstateService.AddFarmNum(ctx.Context, characterID)
	if err != nil {
		switch err {
		case appfarm.ErrMagicEstateFarmNumCapped:
			_ = ctx.Connection.SendCallback("onSystemSay", "Số lượng đất đã vượt mức, cần thăng cấp trang viên mới có tăng số lượng đất.")
			return nil, nil
		case appfarm.ErrMagicEstateInsufficientMoney:
			_ = ctx.Connection.SendCallback("onSystemSay", "Bạn không có bạc, không thể mở trang viên")
			return nil, nil
		default:
			return nil, err
		}
	}

	_ = ctx.Connection.SendCallback("onMinusMoney", float64(characterID), "moneyBind", float64(result.Cost), float64(result.Character.MoneyBind))
	payload := map[string]interface{}{
		"f":   true,
		"num": result.Profile.FarmNum,
	}
	if err := ctx.Connection.SendCallback("onAddFarmNum", payload); err != nil {
		h.logger.Warn("Failed to send onAddFarmNum callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) FarmLvUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	result, err := h.magicEstateService.FarmLvUp(ctx.Context, characterID)
	if err != nil {
		switch err {
		case appfarm.ErrMagicEstateInsufficientMoney:
			_ = ctx.Connection.SendCallback("onSystemSay", "Không đủ ngân phiếu")
			return nil, nil
		default:
			return nil, nil
		}
	}

	_ = ctx.Connection.SendCallback("onMinusMoney", float64(characterID), "moneyBind", float64(result.Cost), float64(result.Character.MoneyBind))
	payload := map[string]interface{}{
		"f":   true,
		"exp": result.Profile.Exp,
	}
	if err := ctx.Connection.SendCallback("onFarmLvUp", payload); err != nil {
		h.logger.Warn("Failed to send onFarmLvUp callback", zap.Error(err))
	}
	return nil, nil
}

func (h *Handler) HarvestMine(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	slotID, ok := FindFirstIntArg(args)
	if !ok || slotID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	result, err := h.magicEstateService.HarvestMine(ctx.Context, characterID, slotID)
	if err != nil {
		payload := map[string]interface{}{"f": false, "time": 0}
		if err == appfarm.ErrMagicEstateSlotCoolingDown {
			if view, viewErr := h.magicEstateService.GetEstateView(ctx.Context, characterID); viewErr == nil {
				if slot := view.Profile.Slots[slotID]; slot != nil && slot.CooldownEndsAt > 0 {
					payload["time"] = maxInt64(0, slot.CooldownEndsAt-time.Now().UnixMilli())
				}
			}
		}
		_ = ctx.Connection.SendCallback("onHarvestMine", payload)
		return nil, nil
	}

	bagDelta := map[string]interface{}{
		strconv.Itoa(result.BagSlot.SlotIndex): map[string]interface{}{
			"c":   result.BagSlot.ColorCode,
			"tid": strconv.Itoa(result.BagSlot.TemplateID),
			"num": strconv.FormatInt(result.BagSlot.Num, 10),
		},
	}
	_ = ctx.Connection.SendCallback("onUpFarmBag", bagDelta)
	_ = ctx.Connection.SendCallback("addFarmLog", fmt.Sprintf("Nhận %d%s(Kho lương trang viên)", result.RewardNum, result.RewardName))

	payload := map[string]interface{}{
		"f":        true,
		"c":        0,
		"coldTime": result.CooldownAt,
		"tid":      strconv.Itoa(result.RewardTid),
		"num":      strconv.Itoa(result.RewardNum),
		"fid":      result.Slot.SlotID,
	}
	if err := ctx.Connection.SendCallback("onHarvestMine", payload); err != nil {
		h.logger.Warn("Failed to send onHarvestMine callback", zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) SteelMine(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	ownerCharacterID, ok := parseInt64Value(args[0])
	if !ok || ownerCharacterID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	slotID, ok := FindFirstIntArg(args[1:2])
	if !ok || slotID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	result, err := h.magicEstateService.SteelMine(ctx.Context, characterID, ownerCharacterID, slotID)
	if err != nil {
		switch err {
		case appfarm.ErrMagicEstateFrozen:
			_ = ctx.Connection.SendCallback("addFarmLog", "Đất đang đóng băng")
			return nil, nil
		case appfarm.ErrMagicEstateInsufficientMove:
			_ = ctx.Connection.SendCallback("addFarmLog", "Không đủ điểm Hành Động")
			return nil, nil
		default:
			return nil, err
		}
	}

	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"movePnt": result.HarvesterProfile.MovePnt})
	_ = ctx.Connection.SendCallback("addFarmLog", "Mất: 10Điểm Hành Động")
	_ = ctx.Connection.SendCallback("onMinusMoney", float64(characterID), "movePnt", float64(10), float64(result.HarvesterProfile.MovePnt))

	payload := map[string]interface{}{
		"name":    result.OwnerCharacter.Name,
		"result":  result.Log.Result,
		"tid":     result.OwnerCharacterID,
		"bid":     fmt.Sprintf("%d", result.Log.BattleID),
		"logTime": result.Log.LogTime,
		"cid":     result.HarvesterCharacterID,
		"fid":     slotID,
	}
	if result.Log.ItemTemplateID > 0 {
		payload["id"] = result.Log.ItemTemplateID
		payload["num"] = result.Log.Num
		if h.itemService != nil && result.Log.Num > 0 {
			addedItem, addErr := h.itemService.AddItem(ctx.Context, characterID, result.Log.ItemTemplateID, resolveFarmBagItemType(h.itemService, result.Log.ItemTemplateID), result.Log.Num)
			if addErr == nil && addedItem != nil {
				_ = ctx.Connection.SendCallback("onAddCharactorSlot", h.itemService.BuildClientItemDTO(addedItem))
			}
		}
	}
	if err := ctx.Connection.SendCallback("onSteelMine", payload); err != nil {
		h.logger.Warn("Failed to send onSteelMine callback", zap.Error(err))
	}
	return nil, nil
}

func (h *Handler) GetFarmBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return map[string]interface{}{}, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	return h.magicEstateService.GetFarmBag(ctx.Context, characterID)
}

func (h *Handler) GetFromFarmBag(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil || h.itemService == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	slotIndex, ok := FindFirstIntArg(args[:1])
	if !ok || slotIndex < 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	bagSlot, err := h.magicEstateService.GetFarmBagSlot(ctx.Context, characterID, slotIndex)
	if err != nil {
		return nil, err
	}
	if bagSlot == nil {
		return nil, nil
	}

	addedItem, err := h.itemService.AddItem(ctx.Context, characterID, bagSlot.TemplateID, resolveFarmBagItemType(h.itemService, bagSlot.TemplateID), int(bagSlot.Num))
	if err != nil {
		return nil, nil
	}

	delta, err := h.magicEstateService.RemoveFarmBagSlots(ctx.Context, characterID, []int{slotIndex})
	if err != nil {
		return nil, err
	}

	if addedItem != nil {
		_ = ctx.Connection.SendCallback("onAddCharactorSlot", h.itemService.BuildClientItemDTO(addedItem))
	}
	if len(delta) > 0 {
		_ = ctx.Connection.SendCallback("onUpFarmBag", delta)
	}

	return nil, nil
}

func (h *Handler) GetFarmBagAll(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil || h.itemService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	bagSlots, err := h.magicEstateService.GetAllFarmBagSlots(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	if len(bagSlots) == 0 {
		return nil, nil
	}

	removed := make([]int, 0, len(bagSlots))
	for _, bagSlot := range bagSlots {
		if bagSlot == nil || bagSlot.Num <= 0 {
			continue
		}

		addedItem, addErr := h.itemService.AddItem(ctx.Context, characterID, bagSlot.TemplateID, resolveFarmBagItemType(h.itemService, bagSlot.TemplateID), int(bagSlot.Num))
		if addErr != nil {
			break
		}
		removed = append(removed, bagSlot.SlotIndex)
		if addedItem != nil {
			_ = ctx.Connection.SendCallback("onAddCharactorSlot", h.itemService.BuildClientItemDTO(addedItem))
		}
	}

	if len(removed) == 0 {
		return nil, nil
	}

	delta, err := h.magicEstateService.RemoveFarmBagSlots(ctx.Context, characterID, removed)
	if err != nil {
		return nil, err
	}
	if len(delta) > 0 {
		_ = ctx.Connection.SendCallback("onUpFarmBag", delta)
	}

	return nil, nil
}

func (h *Handler) GetFarmLog(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return map[string]interface{}{}, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	payload, err := h.magicEstateService.GetFarmLog(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	if err := ctx.Connection.SendCallback("onGetFarmLog", payload); err != nil {
		h.logger.Warn("Failed to send onGetFarmLog callback", zap.Error(err))
	}
	return payload, nil
}

func (h *Handler) GetReplayList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return map[string]interface{}{}, nil
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	payload, err := h.magicEstateService.GetReplayList(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	if err := ctx.Connection.SendCallback("onGetReplayList", payload); err != nil {
		h.logger.Warn("Failed to send onGetReplayList callback", zap.Error(err))
	}
	return payload, nil
}

func (h *Handler) SaveReplay(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if len(args) < 2 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	name, _ := args[0].(string)
	battleID, ok := parseInt64Value(args[1])
	if !ok || battleID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	replay, err := h.magicEstateService.SaveReplay(ctx.Context, characterID, name, battleID)
	if err != nil {
		return nil, err
	}

	payload := map[string]interface{}{
		"id":        fmt.Sprintf("%d", replay.BattleID),
		"battleId":  fmt.Sprintf("%d", replay.BattleID),
		"name":      replay.Name,
		"timestamp": replay.Timestamp,
	}
	if err := ctx.Connection.SendCallback("onSaveReplay", payload); err != nil {
		h.logger.Warn("Failed to send onSaveReplay callback", zap.Error(err))
	}
	_ = ctx.Connection.SendCallback("addFarmLog", "Lưu clip thành công")
	return payload, nil
}

func (h *Handler) DelReplay(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.magicEstateService == nil {
		return nil, pkgerrors.ErrSystemError
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}
	battleID, ok := parseInt64Value(args[0])
	if !ok || battleID <= 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if err := h.magicEstateService.DeleteReplay(ctx.Context, characterID, battleID); err != nil {
		return nil, err
	}

	payload := map[string]interface{}{
		"bid": fmt.Sprintf("%d", battleID),
	}
	if err := ctx.Connection.SendCallback("onDelReplay", payload); err != nil {
		h.logger.Warn("Failed to send onDelReplay callback", zap.Error(err))
	}
	_ = ctx.Connection.SendCallback("addFarmLog", "Xóa clip thành công")
	return payload, nil
}

func (h *Handler) buildMagicEstatePayload(view *appfarm.MagicEstateView) map[string]interface{} {
	if view == nil || view.Character == nil || view.Profile == nil {
		return map[string]interface{}{}
	}

	iconCode := domainfarm.MagicEstateDefaultIconCode
	if h.charService != nil {
		_, _, iconCodeStr, _ := h.charService.GetAppearanceCodesByClassAndGender(view.Character.ClassID, view.Character.Gender)
		if parsed, err := strconv.ParseInt(iconCodeStr, 10, 64); err == nil && parsed > 0 {
			iconCode = parsed
		}
	}

	mine := buildMagicEstateMinePayload(view.Profile)
	return map[string]interface{}{
		"farm": map[string]interface{}{
			"name":      view.Character.Name,
			"exp":       strconv.Itoa(view.Profile.Exp),
			"timeStamp": nil,
			"f":         view.Profile.BuildFarmField(),
			"id":        strconv.FormatInt(view.Profile.ID, 10),
			"cid":       strconv.FormatInt(view.Character.ID, 10),
			"farmNum":   strconv.Itoa(view.Profile.FarmNum),
		},
		"icon": strconv.FormatInt(iconCode, 10),
		"mine": mine,
		"lv":   view.Character.Level,
	}
}

func buildMagicEstateMinePayload(profile *domainfarm.MagicEstateProfile) map[string]interface{} {
	if profile == nil || len(profile.Slots) == 0 {
		return map[string]interface{}{}
	}

	slotIDs := make([]int, 0, len(profile.Slots))
	for slotID := range profile.Slots {
		slotIDs = append(slotIDs, slotID)
	}
	sort.Ints(slotIDs)

	result := make(map[string]interface{}, len(slotIDs))
	for _, slotID := range slotIDs {
		slot := profile.Slots[slotID]
		if slot == nil {
			continue
		}
		result[strconv.Itoa(slotID)] = map[string]interface{}{
			"havestFlag": slot.HavestFlag,
			"id":         strconv.Itoa(slot.MineralID),
			"time":       slot.CooldownEndsAt,
			"num":        strconv.Itoa(slot.Num),
			"maxNum":     strconv.Itoa(slot.MaxNum),
		}
	}
	return result
}

func maxInt64(a int64, b int64) int64 {
	if a > b {
		return a
	}
	return b
}

func resolveFarmBagItemType(itemService *appitem.Service, templateID int) domainitem.ItemType {
	if itemService == nil {
		return domainitem.ItemTypeMaterial
	}
	template := itemService.GetItemTemplate(templateID)
	if template == nil {
		return domainitem.ItemTypeMaterial
	}
	if int(template.Kind) == 6 || int(template.Kind) == 14 {
		return domainitem.ItemTypeMaterial
	}
	return domainitem.ItemTypeConsumable
}
