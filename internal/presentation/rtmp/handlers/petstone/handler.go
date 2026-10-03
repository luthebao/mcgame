// Open-sourced by BaoLT

// Pet Stone (Tụ Linh Bảo Thạch) RPC handler. All methods reply via the inline
// Responder result, not a CallBack push:
//
//	initPetStonePanel / composePetStone / absorbPetStone / resolvePetStone -> bag Array;
//	petStoneSet / removePetStone -> {bagData, slotId, newId, skillId, equData};
//	getPetStoneByEid -> {<slot>:[stoneTid,0,skillId]} or Number(-1);
//	changePetStoneEnergy -> {sid, skillId, bagData, newSid}.
//
// On error the bag-returning RPCs reply with an empty Array (the client treats it
// as an empty bag) and the object RPCs reply with a typed empty/-1 value so the
// inline Responder never receives a malformed payload.
package petstone

import (
	"strconv"

	apppetstone "mcgame-server/internal/application/petstone"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type Handler struct {
	service *apppetstone.Service
	logger  *zap.Logger
}

func NewHandler(service *apppetstone.Service, logger *zap.Logger) *Handler {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Handler{service: service, logger: logger}
}

func (h *Handler) RegisterHandlers(d *rtmp.RPCDispatcher) {
	d.Register("initPetStonePanel", h.Init)
	d.Register("composePetStone", h.Compose)
	d.Register("absorbPetStone", h.Absorb)
	d.Register("resolvePetStone", h.Resolve)
	d.Register("petStoneSet", h.Set)
	d.Register("removePetStone", h.Remove)
	d.Register("getPetStoneByEid", h.GetByEid)
	d.Register("changePetStoneEnergy", h.ChangeEnergy)
}

func emptyBag() []interface{} {
	return []interface{}{}
}

func setResp(r *apppetstone.SetResult) map[string]interface{} {
	if r == nil {
		return map[string]interface{}{
			"bagData": emptyBag(),
			"slotId":  0,
			"newId":   0,
			"skillId": 0,
			"equData": map[string]interface{}{},
		}
	}
	return map[string]interface{}{
		"bagData": r.BagData,
		"slotId":  r.SlotID,
		"newId":   r.NewID,
		"skillId": r.SkillID,
		"equData": r.EquData,
	}
}

func energyResp(r *apppetstone.EnergyResult) map[string]interface{} {
	if r == nil {
		return map[string]interface{}{
			"sid":     0,
			"skillId": 0,
			"bagData": emptyBag(),
			"newSid":  0,
		}
	}
	return map[string]interface{}{
		"sid":     r.Sid,
		"skillId": r.SkillID,
		"bagData": r.BagData,
		"newSid":  r.NewSid,
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

func intListArg(args []interface{}, idx int) ([]int, bool) {
	if idx < 0 || idx >= len(args) {
		return nil, false
	}
	list, ok := args[idx].([]interface{})
	if !ok {
		return nil, false
	}
	out := make([]int, 0, len(list))
	for _, raw := range list {
		switch v := raw.(type) {
		case float64:
			out = append(out, int(v))
		case int:
			out = append(out, v)
		case int64:
			out = append(out, int(v))
		case string:
			n, err := strconv.Atoi(v)
			if err != nil {
				return nil, false
			}
			out = append(out, n)
		default:
			return nil, false
		}
	}
	return out, true
}
