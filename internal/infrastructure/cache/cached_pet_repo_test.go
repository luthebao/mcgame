// Open-sourced by BaoLT

package cache

import (
	"context"
	"testing"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/pet"
)

func TestCachedPetRepositoryFindFollowingPetPrefersActiveSessionOverColdLoader(t *testing.T) {
	cache, charRepo, _, _, petRepo, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Tester"}
	petRepo.pets[300] = &pet.Pet{ID: 300, CharacterID: 1, IsFollowing: false}

	data, err := cache.LoadPlayer(ctx, 1)
	if err != nil {
		t.Fatalf("LoadPlayer failed: %v", err)
	}

	data.SetPet(&pet.Pet{ID: 300, CharacterID: 1, IsFollowing: true})

	repo := NewCachedPetRepository(cache, petRepo)
	got, err := repo.FindFollowingPet(ctx, 1)
	if err != nil {
		t.Fatalf("FindFollowingPet failed: %v", err)
	}
	if got == nil {
		t.Fatal("expected following pet from active session, got nil")
	}
	if got.ID != 300 {
		t.Fatalf("following pet ID = %d, want 300", got.ID)
	}
}

func TestCachedPetRepositoryFindByCharacterIDPrefersActiveSessionOverColdLoader(t *testing.T) {
	cache, charRepo, _, _, petRepo, _ := newTestPlayerCache(t)
	ctx := context.Background()

	charRepo.characters[1] = &character.Character{ID: 1, Name: "Tester"}

	data, err := cache.LoadPlayer(ctx, 1)
	if err != nil {
		t.Fatalf("LoadPlayer failed: %v", err)
	}

	data.SetPet(&pet.Pet{ID: 301, CharacterID: 1, Name: "HotOnly"})

	repo := NewCachedPetRepository(cache, petRepo)
	pets, err := repo.FindByCharacterID(ctx, 1)
	if err != nil {
		t.Fatalf("FindByCharacterID failed: %v", err)
	}
	if len(pets) != 1 {
		t.Fatalf("FindByCharacterID count = %d, want 1", len(pets))
	}
	if pets[0].ID != 301 {
		t.Fatalf("pet ID = %d, want 301", pets[0].ID)
	}
}
