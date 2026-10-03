// Open-sourced by BaoLT

// Shop config handlers and currency helpers.
package shop

import (
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func getCurrencyName(currencyType int) string {
	switch currencyType {
	case 1:
		return "Bạc khóa"
	case 2:
		return "Bạc"
	case 3:
		return "Vàng khóa"
	case 4:
		return "Vàng"
	case 7:
		return "Huy chương Liên Minh"
	case 10:
		return "Điểm Năm Mới"
	case 11:
		return "Điểm Tết"
	case 12:
		return "Điểm Valentine"
	case 13:
		return "Điểm Lồng Đèn"
	case 14:
		return "Điểm Quốc Tế Lao Động"
	case 15:
		return "Điểm Câu Cá"
	case 16:
		return "Điểm Thất Tịch"
	case 17:
		return "Điểm Mùa Hè"
	case 18:
		return "Điểm Kỷ Niệm"
	case 19:
		return "Điểm Đấu Trường Thú"
	case 20:
		return "Cống hiến Bang Hội (Thường)"
	case 21:
		return "Cống hiến Bang Hội (Quyên góp)"
	case 22:
		return "Điểm Giáng Sinh"
	case 25:
		return "Điểm Quốc Khánh"
	case 26:
		return "Mảnh Thú Cưỡi"
	case 29:
		return "Điểm World Cup"
	case 30:
		return "Vàng World Cup"
	case 31:
		return "Điểm Olympic"
	case 49:
		return "Điểm Chu Niên"
	case 58:
		return "Điểm Ngày Độc Thân"
	case 60:
		return "Điểm ShowTime"
	case 61:
		return "Vàng Shop"
	case 62:
		return "Điểm Tiêu Hao Chu Niên"
	case 64:
		return "MC Beans"
	case 65:
		return "Điểm Hoạt Động Đấu Trường Thú"
	case 69:
		return "Điểm ShowTime 2"
	default:
		return "Điểm"
	}
}

func getCurrencyKey(currencyType int) string {
	switch currencyType {
	case 1:
		return "moneyBind"
	case 2:
		return "money"
	case 3:
		return "goldBind"
	case 4:
		return "gold"
	case 20:
		return "guildContrib"
	case 61:
		return "shopGold"
	case 64:
		return "mcbeans"
	case 0:
		return "honor"
	default:
		return "money"
	}
}

func (h *Handler) GetShopConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	
	result := []interface{}{0, "", []interface{}{}}
	if err := ctx.Connection.SendCallback("onGetShopConfig", result); err != nil {
		h.logger.Error("Failed to send onGetShopConfig callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) GetLimitShopConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	
	result := []interface{}{0, "", []interface{}{}}
	if err := ctx.Connection.SendCallback("onGetLimitShopConfig", result); err != nil {
		h.logger.Error("Failed to send onGetLimitShopConfig callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	return nil, nil
}

func (h *Handler) GetRemainShopConfig(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	
	result := []interface{}{0, "", []interface{}{}}
	if err := ctx.Connection.SendCallback("onGetRemainShopConfig", result); err != nil {
		h.logger.Error("Failed to send onGetRemainShopConfig callback", zap.Uint32("conn_id", ctx.ConnID), zap.Error(err))
	}

	return nil, nil
}
