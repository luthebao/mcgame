// Open-sourced by BaoLT

// Fairy (Tiểu Tinh Linh) RPC handler.
//
// Responder-result RPCs reply via the inline Responder result: initCharFairy ->
// roster Object; fairyGrowUp -> {f,exp,cri,gnum}; fairyRaise -> {f,num}; addFairyExp
// -> {f,num,en}; onSkill/upFairySkill -> {flag,id,sindex,skill}; getFairyResAndList
// & setFairyResList -> {actFairy,actFairyList}; setFairyRes -> {type,tid}.
//
// Null-responder RPCs return (nil,nil) and push named callbacks: changeFairyState ->
// onFairyOn {cid,fairy:{resCode}} (state=1) or onFairyOff cid (state=0), plus
// onUpdateFairy {id,'state',value}; delFairy -> onDelFairy id;
// fairySkillConfigChange stores config silently (no push).
package fairy

import (
	"strconv"

	appfairy "mcgame-server/internal/application/fairy"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *appfairy.Service
	logger  *zap.Logger
}

func NewHandler(service *appfairy.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("initCharFairy", h.InitCharFairy)
	d.Register("fairyGrowUp", h.GrowUp)
	d.Register("fairyRaise", h.Raise)
	d.Register("addFairyExp", h.AddExp)
	d.Register("onSkill", h.OnSkill)
	d.Register("upFairySkill", h.UpSkill)
	d.Register("fairySkillConfigChange", h.SkillConfigChange)
	d.Register("changeFairyState", h.ChangeState)
	d.Register("delFairy", h.DelFairy)
	d.Register("getFairyResAndList", h.GetResAndList)
	d.Register("setFairyRes", h.SetRes)
	d.Register("setFairyResList", h.SetResList)
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

func int64Arg(args []interface{}, idx int) (int64, bool) {
	if idx < 0 || idx >= len(args) {
		return 0, false
	}
	switch v := args[idx].(type) {
	case float64:
		return int64(v), true
	case int:
		return int64(v), true
	case int64:
		return v, true
	case string:
		n, err := strconv.ParseInt(v, 10, 64)
		if err != nil {
			return 0, false
		}
		return n, true
	}
	return 0, false
}

func int64SliceArg(args []interface{}, idx int) []int64 {
	if idx < 0 || idx >= len(args) {
		return nil
	}
	raw, ok := args[idx].([]interface{})
	if !ok {
		return nil
	}
	out := make([]int64, 0, len(raw))
	for _, item := range raw {
		switch v := item.(type) {
		case float64:
			out = append(out, int64(v))
		case int:
			out = append(out, int64(v))
		case int64:
			out = append(out, v)
		case string:
			if n, err := strconv.ParseInt(v, 10, 64); err == nil {
				out = append(out, n)
			}
		}
	}
	return out
}

func mapArg(args []interface{}, idx int) map[string]interface{} {
	if idx < 0 || idx >= len(args) {
		return nil
	}
	if m, ok := args[idx].(map[string]interface{}); ok {
		return m
	}
	return nil
}

func (h *Handler) push(ctx *rtmp.RPCContext, method string, payload ...interface{}) {
	if ctx == nil || ctx.Connection == nil {
		return
	}
	if err := ctx.Connection.SendCallback(method, payload...); err != nil {
		h.logger.Warn("fairy push failed", zap.String("method", method), zap.Error(err))
	}
}
