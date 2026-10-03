// Open-sourced by BaoLT

// DailyActService manages per-character daily activity state: diary task counters,
// vitality (activity) points, online-time tracking, and the one-per-day award claim.
// It implements events.LoginListener so the event bus fires OnLogin on first login of day.
package activity

import (
	"context"
	"fmt"
	"strconv"
	"sync"
	"time"

	domaindailyact "mcgame-server/internal/domain/dailyact"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type DailyActItemGranter interface {
	AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error)
}

type DailyActBroadcaster interface {
	BroadcastToCharacter(characterID int64, method string, payload interface{}) error
}

type DailyActService struct {
	repo        domaindailyact.Repository
	awardRepo   domaindailyact.AwardRepository
	itemGranter DailyActItemGranter
	broadcaster DailyActBroadcaster
	gameData    *gamedata.Manager
	logger      *zap.Logger

	awardsMu sync.RWMutex
	awards   []*domaindailyact.AwardTier
}

func NewDailyActService(
	repo domaindailyact.Repository,
	awardRepo domaindailyact.AwardRepository,
	itemGranter DailyActItemGranter,
	gameData *gamedata.Manager,
	logger *zap.Logger,
) *DailyActService {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &DailyActService{
		repo:        repo,
		awardRepo:   awardRepo,
		itemGranter: itemGranter,
		gameData:    gameData,
		logger:      logger,
	}
}

func (s *DailyActService) SetBroadcaster(b DailyActBroadcaster) {
	s.broadcaster = b
}

func today() time.Time {
	now := time.Now()
	return time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
}

func (s *DailyActService) GetState(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	rec, err := s.repo.Get(ctx, characterID, today())
	if err != nil {
		return nil, err
	}

	out := make(map[string]interface{}, len(rec.TaskCounts)+2)
	for taskID, count := range rec.TaskCounts {
		out[taskID] = int64(count)
	}
	out["act"] = int64(rec.VitalityPoints)
	out["ad"] = rec.AwardClaimed
	return out, nil
}

func (s *DailyActService) GetTodayOnlineSeconds(ctx context.Context, characterID int64) (int64, error) {
	rec, err := s.repo.Get(ctx, characterID, today())
	if err != nil {
		return 0, err
	}
	if rec.FirstLoginAt == nil {
		return 0, nil
	}
	elapsed := time.Since(*rec.FirstLoginAt).Seconds()
	if elapsed < 0 {
		elapsed = 0
	}
	return int64(rec.OnlineSecondsOffline) + int64(elapsed), nil
}

func (s *DailyActService) OnLogin(ctx context.Context, charID int64) error {
	day := today()
	firstToday, _, err := s.repo.TouchLogin(ctx, charID, day, time.Now())
	if err != nil {
		return fmt.Errorf("daily_act touch_login: %w", err)
	}
	if !firstToday {
		return nil
	}

	const dailyLoginTaskID = "29"
	template := s.lookupDiaryTemplate(dailyLoginTaskID)
	actDelta := 1
	if template != nil {
		actDelta = int(template.Act)
	}

	newCount, vitality, _, err := s.repo.IncrementTask(ctx, charID, day, dailyLoginTaskID, 1, actDelta)
	if err != nil {
		return fmt.Errorf("daily_act increment_task: %w", err)
	}

	s.broadcastUpdate(charID, dailyLoginTaskID, newCount, vitality, actDelta)
	return nil
}

func (s *DailyActService) lookupDiaryTemplate(taskID string) *models.DiaryTemplate {
	if s.gameData == nil {
		return nil
	}
	id, err := strconv.ParseInt(taskID, 10, 64)
	if err != nil {
		return nil
	}
	return s.gameData.GetDiary(int(id))
}

func (s *DailyActService) broadcastUpdate(charID int64, taskID string, newCount, vitality, delta int) {
	if s.broadcaster == nil {
		return
	}
	payload := map[string]interface{}{
		"id":  taskID,
		"val": int64(newCount),
		"act": int64(vitality),
		"num": int64(delta),
	}
	if err := s.broadcaster.BroadcastToCharacter(charID, "updateDiaryData", payload); err != nil {
		s.logger.Warn("daily_act updateDiaryData broadcast failed",
			zap.Int64("character_id", charID),
			zap.String("task_id", taskID),
			zap.Error(err))
	}
}

func (s *DailyActService) ClaimAward(ctx context.Context, characterID int64, tier int16) (bool, error) {
	if !domaindailyact.ValidTier(tier) {
		return false, fmt.Errorf("invalid tier %d", tier)
	}

	tiers, err := s.loadAwards(ctx)
	if err != nil {
		return false, err
	}

	var match *domaindailyact.AwardTier
	for _, t := range tiers {
		if t.Tier == tier {
			match = t
			break
		}
	}
	if match == nil {
		return false, fmt.Errorf("tier %d not configured", tier)
	}

	day := today()
	success, vitality, err := s.repo.ClaimAward(ctx, characterID, day, tier)
	if err != nil {
		return false, err
	}
	if !success {
		s.logger.Info("daily_act claim rejected",
			zap.Int64("character_id", characterID),
			zap.Int16("tier", tier),
			zap.Int("vitality", vitality))
		return false, nil
	}

	if s.itemGranter != nil {
		if _, grantErr := s.itemGranter.AddItemWithBind(ctx, characterID, int(match.ItemID), domainitem.ItemTypeConsumable, match.Quantity, match.Bound); grantErr != nil {
			reverted, revertErr := s.repo.RevertAward(ctx, characterID, day, tier)
			if revertErr != nil {
				s.logger.Error("daily_act award revert failed - manual fix required",
					zap.Int64("character_id", characterID),
					zap.Int16("tier", tier),
					zap.Int64("item_id", match.ItemID),
					zap.Int("quantity", match.Quantity),
					zap.NamedError("grant_error", grantErr),
					zap.NamedError("revert_error", revertErr))
			} else {
				s.logger.Error("daily_act award rolled back after item grant failure",
					zap.Int64("character_id", characterID),
					zap.Int16("tier", tier),
					zap.Int64("item_id", match.ItemID),
					zap.Bool("reverted", reverted),
					zap.NamedError("grant_error", grantErr))
			}
			return false, nil
		}
	}

	s.logger.Info("daily_act award claimed",
		zap.Int64("character_id", characterID),
		zap.Int16("tier", tier),
		zap.Int("vitality", vitality),
		zap.Int64("item_id", match.ItemID),
		zap.Int("quantity", match.Quantity))

	return true, nil
}

func (s *DailyActService) loadAwards(ctx context.Context) ([]*domaindailyact.AwardTier, error) {
	s.awardsMu.RLock()
	cached := s.awards
	s.awardsMu.RUnlock()
	if cached != nil {
		return cached, nil
	}

	s.awardsMu.Lock()
	defer s.awardsMu.Unlock()
	if s.awards != nil {
		return s.awards, nil
	}

	tiers, err := s.awardRepo.List(ctx)
	if err != nil {
		return nil, fmt.Errorf("list daily_act award tiers: %w", err)
	}
	s.awards = tiers
	return tiers, nil
}
