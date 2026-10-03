// Open-sourced by BaoLT

// RPC dispatcher for routing method calls to handlers.
// Includes rate limiting based on client RPCConfig.as settings.
// HandlerFunc signature: func(ctx *RPCContext, args []interface{}) (interface{}, error)
package rtmp

import (
	"context"
	"fmt"
	"sync"
	"time"

	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type HandlerFunc func(ctx *RPCContext, args []interface{}) (interface{}, error)

type RPCContext struct {
	Context     context.Context
	ConnID      uint32
	SessionID   string
	AccountID   string
	CharacterID string
	Method      string
	Timestamp   time.Time
	Connection  *Connection
}

type RPCDispatcher struct {
	handlers              map[string]HandlerFunc
	rateLimits            map[string]time.Duration
	quietMethods          map[string]bool
	silentDropOnRateLimit map[string]bool
	logger                *zap.Logger
	mutex                 sync.RWMutex
}

func NewRPCDispatcher(logger *zap.Logger) *RPCDispatcher {
	d := &RPCDispatcher{
		handlers:   make(map[string]HandlerFunc),
		rateLimits: make(map[string]time.Duration),
		silentDropOnRateLimit: map[string]bool{
			"udcr": true,
			"udcp": true,
			"cbom": true,
		},
		quietMethods: map[string]bool{
			"checkNetDelay":                  true,
			"gdc":                            false,
			"setNpcState":                    true,
			"getTodayOnlineTime":             true,
			"getShopConfig":                  true,
			"getLimitShopConfig":             true,
			"getRemainShopConfig":            true,
			"getLineInfo":                    true,
			"sendCharList":                   true,
			"onConnectAuth":                  true,
			"chooseCharactor":                true,
			"sceneLogin":                     true,
			"createNpcs":                     true,
			"createBoss":                     true,
			"createChars":                    true,
			"closeAuction":                   true,
			"getRepeatSysMsg":                true,
			"getHeadline":                    true,
			"initViewPetMngP":                true,
			"getTodayAward":                  true,
			"getCurrentFeast":                true,
			"getDailyPanelAwardState":        true,
			"getCharDiaryData":               true,
			"checkDoubleExpTime":             true,
			"getCharStateClient":             true,
			"getCharLeaderClient":            false,
			"createGuildBuildings":           true,
			"fixFlyState":                    true,
			"getDailyOnlineAct":              true,
			"initQuestManager":               false,
			"getHoleNum":                     true,
			"holeDig":                        true,
			"getJewelData":                   true,
			"jewelSet":                       true,
			"jewelDel":                       true,
			"getLoopQuestStartTime":          false,
			"udcr":                           true,
			"udcp":                           true,
			"cbom":                           true,
			"battleFieldGetInfo":             true,
			"battleUpdateCmd":                false,
			"initDailySignInActData":         false,
			"initDailySignInActConsumeLimit": false,
			"dailySignInActDoSignin":         false,
			"dailySignInActGetAward":         false,
			"dailySignInActRetroactive":      false,
			"dailySignInUpActCrit":           false,
			"getSignInData":                  false,
			"signinNow":                      false,
			"getDailyActAward":               false,
		},
		logger: logger,
	}
	d.setDefaultRateLimits()
	return d
}

func (d *RPCDispatcher) setDefaultRateLimits() {
	d.rateLimits["getLineInfo"] = 10000 * time.Millisecond
	d.rateLimits["cbom"] = 1000 * time.Millisecond
	d.rateLimits["udcr"] = 600 * time.Millisecond
	d.rateLimits["udcp"] = 600 * time.Millisecond
	d.rateLimits["toMovable"] = 18100 * time.Millisecond
	d.rateLimits["toSafe"] = 1100 * time.Millisecond
	d.rateLimits["product"] = 10000 * time.Millisecond
	d.rateLimits["uc"] = 31000 * time.Millisecond
	d.rateLimits["gtg"] = 31000 * time.Millisecond
	d.rateLimits["callGm"] = 31000 * time.Millisecond
	d.rateLimits["takeQuest"] = 1100 * time.Millisecond
	d.rateLimits["finishQuest"] = 1100 * time.Millisecond
	d.rateLimits["initQuestManager"] = 1100 * time.Millisecond
	d.rateLimits["say"] = 1100 * time.Millisecond
	d.rateLimits["addMail"] = 2100 * time.Millisecond
	d.rateLimits["createChars"] = 1100 * time.Millisecond
	d.rateLimits["createNpcs"] = 1100 * time.Millisecond
	d.rateLimits["createBoss"] = 1100 * time.Millisecond
	d.rateLimits["createSceneItems"] = 1100 * time.Millisecond
	d.rateLimits["sceneChange"] = 1100 * time.Millisecond
	d.rateLimits["sceneLogin"] = 1100 * time.Millisecond
	d.rateLimits["equipOn"] = 1100 * time.Millisecond
	d.rateLimits["equipOff"] = 1100 * time.Millisecond
	d.rateLimits["repairAll"] = 1100 * time.Millisecond
	d.rateLimits["getVipShopConfig"] = 1100 * time.Millisecond
	d.rateLimits["getVipShopCharConfig"] = 1100 * time.Millisecond
	d.rateLimits["buyVipShopItem"] = 1100 * time.Millisecond
	d.rateLimits["repair"] = 1100 * time.Millisecond
	d.rateLimits["setDressHide"] = 1100 * time.Millisecond
	d.rateLimits["moveItem"] = 1100 * time.Millisecond
	d.rateLimits["moveItemNum"] = 1100 * time.Millisecond
	d.rateLimits["dropItem"] = 1100 * time.Millisecond
	d.rateLimits["ex"] = 1100 * time.Millisecond
	d.rateLimits["gp"] = 1100 * time.Millisecond
	d.rateLimits["gg"] = 1100 * time.Millisecond
	d.rateLimits["initViewPetMngP"] = 1100 * time.Millisecond
	d.rateLimits["bindedPetByPlayer"] = 1100 * time.Millisecond
	d.rateLimits["petBook"] = 1100 * time.Millisecond
	d.rateLimits["petDelSkill"] = 1100 * time.Millisecond
	d.rateLimits["petEquipOn"] = 1100 * time.Millisecond
	d.rateLimits["petEquipOff"] = 1100 * time.Millisecond
	d.rateLimits["petOpenSkill"] = 1100 * time.Millisecond
	d.rateLimits["petOpenSlot"] = 1100 * time.Millisecond
	d.rateLimits["getPetGuardData"] = 1100 * time.Millisecond
	d.rateLimits["putDownPet"] = 1100 * time.Millisecond
	d.rateLimits["movePetToPetGuardSid"] = 1100 * time.Millisecond
	d.rateLimits["changePetName"] = 1100 * time.Millisecond
	d.rateLimits["changePetProperty"] = 1100 * time.Millisecond
	d.rateLimits["shopClosePanel"] = 1100 * time.Millisecond
	d.rateLimits["clickNpc"] = 1100 * time.Millisecond
	d.rateLimits["clickBoss"] = 1100 * time.Millisecond
	d.rateLimits["bossDailyGetData"] = 1100 * time.Millisecond
	d.rateLimits["bossDailyBattle"] = 1100 * time.Millisecond
	d.rateLimits["getWarMap"] = 1000 * time.Millisecond
	d.rateLimits["clickWarMap"] = 500 * time.Millisecond
	d.rateLimits["addWarMapTime"] = 500 * time.Millisecond
	d.rateLimits["bossDailyFinishByCard"] = 1100 * time.Millisecond
	d.rateLimits["npcFuncClick"] = 1100 * time.Millisecond
	d.rateLimits["npcFuncOther"] = 1100 * time.Millisecond
	d.rateLimits["pkInvite"] = 1100 * time.Millisecond
	d.rateLimits["pkInviteResp"] = 1100 * time.Millisecond
	d.rateLimits["pkReady"] = 600 * time.Millisecond
	d.rateLimits["pkAction"] = 200 * time.Millisecond
	d.rateLimits["pkSurrender"] = 600 * time.Millisecond
	d.rateLimits["pkLeave"] = 600 * time.Millisecond
	d.rateLimits["hitNpc"] = 2100 * time.Millisecond
	d.rateLimits["auctionSearch"] = 1000 * time.Millisecond
	d.rateLimits["takeSPGift"] = 1000 * time.Millisecond
	d.rateLimits["takeNewGift"] = 1000 * time.Millisecond
	d.rateLimits["doPmOperation"] = 1000 * time.Millisecond
	d.rateLimits["showChaInfo"] = 1000 * time.Millisecond
	d.rateLimits["battleFieldGetInfo"] = 500 * time.Millisecond
	d.rateLimits["battleUpdateCmd"] = 200 * time.Millisecond
	d.rateLimits["speedUpStarLvUp"] = 500 * time.Millisecond
	d.rateLimits["addStarAddition"] = 500 * time.Millisecond
	d.rateLimits["pmStarExchage"] = 500 * time.Millisecond
	d.rateLimits["chooseCharactor"] = 2100 * time.Millisecond
	d.rateLimits["newChar"] = 5000 * time.Millisecond
	d.rateLimits["icl"] = 1000 * time.Millisecond
	d.rateLimits["backToCharSelect"] = 2000 * time.Millisecond
	d.rateLimits["useItem"] = 800 * time.Millisecond
	d.rateLimits["initViewImC"] = 10000 * time.Millisecond
	d.rateLimits["bagSort"] = 3000 * time.Millisecond
	d.rateLimits["getLimitTimeShop"] = 60000 * time.Millisecond
	d.rateLimits["fullHpRecoverByItem"] = 800 * time.Millisecond
	d.rateLimits["fullMpRecoverByItem"] = 800 * time.Millisecond
	d.rateLimits["getOfflineExp"] = 1100 * time.Millisecond
	d.rateLimits["getPetOfflineExp"] = 1100 * time.Millisecond
	d.rateLimits["submitAddict"] = 30000 * time.Millisecond
	d.rateLimits["getChatPanel"] = 3000 * time.Millisecond
	d.rateLimits["addDecoHoleLevel"] = 500 * time.Millisecond
	d.rateLimits["MysteryExchangeItem"] = 2000 * time.Millisecond
	d.rateLimits["MysteryExchangeScore"] = 2000 * time.Millisecond
}

func (d *RPCDispatcher) IsQuiet(method string) bool {
	return d.quietMethods[method]
}

func (d *RPCDispatcher) Register(method string, handler HandlerFunc) {
	d.mutex.Lock()
	defer d.mutex.Unlock()
	d.handlers[method] = handler
}

func (d *RPCDispatcher) Dispatch(conn *Connection, method string, args []interface{}) (interface{}, error) {
	start := time.Now()
	quiet := d.quietMethods[method]

	if !quiet {
		d.logger.Info("RPC call received",
			zap.Uint32("conn_id", conn.ID),
			zap.String("method", method),
			zap.Int("arg_count", len(args)),
			zap.Any("args", args))
	}

	if err := d.checkRateLimit(conn, method); err != nil {
		if d.silentDropOnRateLimit[method] {
			return nil, nil
		}
		d.logger.Warn("Rate limited", zap.Uint32("conn_id", conn.ID), zap.String("method", method))
		return nil, err
	}

	d.mutex.RLock()
	handler, exists := d.handlers[method]
	d.mutex.RUnlock()

	if !exists {
		d.logger.Warn("Method not found", zap.Uint32("conn_id", conn.ID), zap.String("method", method))
		return nil, pkgerrors.ErrMethodNotFound
	}

	session := conn.GetSession()
	ctx := &RPCContext{
		Context:     context.Background(),
		ConnID:      conn.ID,
		SessionID:   session.SessionID,
		AccountID:   session.AccountID,
		CharacterID: session.CharacterID,
		Method:      method,
		Timestamp:   start,
		Connection:  conn,
	}

	result, err := handler(ctx, args)

	duration := time.Since(start)
	if err != nil {
		if pkgerrors.IsExpected(err) {
			d.logger.Warn("RPC call rejected",
				zap.Uint32("conn_id", conn.ID),
				zap.String("method", method),
				zap.Duration("duration", duration),
				zap.Error(err))
		} else {
			d.logger.Error("RPC call failed",
				zap.Uint32("conn_id", conn.ID),
				zap.String("method", method),
				zap.Duration("duration", duration),
				zap.Error(err))
		}
	}

	return result, err
}

func (d *RPCDispatcher) checkRateLimit(conn *Connection, method string) error {
	d.mutex.RLock()
	limit, hasLimit := d.rateLimits[method]
	d.mutex.RUnlock()

	if !hasLimit {
		return nil
	}

	session := conn.GetSession()
	conn.mutex.Lock()
	defer conn.mutex.Unlock()

	lastCall, exists := session.RateLimits[method]
	now := time.Now()

	if exists && now.Sub(lastCall) < limit {
		return pkgerrors.ErrRateLimited
	}

	session.RateLimits[method] = now
	return nil
}

type RPCResponse struct {
	Success bool        `json:"success"`
	Data    interface{} `json:"data,omitempty"`
	Error   *RPCError   `json:"error,omitempty"`
}

type RPCError struct {
	Code    int    `json:"code"`
	Message string `json:"message"`
}

func NewSuccessResponse(data interface{}) *RPCResponse {
	return &RPCResponse{Success: true, Data: data}
}

func NewErrorResponse(code int, message string) *RPCResponse {
	return &RPCResponse{Success: false, Error: &RPCError{Code: code, Message: message}}
}

func ErrorToResponse(err error) *RPCResponse {
	switch {
	case pkgerrors.Is(err, pkgerrors.ErrNotFound):
		return NewErrorResponse(404, "Not found")
	case pkgerrors.Is(err, pkgerrors.ErrUnauthorized):
		return NewErrorResponse(401, "Unauthorized")
	case pkgerrors.Is(err, pkgerrors.ErrInvalidInput):
		return NewErrorResponse(400, "Invalid input")
	case pkgerrors.Is(err, pkgerrors.ErrInventoryFull):
		return NewErrorResponse(400, "Không đủ ô trống.")
	case pkgerrors.Is(err, pkgerrors.ErrRateLimited):
		return NewErrorResponse(429, "Rate limited")
	case pkgerrors.Is(err, pkgerrors.ErrMethodNotFound):
		return NewErrorResponse(404, "Method not found")
	default:
		return NewErrorResponse(500, fmt.Sprintf("Internal error: %v", err))
	}
}
