// Open-sourced by BaoLT

// Legacy activity backlog handlers provide compatibility starter payloads for older activity RPCs exposed by enabling all client activity icons.
package activity

import (
	"context"
	"fmt"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

const legacyStartedActivityCount = 84

type legacyActivityCallback struct {
	method string
	args   []interface{}
}

type legacyStarterResponse struct {
	response  interface{}
	callbacks []legacyActivityCallback
}

type legacyActivityState struct {
	now  time.Time
	day  string
	char *domainchar.Character
}

func (h *Handler) registerLegacyActivityBacklogHandlers(dispatcher *rtmp.RPCDispatcher) {
	register := func(method string, builder func(legacyActivityState, []interface{}) legacyStarterResponse) {
		dispatcher.Register(method, h.legacyStarterHandler(method, builder))
	}

	register("getStartingActList", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := h.buildStartedActListPayload()
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "updateActivityList", args: []interface{}{payload}},
			},
		}
	})
	register("initFlopPassData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"rank": []interface{}{}, "myRank": -1, "award": 0}}
	})
	register("initCardPlayPanel", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"day": state.day, "time": 0, "max": 0}}
	})
	register("getAutoTaskData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := legacyAutoTaskPayload(state)
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onAutoTaskLogin", args: []interface{}{payload}},
			},
		}
	})
	register("initTreasureBowl", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := legacyTreasureBowlPayload(state)
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onFreshCharTreasureBowl", args: []interface{}{payload}},
			},
		}
	})
	register("initStoneToGoldActData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"day": state.day, "flag": 0, "num": 0}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "refreshStoneToGoldActData", args: []interface{}{payload}},
			},
		}
	})
	register("initRebateEverydayPanelData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"v": 0, "day": state.day, "flag": 0}}
	})
	register("initPlayerWaWaData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"coin": 0, "freeNum": 0, "buyNum": 0, "score": 0, "times": 0, "items": map[string]interface{}{}, "machine": 0}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onUpdateWaWaData", args: []interface{}{0, 0, 0, 0, 0, map[string]interface{}{}, 0}},
			},
		}
	})
	register("initNineFloorPanel", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"floor": 0, "currentF": 0, "lastGetTime": state.day}}
	})
	register("initMonthWelfarePanelData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"buy": 0, "day": state.day, "bag": []interface{}{}, "totalCost": 0}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onGetMonthlyWelfare", args: []interface{}{payload}},
			},
		}
	})
	register("initMoJinActData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"day": state.day, "flag": 0, "num": 0}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "refreshMoJinActData", args: []interface{}{payload}},
			},
		}
	})
	register("initManJiuJianPanelData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"day": state.day, "time": 0, "items": map[string]interface{}{}}}
	})
	register("initJuHuaSuanData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"day": state.day, "buyNum": 0, "items": map[string]interface{}{}}}
	})
	register("initHappyFrontLineData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{
			response: 0,
			callbacks: []legacyActivityCallback{
				{method: "onHappyFrontLineFresh", args: []interface{}{0}},
			},
		}
	})
	register("updateAnniversaryCrossRank", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onUpdateAnniRank", args: []interface{}{payload}},
			},
		}
	})
	register("tripleSyncRankList", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := []interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onSyncRankList", args: []interface{}{payload}},
			},
		}
	})
	register("trialsPanelInit", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := legacyTrialsPayload(state)
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onUpdateTrialsCharData", args: []interface{}{payload}},
			},
		}
	})
	register("teamCrossPKGetData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		emptyGroupState := func(date string) map[string]interface{} {
			return map[string]interface{}{"date": date, "state": 0}
		}
		payload := map[string]interface{}{
			"awardMap":       map[string]interface{}{},
			"awards":         map[string]interface{}{},
			"betAwardsItems": map[string]interface{}{},
			"betOpen":        false,
			"enroll":         nil,
			"finalPk": map[string]interface{}{
				"list": map[string]interface{}{},
				"state": map[string]interface{}{
					"A": emptyGroupState(""),
					"B": emptyGroupState(""),
					"C": emptyGroupState(""),
					"D": emptyGroupState(""),
				},
				"team":    map[string]interface{}{},
				"teamNum": map[string]interface{}{"A": 0, "B": 0, "C": 0, "D": 0},
			},
			"group":   "A",
			"nextb":   0,
			"oid":     "",
			"pk":      map[string]interface{}{"list": map[string]interface{}{}},
			"state":   nil,
			"team":    map[string]interface{}{},
			"teamNum": map[string]interface{}{"A": 0, "B": 0, "C": 0, "D": 0},
		}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onGetEnroll", args: []interface{}{map[string]interface{}{"tName": "", "type": 1}}},
			},
		}
	})
	register("summerGameMonopoly", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onMonopolyGetData", args: []interface{}{payload}},
			},
		}
	})
	register("summerGameHorseRace", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onHorseRaceGo", args: []interface{}{payload}},
			},
		}
	})
	register("stoneSealGetData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{}}
	})
	register("sthPlayIsInGroup", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: false}
	})
	register("loadFlopRank", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"rank": []interface{}{}, "myRank": -1}}
	})
	register("initPRSPanel", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"bag": []interface{}{}, "data": map[string]interface{}{}}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "updatePRSPanel", args: []interface{}{payload}},
			},
		}
	})
	register("hulaGetRankData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"rank": []interface{}{}}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onGetHulaData", args: []interface{}{payload}},
			},
		}
	})
	register("getWorldCupShopLimitDataTcn", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{
			response: 0,
			callbacks: []legacyActivityCallback{
				{method: "startWorldCupFreeShopByPveToClient", args: []interface{}{0}},
			},
		}
	})
	register("getWorldCupGoldPoint", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		if state.char == nil {
			return legacyStarterResponse{response: 0}
		}
		return legacyStarterResponse{response: state.char.GoldWorldCup}
	})
	register("getWelfareData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"day": state.day, "totalCost": 0, "bag": []interface{}{}}}
	})
	register("getWeightMasterData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{}}
	})
	register("getSmallGameStatus", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"flag": 0}}
	})
	register("getReturnRewardInfo", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"flag": 0, "data": map[string]interface{}{}, "time": 0}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onGetReturnRewardInfo", args: []interface{}{payload}},
			},
		}
	})
	register("getLuckDrawData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := []interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "updateLuckDrawBag", args: []interface{}{payload}},
			},
		}
	})
	register("getLotteryData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := []interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "updateLottoBag", args: []interface{}{payload}},
			},
		}
	})
	register("getGrouponInfo", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		conf := map[string]interface{}{}
		stat := map[string]interface{}{}
		return legacyStarterResponse{
			response: map[string]interface{}{"conf": conf, "stat": stat},
			callbacks: []legacyActivityCallback{
				{method: "updateGrouponConf", args: []interface{}{conf}},
				{method: "updateGrouponStat", args: []interface{}{stat}},
			},
		}
	})
	register("getFLottData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "showMazeLotteryPanel", args: []interface{}{payload}},
			},
		}
	})
	register("getCrossContentionTotalState", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := legacyCrossContentionPayload(state)
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onGetCrossContentionTotalState", args: []interface{}{payload}},
			},
		}
	})
	register("flopRestart", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		payload := map[string]interface{}{"flag": 0}
		return legacyStarterResponse{
			response: payload,
			callbacks: []legacyActivityCallback{
				{method: "onFlopRestart", args: []interface{}{payload}},
			},
		}
	})
	register("extractCardActivityGetData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"day": state.day, "data": map[string]interface{}{}}}
	})
	register("enterBloodyBattle", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: false}
	})
	register("dxdGetIn", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: false}
	})
	register("dotaGetRankAward", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: false}
	})
	register("dotaGetPanelData", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{}}
	})
	register("checkPVPLine", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: false}
	})
	register("canEnterTreasureHunt", func(state legacyActivityState, args []interface{}) legacyStarterResponse {
		return legacyStarterResponse{response: map[string]interface{}{"flag": false, "type": 0}}
	})
}

func (h *Handler) legacyStarterHandler(method string, builder func(legacyActivityState, []interface{}) legacyStarterResponse) rtmp.HandlerFunc {
	return func(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
		characterID, char, err := h.loadActivityCharacter(ctx, method)
		if err != nil {
			return nil, err
		}

		now := time.Now()
		state := legacyActivityState{
			now:  now,
			day:  legacyActivityDayStamp(now),
			char: char,
		}
		result := builder(state, args)
		for _, callback := range result.callbacks {
			h.sendActivityCallback(ctx, callback.method, callback.args...)
		}

		h.logger.Info(method+": returning legacy starter payload",
			zap.Uint32("conn_id", ctx.ConnID),
			zap.Int64("character_id", characterID))

		return result.response, nil
	}
}

func legacyStartedActList() []interface{} {
	result := make([]interface{}, 0, legacyStartedActivityCount)
	for id := 0; id < legacyStartedActivityCount; id++ {
		result = append(result, map[string]interface{}{
			"id":       id,
			"flag":     true,
			"sortType": id,
		})
	}
	return result
}

func (h *Handler) buildStartedActListPayload() []interface{} {
	if h == nil || h.startedActSvc == nil {
		return legacyStartedActList()
	}
	payload, err := h.startedActSvc.BuildStartedActList(context.Background())
	if err != nil {
		h.logger.Warn("getStartingActList: falling back to legacy stub",
			zap.Error(err))
		return legacyStartedActList()
	}
	if len(payload) == 0 {
		return legacyStartedActList()
	}
	return payload
}

func legacyAutoTaskPayload(state legacyActivityState) map[string]interface{} {
	return map[string]interface{}{
		"day":    state.day,
		"num":    0,
		"data":   map[string]interface{}{},
		"queue":  map[string]interface{}{},
		"finish": map[string]interface{}{},
	}
}

func legacyTreasureBowlPayload(state legacyActivityState) map[string]interface{} {
	return map[string]interface{}{
		"kp":                  0,
		"ts":                  state.now.UnixMilli(),
		"freeTime":            0,
		"goldTime":            0,
		"goldClgTime":         0,
		"awardTime":           0,
		"todayFloor":          -1,
		"gold4awardTimeDaily": "0",
		"ppvefloor":           0,
	}
}

func legacyTrialsPayload(state legacyActivityState) map[string]interface{} {
	return map[string]interface{}{
		"n":  0,
		"t":  state.now.UnixMilli(),
		"m":  0,
		"ut": state.day,
		"a":  map[string]interface{}{},
		"kt": map[string]interface{}{},
		"at": state.day,
		"sc": map[string]interface{}{},
		"nf": 0,
	}
}

func legacyCrossContentionPayload(state legacyActivityState) map[string]interface{} {
	base := map[string]interface{}{
		"timestr":   state.day,
		"validnum":  0,
		"fightnum":  0,
		"cdnum":     0,
		"fighttime": 0,
	}
	return map[string]interface{}{
		"PVE": cloneLegacyMap(base),
		"PVP": cloneLegacyMap(base),
	}
}

func cloneLegacyMap(source map[string]interface{}) map[string]interface{} {
	result := make(map[string]interface{}, len(source))
	for key, value := range source {
		result[key] = value
	}
	return result
}

func legacyActivityDayStamp(now time.Time) string {
	return fmt.Sprintf("%d|%d|%d", int(now.Month()), now.Day(), now.Year()%10)
}
