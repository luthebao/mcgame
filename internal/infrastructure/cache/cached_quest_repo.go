// Open-sourced by BaoLT

// CachedQuestRepository wraps quest.Repository with caching.
// Save writes to DB for new quests (needs ID), updates cache for existing.
// Delete tracks deleted IDs for batch persistence.
package cache

import (
	"context"
	"time"

	"mcgame-server/internal/domain/quest"
)

type CachedQuestRepository struct {
	cache    *PlayerCache
	delegate quest.Repository
}

func NewCachedQuestRepository(cache *PlayerCache, delegate quest.Repository) *CachedQuestRepository {
	return &CachedQuestRepository{cache: cache, delegate: delegate}
}

func (r *CachedQuestRepository) Save(ctx context.Context, progress *quest.QuestProgress) error {
	if progress.ID == 0 {
		if err := r.delegate.Save(ctx, progress); err != nil {
			return err
		}
		if data := r.cache.GetPlayer(progress.CharacterID); data != nil {
			data.AddQuestWithoutDirty(progress)
		}
		r.refreshColdQuest(ctx, progress)
		return nil
	}
	if data := r.cache.GetPlayer(progress.CharacterID); data != nil {
		data.SetQuest(progress)
		r.refreshColdQuest(ctx, progress)
		return nil
	}
	if err := r.delegate.Save(ctx, progress); err != nil {
		return err
	}
	r.refreshColdQuest(ctx, progress)
	return nil
}

func (r *CachedQuestRepository) refreshColdQuest(ctx context.Context, progress *quest.QuestProgress) {
	if r.cache.coldLoader == nil || progress == nil || progress.ID == 0 {
		return
	}
	questMap, err := r.cache.coldLoader.GetQuests(ctx, progress.CharacterID)
	if err != nil || questMap == nil {
		return
	}
	questMap[progress.ID] = progress
	_ = r.cache.coldLoader.SaveQuests(ctx, progress.CharacterID, questMap)
}

func (r *CachedQuestRepository) FindByID(ctx context.Context, id int64) (*quest.QuestProgress, error) {
	r.cache.mu.RLock()
	for _, data := range r.cache.activeSessions {
		if q := data.GetQuest(id); q != nil {
			r.cache.mu.RUnlock()
			return q, nil
		}
	}
	r.cache.mu.RUnlock()
	return r.delegate.FindByID(ctx, id)
}

func (r *CachedQuestRepository) FindByCharacterAndQuest(ctx context.Context, characterID int64, questID int) (*quest.QuestProgress, error) {
	if r.cache.coldLoader != nil {
		questMap, err := r.cache.coldLoader.GetQuests(ctx, characterID)
		if err == nil && questMap != nil {
			for _, q := range questMap {
				if q.QuestID == questID {
					return q, nil
				}
			}
			return nil, nil
		}
	}

	if data := r.cache.GetPlayer(characterID); data != nil {
		quests := data.GetQuests()
		for _, q := range quests {
			if q.QuestID == questID {
				return q, nil
			}
		}
		return nil, nil
	}
	return r.delegate.FindByCharacterAndQuest(ctx, characterID, questID)
}

func (r *CachedQuestRepository) FindActiveByCharacter(ctx context.Context, characterID int64) ([]*quest.QuestProgress, error) {
	if r.cache.coldLoader != nil {
		questMap, err := r.cache.coldLoader.GetQuests(ctx, characterID)
		if err == nil && questMap != nil {
			var result []*quest.QuestProgress
			for _, q := range questMap {
				if q.Status == quest.QuestStatusActive {
					result = append(result, q)
				}
			}
			return result, nil
		}
	}

	if data := r.cache.GetPlayer(characterID); data != nil {
		quests := data.GetQuests()
		var result []*quest.QuestProgress
		for _, q := range quests {
			if q.Status == quest.QuestStatusActive {
				result = append(result, q)
			}
		}
		return result, nil
	}
	return r.delegate.FindActiveByCharacter(ctx, characterID)
}

func (r *CachedQuestRepository) FindCompletedByCharacter(ctx context.Context, characterID int64) ([]*quest.QuestProgress, error) {
	if r.cache.coldLoader != nil {
		questMap, err := r.cache.coldLoader.GetQuests(ctx, characterID)
		if err == nil && questMap != nil {
			var result []*quest.QuestProgress
			for _, q := range questMap {
				if q.Status == quest.QuestStatusCompleted {
					result = append(result, q)
				}
			}
			return result, nil
		}
	}

	if data := r.cache.GetPlayer(characterID); data != nil {
		quests := data.GetQuests()
		var result []*quest.QuestProgress
		for _, q := range quests {
			if q.Status == quest.QuestStatusCompleted {
				result = append(result, q)
			}
		}
		return result, nil
	}
	return r.delegate.FindCompletedByCharacter(ctx, characterID)
}

func (r *CachedQuestRepository) FindAllByCharacter(ctx context.Context, characterID int64) ([]*quest.QuestProgress, error) {
	if r.cache.coldLoader != nil {
		questMap, err := r.cache.coldLoader.GetQuests(ctx, characterID)
		if err == nil && questMap != nil {
			result := make([]*quest.QuestProgress, 0, len(questMap))
			for _, q := range questMap {
				result = append(result, q)
			}
			return result, nil
		}
	}

	if data := r.cache.GetPlayer(characterID); data != nil {
		return data.GetQuests(), nil
	}
	return r.delegate.FindAllByCharacter(ctx, characterID)
}

func (r *CachedQuestRepository) Update(ctx context.Context, progress *quest.QuestProgress) error {
	if data := r.cache.GetPlayer(progress.CharacterID); data != nil {
		data.SetQuest(progress)
	}

	if r.cache.coldLoader != nil {
		questMap, _ := r.cache.coldLoader.GetQuests(ctx, progress.CharacterID)
		if questMap != nil {
			questMap[progress.ID] = progress
			_ = r.cache.coldLoader.SaveQuests(ctx, progress.CharacterID, questMap)
		}
	}

	if data := r.cache.GetPlayer(progress.CharacterID); data != nil {
		return nil
	}
	return r.delegate.Update(ctx, progress)
}

func (r *CachedQuestRepository) Delete(ctx context.Context, id int64) error {
	var charID int64
	var foundInCache bool

	r.cache.mu.RLock()
	for _, data := range r.cache.activeSessions {
		if q := data.GetQuest(id); q != nil {
			charID = q.CharacterID
			foundInCache = true
			data.DeleteQuest(id)
			break
		}
	}
	r.cache.mu.RUnlock()

	if foundInCache && r.cache.coldLoader != nil {
		questMap, _ := r.cache.coldLoader.GetQuests(ctx, charID)
		if questMap != nil {
			delete(questMap, id)
			_ = r.cache.coldLoader.SaveQuests(ctx, charID, questMap)
		}
	}

	if foundInCache {
		return nil
	}
	return r.delegate.Delete(ctx, id)
}

func (r *CachedQuestRepository) RecordHistory(ctx context.Context, history *quest.QuestHistory) error {
	return r.delegate.RecordHistory(ctx, history)
}

func (r *CachedQuestRepository) GetCompletedQuestIDs(ctx context.Context, characterID int64) ([]int, error) {
	if r.cache.coldLoader != nil {
		questMap, err := r.cache.coldLoader.GetQuests(ctx, characterID)
		if err == nil && questMap != nil {
			var result []int
			for _, q := range questMap {
				if q.Status == quest.QuestStatusCompleted {
					result = append(result, q.QuestID)
				}
			}
			return result, nil
		}
	}

	if data := r.cache.GetPlayer(characterID); data != nil {
		quests := data.GetQuests()
		var result []int
		for _, q := range quests {
			if q.Status == quest.QuestStatusCompleted {
				result = append(result, q.QuestID)
			}
		}
		return result, nil
	}
	return r.delegate.GetCompletedQuestIDs(ctx, characterID)
}

type completedWithDateRepo interface {
	GetCompletedQuestIDsWithDate(ctx context.Context, characterID int64) (map[int]time.Time, error)
}

func (r *CachedQuestRepository) GetCompletedQuestIDsWithDate(ctx context.Context, characterID int64) (map[int]time.Time, error) {
	if provider, ok := r.delegate.(completedWithDateRepo); ok {
		return provider.GetCompletedQuestIDsWithDate(ctx, characterID)
	}
	return map[int]time.Time{}, nil
}
