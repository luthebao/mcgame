// Open-sourced by BaoLT

// Activity config application service for building client startedActList payloads.
package activity

import (
	"context"
	"errors"

	domainactivity "mcgame-server/internal/domain/activity"
	pkgerrors "mcgame-server/pkg/errors"
)

type StartedActivityService struct {
	repo domainactivity.ActivityConfigRepository
}

func NewStartedActivityService(repo domainactivity.ActivityConfigRepository) *StartedActivityService {
	return &StartedActivityService{repo: repo}
}

func (s *StartedActivityService) BuildStartedActList(ctx context.Context) ([]interface{}, error) {
	if s == nil || s.repo == nil {
		return []interface{}{}, nil
	}

	configs, err := s.repo.List(ctx)
	if err != nil {
		return nil, err
	}

	return buildStartedActEntries(configs), nil
}

func (s *StartedActivityService) BuildStartedActListIfLevelGateCrossed(ctx context.Context, oldLevel, newLevel int) ([]interface{}, bool, error) {
	if s == nil || s.repo == nil {
		return nil, false, nil
	}
	if newLevel <= oldLevel {
		return nil, false, nil
	}

	configs, err := s.repo.List(ctx)
	if err != nil {
		return nil, false, err
	}

	if !anyLevelGateCrossed(configs, oldLevel, newLevel) {
		return nil, false, nil
	}

	return buildStartedActEntries(configs), true, nil
}

func buildStartedActEntries(configs []*domainactivity.ActivityConfig) []interface{} {
	result := make([]interface{}, 0, len(configs))
	for _, config := range configs {
		if config == nil {
			continue
		}
		result = append(result, config.StartedActEntry())
	}
	return result
}

func anyLevelGateCrossed(configs []*domainactivity.ActivityConfig, oldLevel, newLevel int) bool {
	for _, config := range configs {
		if config == nil || !config.Enable || config.Type != 2 {
			continue
		}
		threshold := config.Flag
		if threshold > oldLevel && threshold <= newLevel {
			return true
		}
	}
	return false
}

type ChangeViewResult struct {
	Entry    map[string]interface{}
	Found    bool
	Fallback bool
}

func (s *StartedActivityService) BuildChangeViewEntry(ctx context.Context, id int) (ChangeViewResult, error) {
	if s == nil || s.repo == nil {
		return ChangeViewResult{}, nil
	}

	config, err := s.repo.Get(ctx, id)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrNotFound) {
			return ChangeViewResult{}, nil
		}
		return ChangeViewResult{}, err
	}

	entry, fallback := config.ChangeViewEntry()
	return ChangeViewResult{
		Entry:    entry,
		Found:    true,
		Fallback: fallback,
	}, nil
}
