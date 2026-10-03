// Open-sourced by BaoLT

// Fairy null-responder RPC actions that push named callbacks plus the skin
// responder-result actions and shared wire helpers.
//
//	changeFairyState -> onUpdateFairy {id,'state',value} + onFairyOn/onFairyOff
//	delFairy         -> onDelFairy id
//	fairySkillConfigChange -> stored silently (no push)
//	getFairyResAndList / setFairyResList -> {actFairy,actFairyList}
//	setFairyRes -> {type,tid}
package fairy

import (
	"strconv"

	appfairy "mcgame-server/internal/application/fairy"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

func skillWire(res *appfairy.SkillResult) map[string]interface{} {
	return map[string]interface{}{
		"flag":   res.Flag,
		"id":     res.ID,
		"sindex": res.Sindex,
		"skill":  res.Skill,
	}
}

func (h *Handler) ChangeState(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	newState, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return nil, nil
	}
	res, err := h.service.ChangeState(ctx.Context, charID, fairyID, newState)
	if err != nil {
		h.logger.Warn("changeFairyState failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onUpdateFairy", res.FairyID, "state", strconv.Itoa(res.State))
	if res.State == 1 {
		h.push(ctx, "onFairyOn", map[string]interface{}{
			"cid":   res.CharID,
			"fairy": map[string]interface{}{"resCode": res.ResCode},
		})
	} else {
		h.push(ctx, "onFairyOff", res.CharID)
	}
	return nil, nil
}

func (h *Handler) DelFairy(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	if !ok1 {
		return nil, nil
	}
	if err := h.service.Delete(ctx.Context, charID, fairyID); err != nil {
		h.logger.Warn("delFairy failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	h.push(ctx, "onDelFairy", fairyID)
	return nil, nil
}

func (h *Handler) SkillConfigChange(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	fairyID, ok1 := int64Arg(args, 0)
	config := mapArg(args, 1)
	if !ok1 {
		return nil, nil
	}
	if err := h.service.SetSkillConfig(ctx.Context, charID, fairyID, config); err != nil {
		h.logger.Warn("fairySkillConfigChange failed", zap.Int64("char_id", charID), zap.Error(err))
	}
	return nil, nil
}

func (h *Handler) GetResAndList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptySkin(), nil
	}
	res, err := h.service.GetResAndList(ctx.Context, charID)
	if err != nil {
		h.logger.Error("getFairyResAndList failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptySkin(), nil
	}
	return res, nil
}

func (h *Handler) SetRes(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return nil, nil
	}
	tid, ok1 := intArg(args, 0)
	resType, ok2 := intArg(args, 1)
	if !ok1 || !ok2 {
		return nil, nil
	}
	res, err := h.service.SetRes(ctx.Context, charID, tid, resType)
	if err != nil {
		h.logger.Warn("setFairyRes failed", zap.Int64("char_id", charID), zap.Error(err))
		return nil, nil
	}
	return map[string]interface{}{"type": res.Type, "tid": res.Tid}, nil
}

func (h *Handler) SetResList(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	charID, ok := charIDFromCtx(ctx)
	if !ok {
		return emptySkin(), nil
	}
	tid, ok1 := intArg(args, 0)
	if !ok1 {
		return emptySkin(), nil
	}
	res, err := h.service.SetResList(ctx.Context, charID, tid)
	if err != nil {
		h.logger.Warn("setFairyResList failed", zap.Int64("char_id", charID), zap.Error(err))
		return emptySkin(), nil
	}
	return res, nil
}

func emptySkin() map[string]interface{} {
	return map[string]interface{}{"actFairy": 0, "actFairyList": ""}
}
