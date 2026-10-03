// Open-sourced by BaoLT

// Package mysterytreasure handles the Mystery Treasure (Mật Bảo) panel RPCs.
// Inbound (reply via _result Responder):
//   - onGetMysBookData        [] -> per-kind learned-book map {kind:{...}}
//   - onGetMysMakeData        [] -> {learnedRec, skiLvl, skiPt}
//   - onGetMysBagData         [] -> {slot:{mid,num}} from feature state
//   - onGetChipBagData        [] -> {slot:{chipId,num}} delegates to rune service
//   - getMysTreBuffByKind     [kind] -> {idx:{propVal,t}}
//   - getMysTreBuffSimpleData [] -> flat stat-totals object
//
// Inbound (write-paths, reply via _result Responder):
//   - onGetMysAddTimes      [] -> {n, t:"month0idx|day"} (addTimes purchase preview state)
//   - addLimitMakeTimes     [] -> {n, t} buy a daily craft slot (charge gold, recompute cap)
//   - onGetMakeLimitTimes   [] -> {n, t} remaining daily make cap from real state
//
// Inbound (push-based, null responder, returns _result [undefined]):
//   - mysTreObjResolve [mysItemDic] -> pushes updateRuneChipBag+onAddMoney×2+updateMysTreBag
//   - makeMysTre [recipeId, slotMap{1-6:{idx}}, stackMap{1-6:num}] -> craft (no push; client
//     re-fetches via onGetMysBagData/onGetMysBookData/onGetMakeLimitTimes)
//
// Outbound helper (shared encoder):
//   - updateMysTreBag(bagMap) pushes {slot:{mid,num}} to client
//
// NOTE: onGetMakeLimitTimes is now served here (reads real makeLimitTimes from state); the
// legacy craft-package registration must be removed by main.go so this handler is authoritative.
package mysterytreasure

import (
	"context"

	appmystre "mcgame-server/internal/application/mysterytreasure"
	apprune "mcgame-server/internal/application/rune"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type characterAccessor interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
	Save(ctx context.Context, char *domainchar.Character) error
}

type Handler struct {
	logger      *zap.Logger
	mysService  *appmystre.Service
	runeService *apprune.Service
	chars       characterAccessor
}

func NewHandler(mysService *appmystre.Service, runeService *apprune.Service, logger *zap.Logger) *Handler {
	return &Handler{
		logger:      logger,
		mysService:  mysService,
		runeService: runeService,
	}
}

func (h *Handler) SetCharacterService(svc characterAccessor) {
	h.chars = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("onGetMysBookData", h.GetMysBookData)
	dispatcher.Register("onGetMysMakeData", h.GetMysMakeData)
	dispatcher.Register("onGetMysBagData", h.GetMysBagData)
	dispatcher.Register("onGetChipBagData", h.GetChipBagData)
	dispatcher.Register("getMysTreBuffByKind", h.GetMysTreBuffByKind)
	dispatcher.Register("getMysTreBuffSimpleData", h.GetMysTreBuffSimpleData)
	dispatcher.Register("mysTreObjResolve", h.ObjResolve)
	dispatcher.Register("onGetMysAddTimes", h.GetMysAddTimes)
	dispatcher.Register("addLimitMakeTimes", h.AddLimitMakeTimes)
	dispatcher.Register("makeMysTre", h.MakeMysTre)
	dispatcher.Register("onGetMakeLimitTimes", h.GetMakeLimitTimes)
}
