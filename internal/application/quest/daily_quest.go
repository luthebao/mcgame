// Open-sourced by BaoLT

// Type-6 (Mỗi ngày) daily re-take semantics (plan §11.2). A completed daily
// quest's character_quests row is deleted immediately (service.go
// CompleteQuest), so "already completed" must be re-derived from
// quest_history and is only true for completions made today; older
// completions must not block re-take. Type-7 loop rounds never reach
// quest_history at all (completeLoopChildQuest skips RecordHistory
// entirely), so the loop-child exclusion below is a defensive backstop.
package quest

import (
	"context"
	"sort"
	"time"

	"mcgame-server/internal/gamedata/predef"
)

// completionDateRepository is an optional capability of quest.Repository:
// only concrete repos backed by quest_history (postgres.QuestRepository and
// its cache.CachedQuestRepository wrapper) implement it. Repos in tests that
// don't implement it simply fall back to the undated completed-ID list.
type completionDateRepository interface {
	GetCompletedQuestIDsWithDate(ctx context.Context, characterID int64) (map[int]time.Time, error)
}

func startOfToday() time.Time {
	now := time.Now()
	return time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
}

// GetCompletedQuestIDs returns quest IDs that should gate re-take/prereqs.
// The raw repo list comes from quest_history and therefore contains every
// type-6 daily ever finished; when completion dates are available, dailies
// are dropped from the base list and re-added only if completed today, so
// yesterday's completion never blocks a re-take. Without a dated provider
// the undated list is kept as-is (conservative fallback).
func (s *Service) GetCompletedQuestIDs(ctx context.Context, charID int64) ([]int, error) {
	baseIDs, err := s.questRepo.GetCompletedQuestIDs(ctx, charID)
	if err != nil {
		return nil, err
	}
	if s.gameDataManager == nil {
		return baseIDs, nil
	}

	var withDates map[int]time.Time
	hasDates := false
	if provider, ok := s.questRepo.(completionDateRepository); ok {
		withDates, err = provider.GetCompletedQuestIDsWithDate(ctx, charID)
		if err != nil {
			s.logger.Warn("Failed to load dated quest completions; daily re-take gating skipped")
			withDates = nil
		} else {
			hasDates = true
		}
	}

	seen := make(map[int]bool, len(baseIDs))
	result := make([]int, 0, len(baseIDs))
	for _, id := range baseIDs {
		if tpl := s.gameDataManager.GetQuest(id); tpl != nil {
			if int(tpl.Type) == predef.QuestTypeLoop {
				continue
			}
			if hasDates && int(tpl.Type) == predef.QuestTypeDaily {
				continue
			}
		}
		seen[id] = true
		result = append(result, id)
	}

	if hasDates {
		todayStart := startOfToday()
		for questID, completedAt := range withDates {
			if seen[questID] {
				continue
			}
			tpl := s.gameDataManager.GetQuest(questID)
			if tpl == nil || int(tpl.Type) != predef.QuestTypeDaily {
				continue
			}
			if completedAt.Before(todayStart) {
				continue
			}
			seen[questID] = true
			result = append(result, questID)
		}
	}

	sort.Ints(result)
	return result, nil
}
