// Open-sourced by BaoLT

// Combat NPC click handlers.
package npc

import (
	"fmt"
	"strconv"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/creature"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) NpcFuncClick(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	var npcID int
	var passHash string
	foundID := false

	for _, arg := range args {
		if arg == nil {
			continue
		}
		if !foundID {
			switch v := arg.(type) {
			case float64:
				npcID = int(v)
				foundID = true
			case int:
				npcID = v
				foundID = true
			}
		} else if s, ok := arg.(string); ok {
			passHash = s
			break
		}
	}

	if npcID == 0 {
		return nil, pkgerrors.ErrInvalidArgs
	}

	if h.gameData != nil {
		npc := h.gameData.GetNPC(npcID)
		if npc != nil {
			if npc.ShopID > 0 {
				shopID := int(npc.ShopID)
				h.logger.Info("NpcFuncClick opening shop", zap.Int("npc_id", npcID), zap.Int("shop_id", shopID))

				if err := sendDirectNPCShop(ctx, shopID); err != nil {
					h.logger.Warn("Failed to send direct npc shop callback", zap.Error(err))
				}
				return nil, nil
			}

			switch creature.NPCType(npc.Type) {
			case creature.NPCTypeBank:
				h.logger.Info("NpcFuncClick: opening Bank panel", zap.Int("npc_id", npcID))

				if passHash == "" {
					ctx.Connection.SendCallback("onNpcMsg", npcID, "Vui lòng nhập mật khẩu rương!")
					return nil, nil
				}

				if err := rtmputils.VerifySecondaryPassword(ctx.Context, h.accountRepo, ctx.AccountID, passHash); err != nil {
					h.logger.Warn("NpcFuncClick: incorrect bank password", zap.String("accountID", ctx.AccountID), zap.Error(err))
					ctx.Connection.SendCallback("onNpcMsg", npcID, "Mật khẩu rương không đúng!")
					return nil, nil
				}

				if err := rtmputils.CacheSecondaryPassword(ctx.Connection, passHash); err != nil {
					h.logger.Error("NpcFuncClick: failed to sync client password", zap.Error(err))
				}

				if err := ctx.Connection.SendCallback("initViewBankPanel"); err != nil {
					h.logger.Error("Failed to send initViewBankPanel", zap.Error(err))
				}
				return nil, nil
			case creature.NPCTypeAuction:
				h.logger.Info("NpcFuncClick: opening Auction panel", zap.Int("npc_id", npcID))
				data := map[string]interface{}{
					"flag":          true,
					"npcId":         npcID,
					"myAuctionList": map[string]interface{}{},
				}
				if err := ctx.Connection.SendCallback("onInitViewAuctionP", data); err != nil {
					h.logger.Error("Failed to send onInitViewAuctionP", zap.Error(err))
				}
				return nil, nil
			case creature.NPCTypeCallboard:
				h.logger.Info("NpcFuncClick: CallBoard clicked", zap.Int("npc_id", npcID))
			}
		}
	}

	h.logger.Warn("NpcFuncClick called for NPC without shop or not found", zap.Int("npc_id", npcID))
	return nil, nil
}

func (h *Handler) ClickNpc(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	if len(args) < 1 {
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

	characterID, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return nil, pkgerrors.ErrUnauthorized
	}

	if handled, err := h.tryHandleFarmNPCClick(ctx, characterID, npcID); handled || err != nil {
		return nil, err
	}
	if handled, response, err := h.tryHandleQuestBattleNPCClick(ctx, characterID, npcID); handled || err != nil {
		return response, err
	}
	if handled, err := h.tryHandleFishingNPCClick(ctx, characterID, npcID); handled || err != nil {
		return nil, err
	}
	if handled, err := h.tryHandleProductNPCClick(ctx, characterID, npcID); handled || err != nil {
		return nil, err
	}
	if handled, err := h.tryHandleHerbNPCClick(ctx, characterID, npcID); handled || err != nil {
		return nil, err
	}
	if handled, err := h.tryHandleGuildBuildingNPCClick(ctx, npcID); handled || err != nil {
		return nil, err
	}

	if npcID == 1287 {
		oldRoomID, _ := ctx.Connection.GetSceneInfo()
		channelID := ctx.Connection.GetChannelID()
		safeX, safeY := h.sceneService.GetSafePoint(3)

		if oldRoomID != 0 && oldRoomID != 3 {
			h.sceneManager.BroadcastToScene(channelID, oldRoomID, ctx.ConnID, "onCharLeaveScene", characterID)
			ctx.Connection.SetSceneInfo(3, characterID)
			h.sceneManager.MoveToScene(channelID, oldRoomID, 3, ctx.Connection)
		} else if oldRoomID == 0 {
			ctx.Connection.SetSceneInfo(3, characterID)
			h.sceneManager.AddToScene(channelID, 3, ctx.Connection)
		}

		if err := h.charService.UpdatePosition(ctx.Context, characterID, character.Position{MapID: 3, X: safeX, Y: safeY}); err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		if err := h.sendSceneResetCallbacks(ctx.Connection); err != nil {
			h.logger.Error("Failed to send scene reset callbacks", zap.Error(err))
		}
		if err := ctx.Connection.SendCallback("onSceneEnter", 3, safeX, safeY, -1); err != nil {
			h.logger.Error("Failed to send onSceneEnter callback", zap.Error(err))
		}

		if oldRoomID != 0 && oldRoomID != 3 {
			char, err := h.charService.GetByID(ctx.Context, characterID)
			if err == nil {
				char.MapID = 3
				char.PosX = safeX
				char.PosY = safeY
				playerData := h.sceneService.GetCharacterForClient(char)
				h.sceneManager.BroadcastToScene(channelID, 3, ctx.ConnID, "onScenePlayerEntered", playerData)
			}
		}
		return nil, nil
	}

	if npcID == 434 {
		npcName := "Tu Hành"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ngươi muốn gì?"
		options := []map[string]interface{}{
			{"label": "Nhiệm vụ và trị liệu", "func": npcInteractionFuncID(npcID)},
			{"label": "Tự động tu hành", "func": "auto_cultivation"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 211 {
		npcName := "Chiến trường Bang Hội"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Bang Hội Chiến là nơi thể hiện sức mạnh của Bang hội. Hãy tham gia ngay để nhận nhiều phần quà hấp dẫn."
		options := []map[string]interface{}{
			{"label": "Báo danh tham chiến", "func": "gwc_register"},
			{"label": "Xem phân đội", "func": "gwc_view_team"},
			{"label": "Vào bản đồ bang hội chiến", "func": "gwc_enter_map"},
			{"label": "Thưởng cá nhân BHC ( bang thua)", "func": "gwc_reward_personal_loss"},
			{"label": "Thưởng xếp hạng BHC tháng", "func": "gwc_reward_ranking_month"},
			{"label": "Xem báo danh bang hội chiến", "func": "gwc_view_registration"},
			{"label": "Xem quy tắc", "func": "gwc_view_rules"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 949 {
		hasGuild, err := h.hasGuildMembership(ctx.Context, characterID)
		if err != nil {
			return nil, err
		}
		if !hasGuild {
			ctx.Connection.SendCallback("a", "Bạn chưa gia nhập bang hội.")
			return nil, nil
		}
		if err := h.teleportToPosition(ctx, characterID, 49, 1800, 1360); err != nil {
			return nil, err
		}
		return nil, nil
	}

	if npcID == 186 {
		npcName := "Phần Thưởng Hoạt Động"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ngươi muốn nhận thưởng gì?"
		options := []map[string]interface{}{
			{"label": "Nhận x2 thần tu", "func": "receive_x2_spirit"},
			{"label": "Nhận exp gấp đôi", "func": "receive_double_exp"},
			{"label": "Đổi chứng chiến thần", "func": "exchange_war_god_token"},
			{"label": "Nhận ma huyết linh lung", "func": "receive_ma_huyet"},
			{"label": "Xem tổng điểm năng nổ", "func": "view_activity_points"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 2351 {
		npcName := "Thám Hiểm Bí Cảnh"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ngươi muốn gì?"
		options := []map[string]interface{}{
			{"label": "Vào thám hiểm bí cảnh", "func": "enter_secret_realm"},
			{"label": "Nhận thưởng xếp hạng điểm", "func": "receive_ranking_reward"},
			{"label": "Nhận thưởng xếp hạng tốc đấu", "func": "receive_speed_ranking_reward"},
			{"label": "Hướng dẫn", "func": "secret_realm_guide"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 2071 {
		npcName := "Phòng Chờ"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ngươi muốn gì?"
		options := []map[string]interface{}{
			{"label": "Vào phòng chờ 1", "func": "enter_waiting_room_1"},
			{"label": "Vào phòng chờ 2", "func": "enter_waiting_room_2"},
			{"label": "Vào phòng chờ 3", "func": "enter_waiting_room_3"},
			{"label": "Nhận phần thưởng xếp hạng", "func": "receive_room_ranking_reward"},
			{"label": "Hướng dẫn", "func": "waiting_room_guide"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 47 {
		npcName := "Đăng Ký"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ngươi muốn gì?"
		options := []map[string]interface{}{
			{"label": "Ta muốn đăng kí", "func": "register_activity"},
			{"label": "Tìm hiểu quy tắc", "func": "view_rules"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 489 {
		ctx.Connection.SendCallback("onNpcMsg", 489, "Ở đây không có nhiệm vụ gia tộc bạn có thể nhận")
		return nil, nil
	}

	if npcID == 1153 {
		npcName := "Thử Thách Gia Tộc"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ngươi muốn gì?"
		options := []map[string]interface{}{
			{"label": "Xin chỉ giáo", "func": "clan_training_ask"},
			{"label": "Ta cần chuẩn bị đã", "func": "close_dialog"},
			{"label": "Xem chiến đấu", "func": "view_battle"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1637 {
		npcName := "Tiểu Tinh Linh"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Các Tiểu Tinh Linh khi mang bên mình không những trợ giúp sức mạnh cho các chủ nhân mà còn là 1 người bạn đồng hành lý tưởng."
		options := []map[string]interface{}{
			{"label": "Miễn phí nhận nuôi Tinh Linh ( Thiên sứ )", "func": "adopt_free_fairy"},
			{"label": "Mua Tinh Linh khác", "func": "buy_other_fairy"},
			{"label": "Tìm hiểu thông tin về Tiểu Tinh Linh", "func": "fairy_info"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID >= 1681 && npcID <= 1686 {
		ctx.Connection.SendCallback("onSystemSay", "Bạn chưa nhận nhiệm vụ")
		return nil, nil
	}

	if npcID == 1666 {
		npcName := "Thuốc Tiềm Năng"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Người chơi có cấp độ≥140 có thể đến đổi lấy thuốc tiềm năng để tăng điểm cộng thuộc tính cho nhân vật."
		options := []map[string]interface{}{
			{"label": "Nhận và dùng thuốc tiềm năng", "func": "potential_drug_use"},
			{"label": "Thuốc tiềm năng là gì ?", "func": "potential_drug_info"},
			{"label": "Bạn đã đổi lấy bao nhiêu thuốc rồi", "func": "potential_drug_count"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1572 {
		npcName := "Cuộc thi câu cá"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Chào mừng các bạn đến Cuộc thi câu cá !! Người thắng cuộc không chỉ nhận được những danh hiệu quý giá mà còn có thể nhận được các phần thưởng giá trị!\n\n<font color=\"#FF0000\">Thời gian: 14:00~15:00 Chủ nhật hàng tuần</font>"
		options := []map[string]interface{}{
			{"label": "Vào nơi thi câu cá", "func": "fishing_enter"},
			{"label": "Quy định cuộc thi", "func": "fishing_rules"},
			{"label": "Xem bảng xếp hạng", "func": "fishing_ranking"},
			{"label": "Nhận thưởng bù", "func": "fishing_reward"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1860 {
		npcName := "Bàng Bối Tế Tự"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Nơi này đã từng là 1 chiến trường khốc liệt, chỉ có những dũng sĩ tài năng mới trở thành truyền nhân chân chính"
		options := []map[string]interface{}{
			{"label": "Nhận danh hiệu", "func": "battlefield_get_title"},
			{"label": "Xem tổng phần thưởng", "func": "battlefield_view_rewards"},
			{"label": "Phần thưởng bổ sung", "func": "battlefield_extra_reward"},
			{"label": "Dũng sĩ chiến trường", "func": "battlefield_guide"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1502 {
		npcName := "NPC 1502"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Có muốn thay đổi hình dáng không? Thay đổi thành hình dáng những pet đáng yêu của Vua Pháp Thuật? Hay thay đổi cánh trở thành độc nhất vô nhị? Ta có thể giúp ngươi thay đổi!"
		options := []map[string]interface{}{
			{"label": "Ta muốn nhuộm màu cho bản thân", "func": "dye_self"},
			{"label": "Ta muốn nhuộm cánh", "func": "dye_wings_orange"},
			{"label": "Cánh Chiến Thần Hoàng Kim", "func": "dye_wings_war_god"},
			{"label": "Đổi hình dạng cánh Khổng Tước", "func": "change_wing_peacock"},
			{"label": "Nhuộm cánh (hiệu quả duy trì 21 ngày )", "func": "dye_wings_timed"},
			{"label": "Đổi hình dạng nhân vật", "func": "change_char_shape"},
			{"label": "Tìm hiểu cách nhuộm", "func": "dye_how_to"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1700 {
		npcName := "Thành Chủ Đông Huyền"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ta có thể đưa ngươi đến Tinh Cung khiêu chiến với Thủ Hộ Tinh Cung(đề nghị lập nhóm khiêu chiến)."
		options := []map[string]interface{}{
			{"label": "Vào thập nhi tinh cung", "func": "enter_zodiac_palace"},
			{"label": "Tìm hiểu thập nhị tinh cung", "func": "zodiac_info"},
			{"label": "Hướng dẫn đổi danh hiệu tinh cung.", "func": "zodiac_title_guide"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 938 {
		npcName := "Thương Nhân Thao Thiết"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Đại Lục Vô Ưu một lần nữa lại bị xâm lược, BOSS Xà Thần Hydra đang dẫn quân tiến vào kênh 3 của Đăng Vân Địa, các dũng sĩ hãy mau chóng đến đó phong ấn chúng!"
		options := []map[string]interface{}{
			{"label": "Phần thưởng bỗ sung", "func": "boss_extra_reward"},
			{"label": "Sự kiện BOSS Thế Giới", "func": "boss_world_info"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 937 {
		npcName := "NPC 937"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Hai anh em ta có nhiệm vụ bảo vệ thành phố này. Ở đây đầy rẫy cơ quan nguy hiểm. Hấy cẩn thận! Nếu không ngươi sẽ bị lạc trong đó. Có thể dùng điểm thần tu thừa để đổi"
		options := []map[string]interface{}{
			{"label": "Xem nhiệm vụ", "func": "view_quest_937"},
			{"label": "Đổi 250", "func": "exchange_250"},
			{"label": "Đổi 25", "func": "exchange_25"},
			{"label": "Xem điểm thần tu", "func": "view_spirit_points"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 929 {
		npcName := "NPC 929"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Chào mừng người lữ khách phương xa, nơi đây là Quyến Cố Thành xinh đẹp!"
		options := []map[string]interface{}{
			{"label": "Nhiệm vụ và thần tu", "func": "quest_spirit_929"},
			{"label": "Tự động thần tu", "func": "auto_spirit_929"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 2309 {
		npcName := "NPC 2309"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := `Chú ý:
1. Mỗi người đều có lịch sử vượt ải các tầng.
2. Cả nhóm sẽ dựa vào số tầng thấp nhất của thành viên vượt được.
3. Trong Hành Lang Vô Tận có thể tùy ý lập nhóm và khiêu chiến Boss chuyển dịch đến tầng kế tiếp, dựa vào tầng thấp nhất của thành viên trong nhóm đã vượt.
4. Lần đầu vượt qua mỗi tầng sẽ nhận được phần thưởng, mỗi ngày nhận 1 lần.`

		options := []map[string]interface{}{
			{"label": `Vào HLVT "Khởi Trình"`, "func": "hlvt_start"},
			{"label": "Đến: Tiến độ trước (Tầng 12)", "func": "hlvt_prev_progress"},
			{"label": "Xem tầng cao nhất có thể đến", "func": "hlvt_max_possible"},
			{"label": "Xem tầng cao nhất đã vượt", "func": "hlvt_max_cleared"},
			{"label": "Nhận thưởng hằng ngày", "func": "hlvt_daily_reward"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID >= 2310 && npcID <= 2317 {
		npcName := "NPC"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Không có manh mối, về Đông Huyền Thành tìm đội trưởng thương lượng"
		options := []map[string]interface{}{
			{"label": "Chuyển đến Đông Huyền Thành", "func": "hlvt_goto_dong_huyen"},
			{"label": "Chuyển Đến Quyến Cố Thành", "func": "hlvt_goto_quyen_co"},
			{"label": "Vẫn còn 1 tầng nữa đấy", "func": "hlvt_one_floor_left"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID >= 2301 && npcID <= 2308 {
		npcName := "NPC"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Chú ý: đừng tin vào mắt mình\nTrong nhóm, quái giao chiến được\nquyết định bởi số tầng thấp nhất của\nthành viên vượt được! Trước khi giao\nchiến có thể xem thông tin BOSS ở mỗi tầng"

		options := []map[string]interface{}{
			{"label": "Lại đây! Ta sẽ đá ngươi khỏi đây", "func": fmt.Sprintf("hlvt_kick_out_%d", npcID)},
			{"label": "Cho ta biết ta đang đối mặt với ai?", "func": fmt.Sprintf("hlvt_boss_current_%d", npcID)},
			{"label": "Ta muốn tiếp tục", "func": fmt.Sprintf("hlvt_continue_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID >= 2293 && npcID <= 2300 {
		npcName := "NPC"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		floorNum := npcID - 2291
		if npcID == 2300 {
			floorNum = 10
		}

		content := "Nơi này không có điểm cuối cùng, lẽ nào chúng ta không thể thoát được sao? Đây nhất định là biểu tượng mà chưa ai tìm thấy..."

		options := []map[string]interface{}{
			{"label": fmt.Sprintf("Đến: HLVT tầng kế (tầng %d)", floorNum), "func": fmt.Sprintf("hlvt_next_floor_%d", npcID)},
			{"label": "Ta muốn thám hiểm tầng nữa", "func": fmt.Sprintf("hlvt_explore_more_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1227 {
		npcName := "NPC 1227"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Cày đồng đang buổi ban trưa, mồ hồi thánh thót như mưa ruộng cày ... Việc đồng áng thật vất vả nhưng thành quả của nó thật to lớn, chính vì thế mà ta đã làm nghề này hơn 22 năm rồi, giờ ngươi muốn đến nông trường nào?"
		options := []map[string]interface{}{
			{"label": "Nông trường số 1", "func": fmt.Sprintf("farm_map_1_%d", npcID)},
			{"label": "Nông trường số 2", "func": fmt.Sprintf("farm_map_2_%d", npcID)},
			{"label": "Xem nhiệm vụ", "func": fmt.Sprintf("farm_quests_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if (npcID >= 1707 && npcID <= 1725) || npcID == 1228 {
		npcName := "NPC"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Việc trồng trọt sẽ giúp ta thu hoạch được các nông sản phong phú! Nông sản có 2 loại là dài ngày và ngắn ngày, thời gian trưởng thành của loại ngắn ngày là 5 phút, loại dài ngày là 40 phút, 1 lần thu hoạch khá nhiều. Ngươi muốn trồng loại nào?"
		options := []map[string]interface{}{
			{"label": "Trồng cây ngắn ngày", "func": fmt.Sprintf("plant_short_term_%d", npcID)},
			{"label": "Trồng cây dài ngày", "func": fmt.Sprintf("plant_long_term_%d", npcID)},
			{"label": "Trồng nông sản đặc biệt", "func": fmt.Sprintf("plant_special_%d", npcID)},
			{"label": "Thao tác nông trường", "func": fmt.Sprintf("farm_operation_%d", npcID)},
			{"label": "Ta muốn xem cách trồng cây", "func": "view_planting_guide"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1776 {
		npcName := "NPC 1776"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ma Vương lam le xâm chiếm Đại Lục Vô Ưu, các dũng sĩ cấp độ 120 trở lên hãy nhanh chóng chuẩn bị đánh đuổi bọn ma quái này."
		options := []map[string]interface{}{
			{"label": "Vào Chu Ma Điện", "func": fmt.Sprintf("chu_ma_dien_enter_%d", npcID)},
			{"label": "Chu Ma Điện", "func": fmt.Sprintf("chu_ma_dien_guide_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 421 {
		npcName := "NPC 421"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Lễ hội Công Viên Trên Không đang diễn ra cực kỳ sôi động! Mỗi tuần đều có trải nghiệm hấp dẫn và phần thưởng phong phú, mau rủ bạn bè cùng tham gia nhé!\n[Giới hạn cấp 50 trở lên]"
		options := []map[string]interface{}{
			{"label": "Vào phụ bản", "func": fmt.Sprintf("park_enter_%d", npcID)},
			{"label": "Tra tiến độ", "func": fmt.Sprintf("park_status_%d", npcID)},
			{"label": "Quy tắc", "func": fmt.Sprintf("park_rules_%d", npcID)},
			{"label": "Cửa hàng điểm", "func": fmt.Sprintf("park_shop_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1893 {
		npcName := "NPC 1893"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Từ lúc thành lập Quân Đoàn đến nay, bọn ác ma đã không ngừng hủy hoại đến thành tựu cống hiến của chúng ta. Sau khi chuyển sinh, phải gia nhậm Quân Đoàn đấy!"
		options := []map[string]interface{}{
			{"label": "Nhận danh hiệu Quân Hàm", "func": fmt.Sprintf("army_get_title_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1759 {
		npcName := "NPC 1759"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Đề nghị nhóm ít nhất 2 người, trong nhóm mỗi người đều phải có [Thư Cầu Cứu Kỳ Quái], [Thư Cầu Cứu Kỳ Quái] có thể nhận tại Sứ Giả Mở Phụ Bản ở Tinh Linh Thành (309,169)."
		options := []map[string]interface{}{
			{"label": "Phụ Bản Quỷ Hút Máu (Dễ)", "func": fmt.Sprintf("quy_hut_mau_1_%d", npcID)},
			{"label": "Phụ Bản Quỷ Hút Máu (Thường)", "func": fmt.Sprintf("quy_hut_mau_2_%d", npcID)},
			{"label": "Phụ Bản Quỷ Hút Máu (Khó)", "func": fmt.Sprintf("quy_hut_mau_3_%d", npcID)},
			{"label": "Tự động hoàn thành phụ bản", "func": fmt.Sprintf("quy_hut_mau_auto_%d", npcID)},
			{"label": "Hướng dẫn phụ bản", "func": fmt.Sprintf("quy_hut_mau_guide_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1135 {
		npcName := "NPC 1135"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ảo Ma Tháp dẫn đến ma giới, kẻ có năng lực có thể đến đây tu luyện. Cấp 60 trở lên có thể vào Tháp khiêu chiến.\nMỗi tuần có 1 lượt dùng 999 vàng tái thiết lập tiến độ khiêu chiến ở tầng 1 (cần nhận thưởng và thoát phòng tu luyện). 0 giờ thứ 2 hàng tuần sẽ bắt đầu lại tuần mới"
		options := []map[string]interface{}{
			{"label": "Khiêu chiến Ảo Ma Tháp", "func": fmt.Sprintf("hmt_challenge_start_%d", npcID)},
			{"label": "Tái thiết lập tiến độ Ảo Ma Tháp", "func": fmt.Sprintf("hmt_reset_confirm_%d", npcID)},
			{"label": "Ảo Ma Tháp", "func": fmt.Sprintf("hmt_guide_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1142 {
		npcName := "NPC 1142"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Ta phụng lệnh Ma Vương canh giữ tầng này, nhận lời khiêu chiến của ngươi"
		options := []map[string]interface{}{
			{"label": "Xin chỉ giáo", "func": fmt.Sprintf("hmt_guardian_fight_%d", npcID)},
			{"label": "Ta cần chuẫn bị đã", "func": fmt.Sprintf("hmt_cancel_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 1136 {
		npcName := "NPC 1136"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Theo lệnh của Ma Vương, ta phụ trách dịch chuyển trong Ảo Ma Tháp, chỉ có người đánh bại Ma Ảnh ở tầng này mới có thể lên tầng cao hơn"
		options := []map[string]interface{}{
			{"label": "Dịch Chuyển Ảo Ma Tháp", "func": fmt.Sprintf("hmt_tele_generic_%d", npcID)},
			{"label": "Vào Ảo Ma Tháp tầng 252", "func": fmt.Sprintf("hmt_trans_252_%d", npcID)},
			{"label": "Xem thông tin vượt tháp", "func": fmt.Sprintf("hmt_tower_info_%d", npcID)},
			{"label": "Lưu và thoát tháp", "func": fmt.Sprintf("hmt_exit_%d", npcID)},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	if npcID == 280 {
		npcName := "Thương Buôn"
		if h.gameData != nil {
			if npc := h.gameData.GetNPC(npcID); npc != nil {
				npcName = npc.Name
			}
		}

		content := "Khách quan muốn mua gì?"
		options := []map[string]interface{}{
			{"label": "Mở cửa hàng", "func": "open_shop_45"},
			{"label": "Đổi trang bị pet", "func": "exchange_pet_equip"},
			{"label": "Nhiệm vụ liên quan", "func": "related_quests_280"},
		}

		if err := ctx.Connection.SendCallbackSync("onList", npcID, npcName, content, options); err != nil {
			h.logger.Error("Failed to send onList callback", zap.Error(err))
		}
		return nil, nil
	}

	interaction := h.buildNPCInteractionData(ctx.Context, characterID, npcID)

	if interaction.directShopID > 0 && !interaction.hasQuest {
		h.logger.Info("Directly opening shop for player",
			zap.Int64("character_id", characterID),
			zap.Int("npc_id", npcID),
			zap.Int("shop_id", interaction.directShopID))

		if err := sendDirectNPCShop(ctx, interaction.directShopID); err != nil {
			h.logger.Error("Failed to send direct npc shop callback", zap.Error(err))
		}
		return nil, nil
	}

	if err := ctx.Connection.SendCallbackSync("npcFuncInit", interaction.payload); err != nil {
		h.logger.Error("Failed to send npcFuncInit callback", zap.Error(err))
	}

	h.logger.Debug("NPC interaction initiated",
		zap.Int64("character_id", characterID),
		zap.Int("npc_id", npcID),
		zap.Int("state", interaction.npcState),
		zap.Bool("has_quest", interaction.hasQuest))

	return nil, nil
}
