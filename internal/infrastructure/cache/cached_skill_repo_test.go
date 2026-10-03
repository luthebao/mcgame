// Open-sourced by BaoLT

package cache

import (
	"context"
	"testing"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/skill"
)

func TestCachedSkillRepositoryFindByCharacterIDPrefersActiveSessionOverColdLoader(t *testing.T) {
	cache, charRepo, _, skillRepo, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Tester"}
	skillRepo.skills[200] = &skill.CharacterSkill{ID: 200, CharacterID: 1, SkillID: 4965, Level: 1}

	data, err := cache.LoadPlayer(ctx, 1)
	if err != nil {
		t.Fatalf("LoadPlayer failed: %v", err)
	}

	data.SetSkill(&skill.CharacterSkill{ID: 201, CharacterID: 1, SkillID: 4964, Level: 2})
	cache.coldLoader.skillRepo = newMockSkillRepo()

	repo := NewCachedSkillRepository(cache, skillRepo)
	skills, err := repo.FindByCharacterID(ctx, 1)
	if err != nil {
		t.Fatalf("FindByCharacterID failed: %v", err)
	}
	if len(skills) != 2 {
		t.Fatalf("FindByCharacterID count = %d, want 2", len(skills))
	}
}

func TestCachedSkillRepositoryFindByCharacterAndSkillFallsBackWhenColdLoaderMisses(t *testing.T) {
	cache, _, _, skillRepo, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	skillRepo.skills[200] = &skill.CharacterSkill{ID: 200, CharacterID: 1, SkillID: 4965, Level: 1}
	cache.coldLoader.skillRepo = newMockSkillRepo()

	repo := NewCachedSkillRepository(cache, skillRepo)
	got, err := repo.FindByCharacterAndSkill(ctx, 1, 4965)
	if err != nil {
		t.Fatalf("FindByCharacterAndSkill failed: %v", err)
	}
	if got == nil {
		t.Fatal("expected skill from delegate, got nil")
	}
	if got.ID != 200 {
		t.Fatalf("skill ID = %d, want 200", got.ID)
	}
}

func TestCachedSkillRepositoryHasSkillFallsBackWhenColdLoaderMisses(t *testing.T) {
	cache, _, _, skillRepo, _, _ := newTestPlayerCache(t)
	ctx := context.Background()

	skillRepo.skills[200] = &skill.CharacterSkill{ID: 200, CharacterID: 1, SkillID: 4965, Level: 1}
	cache.coldLoader.skillRepo = newMockSkillRepo()

	repo := NewCachedSkillRepository(cache, skillRepo)
	hasSkill, err := repo.HasSkill(ctx, 1, 4965)
	if err != nil {
		t.Fatalf("HasSkill failed: %v", err)
	}
	if !hasSkill {
		t.Fatal("expected HasSkill to return true")
	}
}
