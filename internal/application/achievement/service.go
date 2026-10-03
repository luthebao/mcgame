// Open-sourced by BaoLT

// Achievement service loads client-facing progress snapshots and registers login hooks.
package achievement

import (
	"context"
	"fmt"
	"strconv"
	"time"

	appevents "mcgame-server/internal/application/events"
	domainachievement "mcgame-server/internal/domain/achievement"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

type Service struct {
	repo            domainachievement.Repository
	gameDataManager *gamedata.Manager
	logger          *zap.Logger
}

type ClaimResult struct {
	AchievementID int64
	ClaimCount    int
}

func NewService(repo domainachievement.Repository, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}

	return &Service{
		repo:   repo,
		logger: logger,
	}
}

func (s *Service) SetGameDataManager(manager *gamedata.Manager) {
	s.gameDataManager = manager
}

func (s *Service) SetEventBus(bus *appevents.Bus) {
	if bus == nil {
		return
	}

	bus.Register(s)
}

func (s *Service) LoadSnapshot(ctx context.Context, charID int64) (domainachievement.Snapshot, error) {
	snapshot := domainachievement.Snapshot{
		AchieveLog:          map[string]interface{}{},
		AchieveReqLog:       map[string]interface{}{},
		TakeAchieveAwardLog: map[string]interface{}{},
	}

	if s.repo == nil {
		return snapshot, nil
	}

	rows, err := s.repo.GetProgressByCharacter(ctx, charID)
	if err != nil {
		return snapshot, err
	}

	for _, progress := range rows {
		if progress == nil {
			continue
		}

		key := strconv.FormatInt(progress.AchievementID, 10)
		target := s.resolveTarget(progress)
		current := progress.Progress
		if progress.IsCompleted && current < target {
			current = target
		}

		if progress.IsCompleted {
			snapshot.AchieveLog[key] = s.resolveCompletionTimestamp(progress)
			snapshot.AchievementPoints += s.resolveAchievementPoints(progress.AchievementID)
		}

		if progress.IsClaimed {
			snapshot.TakeAchieveAwardLog[key] = 1
		}

		if current > 0 || target > 0 {
			snapshot.AchieveReqLog[key] = map[string]interface{}{
				"done":     target,
				"progress": current,
			}
		}
	}

	return snapshot, nil
}

func (s *Service) ClaimReward(ctx context.Context, charID, achievementID int64) (ClaimResult, error) {
	result := ClaimResult{AchievementID: achievementID}
	if s.repo == nil {
		return result, fmt.Errorf("achievement repository not configured")
	}

	progressRows, err := s.repo.GetProgressByCharacter(ctx, charID)
	if err != nil {
		return result, err
	}

	var progress *domainachievement.Progress
	for _, row := range progressRows {
		if row != nil && row.AchievementID == achievementID {
			progress = row
			break
		}
	}

	if progress == nil {
		return result, fmt.Errorf("achievement progress not found")
	}
	if !progress.IsCompleted {
		return result, fmt.Errorf("achievement is not completed")
	}
	if progress.IsClaimed {
		return result, fmt.Errorf("achievement reward already claimed")
	}

	updated, err := s.repo.MarkClaimed(ctx, charID, achievementID, time.Now().UTC())
	if err != nil {
		return result, err
	}
	if updated != nil && updated.IsClaimed {
		result.ClaimCount = 1
	}

	return result, nil
}

func (s *Service) OnLogin(ctx context.Context, charID int64) error {
	return nil
}

func (s *Service) resolveTarget(progress *domainachievement.Progress) int {
	if progress == nil {
		return 0
	}
	if progress.Target > 0 {
		return progress.Target
	}
	if s.gameDataManager == nil {
		return progress.Progress
	}

	requirements := s.gameDataManager.GetAchievementRequiresByAchievementID(int(progress.AchievementID))
	if len(requirements) == 0 {
		return progress.Progress
	}

	return int(requirements[0].Num)
}

func (s *Service) resolveCompletionTimestamp(progress *domainachievement.Progress) int64 {
	if progress != nil && progress.CompletedAt != nil {
		timestamp := progress.CompletedAt.UnixMilli()
		if timestamp > 999999 {
			return timestamp
		}
	}

	return 1000000
}

func (s *Service) resolveAchievementPoints(achievementID int64) int {
	if s.gameDataManager == nil {
		return 0
	}

	template := s.gameDataManager.GetAchievement(int(achievementID))
	if template == nil {
		return 0
	}

	return int(template.Award)
}
