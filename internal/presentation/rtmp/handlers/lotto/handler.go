// Open-sourced by BaoLT

// Lottery bag RPC handlers. Three parallel bags (lotto / lottery / luckDraw) each expose
// get / getSingle(claim one) / getAll(claim all) / throwAll / sort, all of which push the
// updated bag via the bag's update* callback. The Wish-Tree draw RPCs getLottoData
// (returns the per-type display grid of TBL_PLAN ids) and lottoByClient (rolls the pool,
// deposits winnings, pushes updateLottoBag) are also registered here.
package lotto

import (
	"errors"
	"strconv"

	applotto "mcgame-server/internal/application/lotto"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *applotto.Service
	logger  *zap.Logger
}

func NewHandler(service *applotto.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

type bagRoutes struct {
	kind     string
	callback string
	get      string
	single   string
	all      string
	throw    string
	sort     string
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	routes := []bagRoutes{
		{applotto.BagLotto, "updateLottoBag", "getLottoBag", "getSingleItem", "getAllItem", "throwAllItem", "lottoBagSort"},
		{applotto.BagLottery, "updateLotteryBag", "getLotteryBag", "getSingleLotteryItem", "getAllLotteryItem", "throwAllLotteryItem", "lotteryBagSort"},
		{applotto.BagLuckDraw, "updateLuckDrawBag", "getLuckDrawBag", "getSingleLuckDrawItem", "getAllLuckDrawItem", "throwAllLuckDrawItem", "luckDrawBagSort"},
	}
	for _, r := range routes {
		d.Register(r.get, h.makeGet(r.kind, r.callback))
		d.Register(r.single, h.makeSingle(r.kind, r.callback))
		d.Register(r.all, h.makeAll(r.kind, r.callback))
		d.Register(r.throw, h.makeThrow(r.kind, r.callback))
		d.Register(r.sort, h.makeSort(r.kind, r.callback))
	}
	d.Register("getLottoData", h.getLottoData)
	d.Register("lottoByClient", h.lottoByClient)
}

func (h *Handler) getLottoData(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	data, err := h.service.GetLottoData(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getLottoData failed", zap.Error(err))
		return map[string]interface{}{"lottoAward": []interface{}{}, "highestAwardArr": []interface{}{}}, nil
	}
	return data, nil
}

func (h *Handler) lottoByClient(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return false, nil
	}
	drawType, num := 0, 0
	if len(args) > 0 {
		if m, ok := args[0].(map[string]interface{}); ok {
			if n, err := parseIntArg(m["type"]); err == nil {
				drawType = n
			}
			if n, err := parseIntArg(m["num"]); err == nil {
				num = n
			}
		}
	}
	bag, err := h.service.Draw(ctx.Context, charID, drawType, num)
	if err != nil {
		h.logger.Warn("lottoByClient draw failed",
			zap.Int("type", drawType), zap.Int("num", num), zap.Error(err))
		return false, nil
	}
	_ = ctx.Connection.SendCallback("updateLottoBag", bag)
	return true, nil
}

func (h *Handler) makeGet(kind, callback string) rtmp.HandlerFunc {
	return func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		charID, ok := charIDFromCtx(ctx)
		if !ok {
			return nil, nil
		}
		bag, err := h.service.GetBag(ctx.Context, charID, kind)
		if err != nil {
			h.logger.Error("lotto get bag failed", zap.String("kind", kind), zap.Error(err))
			return nil, nil
		}
		_ = ctx.Connection.SendCallback(callback, bag)
		return bag, nil
	}
}

func (h *Handler) makeSingle(kind, callback string) rtmp.HandlerFunc {
	return func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		charID, ok := charIDFromCtx(ctx)
		if !ok {
			return nil, nil
		}
		index := 0
		if len(args) > 0 {
			if n, err := parseIntArg(args[0]); err == nil {
				index = n
			}
		}
		bag, err := h.service.ClaimSingle(ctx.Context, charID, kind, index)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		_ = ctx.Connection.SendCallback(callback, bag)
		return nil, nil
	}
}

func (h *Handler) makeAll(kind, callback string) rtmp.HandlerFunc {
	return func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		charID, ok := charIDFromCtx(ctx)
		if !ok {
			return nil, nil
		}
		bag, err := h.service.ClaimAll(ctx.Context, charID, kind)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		_ = ctx.Connection.SendCallback(callback, bag)
		return nil, nil
	}
}

func (h *Handler) makeThrow(kind, callback string) rtmp.HandlerFunc {
	return func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		charID, ok := charIDFromCtx(ctx)
		if !ok {
			return nil, nil
		}
		bag, err := h.service.ThrowAll(ctx.Context, charID, kind)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		_ = ctx.Connection.SendCallback(callback, bag)
		return nil, nil
	}
}

func (h *Handler) makeSort(kind, callback string) rtmp.HandlerFunc {
	return func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		charID, ok := charIDFromCtx(ctx)
		if !ok {
			return nil, nil
		}
		bag, err := h.service.Sort(ctx.Context, charID, kind)
		if err != nil {
			return rtmp.ErrorToResponse(err), nil
		}
		_ = ctx.Connection.SendCallback(callback, bag)
		return nil, nil
	}
}

func parseIntArg(value any) (int, error) {
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

func charIDFromCtx(ctx *rtmp.RPCContext) (int64, bool) {
	if ctx == nil || ctx.CharacterID == "" {
		return 0, false
	}
	id, err := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if err != nil {
		return 0, false
	}
	return id, true
}
