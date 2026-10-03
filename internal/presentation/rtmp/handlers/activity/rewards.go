// Open-sourced by BaoLT

// Activity reward handlers cover online gifts and special reward distribution.
package activity

import (
	"time"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) getRewardState(charID int64) *PlayerRewardState {
	today := time.Now().Format("2006-01-02")

	value, ok := h.rewardStates.Load(charID)
	if !ok {
		state := &PlayerRewardState{
			StepIndex:     0,
			StartTime:     time.Now(),
			IsClaimedDate: today,
		}
		h.rewardStates.Store(charID, state)
		return state
	}

	state := value.(*PlayerRewardState)
	if state.IsClaimedDate != today {
		state.StepIndex = 0
		state.StartTime = time.Now()
		state.IsClaimedDate = today
		h.rewardStates.Store(charID, state)
	}

	return state
}

func (h *Handler) SendNextOnlineReward(conn *rtmp.Connection, charID int64) {
	state := h.getRewardState(charID)
	if state.StepIndex >= len(onlineRewardSteps) {
		return
	}

	config := onlineRewardSteps[state.StepIndex]
	elapsed := time.Since(state.StartTime).Seconds()
	waitDurationSeconds := config.Duration - int(elapsed)
	if waitDurationSeconds < 0 {
		waitDurationSeconds = 0
	}

	boundValue := 0
	if config.IsBound {
		boundValue = 1
	}

	rewardItem := map[string]interface{}{
		"plan": map[string]interface{}{
			"ti": 29,
			"ii": config.ItemID,
			"n":  config.Quantity,
			"b":  boundValue,
		},
		"sp":       false,
		"warnType": 196,
	}

	if err := conn.SendCallback("onStartNewGift", waitDurationSeconds*1000, rewardItem); err != nil {
		h.logger.Error("SendNextOnlineReward: failed", zap.Error(err))
	}
}

func (h *Handler) AdminDistributeSPGift(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("AdminDistributeSPGift called", zap.Any("args", args))

	if h.rtmpServer == nil {
		h.logger.Error("AdminDistributeSPGift: RTMPServer not set")
		return nil, pkgerrors.ErrSystemError
	}

	itemID := 2005
	quantity := 1
	duration := 0

	if len(args) > 0 {
		if value, ok := parseIntArg(args[0]); ok {
			itemID = value
		}
	}
	if len(args) > 1 {
		if value, ok := parseIntArg(args[1]); ok {
			quantity = value
		}
	}
	if len(args) > 2 {
		if value, ok := parseIntArg(args[2]); ok {
			duration = value
		}
	}

	rewardItem := map[string]interface{}{
		"plan": map[string]interface{}{
			"ti": 29,
			"ii": itemID,
			"n":  quantity,
			"b":  1,
		},
		"sp":       true,
		"warnType": 196,
	}

	h.rtmpServer.BroadcastToAll("onStartNewGift", []interface{}{duration * 1000, rewardItem})

	return true, nil
}

func (h *Handler) GetTodayOnlineTime(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "GetTodayOnlineTime")
	if err != nil {
		return nil, err
	}

	minutes := int64(0)
	if h.dailyActService != nil {
		seconds, err := h.dailyActService.GetTodayOnlineSeconds(ctx.Context, characterID)
		if err != nil {
			h.logger.Warn("GetTodayOnlineTime: failed to load state, returning zero",
				zap.Int64("character_id", characterID),
				zap.Error(err))
		} else {
			minutes = seconds / 60
		}
	}

	return map[string]interface{}{
		"t": minutes,
		"f": int64(0),
	}, nil
}

func (h *Handler) TakeNewGift(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TakeNewGift called", zap.String("charID", ctx.CharacterID))

	_, characterID, err := h.characterID(ctx, "TakeNewGift")
	if err != nil {
		return nil, err
	}

	state := h.getRewardState(characterID)
	if state.StepIndex >= len(onlineRewardSteps) {
		h.logger.Warn("TakeNewGift: no more rewards available")
		return nil, nil
	}

	config := onlineRewardSteps[state.StepIndex]
	elapsed := time.Since(state.StartTime).Seconds()
	if int(elapsed) < config.Duration {
		h.logger.Warn("TakeNewGift: time not reached",
			zap.Int("needed", config.Duration),
			zap.Int("elapsed", int(elapsed)))
		return nil, nil
	}

	addedItem, addErr := h.itemService.AddItemWithBind(ctx.Context, characterID, config.ItemID, domainitem.ItemTypeConsumable, config.Quantity, true)
	if addErr != nil {
		h.logger.Error("TakeNewGift: AddItem failed", zap.Error(addErr))
		return nil, nil
	}

	_ = ctx.Connection.SendCallback("onAddItem", addedItem)
	_ = ctx.Connection.SendCallback("onAddCharactorSlot", addedItem)
	_ = ctx.Connection.SendCallback("onBlueMsg", "Nhận thưởng online thành công!")
	rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)

	state.StepIndex++
	h.SendNextOnlineReward(ctx.Connection, characterID)

	return nil, nil
}

func (h *Handler) TakeSPGift(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("TakeSPGift called", zap.String("charID", ctx.CharacterID))

	_, characterID, err := h.characterID(ctx, "TakeSPGift")
	if err != nil {
		return nil, err
	}

	addedItem, addErr := h.itemService.AddItemWithBind(ctx.Context, characterID, 2005, domainitem.ItemTypeConsumable, 1, true)
	if addErr != nil {
		h.logger.Error("TakeSPGift: AddItem failed", zap.Error(addErr))
		_ = ctx.Connection.SendCallback("onRedMsg", "Túi đã đầy hoặc lỗi hệ thống!")
		return nil, nil
	}

	_ = ctx.Connection.SendCallback("onAddItem", addedItem)
	_ = ctx.Connection.SendCallback("onAddCharactorSlot", addedItem)
	_ = ctx.Connection.SendCallback("onBlueMsg", "Nhận Quà Đặc Biệt thành công!")
	rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)

	return nil, nil
}
