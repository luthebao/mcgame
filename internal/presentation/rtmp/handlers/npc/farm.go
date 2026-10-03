// Open-sourced by BaoLT

// Farm npc handlers manage planting, growth, harvesting, and plot visuals.
package npc

import (
	"errors"
	"fmt"
	"strconv"
	"strings"
	"time"

	appfarm "mcgame-server/internal/application/farm"
	appscene "mcgame-server/internal/application/scene"
	domainchar "mcgame-server/internal/domain/character"
	domainfarm "mcgame-server/internal/domain/farm"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/infrastructure/rtmp"
	farmhandler "mcgame-server/internal/presentation/rtmp/handlers/farm"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type farmHarvestTask struct {
	characterID int64
	plotNPCID   int
	cancel      chan struct{}
}

const (
	farmPlantVigorCost          = 25
	farmHarvestPlantMasteryGain = 20
	farmPlantSkillType          = 15
	farmHarvestAchieveType      = 2
	farmHarvestAchieveReqID     = 294
)

func (h *Handler) handleFarmScriptAction(ctx *rtmp.RPCContext, characterID int64, funcID string) (bool, error) {
	if strings.HasPrefix(funcID, "plant_short_term_") || strings.HasPrefix(funcID, "plant_long_term_") {
		idStr := funcID[strings.LastIndex(funcID, "_")+1:]
		plotNPCID, _ := strconv.Atoi(idStr)
		if blocked, err := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); blocked || err != nil {
			return true, err
		}
		cropIDs := []int{1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1239, 1240, 1525, 1526, 1527, 1528, 1529}
		mode := "short"
		if strings.HasPrefix(funcID, "plant_long_term_") {
			mode = "long"
		}
		cropOptions := make([]map[string]interface{}, 0, len(cropIDs))
		for _, cropID := range cropIDs {
			label := fmt.Sprintf("Nông sản %d", cropID)
			if h.gameData != nil {
				if cropNPC := h.gameData.GetNPC(cropID); cropNPC != nil {
					label = fmt.Sprintf("%s (Lv %d)", cropNPC.Name, int(cropNPC.Lv))
				}
			}
			cropOptions = append(cropOptions, map[string]interface{}{
				"label": label,
				"func":  fmt.Sprintf("plant_crop_%s_%d_%d", mode, cropID, plotNPCID),
			})
		}
		_ = ctx.Connection.SendCallback("onList", plotNPCID, "Trồng trọt", "Hãy chọn loại nông sản bạn muốn trồng:", cropOptions)
		return true, nil
	}

	if strings.HasPrefix(funcID, "plant_crop_") {
		parts := strings.Split(funcID, "_")
		if len(parts) < 4 {
			return true, pkgerrors.ErrInvalidArgs
		}

		cropID := 0
		plotNPCID := 0
		growDuration := time.Duration(0)
		var err error
		switch {
		case len(parts) >= 5 && (parts[2] == "short" || parts[2] == "long"):
			cropID, err = strconv.Atoi(parts[3])
			if err != nil {
				return true, pkgerrors.ErrInvalidArgs
			}
			plotNPCID, err = strconv.Atoi(parts[4])
			if err != nil {
				return true, pkgerrors.ErrInvalidArgs
			}
			if parts[2] == "long" {
				growDuration = 40 * time.Minute
			} else {
				growDuration = 4 * time.Minute
			}
		default:
			cropID, err = strconv.Atoi(parts[2])
			if err != nil {
				return true, pkgerrors.ErrInvalidArgs
			}
			plotNPCID, err = strconv.Atoi(parts[3])
			if err != nil {
				return true, pkgerrors.ErrInvalidArgs
			}
		}

		if h.farmService == nil || h.charService == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Hệ thống nông trại chưa sẵn sàng.")
			return true, nil
		}
		if blocked, err := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); blocked || err != nil {
			return true, err
		}

		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil || char == nil {
			return true, pkgerrors.ErrUnauthorized
		}
		if !h.farmPlantSkillLevelEnoughForCharacter(ctx.Context, char, cropID) {
			_ = ctx.Connection.SendCallback("onSystemSay", "Cấp độ kỹ năng không đủ")
			return true, nil
		}
		if !hasFarmPlantVigor(char, farmPlantVigorCost) {
			_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
			return true, nil
		}

		result, err := h.farmService.PlantCropWithDuration(ctx.Context, characterID, plotNPCID, cropID, growDuration)
		if err != nil {
			if errors.Is(err, appfarm.ErrAnotherPlotActive) {
				if blocked, noticeErr := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); noticeErr != nil {
					return true, noticeErr
				} else if blocked {
					return true, nil
				}
			}
			msg := "Không thể trồng cây tại ô đất này."
			switch {
			case errors.Is(err, appfarm.ErrInvalidPlotNPCID):
				msg = "Ô đất không hợp lệ."
			case errors.Is(err, appfarm.ErrInvalidCropNPCID):
				msg = "Loại nông sản không hợp lệ."
			case errors.Is(err, appfarm.ErrPlotOccupied):
				msg = "Ô đất đang có nông sản."
			}
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, msg)
			return true, nil
		}

		if result != nil && result.ConsumedSeedItem != nil {
			if result.ConsumedSeedItem.StackCount <= 0 {
				_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(result.ConsumedSeedItem.ID), float64(result.ConsumedSeedItem.CalculateSID()))
			} else {
				_ = ctx.Connection.SendCallback("onAddCharactorSlot", result.ConsumedSeedItem.ToDTO())
			}
		}

		msg := "Đã trồng nông sản thành công."
		if result != nil && result.CropName != "" && result.Plot != nil {
			msg = fmt.Sprintf("Đã trồng %s. Thời gian chín: %s.", result.CropName, result.Plot.ReadyAt.Format("15:04:05"))
		}
		h.applyFarmPlantVigorCost(ctx, char)
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, msg)
		h.sendFarmCropOn(ctx, characterID, plotNPCID, cropID)
		h.sendFarmDataUpdate(ctx, characterID)
		return true, nil
	}

	if strings.HasPrefix(funcID, "plant_special_") {
		idStr := funcID[len("plant_special_"):]
		plotNPCID, _ := strconv.Atoi(idStr)
		if blocked, err := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); blocked || err != nil {
			return true, err
		}
		options := []map[string]interface{}{{"label": "Trồng cây kim tiền (cần hạt giống)", "func": fmt.Sprintf("plant_money_tree_%d", plotNPCID)}}
		_ = ctx.Connection.SendCallback("onList", plotNPCID, "Nông sản đặc biệt", "Chọn loại nông sản đặc biệt:", options)
		return true, nil
	}

	if strings.HasPrefix(funcID, "farm_operation_") {
		idStr := funcID[len("farm_operation_"):]
		plotNPCID, _ := strconv.Atoi(idStr)
		h.sendFarmOperationList(ctx, plotNPCID)
		return true, nil
	}

	if strings.HasPrefix(funcID, "farm_harvest_now_") {
		idStr := funcID[len("farm_harvest_now_"):]
		plotNPCID, _ := strconv.Atoi(idStr)
		if h.farmService == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Hệ thống nông trại chưa sẵn sàng.")
			return true, nil
		}

		ownerCharacterID := h.harvestOwnerCharacterID(ctx, characterID, plotNPCID)
		plot, err := h.farmService.GetPlot(ctx.Context, ownerCharacterID, plotNPCID)
		if err == nil && plot == nil && ownerCharacterID != characterID {
			plot, err = h.farmService.GetPlotByNPCID(ctx.Context, plotNPCID)
		}
		if err != nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Không thể thu hoạch nông sản.")
			return true, nil
		}
		if plot == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
			return true, nil
		}
		if time.Now().Before(plot.ReadyAt) {
			if ownerCharacterID != characterID {
				_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Nông sản chưa chín.")
				return true, nil
			}
			_ = ctx.Connection.SendCallback("ripenImmediately", plotNPCID, 9)
			return true, nil
		}

		return true, h.startFarmHarvest(ctx, characterID, ownerCharacterID, plotNPCID)
	}

	if strings.HasPrefix(funcID, "farm_destroy_") {
		idStr := funcID[len("farm_destroy_"):]
		plotNPCID, _ := strconv.Atoi(idStr)
		if h.farmService == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Hệ thống nông trại chưa sẵn sàng.")
			return true, nil
		}

		plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
		if err != nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Không thể tiêu diệt nông sản.")
			return true, nil
		}
		if plot == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
			return true, nil
		}

		_ = ctx.Connection.SendCallback("uproot", plotNPCID, 1)
		return true, nil
	}

	if strings.HasPrefix(funcID, "farm_use_booster_") {
		idStr := funcID[len("farm_use_booster_"):]
		plotNPCID, _ := strconv.Atoi(idStr)
		if h.farmService == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Hệ thống nông trại chưa sẵn sàng.")
			return true, nil
		}

		plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
		if err != nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Không thể sử dụng thuốc tăng trưởng.")
			return true, nil
		}
		if plot == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
			return true, nil
		}

		_ = ctx.Connection.SendCallback("doubleHarvest", plotNPCID)
		return true, nil
	}

	if strings.HasPrefix(funcID, "plant_money_tree_") {
		idStr := funcID[len("plant_money_tree_"):]
		plotNPCID, _ := strconv.Atoi(idStr)
		if h.farmService == nil || h.charService == nil {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Hệ thống nông trại chưa sẵn sàng.")
			return true, nil
		}
		if blocked, err := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); blocked || err != nil {
			return true, err
		}

		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil || char == nil {
			return true, pkgerrors.ErrUnauthorized
		}
		if !h.farmPlantSkillLevelEnoughForCharacter(ctx.Context, char, 1529) {
			_ = ctx.Connection.SendCallback("onSystemSay", "Cấp độ kỹ năng không đủ")
			return true, nil
		}
		if !hasFarmPlantVigor(char, farmPlantVigorCost) {
			_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
			return true, nil
		}

		result, err := h.farmService.PlantMoneyTree(ctx.Context, characterID, plotNPCID)
		if err != nil {
			if errors.Is(err, appfarm.ErrAnotherPlotActive) {
				if blocked, noticeErr := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); noticeErr != nil {
					return true, noticeErr
				} else if blocked {
					return true, nil
				}
			}
			msg := "Không thể trồng cây kim tiền."
			switch {
			case errors.Is(err, appfarm.ErrSeedNotFound):
				msg = "Ngươi không có Hạt Giống Cây Kim Tiền"
			case errors.Is(err, appfarm.ErrPlotOccupied):
				msg = "Ô đất đang có nông sản."
			case errors.Is(err, appfarm.ErrInvalidPlotNPCID):
				msg = "Ô đất không hợp lệ."
			}
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, msg)
			return true, nil
		}

		if result != nil && result.ConsumedSeedItem != nil {
			if result.ConsumedSeedItem.StackCount <= 0 {
				_ = ctx.Connection.SendCallback("onDelCharactorSlot", float64(result.ConsumedSeedItem.ID), float64(result.ConsumedSeedItem.CalculateSID()))
			} else {
				_ = ctx.Connection.SendCallback("onAddCharactorSlot", result.ConsumedSeedItem.ToDTO())
			}
		}

		if result != nil && result.Plot != nil {
			h.sendFarmCropOn(ctx, characterID, plotNPCID, result.Plot.CropNPCID)
		}
		h.applyFarmPlantVigorCost(ctx, char)
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Đã trồng cây kim tiền thành công.")
		h.sendFarmDataUpdate(ctx, characterID)
		return true, nil
	}

	if funcID == "view_planting_guide" || strings.HasPrefix(funcID, "view_planting_guide_") {
		guide := `1. Muốn trồng nông sản trước tiên cần học kỹ năng trồng trọt, sau khi đạt cấp 50 có thể đến Diệu Linh Thôn gặp Đại Sư Kỹ Năng Sống để học.
2. Khi trồng cần có đất trống, có thể đến Nông Trường Pháp Thuật chọn 1 mảnh đất trống để trồng. Nông sản gồm có ngắn ngày và dài ngày, cấp thấp và cấp cao. Nông sản có cấp độ trồng trọt càng cao thì càng cần kỹ năng cao.
3. Sau khi nông sản chín, người trồng cần thu hoạch ngay. Nếu sau một thời gian không được thu hoạch thì nông sản sẽ héo và cần phải trồng lại.`
		_ = ctx.Connection.SendCallback("a", guide)
		return true, nil
	}

	return false, nil
}

func (h *Handler) tryHandleFarmNPCClick(ctx *rtmp.RPCContext, characterID int64, npcID int) (bool, error) {
	if h.farmService == nil || h.charService == nil || h.sceneService == nil {
		return false, nil
	}

	plotNPCID := farmhandler.NormalizePlotNPCID(h.farmService, npcID)
	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return false, err
	}
	if !farmhandler.IsFarmMap(char.MapID) {
		return false, nil
	}

	ownerCharacterID := characterID
	plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
	if err != nil {
		return false, err
	}
	if plot == nil {
		ownerCharacterID, err = h.farmService.ResolvePlotOwnerCharacterID(ctx.Context, characterID, plotNPCID)
		if err != nil {
			return false, err
		}
		if ownerCharacterID > 0 && ownerCharacterID != characterID {
			plot, err = h.farmService.GetPlot(ctx.Context, ownerCharacterID, plotNPCID)
			if err != nil {
				return false, err
			}
		}
	}
	if plot != nil {
		if ownerCharacterID != characterID {
			if time.Now().Before(plot.ReadyAt) {
				return true, nil
			}
			return true, h.startFarmHarvest(ctx, characterID, ownerCharacterID, plotNPCID)
		}
		if time.Now().Before(plot.ReadyAt) {
			h.sendFarmOperationList(ctx, plotNPCID)
			return true, nil
		}
		return true, h.startFarmHarvest(ctx, characterID, characterID, plotNPCID)
	}
	if blocked, err := h.sendBlockingFarmPlotNotice(ctx, characterID, plotNPCID); blocked || err != nil {
		return true, err
	}

	mapNPC, found, err := h.findMapNPCInstance(ctx, char.MapID, plotNPCID)
	if err != nil || !found {
		return false, err
	}
	if !h.farmService.IsPlotTemplateID(mapNPC.NID) {
		return false, nil
	}

	h.sendFarmPlantList(ctx, plotNPCID, mapNPC.NID)
	return true, nil
}

func (h *Handler) findMapNPCInstance(ctx *rtmp.RPCContext, mapID int, npcID int) (appscene.NPCClientData, bool, error) {
	npcs, err := h.sceneService.GetMapNPCsForClient(ctx.Context, mapID)
	if err != nil {
		return appscene.NPCClientData{}, false, err
	}

	for _, npc := range npcs {
		if npc.InstanceID == npcID {
			return npc, true, nil
		}
	}

	return appscene.NPCClientData{}, false, nil
}

func (h *Handler) sendFarmPlantList(ctx *rtmp.RPCContext, plotNPCID int, npcTemplateID int) {
	npcName := "NPC"
	if h.gameData != nil {
		if npc := h.gameData.GetNPC(npcTemplateID); npc != nil && npc.Name != "" {
			npcName = npc.Name
		}
	}

	content := "Việc trồng trọt sẽ giúp ta thu hoạch được các nông sản phong phú! Nông sản có 2 loại là dài ngày và ngắn ngày, thời gian trưởng thành của loại ngắn ngày là 5 phút, loại dài ngày là 40 phút, 1 lần thu hoạch khá nhiều. Ngươi muốn trồng loại nào?"
	options := []map[string]interface{}{
		{"label": "Trồng cây ngắn ngày", "func": fmt.Sprintf("plant_short_term_%d", plotNPCID)},
		{"label": "Trồng cây dài ngày", "func": fmt.Sprintf("plant_long_term_%d", plotNPCID)},
		{"label": "Trồng nông sản đặc biệt", "func": fmt.Sprintf("plant_special_%d", plotNPCID)},
		{"label": "Thao tác nông trường", "func": fmt.Sprintf("farm_operation_%d", plotNPCID)},
		{"label": "Ta muốn xem cách trồng cây", "func": "view_planting_guide"},
	}

	if err := ctx.Connection.SendCallbackSync("onList", plotNPCID, npcName, content, options); err != nil {
		h.logger.Error("Failed to send farm plant list", zap.Error(err))
	}
}

func (h *Handler) sendFarmOperationList(ctx *rtmp.RPCContext, plotNPCID int) {
	options := []map[string]interface{}{
		{"label": "Sử dụng thuốc tăng trưởng", "func": fmt.Sprintf("farm_use_booster_%d", plotNPCID)},
		{"label": "Lập tức thu hoạch", "func": fmt.Sprintf("farm_harvest_now_%d", plotNPCID)},
		{"label": "Tiêu diệt", "func": fmt.Sprintf("farm_destroy_%d", plotNPCID)},
	}

	if err := ctx.Connection.SendCallbackSync("onList", plotNPCID, "Thao tác nông trường", "Bạn muốn thao tác gì?", options); err != nil {
		h.logger.Error("Failed to send farm operation list", zap.Error(err))
	}
}

func (h *Handler) sendBlockingFarmPlotNotice(ctx *rtmp.RPCContext, characterID int64, targetPlotNPCID int) (bool, error) {
	if h.farmService == nil {
		return false, nil
	}

	plot, err := h.farmService.GetBlockingPlantPlot(ctx.Context, characterID, targetPlotNPCID)
	if err != nil {
		return false, err
	}
	if plot == nil {
		return false, nil
	}

	_ = ctx.Connection.SendCallback("onSystemSay", farmExistingPlotSystemMessage(ctx.Connection.GetChannelID(), plot, h.gameData))
	return true, nil
}

func hasFarmPlantVigor(char *domainchar.Character, cost int) bool {
	return char != nil && cost > 0 && char.CurrentSP >= cost
}

func spendFarmPlantVigor(char *domainchar.Character, cost int) bool {
	if !hasFarmPlantVigor(char, cost) {
		return false
	}

	char.CurrentSP -= cost
	return true
}

func (h *Handler) applyFarmPlantVigorCost(ctx *rtmp.RPCContext, char *domainchar.Character) {
	if h.charService == nil || !spendFarmPlantVigor(char, farmPlantVigorCost) {
		return
	}

	if err := h.charService.Update(ctx.Context, char); err != nil {
		h.logger.Warn("Failed to persist farm plant vigor cost",
			zap.Int64("character_id", char.ID),
			zap.Int("vigor_cost", farmPlantVigorCost),
			zap.Error(err))
		return
	}

	_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Mất %d điểm sức lực", farmPlantVigorCost))
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"vigor": char.CurrentSP})
}

func farmPlantSkillLevelEnough(char *domainchar.Character, cropNPCID int, gameData *gamedata.Manager) bool {
	requiredLevel, hasRequiredLevel := farmCropRequiredSkillLevel(cropNPCID, gameData)
	if !hasRequiredLevel || requiredLevel <= 0 {
		return true
	}

	currentLevel, hasSkillData := farmCharacterPlantSkillLevel(char, gameData)
	if !hasSkillData {
		return true
	}

	return currentLevel >= requiredLevel
}

func farmCharacterPlantSkillLevel(char *domainchar.Character, gameData *gamedata.Manager) (int, bool) {
	if char == nil || gameData == nil {
		return 0, false
	}

	bestLevel := 0
	foundTemplate := false
	for _, skill := range gameData.GetAllSkills() {
		if skill == nil || int(skill.Type) != farmPlantSkillType {
			continue
		}

		foundTemplate = true
		requiredLevel := int(skill.ReqLevel)
		requiredDex := int(skill.DexSkill)
		if char.Level < requiredLevel {
			continue
		}
		if requiredDex > 0 && char.PlantDex < requiredDex {
			continue
		}

		level := int(skill.Level)
		if level > bestLevel {
			bestLevel = level
		}
	}

	return bestLevel, foundTemplate
}

func farmCropRequiredSkillLevel(cropNPCID int, gameData *gamedata.Manager) (int, bool) {
	if gameData == nil {
		return 0, false
	}

	npc := gameData.GetNPC(cropNPCID)
	if npc == nil {
		return 0, false
	}

	return int(npc.Lv), true
}

func farmExistingPlotSystemMessage(channelID int, plot *domainfarm.Plot, gameData *gamedata.Manager) string {
	if channelID <= 0 {
		channelID = 1
	}

	locationName := "Nông Trường"
	x := 0
	y := 0
	if gameData != nil && plot != nil {
		if npc := gameData.GetNPC(plot.PlotNPCID); npc != nil {
			locationName = farmPlotMapName(int(npc.PosMapID))
			x = int(npc.PosX)
			y = int(npc.PosY)
		}
	}

	cropName := farmCropName(0, gameData)
	if plot != nil {
		cropName = farmCropName(plot.CropNPCID, gameData)
	}

	if x > 0 || y > 0 {
		return fmt.Sprintf("Tại kênh %d - vị trí %s [%d,%d], bạn có một vườn %s", channelID, locationName, x, y, cropName)
	}

	return fmt.Sprintf("Tại kênh %d - vị trí %s, bạn có một vườn %s", channelID, locationName, cropName)
}

func farmRipeSystemMessage(channelID int, plot *domainfarm.Plot, gameData *gamedata.Manager) string {
	if channelID <= 0 {
		channelID = 1
	}

	locationName := "Nông Trường"
	x := 0
	y := 0
	if gameData != nil && plot != nil {
		if npc := gameData.GetNPC(plot.PlotNPCID); npc != nil {
			locationName = farmPlotMapName(int(npc.PosMapID))
			x = int(npc.PosX)
			y = int(npc.PosY)
		}
	}

	cropName := farmCropName(0, gameData)
	if plot != nil {
		cropName = farmCropName(plot.CropNPCID, gameData)
	}

	if x > 0 || y > 0 {
		return fmt.Sprintf("Tại kênh %d - vị trí %s [%d,%d], %s mà bạn trồng đã chín, hãy thu hoạch ngay đi.", channelID, locationName, x, y, cropName)
	}

	return fmt.Sprintf("Tại kênh %d - vị trí %s, %s mà bạn trồng đã chín, hãy thu hoạch ngay đi.", channelID, locationName, cropName)
}

func farmPlotMapName(mapID int) string {
	switch mapID {
	case 57:
		return "Nông Trường Số 1"
	case 58:
		return "Nông Trường Số 2"
	default:
		return "Nông Trường"
	}
}

func farmCropName(cropNPCID int, gameData *gamedata.Manager) string {
	if gameData != nil && cropNPCID > 0 {
		if npc := gameData.GetNPC(cropNPCID); npc != nil && npc.Name != "" {
			return npc.Name
		}
	}

	if cropNPCID <= 0 {
		return "nông sản"
	}

	return fmt.Sprintf("Nông sản %d", cropNPCID)
}

func (h *Handler) viewedFarmCharacterID(ctx *rtmp.RPCContext, characterID int64) int64 {
	if ctx == nil || ctx.Connection == nil {
		return characterID
	}

	viewedCharacterID := ctx.Connection.GetViewedFarmCharacterID()
	if viewedCharacterID <= 0 {
		return characterID
	}

	return viewedCharacterID
}

func (h *Handler) harvestOwnerCharacterID(ctx *rtmp.RPCContext, characterID int64, plotNPCID int) int64 {
	if h.charService != nil {
		if char, err := h.charService.GetByID(ctx.Context, characterID); err == nil && char != nil && farmhandler.IsFarmMap(char.MapID) {
			if h.farmService == nil {
				return characterID
			}

			ownerCharacterID, resolveErr := h.farmService.ResolvePlotOwnerCharacterID(ctx.Context, characterID, plotNPCID)
			if resolveErr == nil && ownerCharacterID > 0 {
				return ownerCharacterID
			}
			return characterID
		}
	}

	return h.viewedFarmCharacterID(ctx, characterID)
}

func (h *Handler) nextFarmHarvestAchieveProgress(characterID int64) int {
	h.farmAchieveMu.Lock()
	defer h.farmAchieveMu.Unlock()

	h.farmAchieves[characterID]++
	return h.farmAchieves[characterID]
}

func (h *Handler) replaceFarmHarvestTask(connID uint32, task *farmHarvestTask) *farmHarvestTask {
	h.farmHarvestMu.Lock()
	defer h.farmHarvestMu.Unlock()

	prev := h.farmHarvests[connID]
	h.farmHarvests[connID] = task
	return prev
}

func (h *Handler) completeFarmHarvestTask(connID uint32, task *farmHarvestTask) bool {
	h.farmHarvestMu.Lock()
	defer h.farmHarvestMu.Unlock()

	current, ok := h.farmHarvests[connID]
	if !ok || current != task {
		return false
	}

	delete(h.farmHarvests, connID)
	return true
}

func (h *Handler) cancelFarmHarvestTask(connID uint32) *farmHarvestTask {
	h.farmHarvestMu.Lock()
	defer h.farmHarvestMu.Unlock()

	task, ok := h.farmHarvests[connID]
	if !ok {
		return nil
	}

	delete(h.farmHarvests, connID)
	close(task.cancel)
	return task
}

func (h *Handler) startFarmHarvest(ctx *rtmp.RPCContext, characterID int64, ownerCharacterID int64, plotNPCID int) error {
	task := &farmHarvestTask{
		characterID: characterID,
		plotNPCID:   plotNPCID,
		cancel:      make(chan struct{}),
	}
	if prev := h.replaceFarmHarvestTask(ctx.ConnID, task); prev != nil {
		close(prev.cancel)
	}

	if err := ctx.Connection.SendCallback("onSetCharState", map[string]interface{}{"cid": ctx.CharacterID, "state": 27}); err != nil {
		h.cancelFarmHarvestTask(ctx.ConnID)
		return err
	}

	if err := ctx.Connection.SendCallback("onGathering", map[string]interface{}{"hint": " Đang thu hoạch", "delay": 5000}); err != nil {
		h.cancelFarmHarvestTask(ctx.ConnID)
		_ = ctx.Connection.SendCallback("onSetCharState", map[string]interface{}{"cid": ctx.CharacterID, "state": 1})
		return err
	}

	go func() {
		timer := time.NewTimer(5 * time.Second)
		defer timer.Stop()

		select {
		case <-task.cancel:
			return
		case <-timer.C:
		}

		if !h.completeFarmHarvestTask(ctx.ConnID, task) {
			return
		}

		result, err := h.farmService.HarvestPlot(ctx.Context, ownerCharacterID, characterID, plotNPCID)
		_ = ctx.Connection.SendCallback("quitGathering", nil)
		_ = ctx.Connection.SendCallback("onSetCharState", map[string]interface{}{"cid": ctx.CharacterID, "state": 1})
		h.finishFarmHarvest(ctx, characterID, plotNPCID, result, err)
	}()

	return nil
}

func (h *Handler) QuitGatheringClinet(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if task := h.cancelFarmHarvestTask(ctx.ConnID); task != nil {
		_ = ctx.Connection.SendCallback("quitGathering", nil)
		_ = ctx.Connection.SendCallback("onSetCharState", map[string]interface{}{"cid": ctx.CharacterID, "state": 1})
		return map[string]interface{}{"success": true, "plotId": task.plotNPCID}, nil
	}

	if task := h.cancelFishingTask(ctx.ConnID); task != nil {
		_ = ctx.Connection.SendCallback("quitGathering", nil)
		_ = ctx.Connection.SendCallback("onSetCharState", map[string]interface{}{"cid": ctx.CharacterID, "state": 1})
		return map[string]interface{}{"success": true, "npcId": task.npcID}, nil
	}

	if task := h.cancelHerbTask(ctx.ConnID); task != nil {
		_ = ctx.Connection.SendCallback("quitGathering", nil)
		_ = ctx.Connection.SendCallback("onSetCharState", map[string]interface{}{"cid": ctx.CharacterID, "state": 1})
		return map[string]interface{}{"success": true, "npcId": task.npcID}, nil
	}

	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) finishFarmHarvest(ctx *rtmp.RPCContext, characterID int64, plotNPCID int, result *appfarm.HarvestResult, err error) {
	if err != nil {
		msg := "Không thể thu hoạch nông sản."
		systemMsg := ""
		switch {
		case errors.Is(err, appfarm.ErrPlotNotFound):
			msg = "Bạn chưa trồng."
		case errors.Is(err, appfarm.ErrCropNotReady):
			msg = "Nông sản chưa chín."
		case errors.Is(err, appfarm.ErrPlotAlreadyShared):
			systemMsg = "Bạn đã thu hoạch mảnh vườn này rồi, phải chừa lại cho chủ vườn 1 ít chứ"
		case errors.Is(err, appfarm.ErrPlotSharedOut):
			systemMsg = "Mảnh vườn này đã được người khác thu hoạch phụ rồi."
		}
		if systemMsg != "" {
			_ = ctx.Connection.SendCallback("onSystemSay", systemMsg)
			return
		}
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, msg)
		return
	}

	if result != nil {
		_ = ctx.Connection.SendCallback("onAddItem", h.buildFarmRewardEffect(result))
		if result.AddedInventoryItem != nil {
			_ = ctx.Connection.SendCallback("onAddCharactorSlot", result.AddedInventoryItem.ToDTO())
		}
		_ = ctx.Connection.SendCallback("onUpdateAchieve", farmHarvestAchieveType, farmHarvestAchieveReqID, map[string]interface{}{"progress": h.nextFarmHarvestAchieveProgress(characterID)})
	}

	if h.skillService != nil {
		char, _, masteryErr := h.skillService.AddPlantMastery(ctx.Context, characterID, farmHarvestPlantMasteryGain)
		if masteryErr != nil {
			h.logger.Warn("Failed to add farm plant mastery",
				zap.Int64("character_id", characterID),
				zap.Int("mastery_gain", farmHarvestPlantMasteryGain),
				zap.Error(masteryErr))
		} else if char != nil {
			_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Độ thành thục của Trồng trọt tăng thêm %d điểm", farmHarvestPlantMasteryGain))
			rtmputils.SendLifeSkillStateUpdate(ctx, h.logger, h.skillService, char)
		}
	}

	if result == nil || !result.IsSharedHarvest {
		h.sendFarmPlotReset(ctx, plotNPCID)
	}
	if result != nil {
		h.sendFarmDataUpdate(ctx, result.OwnerCharacterID)
		return
	}
	h.sendFarmDataUpdate(ctx, characterID)
}

func (h *Handler) RipenImmediately(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.farmService == nil || h.charService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	plotNPCID, ok := farmhandler.FindFirstIntArg(args)
	if !ok || plotNPCID == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	plotNPCID = farmhandler.NormalizePlotNPCID(h.farmService, plotNPCID)

	plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	if plot == nil {
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
		return map[string]interface{}{"success": true}, nil
	}
	if !time.Now().Before(plot.ReadyAt) {
		result, harvestErr := h.farmService.HarvestPlot(ctx.Context, characterID, characterID, plotNPCID)
		h.finishFarmHarvest(ctx, characterID, plotNPCID, result, harvestErr)
		return map[string]interface{}{"success": true}, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	const ripenImmediatelyCost = 9
	if char.Gold < ripenImmediatelyCost {
		_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
		return map[string]interface{}{"success": true}, nil
	}

	char.Gold -= ripenImmediatelyCost
	if err := h.charService.Update(ctx.Context, char); err != nil {
		return nil, err
	}

	_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Mất %d vàng", ripenImmediatelyCost))
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": char.Gold})

	if _, _, err := h.farmService.RipenPlot(ctx.Context, characterID, plotNPCID); err != nil {
		if errors.Is(err, appfarm.ErrPlotNotFound) {
			_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
			return map[string]interface{}{"success": true}, nil
		}
		return nil, err
	}

	result, harvestErr := h.farmService.HarvestPlot(ctx.Context, characterID, characterID, plotNPCID)
	h.finishFarmHarvest(ctx, characterID, plotNPCID, result, harvestErr)
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) DoDoubleHarvest(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.farmService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	plotNPCID, ok := farmhandler.FindFirstIntArg(args)
	if !ok || plotNPCID == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	plotNPCID = farmhandler.NormalizePlotNPCID(h.farmService, plotNPCID)

	_, alreadyBoosted, err := h.farmService.DoubleHarvestPlot(ctx.Context, characterID, plotNPCID)
	if err != nil {
		msg := "Không thể sử dụng thuốc tăng trưởng."
		switch {
		case errors.Is(err, appfarm.ErrPlotNotFound):
			msg = "Bạn chưa trồng."
		case errors.Is(err, appfarm.ErrInvalidCropNPCID):
			msg = "Loại nông sản không hợp lệ."
		}
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, msg)
		return map[string]interface{}{"success": true}, nil
	}

	if alreadyBoosted {
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Nông sản đã được tăng sản lượng.")
		return map[string]interface{}{"success": true}, nil
	}

	_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Đã sử dụng thuốc tăng trưởng.")
	h.sendFarmDataUpdate(ctx, characterID)
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) Uproot(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if h.farmService == nil || h.charService == nil {
		return nil, pkgerrors.ErrSystemError
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	plotNPCID, ok := farmhandler.FindFirstIntArg(args)
	if !ok || plotNPCID == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}
	plotNPCID = farmhandler.NormalizePlotNPCID(h.farmService, plotNPCID)

	plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	if plot == nil {
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
		return map[string]interface{}{"success": true}, nil
	}

	char, err := h.charService.GetByID(ctx.Context, characterID)
	if err != nil || char == nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	const uprootCost = 1
	if char.Gold < uprootCost {
		_ = ctx.Connection.SendCallback("onSystemMsgCode", 20)
		return map[string]interface{}{"success": true}, nil
	}

	char.Gold -= uprootCost
	if err := h.charService.Update(ctx.Context, char); err != nil {
		return nil, err
	}

	destroyed, err := h.farmService.DestroyPlot(ctx.Context, characterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	if !destroyed {
		_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Bạn chưa trồng.")
		return map[string]interface{}{"success": true}, nil
	}

	_ = ctx.Connection.SendCallback("onSystemSay", fmt.Sprintf("Mất %d vàng", uprootCost))
	_ = ctx.Connection.SendCallback("onUPP", map[string]interface{}{"gold": char.Gold})
	_ = ctx.Connection.SendCallback("onNpcMsg", plotNPCID, "Đã tiêu diệt nông sản trên ô đất này.")
	h.sendFarmPlotReset(ctx, plotNPCID)
	h.sendFarmDataUpdate(ctx, characterID)
	return map[string]interface{}{"success": true}, nil
}

func (h *Handler) buildFarmRewardEffect(result *appfarm.HarvestResult) map[string]interface{} {
	itemTableType := 29
	itemKind := 0
	itemName := result.RewardName

	if h.gameData != nil {
		if item := h.gameData.GetItem(result.RewardTemplateID); item != nil {
			itemKind = int(item.Kind)
			if item.Name != "" {
				itemName = item.Name
			}
		}
	}

	return map[string]interface{}{
		"i":  result.RewardTemplateID,
		"q":  result.RewardCount,
		"s":  result.RewardCount,
		"c":  0,
		"t":  itemTableType,
		"n":  itemName,
		"tt": itemKind,
	}
}

func (h *Handler) sendFarmCropOn(ctx *rtmp.RPCContext, characterID int64, plotNPCID int, cropNPCID int) {
	payload, ok := h.buildFarmCropVisualPayload(ctx, characterID, plotNPCID, cropNPCID)
	if !ok {
		return
	}

	if err := h.sendFarmVisualToSelfAndScene(ctx, "onNpcOn", payload); err != nil {
		h.logger.Warn("Failed to send farm crop on callback",
			zap.Int64("character_id", characterID),
			zap.Int("plot_npc_id", plotNPCID),
			zap.Int("crop_npc_id", cropNPCID),
			zap.Error(err))
	}

	h.scheduleFarmGrowthReloads(ctx, characterID, plotNPCID, cropNPCID)
}

func (h *Handler) sendFarmPlotReset(ctx *rtmp.RPCContext, plotNPCID int) {
	_ = h.sendFarmVisualOffToSelfAndScene(ctx, plotNPCID)
}

func (h *Handler) buildFarmCropVisualPayload(ctx *rtmp.RPCContext, characterID int64, plotNPCID int, cropNPCID int) (map[string]interface{}, bool) {
	if h.sceneService == nil {
		return nil, false
	}

	mapID := h.farmPlotSceneMapID(ctx, plotNPCID)
	if mapID <= 0 && h.charService != nil {
		char, err := h.charService.GetByID(ctx.Context, characterID)
		if err != nil || char == nil {
			return nil, false
		}
		mapID = char.MapID
	}
	if mapID <= 0 {
		return nil, false
	}

	mapNPC, found, err := h.findMapNPCInstance(ctx, mapID, plotNPCID)
	if err != nil || !found {
		return nil, false
	}

	resCode := mapNPC.ResCode
	if h.gameData != nil {
		if cropNPC := h.gameData.GetNPC(cropNPCID); cropNPC != nil {
			resCode = int64(cropNPC.ResCode)
		}
	}

	x, y := farmhandler.VisualPositionForPlot(plotNPCID, mapNPC.X, mapNPC.Y)
	return map[string]interface{}{
		"id":      farmhandler.VisualNPCID(plotNPCID),
		"map":     strconv.Itoa(mapID),
		"name":    " ",
		"nid":     cropNPCID,
		"resCode": resCode,
		"x":       x,
		"y":       y,
	}, true
}

func (h *Handler) scheduleFarmGrowthReloads(ctx *rtmp.RPCContext, characterID int64, plotNPCID int, cropNPCID int) {
	if h.farmService == nil {
		return
	}

	plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
	if err != nil || plot == nil {
		return
	}

	readyDelay := time.Until(plot.ReadyAt)
	if readyDelay <= 0 {
		payload, ok := h.buildFarmCropVisualPayload(ctx, characterID, plotNPCID, cropNPCID)
		if !ok {
			return
		}
		if resCode, ok := payload["resCode"].(int64); ok {
			h.sendFarmGrowthReload(ctx, characterID, plotNPCID, cropNPCID, farmhandler.VisualResCode(plot, resCode, plot.ReadyAt))
		}
	}

	growingAt := farmhandler.GrowingStageAt(plot)
	growingDelay := time.Until(growingAt)
	if !growingAt.IsZero() && growingDelay <= 0 && readyDelay > 0 {
		payload, ok := h.buildFarmCropVisualPayload(ctx, characterID, plotNPCID, cropNPCID)
		if ok {
			resCode, _ := payload["resCode"].(int64)
			h.sendFarmGrowthReload(ctx, characterID, plotNPCID, cropNPCID, farmhandler.VisualResCode(plot, resCode, growingAt))
		}
	}
	if !growingAt.IsZero() && growingDelay > 0 {
		go func() {
			time.Sleep(growingDelay)
			payload, ok := h.buildFarmCropVisualPayload(ctx, characterID, plotNPCID, cropNPCID)
			if !ok {
				return
			}
			resCode, _ := payload["resCode"].(int64)
			h.sendFarmGrowthReload(ctx, characterID, plotNPCID, cropNPCID, farmhandler.VisualResCode(plot, resCode, growingAt))
		}()
	}

	if readyDelay > 0 {
		go func() {
			time.Sleep(readyDelay)
			payload, ok := h.buildFarmCropVisualPayload(ctx, characterID, plotNPCID, cropNPCID)
			if !ok {
				return
			}
			resCode, _ := payload["resCode"].(int64)
			h.sendFarmGrowthReload(ctx, characterID, plotNPCID, cropNPCID, farmhandler.VisualResCode(plot, resCode, plot.ReadyAt))
			h.sendFarmRipeNotice(characterID, plotNPCID, cropNPCID)
		}()
	}

	witherAt := h.farmService.GetPlotWitherAt(plot)
	if !witherAt.IsZero() {
		witherDelay := time.Until(witherAt)
		if witherDelay <= 0 {
			h.sendFarmWither(ctx, characterID, plotNPCID, cropNPCID)
			return
		}

		go func() {
			time.Sleep(witherDelay)
			h.sendFarmWither(ctx, characterID, plotNPCID, cropNPCID)
		}()
	}
}

func (h *Handler) sendFarmGrowthReload(ctx *rtmp.RPCContext, characterID int64, plotNPCID int, cropNPCID int, resCode int64) {
	if h.farmService == nil {
		return
	}

	plot, err := h.farmService.GetPlot(ctx.Context, characterID, plotNPCID)
	if err != nil || plot == nil || plot.CropNPCID != cropNPCID {
		return
	}

	payload, ok := h.buildFarmCropVisualPayload(ctx, characterID, plotNPCID, cropNPCID)
	if !ok {
		return
	}

	payload["name"] = " "
	payload["nid"] = farmhandler.VisualNPCID(plotNPCID)
	payload["resCode"] = resCode

	if err := h.sendFarmVisualToSelfAndScene(ctx, "onNpcReload", payload); err != nil {
		h.logger.Warn("Failed to send farm growth reload callback",
			zap.Int64("character_id", characterID),
			zap.Int("plot_npc_id", plotNPCID),
			zap.Int64("res_code", resCode),
			zap.Error(err))
	}
}

func (h *Handler) sendFarmWither(ctx *rtmp.RPCContext, characterID int64, plotNPCID int, cropNPCID int) {
	if h.farmService == nil {
		return
	}

	plot, err := h.farmService.GetPlotRaw(ctx.Context, characterID, plotNPCID)
	if err != nil || plot == nil || plot.CropNPCID != cropNPCID {
		return
	}
	if !h.farmService.IsPlotWithered(plot, time.Now()) {
		return
	}

	h.farmWitherSceneBroadcastFallback(ctx, plotNPCID, cropNPCID)

	destroyed, err := h.farmService.DestroyPlot(ctx.Context, characterID, plotNPCID)
	if err != nil {
		h.logger.Warn("Failed to delete withered farm plot",
			zap.Int64("character_id", characterID),
			zap.Int("plot_npc_id", plotNPCID),
			zap.Error(err))
		return
	}
	if destroyed {
		h.sendFarmDataUpdate(ctx, characterID)
	}
}

func (h *Handler) farmWitherSceneBroadcastFallback(ctx *rtmp.RPCContext, plotNPCID int, cropNPCID int) {
	if h.sceneManager == nil {
		return
	}

	mapID := 0
	if h.gameData != nil {
		if npc := h.gameData.GetNPC(plotNPCID); npc != nil {
			mapID = int(npc.PosMapID)
		}
	}
	if mapID <= 0 {
		return
	}

	channelID := 0
	if ctx != nil && ctx.Connection != nil {
		channelID = ctx.Connection.GetChannelID()
	}
	if channelID <= 0 {
		channelID = 1
	}

	visualNPCID := farmhandler.VisualNPCID(plotNPCID)
	h.sceneManager.BroadcastToScene(channelID, mapID, 0, "onNpcOff", visualNPCID)
}

func (h *Handler) sendFarmRipeNotice(characterID int64, plotNPCID int, cropNPCID int) {
	if h.rtmpServer == nil {
		return
	}

	conn := h.rtmpServer.GetConnectionByCharacterID(strconv.FormatInt(characterID, 10))
	if conn == nil {
		return
	}

	plotMapID := h.farmPlotSceneMapID(nil, plotNPCID)
	currentMapID, _ := conn.GetSceneInfo()
	if plotMapID > 0 && currentMapID == plotMapID {
		return
	}

	msg := farmRipeSystemMessage(conn.GetChannelID(), &domainfarm.Plot{PlotNPCID: plotNPCID, CropNPCID: cropNPCID}, h.gameData)
	if err := conn.SendCallback("onGetRipeMsg", msg); err != nil {
		h.logger.Warn("Failed to send farm ripe notice",
			zap.Int64("character_id", characterID),
			zap.Int("plot_npc_id", plotNPCID),
			zap.Int("crop_npc_id", cropNPCID),
			zap.Error(err))
	}
}

func (h *Handler) sendFarmDataUpdate(ctx *rtmp.RPCContext, characterID int64) {
	if h.farmService == nil {
		return
	}

	data, err := h.farmService.GetFarmData(ctx.Context, characterID)
	if err != nil {
		h.logger.Warn("Failed to get farm data update",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return
	}

	if err := ctx.Connection.SendCallback("onGetFarmData", data); err != nil {
		h.logger.Warn("Failed to send onGetFarmData callback",
			zap.Int64("character_id", characterID),
			zap.Error(err))
	}
}

func (h *Handler) sendFarmVisualToSelfAndScene(ctx *rtmp.RPCContext, method string, payload map[string]interface{}) error {
	if ctx == nil || ctx.Connection == nil {
		return nil
	}

	var sendErr error
	if err := ctx.Connection.SendCallback(method, payload); err != nil {
		sendErr = err
	}

	if h.sceneManager == nil {
		return sendErr
	}

	mapID := farmVisualMapIDFromPayload(payload)
	if mapID <= 0 {
		mapID, _ = ctx.Connection.GetSceneInfo()
	}
	if mapID <= 0 {
		return sendErr
	}

	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), mapID, ctx.ConnID, method, payload)
	return sendErr
}

func (h *Handler) sendFarmVisualOffToSelfAndScene(ctx *rtmp.RPCContext, plotNPCID int) error {
	if ctx == nil || ctx.Connection == nil {
		return nil
	}

	visualNPCID := farmhandler.VisualNPCID(plotNPCID)
	var sendErr error
	if err := ctx.Connection.SendCallback("onNpcOff", visualNPCID); err != nil {
		sendErr = err
	}

	if h.sceneManager == nil {
		return sendErr
	}

	mapID := h.farmPlotSceneMapID(ctx, plotNPCID)
	if mapID <= 0 {
		return sendErr
	}

	h.sceneManager.BroadcastToScene(ctx.Connection.GetChannelID(), mapID, ctx.ConnID, "onNpcOff", visualNPCID)
	return sendErr
}

func (h *Handler) farmPlotSceneMapID(ctx *rtmp.RPCContext, plotNPCID int) int {
	if h.gameData != nil {
		if npc := h.gameData.GetNPC(plotNPCID); npc != nil {
			if mapID := int(npc.PosMapID); mapID > 0 {
				return mapID
			}
		}
	}
	if ctx == nil || ctx.Connection == nil {
		return 0
	}
	mapID, _ := ctx.Connection.GetSceneInfo()
	return mapID
}

func farmVisualMapIDFromPayload(payload map[string]interface{}) int {
	if payload == nil {
		return 0
	}

	if mapID, ok := payload["map"].(string); ok {
		if parsedMapID, err := strconv.Atoi(mapID); err == nil {
			return parsedMapID
		}
	}

	switch v := payload["map"].(type) {
	case int:
		return v
	case int32:
		return int(v)
	case int64:
		return int(v)
	case float64:
		return int(v)
	}

	return 0
}
