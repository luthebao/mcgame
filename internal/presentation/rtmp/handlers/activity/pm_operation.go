// Open-sourced by BaoLT

package activity

import (
	"errors"
	"fmt"
	"sort"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	appbuff "mcgame-server/internal/application/buff"
	domainbuff "mcgame-server/internal/domain/buff"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const (
	pmOperationMessageExpired = "Hôm qua đã nhận hoặc quá hạn nhận"
	pmOperationMessageLimit   = "Bạn đã nhận thưởng, vui lòng quay lại sau!"
	pmOperationMessageNoBag   = "Túi đồ đã đầy hoặc phần thưởng không khả dụng"
	pmOperationMessagePending = "Phần thưởng VIP này hiện chưa hỗ trợ"
	pmOperationAutoDungeonID  = 3630
	pmOperationVipBagBaseID   = 3231
	pmOperationCouponKey      = "goldBind"
	pmTransformProcessKey     = "pm13Transform"
)

var errPMOperationRewardUnsupported = errors.New("pm operation reward unsupported")

func (h *Handler) DoPmOperation(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	_, characterID, err := h.characterID(ctx, "DoPmOperation")
	if err != nil {
		return nil, err
	}
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	if h.premiumService == nil || h.gameData == nil {
		return nil, pkgerrors.ErrSystemError
	}

	index, ok := parseIntArg(args[0])
	if !ok || index <= 0 {
		return nil, pkgerrors.ErrInvalidInput
	}

	right := h.gameData.GetPmRight(index)
	if right == nil {
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageExpired)
		return nil, nil
	}

	state, err := h.premiumService.GetPMState(ctx.Context, characterID)
	if err != nil {
		return nil, err
	}
	if state.PMLevel <= 0 {
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageExpired)
		return nil, nil
	}
	if !pmRightEnabledForLevel(right, state.PMLevel) {
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageExpired)
		return nil, nil
	}

	operationType := int(right.Type)
	if operationType != 2 && operationType != 4 {
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageLimit)
		return nil, nil
	}

	input := appactivity.PMOperationInput{
		Index:         index,
		OperationType: operationType,
		CountConfig:   right.CountConfig,
		DryRun:        true,
	}
	dryRunResult, err := h.premiumService.DoPMOperation(ctx.Context, characterID, input)
	if err != nil {
		return nil, h.handlePMOperationError(ctx, err)
	}

	if err := h.applyPMOperationReward(ctx, characterID, right, state.PMLevel, dryRunResult); err != nil {
		if errors.Is(err, errPMOperationRewardUnsupported) {
			_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessagePending)
			return nil, nil
		} else {
			h.logger.Warn("DoPmOperation: reward application failed",
				zap.Uint32("conn_id", ctx.ConnID),
				zap.Int64("character_id", characterID),
				zap.Int("index", index),
				zap.Error(err))
		}
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageNoBag)
		return nil, nil
	}

	input.DryRun = false
	result, err := h.premiumService.DoPMOperation(ctx.Context, characterID, input)
	if err != nil {
		return nil, h.handlePMOperationError(ctx, err)
	}

	payload := map[string]interface{}{
		"index": result.Index,
		"day":   result.Day,
		"type":  result.Type,
		"time":  result.Time,
	}
	_ = ctx.Connection.SendCallback("flushProcesFlag", payload)

	return nil, nil
}

func (h *Handler) handlePMOperationError(ctx *rtmp.RPCContext, err error) error {
	if errors.Is(err, appactivity.ErrPMOperationExpired) {
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageExpired)
		return nil
	}
	if errors.Is(err, appactivity.ErrPMOperationAlreadyClaimed) {
		_ = ctx.Connection.SendCallback("onSystemSay", pmOperationMessageLimit)
		return nil
	}
	if errors.Is(err, appactivity.ErrPMOperationInvalid) {
		return pkgerrors.ErrInvalidInput
	}
	return err
}

func (h *Handler) applyPMOperationReward(ctx *rtmp.RPCContext, characterID int64, right *models.PmRightTemplate, pmLevel int, progress *appactivity.PMOperationResult) error {
	id := right.GetID()
	switch id {
	case 1:
		if h.characterRepo == nil {
			return pkgerrors.ErrSystemError
		}
		multiplier := pmRightValueForLevel(h.gameData.GetPmRight(id), pmLevel)
		if multiplier <= 0 {
			return pkgerrors.ErrInvalidInput
		}
		char, err := h.characterRepo.FindByID(ctx.Context, characterID)
		if err != nil {
			return err
		}
		baseExp := char.ExperienceForLevel(char.Level + 1)
		if baseExp <= 0 {
			return errPMOperationRewardUnsupported
		}
		expGained := baseExp * int64(multiplier)
		if expGained <= 0 {
			expGained = 1
		}
		leveledUp := char.GainExperience(expGained)
		if err := h.characterRepo.Update(ctx.Context, char); err != nil {
			return err
		}
		h.sendPMExperienceCallbacks(ctx, characterID, char, expGained, leveledUp)
		return nil
	case 2:
		if h.characterRepo == nil {
			return pkgerrors.ErrSystemError
		}
		quantity := pmRightValueForLevel(h.gameData.GetPmRight(id), pmLevel)
		if quantity <= 0 {
			return pkgerrors.ErrInvalidInput
		}
		char, err := h.characterRepo.FindByID(ctx.Context, characterID)
		if err != nil {
			return err
		}
		char.GoldBind += int64(quantity)
		if err := h.characterRepo.Update(ctx.Context, char); err != nil {
			return err
		}
		_ = ctx.Connection.SendCallback("onAddMoney", float64(characterID), pmOperationCouponKey, float64(quantity), float64(char.GoldBind))
		_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{pmOperationCouponKey: char.GoldBind})
		return nil
	case 3:
		if h.buffService == nil {
			return pkgerrors.ErrSystemError
		}
		buffID := pmDailyBuffTemplate(pmLevel)
		if buffID <= 0 || progress == nil {
			return errPMOperationRewardUnsupported
		}
		if h.gameData.GetBuff(buffID) == nil {
			return errPMOperationRewardUnsupported
		}
		buff, err := h.buffService.AddOrRefresh(ctx.Context, characterID, appbuff.AddRequest{
			BuffID:   buffID,
			BuffType: domainbuff.TypePermanent,
			Source:   "pm_daily",
		})
		if err != nil {
			return err
		}
		return h.sendPMDailyBuffCallbacks(ctx, characterID, buff)
	case 7:
		if h.itemService == nil {
			return pkgerrors.ErrSystemError
		}
		quantity := pmRightValueForLevel(h.gameData.GetPmRight(id), pmLevel)
		if quantity <= 0 {
			quantity = 1
		}
		addedItem, err := h.itemService.AddItemWithBind(ctx.Context, characterID, pmOperationAutoDungeonID, domainitem.ItemTypeConsumable, quantity, true)
		if err != nil {
			return err
		}
		h.sendPMGrantedItemCallbacks(ctx, characterID, addedItem, "Nhận vật phẩm VIP thành công")
		rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)
		return nil
	case 10:
		if h.itemService == nil {
			return pkgerrors.ErrSystemError
		}
		bagTemplateID := pmMonthlyVIPBagTemplate(pmLevel)
		if bagTemplateID <= 0 {
			return pkgerrors.ErrInvalidInput
		}
		addedItem, err := h.itemService.AddItemWithBind(ctx.Context, characterID, bagTemplateID, domainitem.ItemTypeConsumable, 1, true)
		if err != nil {
			return err
		}
		h.sendPMGrantedItemCallbacks(ctx, characterID, addedItem, "Nhận túi quà VIP thành công")
		rtmputils.CheckBagCapacityWarning(ctx.Context, ctx.Connection, h.itemService, characterID)
		return nil
	case 13:
		if h.characterRepo == nil || h.gameData == nil {
			return pkgerrors.ErrSystemError
		}
		resCode, ok := pmTransformResCodeFromCreatures(h.gameData, characterID, time.Now())
		if !ok {
			return errPMOperationRewardUnsupported
		}

		char, err := h.characterRepo.FindByID(ctx.Context, characterID)
		if err != nil {
			return err
		}
		expiresAt := pmTransformExpiryAt(time.Now())
		char.SetPMTransform(resCode, expiresAt)
		if err := h.characterRepo.Update(ctx.Context, char); err != nil {
			return err
		}

		h.sendPMTransformCallbacks(ctx, char, resCode)
		return nil
	}

	if int(right.Type) == 2 {
		return errPMOperationRewardUnsupported
	}

	return nil
}

func (h *Handler) sendPMGrantedItemCallbacks(ctx *rtmp.RPCContext, characterID int64, addedItem *domainitem.Item, successMessage string) {
	if h == nil || ctx == nil || ctx.Connection == nil || addedItem == nil {
		return
	}
	itemPayload := addedItem.ToDTO()
	if h.itemService != nil {
		itemPayload = h.itemService.BuildClientItemDTO(addedItem)
	}
	_ = ctx.Connection.SendCallback("onAddItem", itemPayload)
	_ = ctx.Connection.SendCallback("onCreateItemInstance", itemPayload)
	_ = ctx.Connection.SendCallback("onAddCharactorSlot", itemPayload)
	if successMessage != "" {
		_ = ctx.Connection.SendCallback("onBlueMsg", successMessage)
	}
	if h.gameData != nil {
		if tpl := h.gameData.GetItem(addedItem.TemplateID); tpl != nil && tpl.Name != "" {
			_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Nhận được %s", tpl.Name))
		}
	}
}

func (h *Handler) sendPMTransformCallbacks(ctx *rtmp.RPCContext, char *domainchar.Character, resCode int64) {
	if h == nil || ctx == nil || ctx.Connection == nil || char == nil || resCode <= 0 {
		return
	}
	payload := map[string]interface{}{
		"id":  char.ID,
		"res": resCode,
	}
	_ = ctx.Connection.SendCallback("onSetRes", payload)
	if h.rtmpServer != nil {
		if mapID, _ := ctx.Connection.GetSceneInfo(); mapID > 0 {
			h.rtmpServer.GetSceneManager().BroadcastToScene(ctx.Connection.GetChannelID(), mapID, ctx.ConnID, "onSetRes", payload)
		}
	}
}

func (h *Handler) sendPMExperienceCallbacks(ctx *rtmp.RPCContext, characterID int64, char *domainchar.Character, expGained int64, leveledUp bool) {
	if h == nil || ctx == nil || ctx.Connection == nil || char == nil {
		return
	}
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx.Context, char)
		h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, characterID)
		rtmputils.SendExpAndLevelUpCallbacksWithEquipment(ctx.Connection, char, expGained, leveledUp, &bonuses)
	} else {
		rtmputils.SendExpAndLevelUpCallbacks(ctx.Connection, char, expGained, leveledUp)
	}
	_ = ctx.Connection.SendCallback("onBlueMsg", fmt.Sprintf("Nhận %d kinh nghiệm VIP", expGained))
}

func pmTransformExpiryAt(now time.Time) time.Time {
	base := now
	if base.IsZero() {
		base = time.Now()
	}
	next := time.Date(base.Year(), base.Month(), base.Day()+1, 0, 0, 0, 0, base.Location())
	return next
}

func pmTransformResCodeFromCreatures(manager interface {
	GetAllCreatures() []*models.CreatureTemplate
}, characterID int64, now time.Time) (int64, bool) {
	if manager == nil {
		return 0, false
	}
	creatures := manager.GetAllCreatures()
	if len(creatures) == 0 {
		return 0, false
	}

	resCodes := make([]int64, 0, len(creatures))
	seen := make(map[int64]struct{}, len(creatures))
	for _, tpl := range creatures {
		if tpl == nil || tpl.ID <= 0 || tpl.ResCode <= 0 {
			continue
		}
		if int(tpl.ShowAble) != 1 {
			continue
		}
		resCode := int64(tpl.ResCode)
		if _, exists := seen[resCode]; exists {
			continue
		}
		seen[resCode] = struct{}{}
		resCodes = append(resCodes, resCode)
	}

	if len(resCodes) == 0 {
		return 0, false
	}
	sort.Slice(resCodes, func(i, j int) bool {
		return resCodes[i] < resCodes[j]
	})

	daySeed := now.Year()*1000 + now.YearDay() + int(characterID)
	return resCodes[daySeed%len(resCodes)], true
}

func (h *Handler) sendPMDailyBuffCallbacks(ctx *rtmp.RPCContext, characterID int64, buff *domainbuff.Buff) error {
	if ctx == nil || ctx.Connection == nil {
		return nil
	}
	char, err := h.characterRepo.FindByID(ctx.Context, characterID)
	if err != nil {
		return err
	}
	if h.buffService != nil && buff != nil {
		_ = ctx.Connection.SendCallback("upLongBuff", h.buffService.BuildLongBuffPayload(buff))
	}

	var payload map[string]interface{}
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx.Context, char)
		h.itemService.ApplyCharacterMakerSetState(ctx.Context, char)
		bonuses := h.itemService.AggregateEquipmentStats(ctx.Context, characterID)
		payload = domainchar.BuildStatRefreshUPPPayloadWithEquipment(char, bonuses)
	} else {
		payload = domainchar.BuildStatRefreshUPPPayload(char)
	}
	_ = ctx.Connection.SendCallback("onUPP", payload)

	return nil
}

func pmRightEnabledForLevel(right *models.PmRightTemplate, level int) bool {
	switch clampPMLevel(level) {
	case 1:
		return right.Vip1 > 0
	case 2:
		return right.Vip2 > 0
	case 3:
		return right.Vip3 > 0
	case 4:
		return right.Vip4 > 0
	case 5:
		return right.Vip5 > 0
	case 6:
		return right.Vip6 > 0
	case 7:
		return right.Vip7 > 0
	case 8:
		return right.Vip8 > 0
	case 9:
		return right.Vip9 > 0
	default:
		return false
	}
}

func pmRightValueForLevel(right *models.PmRightTemplate, level int) int {
	switch clampPMLevel(level) {
	case 1:
		return int(right.Value1)
	case 2:
		return int(right.Value2)
	case 3:
		return int(right.Value3)
	case 4:
		return int(right.Value4)
	case 5:
		return int(right.Value5)
	case 6:
		return int(right.Value6)
	case 7:
		return int(right.Value7)
	case 8:
		return int(right.Value8)
	case 9:
		return int(right.Value9)
	default:
		return 0
	}
}

func pmMonthlyVIPBagTemplate(level int) int {
	return pmOperationVipBagBaseID + min(clampPMLevel(level), 7)
}

func pmDailyBuffTemplate(level int) int {
	switch clampPMLevel(level) {
	case 1:
		return 2504
	case 2:
		return 2505
	case 3:
		return 2506
	case 4:
		return 2507
	case 5:
		return 2508
	case 6:
		return 2509
	case 7:
		return 2510
	case 8:
		return 3308
	case 9:
		return 3309
	default:
		return 0
	}
}

func clampPMLevel(level int) int {
	if level < 1 {
		return 1
	}
	if level > 9 {
		return 9
	}
	return level
}
