// Open-sourced by BaoLT

// CachedSkillRepository wraps skill.Repository with caching.
// Create writes to DB (needs ID), other writes update cache only.
// Delete tracks deleted IDs for batch persistence.
package cache

import (
	"context"

	"mcgame-server/internal/domain/skill"
)

type CachedSkillRepository struct {
	cache    *PlayerCache
	delegate skill.Repository
}

func NewCachedSkillRepository(cache *PlayerCache, delegate skill.Repository) *CachedSkillRepository {
	return &CachedSkillRepository{cache: cache, delegate: delegate}
}

func (r *CachedSkillRepository) FindByID(ctx context.Context, id int64) (*skill.CharacterSkill, error) {
	r.cache.mu.RLock()
	for _, data := range r.cache.activeSessions {
		if sk := data.GetSkill(id); sk != nil {
			r.cache.mu.RUnlock()
			return sk, nil
		}
	}
	r.cache.mu.RUnlock()
	return r.delegate.FindByID(ctx, id)
}

func (r *CachedSkillRepository) FindByCharacterID(ctx context.Context, charID int64) ([]*skill.CharacterSkill, error) {
	if data := r.cache.GetPlayer(charID); data != nil {
		skills := data.GetSkills()
		if len(skills) > 0 {
			return skills, nil
		}
	}

	if r.cache.coldLoader != nil {
		skillMap, err := r.cache.coldLoader.GetSkills(ctx, charID)
		if err == nil && len(skillMap) > 0 {
			return skillSliceFromMap(skillMap), nil
		}
	}

	return r.delegate.FindByCharacterID(ctx, charID)
}

func (r *CachedSkillRepository) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*skill.CharacterSkill, error) {
	if data := r.cache.GetPlayer(charID); data != nil {
		skills := data.GetSkills()
		for _, sk := range skills {
			if sk.SkillID == skillID {
				return sk, nil
			}
		}
	}

	if r.cache.coldLoader != nil {
		skillMap, err := r.cache.coldLoader.GetSkills(ctx, charID)
		if err == nil {
			for _, sk := range skillMap {
				if sk.SkillID == skillID {
					return sk, nil
				}
			}
		}
	}

	return r.delegate.FindByCharacterAndSkill(ctx, charID, skillID)
}

func (r *CachedSkillRepository) FindBySlot(ctx context.Context, charID int64, slot int) (*skill.CharacterSkill, error) {
	if data := r.cache.GetPlayer(charID); data != nil {
		skills := data.GetSkills()
		for _, sk := range skills {
			if sk.SlotPosition != nil && *sk.SlotPosition == slot {
				return sk, nil
			}
		}
	}

	if r.cache.coldLoader != nil {
		skillMap, err := r.cache.coldLoader.GetSkills(ctx, charID)
		if err == nil {
			for _, sk := range skillMap {
				if sk.SlotPosition != nil && *sk.SlotPosition == slot {
					return sk, nil
				}
			}
		}
	}

	return r.delegate.FindBySlot(ctx, charID, slot)
}

func (r *CachedSkillRepository) Create(ctx context.Context, sk *skill.CharacterSkill) error {
	if err := r.delegate.Create(ctx, sk); err != nil {
		return err
	}
	if data := r.cache.GetPlayer(sk.CharacterID); data != nil {
		data.AddSkillWithoutDirty(sk)
	}
	if r.cache.coldLoader != nil {
		skillMap, err := r.cache.coldLoader.GetSkills(ctx, sk.CharacterID)
		if err == nil {
			if skillMap == nil {
				skillMap = make(map[int64]*skill.CharacterSkill)
			}
			skillMap[sk.ID] = sk
			_ = r.cache.coldLoader.SaveSkills(ctx, sk.CharacterID, skillMap)
		}
	}
	return nil
}

func (r *CachedSkillRepository) Update(ctx context.Context, sk *skill.CharacterSkill) error {
	if data := r.cache.GetPlayer(sk.CharacterID); data != nil {
		data.SetSkill(sk)
	}

	if r.cache.coldLoader != nil {
		skillMap, _ := r.cache.coldLoader.GetSkills(ctx, sk.CharacterID)
		if skillMap != nil {
			skillMap[sk.ID] = sk
			_ = r.cache.coldLoader.SaveSkills(ctx, sk.CharacterID, skillMap)
		}
	}

	if data := r.cache.GetPlayer(sk.CharacterID); data != nil {
		return nil
	}
	return r.delegate.Update(ctx, sk)
}

func (r *CachedSkillRepository) Delete(ctx context.Context, id int64) error {
	var charID int64
	var foundInCache bool

	r.cache.mu.RLock()
	for _, data := range r.cache.activeSessions {
		if sk := data.GetSkill(id); sk != nil {
			charID = sk.CharacterID
			foundInCache = true
			data.DeleteSkill(id)
			break
		}
	}
	r.cache.mu.RUnlock()

	if foundInCache && r.cache.coldLoader != nil {
		skillMap, _ := r.cache.coldLoader.GetSkills(ctx, charID)
		if skillMap != nil {
			delete(skillMap, id)
			_ = r.cache.coldLoader.SaveSkills(ctx, charID, skillMap)
		}
	}

	if foundInCache {
		return nil
	}
	return r.delegate.Delete(ctx, id)
}

func (r *CachedSkillRepository) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	r.cache.mu.RLock()
	for _, data := range r.cache.activeSessions {
		if sk := data.GetSkill(id); sk != nil {
			sk.SlotPosition = slot
			data.SetSkill(sk)
			r.cache.mu.RUnlock()
			return nil
		}
	}
	r.cache.mu.RUnlock()
	return r.delegate.UpdateSlot(ctx, id, slot)
}

func (r *CachedSkillRepository) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	r.cache.mu.RLock()
	for _, data := range r.cache.activeSessions {
		if sk := data.GetSkill(id); sk != nil {
			data.SetSkill(sk)
			r.cache.mu.RUnlock()
			return nil
		}
	}
	r.cache.mu.RUnlock()
	return r.delegate.UpdateCooldown(ctx, id, cooldownEnd)
}

func (r *CachedSkillRepository) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	if data := r.cache.GetPlayer(charID); data != nil {
		skills := data.GetSkills()
		for _, sk := range skills {
			if sk.SkillID == skillID {
				return true, nil
			}
		}
	}

	if r.cache.coldLoader != nil {
		skillMap, err := r.cache.coldLoader.GetSkills(ctx, charID)
		if err == nil {
			for _, sk := range skillMap {
				if sk.SkillID == skillID {
					return true, nil
				}
			}
		}
	}

	return r.delegate.HasSkill(ctx, charID, skillID)
}

func skillSliceFromMap(skillMap map[int64]*skill.CharacterSkill) []*skill.CharacterSkill {
	result := make([]*skill.CharacterSkill, 0, len(skillMap))
	for _, sk := range skillMap {
		result = append(result, sk)
	}
	return result
}
