// Open-sourced by BaoLT

// Combat NPC script handlers.
package npc

import (
	"fmt"
	"strconv"
	"strings"
	"time"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) NpcScript(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var funcID string
	switch v := args[0].(type) {
	case string:
		funcID = v
	case float64:
		funcID = fmt.Sprintf("%v", v)
	case int:
		funcID = fmt.Sprintf("%d", v)
	default:
		return nil, pkgerrors.ErrInvalidArgs
	}

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	h.logger.Info("NPC script action triggered",
		zap.Int64("character_id", characterID),
		zap.String("func_id", funcID))

	if npcID, ok := npcInteractionIDFromScript(funcID); ok {
		interaction := h.buildNPCInteractionData(ctx.Context, characterID, npcID)
		if err := ctx.Connection.SendCallbackSync("npcFuncInit", interaction.payload); err != nil {
			h.logger.Error("Failed to send npcFuncInit callback from npcScript", zap.Error(err), zap.Int("npc_id", npcID))
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "buy_fairy_") {
		if tid, err := strconv.Atoi(funcID[len("buy_fairy_"):]); err == nil {
			h.buyFairy(ctx, tid)
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "transport_") {
		parts := strings.Split(funcID, "_")
		if len(parts) == 5 {
			mapID, _ := strconv.Atoi(parts[1])
			cost, _ := strconv.Atoi(parts[2])

			char, err := h.charService.GetByID(ctx.Context, characterID)
			if err != nil {
				h.logger.Error("Failed to get character", zap.Error(err))
				return nil, err
			}

			if int(char.MoneyBind) < cost {
				h.logger.Info("Not enough money", zap.Int64("charID", characterID))
				return nil, nil
			}

			char.MoneyBind -= int64(cost)

			ctx.Connection.SendCallback("onUPP", map[string]interface{}{
				"moneyBind": char.MoneyBind,
			})
			ctx.Connection.SendCallback("onBlueMsg", fmt.Sprintf("Mất %d Ngân phiếu.", cost))

			if err := h.teleportToMap(ctx, characterID, mapID); err != nil {
				return nil, err
			}

			return nil, nil
		}
	}

	if strings.HasPrefix(funcID, "hlvt_next_floor_") {
		idStr := funcID[len("hlvt_next_floor_"):]
		id, _ := strconv.Atoi(idStr)
		targetMap := 0
		if id >= 2293 && id <= 2299 {
			targetMap = 80 + (id - 2293)
		} else if id == 2300 {
			targetMap = 79
		}

		if targetMap > 0 {
			if err := h.teleportToMap(ctx, characterID, targetMap); err != nil {
				return nil, err
			}
		} else {
			ctx.Connection.SendCallback("onNpcMsg", id, "Tầng này chưa mở hoặc không có đường đi tiếp.")
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hlvt_explore_more_") {
		idStr := funcID[len("hlvt_explore_more_"):]
		id, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", id, "Tính năng đang phát triển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hlvt_boss_current_") {
		idStr := funcID[len("hlvt_boss_current_"):]
		id, _ := strconv.Atoi(idStr)
		floor := id - 2300
		ctx.Connection.SendCallback("a", fmt.Sprintf("Tầng Boss nhóm khiêu chiến: Tầng %d", floor))
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hlvt_kick_out_") {
		idStr := funcID[len("hlvt_kick_out_"):]
		id, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", id, "Tính năng đang phát triển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hlvt_continue_") {
		idStr := funcID[len("hlvt_continue_"):]
		id, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", id, "Tính năng đang phát triển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "farm_map_1_") {
		if err := h.teleportToMap(ctx, characterID, 57); err != nil {
			return nil, err
		}
		return nil, nil
	}
	if strings.HasPrefix(funcID, "farm_map_2_") {
		if err := h.teleportToMap(ctx, characterID, 58); err != nil {
			return nil, err
		}
		return nil, nil
	}
	if strings.HasPrefix(funcID, "farm_quests_") {
		idStr := funcID[len("farm_quests_"):]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Hiện chưa có nhiệm vụ nông trường mới.")
		return nil, nil
	}
	if handled, err := h.handleFarmScriptAction(ctx, characterID, funcID); handled || err != nil {
		return nil, err
	}

	if strings.HasPrefix(funcID, "plant_short_term_") || strings.HasPrefix(funcID, "plant_long_term_") {
		idStr := funcID[strings.LastIndex(funcID, "_")+1:]
		npcID, _ := strconv.Atoi(idStr)
		cropIDs := []int{1229, 1230, 1231, 1232, 1233, 1234, 1235, 1236, 1239, 1240, 1525, 1526, 1527, 1528, 1529}
		cropOptions := make([]map[string]interface{}, 0, len(cropIDs))
		for _, id := range cropIDs {
			label := fmt.Sprintf("Nông sản %d", id)
			if h.gameData != nil {
				if npc := h.gameData.GetNPC(id); npc != nil {
					label = fmt.Sprintf("%s (Lv %d)", npc.Name, int(npc.Lv))
				}
			}
			cropOptions = append(cropOptions, map[string]interface{}{
				"label": label,
				"func":  fmt.Sprintf("plant_crop_%d_%d", id, npcID),
			})
		}
		ctx.Connection.SendCallback("onList", npcID, "Trồng trọt", "Hãy chọn loại nông sản bạn muốn trồng:", cropOptions)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "plant_special_") {
		idStr := funcID[len("plant_special_"):]
		npcID, _ := strconv.Atoi(idStr)
		options := []map[string]interface{}{
			{"label": "Trồng cây kim tiền ( cần hạt giống )", "func": fmt.Sprintf("plant_money_tree_%d", npcID)},
		}
		ctx.Connection.SendCallback("onList", npcID, "Nông sản đặc biệt", "Chọn loại nông sản đặc biệt:", options)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "farm_operation_") {
		idStr := funcID[len("farm_operation_"):]
		npcID, _ := strconv.Atoi(idStr)
		options := []map[string]interface{}{
			{"label": "Sử dụng thuốc tăng trưởng", "func": fmt.Sprintf("farm_use_booster_%d", npcID)},
			{"label": "Lập tức thu hoạch", "func": fmt.Sprintf("farm_harvest_now_%d", npcID)},
			{"label": "Tiêu diệt", "func": fmt.Sprintf("farm_destroy_%d", npcID)},
		}
		ctx.Connection.SendCallback("onList", npcID, "Thao tác nông trường", "Bạn muốn thao tác gì?", options)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "farm_harvest_now_") {
		idStr := funcID[len("farm_harvest_now_"):]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Bạn chưa trồng")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "farm_destroy_") {
		idStr := funcID[len("farm_destroy_"):]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Bạn không phải là chủ nhân của khu đất này, không sở hữu nông sản ở đây nên không thế thao tác")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "farm_use_booster_") || strings.HasPrefix(funcID, "plant_money_tree_") {
		idStr := funcID[strings.LastIndex(funcID, "_")+1:]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Tính năng đang phát triển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "view_planting_guide_") {
		guide := `1. Muốn trồng nông sản trước tiên cần học kỹ năng trồng trọt, sau khi đạt cấp 50 có thể đến Điêu Linh Thôn gặp Đại Sư Kỹ Năng Sống để học.
2. Khi trồng cần có đất trồng, có thể đến Nông Trường Pháp Thuật chọn 1 mảnh đất trống để trồng. Nông sản gồm có ngắn ngày và dài ngày, cấp thấp và cấp cao. Nông sản có cấp độ trồng trọt càng cao thì càng cần kỹ năng cao.
3. Sau khi nông sản chín, người trồng cần thu hoạch ngay, nếu không sẽ bị người khác vào thu hoạch hộ (nông sản ngắn ngày có thể sẽ bị trộm hết, nông sản dài ngày sẽ được giữ lại 1 phần). Nếu sau 20 phút kể từ lúc chín mà không được thu hoạch thì nông sản sẽ héo, cần phải trồng lại.`
		ctx.Connection.SendCallback("a", guide)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "chu_ma_dien_enter_") {
		idStr := funcID[len("chu_ma_dien_enter_"):]
		npcID, _ := strconv.Atoi(idStr)

		now := time.Now()
		hour := now.Hour()
		minute := now.Minute()

		if hour == 13 && minute >= 0 && minute <= 5 {
			if err := h.teleportToMap(ctx, characterID, 2005); err != nil {
				return nil, err
			}
		} else {
			ctx.Connection.SendCallback("onNpcMsg", npcID, "13:00-13:05 mỗi ngày đến kênh 7 để vào Chu Ma Điện!")
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "chu_ma_dien_guide_") {
		guide := `1.13:00-13:05 mỗi ngày, ta có thể giúp các cư dân cấp độ 120 trở lên vào Chu Ma Điện, nhưng chỉ nhận 5 nhóm ít nhất 3 người (đề nghị 5 người)!
2.Khi vào Chu Ma Điện phải nhớ luôn trong tư thế sẵn sàng chiến đấu! Sau 2 phút các yêu ma Chu Ma sẽ xuất hiện.
3.Nếu đã vào Chu Ma Điện lại thoát ra thì không thể vào lại trong ngày hôm đó`
		ctx.Connection.SendCallback("a", guide)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "quy_hut_mau_1_") || strings.HasPrefix(funcID, "quy_hut_mau_2_") || strings.HasPrefix(funcID, "quy_hut_mau_3_") {
		idStr := funcID[strings.LastIndex(funcID, "_")+1:]
		npcID, _ := strconv.Atoi(idStr)

		if h.groupService != nil {
			isLeader, err := h.groupService.IsGroupLeader(ctx.Context, characterID)
			if err != nil || !isLeader {
				ctx.Connection.SendCallback("onNpcMsg", npcID, "Bạn không phải là nhóm trưởng")
				return nil, nil
			}
		}

		if err := h.teleportToMap(ctx, characterID, 69); err != nil {
			return nil, err
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "quy_hut_mau_auto_") {
		idStr := funcID[strings.LastIndex(funcID, "_")+1:]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Tính năng đang phát triển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "quy_hut_mau_guide_") {
		guide := `1. Mỗi người cần mang theo vật phẩm vào phụ bản thì mới có thể tạo phụ bản
2. Người tạo phụ bản sẽ mặc định trở thành trưởng nhóm phụ bản, tất cả các nhiệm vụ trong phụ bản chỉ có trưởng nhóm mới có thể nhận và trả, các thành viên còn lại cần làm theo các nhắc nhở mà hệ thống đưa ra 
3. Trong bản đồ phụ bản, có thể rời nhóm và tạo lại nhóm bất kỳ lúc nào, tuy nhiên không thể đổi trưởng nhóm 
4. Nếu đổi kênh sẽ bị đẩy ra khỏi phụ bản 
5. Nếu bị rớt mạng trong phụ bản, khi đăng nhập cần chọn lại kênh lúc nãy, nếu chọn kênh khác sẽ bị đẩy ra khỏi phụ bản 
6. Nếu nhóm trưởng rời khỏi phụ bản thì các nhiệm vụ sẽ không thể làm tiếp`
		ctx.Connection.SendCallback("a", guide)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_challenge_start_") {
		idStr := funcID[len("hmt_challenge_start_"):]
		npcID, _ := strconv.Atoi(idStr)
		options := []map[string]interface{}{
			{"label": "Ok", "func": fmt.Sprintf("hmt_tele_515_%d", npcID)},
			{"label": "Hủy", "func": fmt.Sprintf("hmt_cancel_%d", npcID)},
		}
		ctx.Connection.SendCallback("onList", npcID, "Khiêu chiến Ảo Ma Tháp", "Bạn có muốn vào Ảo Ma Tháp không?", options)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_tele_515_") {
		if err := h.teleportToMap(ctx, characterID, 515); err != nil {
			return nil, err
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_reset_confirm_") {
		ctx.Connection.SendCallback("resetHMTAlert", 999)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_guide_") {
		guide := `1.Có thể khiêu chiến Ảo Ma Tháp không giới hạn. Số tầng càng cao (giới hạn 400 tầng) thì phần thưởng tu luyện càng nhiều. Khi hoàn thành tầng nào thì vĩnh viễn sẽ được ghi nhận tu luyện ở tầng đó, không cần khiêu chiến lại；
2.Tu luyện chắc chắn sẽ nhận được exp và có cơ hội nhận Tinh Hoa Hắc Diệu Thạch, Ấn Chương Ảo Ma. Nhân vật có thú cưỡi tiến hóa đến cấp 8 còn được nhận Dược Thủy Tiến Hóa Cao Cấp；
3.Sau khi tu luyện 10 phút sẽ có được 1 phần thưởng, tu luyện quá lâu sẽ không nhận được phần thưởng mà phải thoát ra vào lại；
4.Phòng tu luyện cao cấp chỉ chứa được 5 người, mỗi ngày mỗi người tu luyện 1 lần, mỗi lần tiêu hao 1 lượng chiến tích, tối đa tu luyện 6 tiếng 1 lần, nhưng sau 120 phút tu luyện sẽ bị người khác vào cướp phòng；
5.Phòng tu luyện công cộng không giới hạn số người vào, số lần tu luyện, tối đa tu luyện 9 tiếng 1 lần, phần thưởng tương đối thấp hơn phòng tu luyện cao cấp；
6.Từ 3h - 8h mỗi ngày là thời gian quét dọn phòng tu luyện, người chơi không thể vào；
7.Ở phòng tu luyện cần có đội pet thi đấu để giúp chủ nhân canh chừng.
8.Mỗi tuần có 1 lượt dùng 999 vàng để tái thiết lập tiến độ khiêu chiến từ tầng 1 (cần rời Phòng Tu Luyện và nhận thưởng trước). 0 giờ thứ 2 hàng tuần bắt đầu tuần mới)`
		ctx.Connection.SendCallback("a", guide)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_cancel_") {
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_guardian_fight_") {
		idStr := funcID[len("hmt_guardian_fight_"):]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Tính năng đang phát triển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_trans_252_") {
		idStr := funcID[len("hmt_trans_252_"):]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onNpcMsg", npcID, "Khiêu chiến cần có trình tự, bạn chưa khiêu chiến ở tầng 252, không thể chuyển")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_tower_info_") {
		ctx.Connection.SendCallback("a", "Số tầng đã khiêu chiến: 0")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "hmt_exit_") || strings.HasPrefix(funcID, "hmt_tele_generic_") {
		if err := h.teleportToMap(ctx, characterID, 38); err != nil {
			return nil, err
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "park_enter_") {
		if err := h.teleportToMap(ctx, characterID, 515); err != nil {
			return nil, err
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "park_status_") {
		ctx.Connection.SendCallback("a", "Tiến độ lễ hội công viên trên không : Ải thứ 1")
		return nil, nil
	}

	if strings.HasPrefix(funcID, "park_rules_") {
		rules := `1. Tổ đội tham gia Công Viên Trên Không, hoàn thành mỗi màn chơi đều nhận thưởng tương ứng
2. Công Viên Trên Không có thể vào/ra bất kỳ lúc nào; màn chưa vượt qua có thể tiếp tục lần sau, cũng có thể chơi cùng đội khác, nhưng mỗi màn chỉ được nhận thưởng một lần
3. Nếu tiến độ trong đội không giống nhau, sẽ lấy tiến độ cao nhất để tiếp tục. Những màn chưa hoàn thành trước đó sẽ không thể quay lại nhận thưởng, hãy cố gắng tổ đội với người có tiến độ tương đương
4. Bí kíp vượt ải có thể giảm độ khó một số màn; trong thời gian mở Công Viên Trên Không, hoàn thành 10 vòng nhiệm vụ học viện, nhiệm vụ trị an hoặc nhiệm vụ 200 vòng đều có xác suất rơi bí kíp
5. Tiến độ Công Viên Trên Không sẽ được đặt lại sau bảo trì thứ Năm hằng tuần`
		ctx.Connection.SendCallback("a", rules)
		return nil, nil
	}

	if strings.HasPrefix(funcID, "park_shop_") {
		if err := ctx.Connection.SendCallbackSync("openShopById", 7); err != nil {
			h.logger.Error("Failed to send openShopById callback", zap.Error(err))
		}
		return nil, nil
	}

	if strings.HasPrefix(funcID, "army_get_title_") {
		idStr := funcID[len("army_get_title_"):]
		npcID, _ := strconv.Atoi(idStr)
		ctx.Connection.SendCallback("onSystemSay", npcID, " Đã nhận danh hiệu Quân Đoàn, sau khi hết hạn mới có thể nhận tiếp!")
		return nil, nil
	}

	switch funcID {
	case "trade_func":
		h.logger.Info("Opening shop for player", zap.Int64("character_id", characterID))
		if err := ctx.Connection.SendCallbackSync("openShopById", 1); err != nil {
			h.logger.Error("Failed to send openShopById callback", zap.Error(err))
		}
	case "quest_func":
		h.logger.Info("Opening quest list for player", zap.Int64("character_id", characterID))
		questData := map[string]interface{}{
			"qid": 1,
			"st":  1,
			"data": map[string]interface{}{
				"id":   1,
				"name": "Thử nghiệm nhiệm vụ",
				"type": 1,
			},
		}

		if err := ctx.Connection.SendCallbackSync("onAddChaQuest", questData); err != nil {
			h.logger.Error("Failed to send onAddChaQuest callback", zap.Error(err))
		}
	case "gwc_register":
		hasGuild, err := h.hasGuildMembership(ctx.Context, characterID)
		if err != nil {
			return nil, err
		}
		if !hasGuild {
			ctx.Connection.SendCallback("onNpcMsg", 211, "Bạn chưa gia nhập bang hội.")
			return nil, nil
		}
	case "gwc_enter_map":
		hasGuild, err := h.hasGuildMembership(ctx.Context, characterID)
		if err != nil {
			return nil, err
		}
		if !hasGuild {
			ctx.Connection.SendCallback("onNpcMsg", 211, "Bạn chưa  gia nhập bang hội.")
			return nil, nil
		}
		if err := h.teleportToPosition(ctx, characterID, 54, 2600, 760); err != nil {
			return nil, err
		}
		return nil, nil
	case "gwc_view_team":
		ctx.Connection.SendCallback("a", "Danh sách các đội")
	case "gwc_view_rules":
		ctx.Connection.SendCallback("a", "Thông tin mô tả")
	case "gwc_reward_personal_loss":
		ctx.Connection.SendCallback("onSystemSay", "Nội trong 3 ngày khi Bang Hội Chiến kết thúc có thể nhận thưởng cá nhân!")
	case "gwc_reward_ranking_month":
		ctx.Connection.SendCallback("onNpcMsg", 211, "Tính năng chiến trường đang phát triển")
	case "startConstruction":
		return guildBuildCallbackID(ctx.Connection, guildBuildConstructID), nil
	case "buildInfo":
		if err := ctx.Connection.SendCallback("onShowBuildInfo", guildBuildCallbackID(ctx.Connection, guildBuildInfoFallbackID)); err != nil {
			return nil, err
		}
		return nil, nil
	case "showGuildWarehouse":
		if err := ctx.Connection.SendCallback("onShowGuildWarehouse", guildBuildWarehouseFallback); err != nil {
			return nil, err
		}
		return nil, nil
	case "showDonatePanel":
		if err := ctx.Connection.SendCallback("onShowDonatePanel", guildBuildWarehouseFallback); err != nil {
			return nil, err
		}
		return nil, nil
	case "receive_x2_spirit", "receive_double_exp", "exchange_war_god_token", "receive_ma_huyet", "view_activity_points":
		ctx.Connection.SendCallback("onNpcMsg", 186, "Tính năng đang phát triển")
	case "enter_secret_realm", "receive_ranking_reward", "receive_speed_ranking_reward", "secret_realm_guide":
		ctx.Connection.SendCallback("onNpcMsg", 2351, "Tính năng đang phát triển")
	case "enter_waiting_room_1", "enter_waiting_room_2", "enter_waiting_room_3", "receive_room_ranking_reward", "waiting_room_guide":
		ctx.Connection.SendCallback("onNpcMsg", 2071, "Tính năng đang phát triển")
	case "register_activity", "view_rules":
		ctx.Connection.SendCallback("onNpcMsg", 47, "Tính năng đang phát triển")
	case "open_shop_45":
		if err := ctx.Connection.SendCallbackSync("onOpenShop", 45); err != nil {
			h.logger.Error("Failed to send onOpenShop callback", zap.Error(err))
		}
	case "exchange_pet_equip":
		if err := ctx.Connection.SendCallbackSync("openShopById", 1); err != nil {
			h.logger.Error("Failed to send openShopById callback", zap.Error(err))
		}
	case "related_quests_280":
		ctx.Connection.SendCallback("onNpcMsg", 280, "Hiện chưa có nhiệm vụ nào.")
	case "clan_training_ask":
		ctx.Connection.SendCallback("onNpcMsg", 1153, "Bạn chưa khiêu chiến nhiệm vụ tu hành của gia tộc này, hãy đến gặp Trưởng Lão Vô")
	case "view_battle":
		ctx.Connection.SendCallback("onNpcMsg", 1153, "Tính năng đang phát triển")
	case "close_dialog":
	case "adopt_free_fairy":
		h.adoptFreeFairy(ctx)
	case "buy_other_fairy":
		h.listBuyableFairies(ctx)
	case "fairy_info":
		npcID := 1637
		npcName := "Tiểu Tinh Linh"
		content := "Tìm hiểu các thông tin về Tiểu Tinh Linh:"
		options := []map[string]interface{}{
			{"label": "Nhận Tiểu Tinh Linh", "func": "adopt_free_fairy"},
			{"label": "Thăng cấp Tiểu Tinh Linh", "func": "fairy_level_up"},
			{"label": "Nuôi dưỡng Tiểu Tinh Linh", "func": "fairy_feed"},
			{"label": "Cường hóa Tiểu Tinh Linh", "func": "fairy_enhance"},
			{"label": "Cách thủ hộ chủ nhân", "func": "fairy_guard_guide"},
		}
		ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options)
	case "fairy_level_up":
		msg := `【Thăng Cấp Tinh Linh】
Cấp độ ban đầu của Tiểu Tinh Linh là 1 và có thể tăng đến cấp 20. Thông qua [Quả Tinh Linh] để có thể tăng kinh nghiệm cho các tinh linh, khi điểm kinh nghiệm đạt đến độ nhất định, tinh linh sẽ được thăng cấp. {Quả Tinh Linh} này có thể dùng điểm đấu pet để đổi ở Shop Điểm Thưởng Giác Đấu Đông Huyền.`
		ctx.Connection.SendCallback("a", msg)
	case "fairy_feed":
		msg := `【Nuôi Dưỡng Tinh Linh】
Khi các tinh linh trong trạng thái thủ hộ, tùy thuộc vào số lần chiến đấu mà giảm Độ no. Thông qua việc Cho Ăn các nguyên liệu chế tạo để tăng Độ no này. Độ no càng cao thì lực thủ hộ của tinh linh sẽ càng mạnh và trợ thủ thuộc tính cho nhân vật càng nhiều.`
		ctx.Connection.SendCallback("a", msg)
	case "fairy_enhance":
		msg := `【Cường Hóa Tinh Linh】
Thông qua các cách nuôi dưỡng Tinh Linh mà tăng thuộc tính trưởng thành cho nó. Mỗi lần nuôi dưỡng tinh linh sẽ tăng được điểm trưởng thành. Khi điểm trưởng thành đầy thì tăng được cấp độ trưởng thành cho tinh linh cũng như có hệ số thuộc tính của tinh linh. Cấp độ trưởng thành được chia thành 5 giai đoạn (trắng -> lục -> lam -> tím -> cam). Mỗi giai đoạn chia từ cấp 1 - 10. Cứ tăng lên được 1 giai đoạn thì Lực thủ hộ cũng tăng theo.`
		ctx.Connection.SendCallback("a", msg)
	case "fairy_guard_guide":
		msg := `【Cách Thủ Hộ Chủ Nhân】
Sau khi tinh linh ở trạng thái {Thủ hộ} thì có thể tăng 5 thuộc tính của bản thân (nhẫn, lực, xảo, thần, trí). Thuộc tính của tinh linh và Lực Thủ Hộ càng cao thì thuộc tính cộng thêm cho nhân vật chủ nhân sẽ càng nhiều.`
		ctx.Connection.SendCallback("a", msg)
	case "auto_cultivation":
		ctx.Connection.SendCallback("onNpcMsg", 434, "Tính năng đang phát triển")
	case "potential_drug_use", "potential_drug_info", "potential_drug_count":
		ctx.Connection.SendCallback("onNpcMsg", 1666, "Tính năng đang phát triển")
	case "fishing_enter":
		ctx.Connection.SendCallback("onNpcMsg", 1572, "Cuộc thi câu cá diễn ra từ 14h đến 15h Chủ nhật hàng tuần tại kênh 1, mọi người")
	case "fishing_rules":
		ctx.Connection.SendCallback("onNpcMsg", 1572, "Tính năng đang phát triển")
	case "fishing_ranking":
		ctx.Connection.SendCallback("onNpcMsg", 1572, "Bảng xếp hạng hiện tại đang trống")
	case "fishing_reward":
		ctx.Connection.SendCallback("onNpcMsg", 1572, "Ngươi không nằm trong top 3 thi câu cá, hãy cố gắng thêm nhé !")
	case "battlefield_get_title":
		ctx.Connection.SendCallback("onNpcMsg", 1860, "Tính năng đang phát triển")
	case "battlefield_view_rewards":
		ctx.Connection.SendCallback("a", "Bạn có tổng cộng x huy chương dũng sĩ")
	case "battlefield_extra_reward":
		ctx.Connection.SendCallback("onSystemSay", 1860, "Nhận quà bổ sung ở kênh 1")
	case "battlefield_guide":
		guide := `1. 20:40-21:00 thứ sáu, hệ thống sẽ thông báo sự kiện để cư dân chuẩn bị, 21:00-22:00 người chơi vào chiến trường 3v3 bằng cách chọn icon Chiến Trường Dũng Sĩ ở phía trên màn hình (trong thời gian sự kiện có thể vào bất cứ lúc nào)
2. Sau khi vào chiến trường phải làm 1 phòng 3 người, người lập phòng là Phòng Trưởng, sau khi tất cả thành viên còn lại chuẩn bị sẵn sàng, Phòng Trưởng nhấp chọn "Bắt đầu" để hệ thống sắp xếp chiến đấu với các phòng khác.
3. Khi sự kiện bắt đầu, dựa vào đấu sĩ các phòng mà sắp xếp thi đấu. Sau mỗi trận đấu sẽ hồi phục toàn bộ HP-MP và không bị trừng phạt. Phòng liên tiếp thua 5 lần sẽ nhận Buff Cổ Vũ Sĩ Khí (tăng 20% tấn công), tối đa tích lũy đến 100%, sau khi chiến thắng, Buff này sẽ biến mất.
4. Sau khi kết thúc mỗi trận đấu, dựa vào kết quả thắng thua mà mỗi người chơi có lượng điểm nhất định, cuối cùng dựa vào các điểm này để xếp hạng và phát tặng 'Huy Chương Dũng Sĩ' tương ứng (người chơi có điểm >0 đều được xếp hạng).
5. 'Huy Chương Dũng Sĩ' dùng để đổi lấy vật phẩm tẩy luyện thần khí phụ ở Shop Điểm Thưởng Giác Đấu Đông Huyền Thành (290,160). Khi sở hữu  1 lượng "Huy Chương Dũng Sĩ" nhất định còn thể đến Bàng Bối Thành gặp Bàng Bối Tế Tự để đổi Danh hiệu đặc biệt! Lượng Huy Chương Dũng Sĩ sẽ không mất! Danh hiệu chỉ có thời hạn 1 tháng.
6. Nếu sau khi sự kiện kết thúc, không nhận được thưởng có thể đến kênh 1 Bàng Bối Thành (210,90) gặp Bàng Bối Tế Tự để nhận bổ sung! Thời gian lưu trữ quà chỉ đến sáng thứ năm bảo trì định kỳ!`
		ctx.Connection.SendCallback("a", guide)
	case "dye_self":
		ctx.Connection.SendCallback("showColorPanel", 2)
	case "dye_wings_orange":
		ctx.Connection.SendCallback("onNpcMsg", 1502, "Chỉ có canh Thiên Sứ cam, cánh Bích Không cam, cánh Ác Ma cam mới có thể nhuộm")
	case "dye_wings_war_god":
		ctx.Connection.SendCallback("onNpcMsg", 1502, "Để nhuộm Cánh Chiến Thần cần tiêu phí 1 Chứng Nhận Chiến Thần!")
	case "change_wing_peacock":
		ctx.Connection.SendCallback("onNpcMsg", 1502, "Vật phẩm không đủ.")
	case "dye_wings_timed", "change_char_shape":
		ctx.Connection.SendCallback("onNpcMsg", 1502, "Tính năng đang phát triển")
	case "dye_how_to":
		howTo := `1.Nhuộm màu cần trả một lượng bạc và một số vật phẩm cần thiết. Nhuộm nhân vật cần 3 Thất Sắc Hoa, nhuộm pet cần 3 Cỏ Cầu Vồng.
2.Thất Sắc Hoa và Cỏ Cầu Vồng có thể mua ở shop hoặc có được khi làm nhiệm vụ sự kiện hoặc nông trường.
3.Nhuộm cánh cần 10 Lông Vũ Ngũ Sắc, có thể ngẫu nhiên chọn 1 trong 2 màu trong quá trình nhuộm. Hãy chọn cánh mà bạn muốn Nhuộm!
4.Khi nhuộm cánh còn có cơ hội nhận được hình dáng cánh đặc biệt!
5.Hình ảnh cánh giới hạn thời gian sẽ bị ghi đè bằng hình ảnh cánh giới hạn thời gian sau.`
		ctx.Connection.SendCallback("a", howTo)
	case "enter_zodiac_palace":
		ctx.Connection.SendCallback("onNpcMsg", 1700, "Tính năng đang phát triển")
	case "zodiac_info":
		info := `1.Người chơi cấp 80 trở lên mới có thể vào Tinh Cung khiêu chiến với Thủ Hộ Tinh Cung.
2.Khiêu chiến Thập Nhị Tinh Cung sẽ nhận được Tinh Toái cho Cung tương ứng，Tinh Toái dùng để tăng tốc độ tu luyện thuộc tính Tinh Cung. Khi bắt đầu tu luyện, người chơi mới có thể khiêu chiến với Cung tương ứng, cá nhân hoặc nhóm khiêu chiến đều được.
3.Cấp cao nhất của các cung là 12, khiêu chiến dần từ Cung cấp thấp đến cao, cấp độ Tinh Cung càng cao thì Tinh Toái nhận được càng nhiều.
4.Đánh giá khiêu chiến sẽ dựa vào thời gian khiêu chiến và số lần nhân vật tử vong`
		ctx.Connection.SendCallback("a", info)
	case "zodiac_title_guide":
		guide := `1.Sau mỗi lần khiêu chiến thành công sẽ nhận được điểm tinh cung, cấp độ tinh cung khiêu chiến càng cao thì điểm nhận được càng nhiều.
2.Danh hiệu tinh cung đổi được có hiệu lực trong 1 tháng, người chơi đã nhận được danh hiệu có thể kéo dài thời gian (1 tháng).
3.Muốn đổi và kéo dài thời hạn phải mất 450 điểm tinh cung.`
		ctx.Connection.SendCallback("a", guide)
	case "boss_extra_reward":
		ctx.Connection.SendCallback("onSystemSay", " Nhận phần thưởng ở kênh3 ")
	case "boss_world_info":
		info := `1.Tham gia sự kiện BOSS Thế Giới vào lúc 14:30 - 15:00 thứ ba, thứ năm, thứ bảy.
2.Cá nhân cấp độ 50 trở lên mới được tham gia sự kiện này.
3.Trong quá trình tham gia sự kiện nếu tử vong sẽ không phải chịu trừng phạt và tự động hồi phục toàn bộ HP - MP.
4.Mỗi lần hoàn thành 1 trận đấu sẽ nhận được điểm kinh nghiệm và chiến tích. Hệ thống sẽ dựa vào độ sát thương tạo ra của người chơi mà xếp hạng mỗi gia tộc. Sát thương BOSS càng cao thì phần thưởng càng nhiều. Người chơi đạt hạng 1, 2, 3 sẽ nhận được phần thưởng lớn.
5.Nếu trong quá trình phát thưởng, người chơi không online có thể đến kênh 3 tìm ta nhận thưởng bổ sung!`
		ctx.Connection.SendCallback("a", info)
	case "view_quest_937":
		ctx.Connection.SendCallback("onNpcMsg", 937, "Nghe nói làm cận vệ ở Quyến Cố Thành được trả lương rất khá.")
	case "exchange_250", "exchange_25":
		ctx.Connection.SendCallback("onNpcMsg", 937, "Tính năng đang phát triển")
	case "view_spirit_points":
		ctx.Connection.SendCallback("a", "Điểm thần tu 100")
	case "quest_spirit_929", "auto_spirit_929":
		ctx.Connection.SendCallback("onNpcMsg", 929, "Tính năng đang phát triển")
	case "hlvt_start":
		if err := h.teleportToMap(ctx, characterID, 79); err != nil {
			return nil, err
		}
	case "hlvt_prev_progress":
		ctx.Connection.SendCallback("onSystemSay", "Tầng mới chưa mở, vui lòng quay lại sau")
	case "hlvt_max_possible":
		ctx.Connection.SendCallback("a", "Tiến độ nhóm khiêu chiến: Tầng 12")
	case "hlvt_max_cleared":
		ctx.Connection.SendCallback("a", "Tiến độ khiêu chiến : Tầng 11")
	case "hlvt_daily_reward":
		ctx.Connection.SendCallback("onNpcMsg", 2309, "Hôm nay bạn đã nhận thưởng")
	case "hlvt_goto_dong_huyen":
		if err := h.teleportToMap(ctx, characterID, 9); err != nil {
			return nil, err
		}
	case "hlvt_goto_quyen_co":
		if err := h.teleportToMap(ctx, characterID, 30); err != nil {
			return nil, err
		}
	case "hlvt_one_floor_left":
		ctx.Connection.SendCallback("onSystemSay", "Vẫn còn 1 tầng nữa đấy")
	case "hlvt_kick_out":
		ctx.Connection.SendCallback("onNpcMsg", 2301, "Tính năng đang phát triển")
	case "hlvt_boss_current_info":
		ctx.Connection.SendCallback("a", "Tầng Boss nhóm khiêu chiến: Tầng 1")
	case "hlvt_continue":
		ctx.Connection.SendCallback("onNpcMsg", 2301, "Tính năng đang phát triển")
	case "hlvt_explore_more":
		ctx.Connection.SendCallback("onNpcMsg", 2293, "Tính năng đang phát triển")
	default:
		h.logger.Warn("Unknown NPC script function", zap.String("func_id", funcID))
	}

	return nil, nil
}

func (h *Handler) teleportToMap(ctx *rtmp.RPCContext, characterID int64, mapID int) error {
	safeX, safeY := h.sceneService.GetSafePoint(mapID)

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

	if err := h.charService.UpdatePosition(ctx.Context, characterID, character.Position{MapID: mapID, X: safeX, Y: safeY}); err != nil {
		h.logger.Error("Failed to update position", zap.Error(err))
	}
	_ = rtmputils.UpsertSocialPresence(ctx.Context, h.presenceStore, characterID, char.Name, mapID, safeX, safeY, channelID)
	if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
		h.logger.Error("Failed to send scene reset callbacks", zap.Error(err))
	}
	ctx.Connection.ResetSceneEntryRateLimits()

	if err := ctx.Connection.SendCallback("onSceneEnter", mapID, safeX, safeY, -1); err != nil {
		h.logger.Error("Failed to send onSceneEnter callback", zap.Error(err))
	}

	h.scenePopulationDeps().PushOnCreateChars(ctx.Context, ctx.Connection, channelID, mapID, characterID)

	if oldRoomID != 0 && oldRoomID != mapID {
		char.MapID = mapID
		char.PosX = safeX
		char.PosY = safeY
		playerData := h.sceneService.GetCharacterForClient(char)
		h.sceneManager.BroadcastToScene(channelID, mapID, ctx.ConnID, "onScenePlayerEntered", playerData)

		h.groupTransportDeps().FollowLeaderToMap(ctx.Context, characterID, oldRoomID, mapID, safeX, safeY)
	}
	return nil
}
