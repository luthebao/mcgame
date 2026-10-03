// Open-sourced by BaoLT

// PRS — "Chân Hồn Thần Thú" (Pet Real Soul) RPC handler.
// initPRSPanel replies via the inline Responder result (full prsInfo); the mutators
// use a null responder and push named callbacks: updatePRSPanel (tree/form changes),
// updatePRSChipBag / updatePRSExcBag (chip moves), onReplacePRSShow (equip/cancel),
// onGetPRSChip (exchange/collect notification). The chip collect/swap draws live in
// collect.go (freePRSCollect/goldPRSCollect/goldPRSCollectThree/swapPRSChip/
// swapPRSChipTimes). activePRSShowSpe (tab=1 special forms, consume main-bag items)
// is registered here and wired to prs.Service via SetItemConsumer at startup.
package prs

import (
	"strconv"

	appprs "mcgame-server/internal/application/prs"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appprs.Service
	logger  *zap.Logger
}

func NewHandler(service *appprs.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("initPRSPanel", h.InitPanel)
	d.Register("addSoulTreeLvl", h.AddSoulTreeLvl)
	d.Register("replacePRSShow", h.ReplaceShow)
	d.Register("cancelPRSShow", h.CancelShow)
	d.Register("activePRSShow", h.ActiveShow)
	d.Register("activePRSShowSpe", h.ActiveShowSpe)
	d.Register("movePRSChip", h.MoveChip)
	d.Register("exchangePRSChip", h.ExchangeChip)
	d.Register("updateActivePRSShow", h.UpdateActiveShow)
	d.Register("freePRSCollect", h.FreeCollect)
	d.Register("goldPRSCollect", h.GoldCollect)
	d.Register("goldPRSCollectThree", h.GoldCollectThree)
	d.Register("swapPRSChip", h.SwapChip)
	d.Register("swapPRSChipTimes", h.SwapChipTimes)
}

func emptyPanel() map[string]interface{} {
	return map[string]interface{}{
		"tid":         "0",
		"actArr":      map[string]interface{}{},
		"actLimitObj": map[string]interface{}{},
		"useSid":      0,
		"chipBag":     map[string]interface{}{},
		"excBag":      map[string]interface{}{},
		"isShow":      0,
	}
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

func intArg(args []interface{}, idx int) (int, bool) {
	if idx < 0 || idx >= len(args) {
		return 0, false
	}
	switch v := args[idx].(type) {
	case float64:
		return int(v), true
	case int:
		return v, true
	case int64:
		return int(v), true
	case string:
		n, err := strconv.Atoi(v)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}

func expiredShowIDs(args []interface{}) []int {
	if len(args) == 0 {
		return nil
	}
	m, ok := args[0].(map[string]interface{})
	if !ok {
		return nil
	}
	ids := make([]int, 0, len(m))
	for key, val := range m {
		if id, ok := intArg([]interface{}{val}, 0); ok && id > 0 {
			ids = append(ids, id)
			continue
		}
		if id, err := strconv.Atoi(key); err == nil && id > 0 {
			ids = append(ids, id)
		}
	}
	return ids
}
