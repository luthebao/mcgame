// Open-sourced by BaoLT

// Pet PVE panel operations beyond floor progression: panel init (with daily
// reset), pet-group config persistence, gold-purchased extra challenges, and the
// free / gold KP exchanges. All non-challenge mutations persist the full feature
// state via UpsertCharacterFeatureState; the challengeNextFloor path stays on the
// atomic player.ppve_challenge_next_floor DB function, which shallow-merges so
// these fields survive a floor advance. Currency (gold / vàng) is mutated directly
// on the character (char.Gold) + chars.Update, matching the codebase pattern.
//
// Daily counters reset off two independent day markers so a reset is applied no
// matter which path (panel open vs. challenge) runs first on a new day:
//   - lastResetDay  governs freeTime / todayFloor (also managed by the DB function)
//   - lastDailyDay  governs goldTime / goldClgTime / awardTime / gold4awardTimeDaily
//
// Free-exchange KP magnitude is game-data driven: TBL_CARVE_AWARD row (PPVEFloor+1,
// clamped to 150) freeExchagne, mirroring the client setPPFloorAward(ppvefloor+1)
// lookup; freeKPAward falls back to ppveFreeKPAward when gameData is unwired or the
// row is missing. The gold exchange (25 vàng -> 50 KP) and the extra-challenge cost
// tiers [10,20,50] are confirmed from the client.
package pet

import (
	"context"
	"errors"
	"time"

	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const (
	ppveKPByGoldCost  = 25
	ppveKPByGoldYield = 50
	ppveFreeKPAward   = 50
)

var ppveAddtionCost = [3]int{10, 20, 50}

var (
	ErrPPVEInsufficientGold    = errors.New("ppve: not enough gold")
	ErrPPVENoFreeExchange      = errors.New("ppve: no free exchange remaining")
	ErrPPVEChallengeCapReached = errors.New("ppve: daily extra-challenge purchase cap reached")
	ErrPPVEServiceConfig       = errors.New("ppve: service not configured")
)

func ppveToday() string {
	return time.Now().Format("2006-01-02")
}

type PPVEGameData interface {
	GetCarveAward(id int) *models.CarveAwardTemplate
}

func (s *PPVEService) SetGameData(g PPVEGameData) {
	if s == nil {
		return
	}
	s.gameData = g
}

func (s *PPVEService) freeKPAward(state *PPVEState) int {
	if s == nil || s.gameData == nil || state == nil {
		return ppveFreeKPAward
	}
	id := state.PPVEFloor + 1
	if id > PPVEMaxFloor {
		id = PPVEMaxFloor
	}
	if id < 1 {
		id = 1
	}
	row := s.gameData.GetCarveAward(id)
	if row == nil {
		return ppveFreeKPAward
	}
	return int(row.FreeExchagne)
}

func (s *PPVEService) saveState(ctx context.Context, charID int64, state *PPVEState) error {
	if s == nil || s.repo == nil {
		return ErrPPVEServiceConfig
	}
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeaturePetPVE,
		State:       encodePPVEState(state),
	})
}

func (s *PPVEService) logState(charID int64, op string, err error) {
	if s == nil || s.logger == nil {
		return
	}
	s.logger.Error("ppve: gold deducted but panel state save failed; counters not persisted",
		zap.Int64("character_id", charID),
		zap.String("op", op),
		zap.Error(err))
}

func applyPPVEDailyReset(state *PPVEState, today string) bool {
	changed := false
	if state.LastResetDay != today {
		state.FreeTime = PPVEFreeChallenges
		state.TodayFloor = -1
		state.LastResetDay = today
		changed = true
	}
	if state.LastDailyDay != today {
		state.GoldTime = 0
		state.GoldClgTime = 0
		state.AwardTime = PPVEFreeExchanges
		state.Gold4AwardTimeDaily = 0
		state.LastDailyDay = today
		changed = true
	}
	return changed
}

func (s *PPVEService) KPData(state *PPVEState) map[string]interface{} {
	return map[string]interface{}{
		"ppvefloor":           state.PPVEFloor,
		"kp":                  state.KP,
		"freeTime":            state.FreeTime,
		"goldTime":            state.GoldTime,
		"goldClgTime":         state.GoldClgTime,
		"awardTime":           state.AwardTime,
		"gold4awardTimeDaily": state.Gold4AwardTimeDaily,
	}
}

func (s *PPVEService) PPVEData(state *PPVEState) map[string]interface{} {
	p := state.P
	if p == nil {
		p = map[string]interface{}{}
	}
	config := state.PPVEConfig
	if config == nil {
		config = map[string]interface{}{}
	}
	return map[string]interface{}{
		"p":          p,
		"mlv":        state.MasterLevel,
		"ppveConfig": config,
	}
}

func (s *PPVEService) InitPanel(ctx context.Context, charID int64) (*PPVEState, error) {
	state, err := s.LoadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	if applyPPVEDailyReset(state, ppveToday()) {
		if err := s.saveState(ctx, charID, state); err != nil {
			return nil, err
		}
	}
	return state, nil
}

func (s *PPVEService) SaveConfig(ctx context.Context, charID int64, config map[string]interface{}) (*PPVEState, error) {
	state, err := s.LoadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	applyPPVEDailyReset(state, ppveToday())
	if config == nil {
		config = map[string]interface{}{}
	}
	state.PPVEConfig = config
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *PPVEService) IncreaseChallengeTime(ctx context.Context, charID int64) (*PPVEState, error) {
	state, err := s.LoadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	applyPPVEDailyReset(state, ppveToday())

	if state.GoldTime < 0 {
		state.GoldTime = 0
	}
	if state.GoldTime >= len(ppveAddtionCost) {
		return nil, ErrPPVEChallengeCapReached
	}
	cost := int64(ppveAddtionCost[state.GoldTime])

	char, err := s.chars.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, ErrPPVEServiceConfig
	}
	if char.Gold < cost {
		return nil, ErrPPVEInsufficientGold
	}
	char.Gold -= cost
	if err := s.chars.Update(ctx, char); err != nil {
		return nil, err
	}

	state.GoldTime++
	state.GoldClgTime++
	state.FreeTime++
	if err := s.saveState(ctx, charID, state); err != nil {
		s.logState(charID, "increaseChallengeTime", err)
		return nil, err
	}
	return state, nil
}

func (s *PPVEService) ExchangeKPFree(ctx context.Context, charID int64) (*PPVEState, error) {
	state, err := s.LoadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	applyPPVEDailyReset(state, ppveToday())
	if state.AwardTime <= 0 {
		return nil, ErrPPVENoFreeExchange
	}
	state.AwardTime--
	state.KP += s.freeKPAward(state)
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, err
	}
	return state, nil
}

func (s *PPVEService) ExchangeKPByGold(ctx context.Context, charID int64) (*PPVEState, error) {
	state, err := s.LoadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	applyPPVEDailyReset(state, ppveToday())

	char, err := s.chars.FindByID(ctx, charID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, ErrPPVEServiceConfig
	}
	if char.Gold < ppveKPByGoldCost {
		return nil, ErrPPVEInsufficientGold
	}
	char.Gold -= ppveKPByGoldCost
	if err := s.chars.Update(ctx, char); err != nil {
		return nil, err
	}

	state.Gold4AwardTimeDaily++
	state.KP += ppveKPByGoldYield
	if err := s.saveState(ctx, charID, state); err != nil {
		s.logState(charID, "exchangeKPByGold", err)
		return nil, err
	}
	return state, nil
}
