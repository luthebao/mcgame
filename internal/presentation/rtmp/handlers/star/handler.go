// Open-sourced by BaoLT

// Star RPC handlers for the 12-slot zodiac star upgrade panel.
// Registers begin/finish/cancel/speedUp/addAddition + pmStarExchage.
// See docs/research/2026-05-05_02_STAR_SUBSYSTEM_RESEARCH.md.
package star

import (
	"errors"
	"strconv"

	appitem "mcgame-server/internal/application/item"
	appstar "mcgame-server/internal/application/star"
	"mcgame-server/internal/infrastructure/rtmp"
	rtmputils "mcgame-server/internal/presentation/rtmp/utils"

	"go.uber.org/zap"
)

type Handler struct {
	service     *appstar.Service
	itemService *appitem.Service
	logger      *zap.Logger
}

func NewHandler(service *appstar.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) SetItemService(svc *appitem.Service) {
	h.itemService = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("beginStarLvUp", h.BeginStarLvUp)
	dispatcher.Register("finishStarLvUp", h.FinishStarLvUp)
	dispatcher.Register("cancelStarLvUp", h.CancelStarLvUp)
	dispatcher.Register("speedUpStarLvUp", h.SpeedUpStarLvUp)
	dispatcher.Register("addStarAddition", h.AddStarAddition)
	dispatcher.Register("pmStarExchage", h.PmStarExchage)
}

func (h *Handler) BeginStarLvUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("BeginStarLvUp called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if h.service == nil {
		return errResponse("star service not configured"), nil
	}
	if len(args) < 1 {
		return errResponse("missing nextId argument"), nil
	}
	nextID, err := parseIntArg(args[0])
	if err != nil {
		return errResponse("invalid nextId argument"), nil
	}
	charID, ok := characterID(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	state, err := h.service.Begin(ctx.Context, charID, nextID)
	if err != nil {
		h.logServiceError("beginStarLvUp", ctx, err)
		return false, nil
	}
	return appstar.StateToWire(state), nil
}

func (h *Handler) FinishStarLvUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("FinishStarLvUp called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if h.service == nil {
		return errResponse("star service not configured"), nil
	}
	if len(args) < 1 {
		return errResponse("missing starType argument"), nil
	}
	starType, err := parseIntArg(args[0])
	if err != nil {
		return errResponse("invalid starType argument"), nil
	}
	charID, ok := characterID(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	state, err := h.service.Finish(ctx.Context, charID, starType)
	if err != nil {
		h.logServiceError("finishStarLvUp", ctx, err)
		return false, nil
	}
	h.pushStatRefresh(ctx, charID)
	return appstar.StateToWire(state), nil
}

func (h *Handler) pushStatRefresh(ctx *rtmp.RPCContext, charID int64) {
	if h.itemService == nil || h.service == nil {
		return
	}
	char, err := h.service.LoadCharacter(ctx.Context, charID)
	if err != nil {
		h.logger.Warn("star: stat refresh load failed",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", charID),
			zap.Error(err))
		return
	}
	if char == nil {
		return
	}
	rtmputils.SendStatRefreshUPP(ctx, h.itemService, char)
}

func (h *Handler) CancelStarLvUp(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("CancelStarLvUp called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.Any("args", args))

	if h.service == nil {
		return errResponse("star service not configured"), nil
	}
	if len(args) < 1 {
		return errResponse("missing starType argument"), nil
	}
	starType, err := parseIntArg(args[0])
	if err != nil {
		return errResponse("invalid starType argument"), nil
	}
	charID, ok := characterID(ctx)
	if !ok {
		return errResponse("invalid character id"), nil
	}

	state, err := h.service.Cancel(ctx.Context, charID, starType)
	if err != nil {
		h.logServiceError("cancelStarLvUp", ctx, err)
		return false, nil
	}
	return appstar.StateToWire(state), nil
}

func characterID(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}

func parseIntArg(value interface{}) (int, error) {
	switch typed := value.(type) {
	case float64:
		return int(typed), nil
	case int:
		return typed, nil
	case int64:
		return int(typed), nil
	case string:
		return strconv.Atoi(typed)
	}
	return 0, errors.New("unsupported argument type")
}

func parseInt64Arg(value interface{}) int64 {
	switch typed := value.(type) {
	case float64:
		return int64(typed)
	case int:
		return int64(typed)
	case int64:
		return typed
	case string:
		v, _ := strconv.ParseInt(typed, 10, 64)
		return v
	}
	return 0
}

func parseBoolArg(value interface{}) bool {
	switch typed := value.(type) {
	case bool:
		return typed
	case float64:
		return typed != 0
	case int:
		return typed != 0
	}
	return false
}

func errResponse(_ string) interface{} {
	return false
}

var starErrorMessages = []struct {
	err error
	msg string
}{
	{appstar.ErrInvalidStarType, "Loại sao không hợp lệ"},
	{appstar.ErrTemplateNotFound, "Không tìm thấy mẫu sao"},
	{appstar.ErrLevelMismatch, "Cấp độ sao không khớp"},
	{appstar.ErrPlayerLevelTooLow, "Cấp nhân vật chưa đủ"},
	{appstar.ErrTotalStarLevelTooLow, "Tổng cấp sao chưa đủ"},
	{appstar.ErrInsufficientGold, "Không đủ vàng"},
	{appstar.ErrAnotherStarInProgress, "Đang nâng cấp một sao khác"},
	{appstar.ErrNoUpgradeInProgress, "Không có sao nào đang nâng cấp"},
	{appstar.ErrUpgradeNotYetComplete, "Sao chưa nâng cấp xong"},
	{appstar.ErrCharacterNotFound, "Không tìm thấy nhân vật"},
	{appstar.ErrNoUpgradeItemForStar, "Không có vật phẩm tăng tốc cho sao này"},
	{appstar.ErrInsufficientSpeedItems, "Không đủ vật phẩm tăng tốc"},
	{appstar.ErrInsufficientStarPnt, "Không đủ bạc để nâng tinh hoa"},
	{appstar.ErrAdditionItemRequired, "Cần vật phẩm tinh hoa"},
	{appstar.ErrInsufficientAddItem, "Không đủ vật phẩm tinh hoa"},
	{appstar.ErrAdditionMaxed, "Tinh hoa sao đã đạt mức tối đa"},
	{appstar.ErrInvalidAdditionQuantity, "Số lượng Hoa Tinh Tú không hợp lệ"},
}

func (h *Handler) logServiceError(method string, ctx *rtmp.RPCContext, err error) {
	msg := "Hệ thống lỗi"
	for _, entry := range starErrorMessages {
		if errors.Is(err, entry.err) {
			msg = entry.msg
			break
		}
	}
	h.logger.Warn("star RPC error",
		zap.String("method", method),
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID),
		zap.String("reason", msg),
		zap.Error(err))
}
