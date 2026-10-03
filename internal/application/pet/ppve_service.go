// Open-sourced by BaoLT

// PPVEService manages Pet PVE tower floor progression state for a character.
// Floor advances are persisted atomically via player.ppve_challenge_next_floor which holds FOR UPDATE.
// Full combat resolution is not implemented; see open questions in docs/memory/pet_ppve.md.
package pet

import (
	"context"
	"errors"
	"fmt"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const (
	PPVEMaxFloor       = 150
	PPVEFreeChallenges = 3
	PPVEFreeExchanges  = 1
	PPVERankLimit      = 50
)

var ErrNoFreeChallenges = domainfeature.ErrPPVENoFreeChallenges
var ErrAlreadyMaxFloor = domainfeature.ErrPPVEMaxFloor

type PPVEState struct {
	PPVEFloor           int                    `json:"ppvefloor"`
	TodayFloor          int                    `json:"todayFloor"`
	KP                  int                    `json:"kp"`
	FreeTime            int                    `json:"freeTime"`
	GoldTime            int                    `json:"goldTime"`
	GoldClgTime         int                    `json:"goldClgTime"`
	AwardTime           int                    `json:"awardTime"`
	Gold4AwardTimeDaily int                    `json:"gold4awardTimeDaily"`
	MasterLevel         int                    `json:"mlv"`
	LastResetDay        string                 `json:"lastResetDay"`
	LastDailyDay        string                 `json:"lastDailyDay"`
	P                   map[string]interface{} `json:"p"`
	PPVEConfig          map[string]interface{} `json:"ppveConfig"`
}

type PPVERankEntry struct {
	CID      string `json:"cid"`
	ClassID  string `json:"classId"`
	FloorNum int    `json:"floorNum"`
	Level    int    `json:"level"`
	Name     string `json:"name"`
}

type PPVEChallengeResult struct {
	State    *PPVEState
	FloorNum int
	ReplayID string
	RankList []PPVERankEntry
	MyRank   int
}

type PPVERankProvider interface {
	PPVEGetRank(ctx context.Context, charID int64, limit int) (*domainfeature.PPVERankResult, error)
}

type PPVEService struct {
	repo     domainfeature.Repository
	chars    domainchar.Repository
	gameData PPVEGameData
	rank     PPVERankProvider
	logger   *zap.Logger
}

func NewPPVEService(repo domainfeature.Repository, chars domainchar.Repository, logger *zap.Logger) *PPVEService {
	return &PPVEService{repo: repo, chars: chars, logger: logger}
}

func (s *PPVEService) SetRankProvider(p PPVERankProvider) {
	if s == nil || p == nil {
		return
	}
	s.rank = p
}

func (s *PPVEService) GetRank(ctx context.Context, charID int64, limit int) ([]PPVERankEntry, int, error) {
	if s == nil || s.rank == nil {
		return []PPVERankEntry{}, -1, nil
	}
	res, err := s.rank.PPVEGetRank(ctx, charID, limit)
	if err != nil {
		return nil, -1, err
	}
	if res == nil {
		return []PPVERankEntry{}, -1, nil
	}
	entries := make([]PPVERankEntry, 0, len(res.Entries))
	for _, e := range res.Entries {
		entries = append(entries, PPVERankEntry{
			CID:      e.CID,
			ClassID:  e.ClassID,
			FloorNum: e.FloorNum,
			Level:    e.Level,
			Name:     e.Name,
		})
	}
	return entries, res.MyRank, nil
}

func (s *PPVEService) LoadState(ctx context.Context, charID int64) (*PPVEState, error) {
	if s == nil || s.repo == nil {
		return defaultPPVEState(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("ppve: load feature state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeaturePetPVE {
			continue
		}
		return decodePPVEState(st.State), nil
	}
	return defaultPPVEState(), nil
}

func (s *PPVEService) ChallengeNextFloor(ctx context.Context, charID int64) (*PPVEChallengeResult, error) {
	if s == nil || s.repo == nil {
		return nil, fmt.Errorf("ppve: repository not configured")
	}

	today := time.Now().Format("2006-01-02")

	dbResult, err := s.repo.PPVEChallengeNextFloor(ctx, charID, PPVEMaxFloor, PPVEFreeChallenges, today)
	if err != nil {
		if errors.Is(err, domainfeature.ErrPPVEMaxFloor) || errors.Is(err, domainfeature.ErrPPVENoFreeChallenges) {
			return nil, err
		}
		return nil, fmt.Errorf("ppve: challenge floor db: %w", err)
	}

	state, loadErr := s.LoadState(ctx, charID)
	if loadErr != nil || state == nil {
		state = &PPVEState{
			PPVEFloor:    dbResult.NewFloor,
			TodayFloor:   dbResult.TodayFloor,
			FreeTime:     dbResult.FreeTime,
			LastResetDay: dbResult.LastResetDay,
		}
	}

	now := time.Now()
	replayID := fmt.Sprintf("%d_%d", now.UnixMilli(), charID)

	rankList, myRank, rankErr := s.GetRank(ctx, charID, PPVERankLimit)
	if rankErr != nil {
		if s.logger != nil {
			s.logger.Warn("ppve: rank fetch failed after challenge", zap.Int64("character_id", charID), zap.Error(rankErr))
		}
		rankList, myRank = []PPVERankEntry{}, -1
	}

	return &PPVEChallengeResult{
		State:    state,
		FloorNum: dbResult.NewFloor,
		ReplayID: replayID,
		RankList: rankList,
		MyRank:   myRank,
	}, nil
}

func defaultPPVEState() *PPVEState {
	return &PPVEState{
		PPVEFloor:           0,
		TodayFloor:          -1,
		KP:                  0,
		FreeTime:            PPVEFreeChallenges,
		GoldTime:            0,
		GoldClgTime:         0,
		AwardTime:           PPVEFreeExchanges,
		Gold4AwardTimeDaily: 0,
		MasterLevel:         0,
		LastResetDay:        "",
		LastDailyDay:        "",
		P:                   map[string]interface{}{},
		PPVEConfig:          map[string]interface{}{},
	}
}

func decodePPVEState(m map[string]interface{}) *PPVEState {
	s := defaultPPVEState()
	if v, ok := m["ppvefloor"]; ok {
		if n, ok := toInt(v); ok {
			s.PPVEFloor = n
		}
	}
	if v, ok := m["todayFloor"]; ok {
		if n, ok := toInt(v); ok {
			s.TodayFloor = n
		}
	}
	if v, ok := m["kp"]; ok {
		if n, ok := toInt(v); ok {
			s.KP = n
		}
	}
	if v, ok := m["freeTime"]; ok {
		if n, ok := toInt(v); ok {
			s.FreeTime = n
		}
	}
	if v, ok := m["goldTime"]; ok {
		if n, ok := toInt(v); ok {
			s.GoldTime = n
		}
	}
	if v, ok := m["goldClgTime"]; ok {
		if n, ok := toInt(v); ok {
			s.GoldClgTime = n
		}
	}
	if v, ok := m["awardTime"]; ok {
		if n, ok := toInt(v); ok {
			s.AwardTime = n
		}
	}
	if v, ok := m["gold4awardTimeDaily"]; ok {
		if n, ok := toInt(v); ok {
			s.Gold4AwardTimeDaily = n
		}
	}
	if v, ok := m["mlv"]; ok {
		if n, ok := toInt(v); ok {
			s.MasterLevel = n
		}
	}
	if v, ok := m["lastResetDay"]; ok {
		if str, ok := v.(string); ok {
			s.LastResetDay = str
		}
	}
	if v, ok := m["lastDailyDay"]; ok {
		if str, ok := v.(string); ok {
			s.LastDailyDay = str
		}
	}
	if v, ok := m["p"]; ok {
		if mp, ok := v.(map[string]interface{}); ok {
			s.P = mp
		}
	}
	if v, ok := m["ppveConfig"]; ok {
		if mp, ok := v.(map[string]interface{}); ok {
			s.PPVEConfig = mp
		}
	}
	return s
}

func encodePPVEState(s *PPVEState) map[string]interface{} {
	p := s.P
	if p == nil {
		p = map[string]interface{}{}
	}
	config := s.PPVEConfig
	if config == nil {
		config = map[string]interface{}{}
	}
	return map[string]interface{}{
		"ppvefloor":           s.PPVEFloor,
		"todayFloor":          s.TodayFloor,
		"kp":                  s.KP,
		"freeTime":            s.FreeTime,
		"goldTime":            s.GoldTime,
		"goldClgTime":         s.GoldClgTime,
		"awardTime":           s.AwardTime,
		"gold4awardTimeDaily": s.Gold4AwardTimeDaily,
		"mlv":                 s.MasterLevel,
		"lastResetDay":        s.LastResetDay,
		"lastDailyDay":        s.LastDailyDay,
		"p":                   p,
		"ppveConfig":          config,
	}
}

func toInt(v interface{}) (int, bool) {
	switch n := v.(type) {
	case float64:
		return int(n), true
	case int:
		return n, true
	case int64:
		return int(n), true
	}
	return 0, false
}
