// Open-sourced by BaoLT

package pet

import (
	"context"
	"errors"
	"testing"

	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func TestChangeState_SwitchesBattlePetWithoutChangingFollowingPet(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 2,
		pets: map[int64]*domainpet.Pet{
			1: {
				ID:          1,
				CharacterID: 99,
				IsFollowing: true,
				Life:        10000,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
			2: {
				ID:          2,
				CharacterID: 99,
				IsFollowing: false,
				Life:        10000,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
		},
	}
	service := NewService(repo, zap.NewNop())

	updated, err := service.ChangeState(context.Background(), 99, 2, int(domainpet.PetStateBattle))
	if err != nil {
		t.Fatalf("ChangeState() error = %v", err)
	}

	if updated.IsFollowing {
		t.Fatalf("updated pet IsFollowing = true, want false")
	}
	if got := updated.ClientState(); got != int(domainpet.PetStateBattle) {
		t.Fatalf("updated pet ClientState() = %d, want %d", got, domainpet.PetStateBattle)
	}

	followingPet, err := repo.FindByID(context.Background(), 1)
	if err != nil {
		t.Fatalf("FindByID(1) error = %v", err)
	}
	if !followingPet.IsFollowing {
		t.Fatalf("following pet IsFollowing = false, want true")
	}
	if got := followingPet.ClientState(); got != int(domainpet.PetStateRest) {
		t.Fatalf("following pet ClientState() = %d, want %d", got, domainpet.PetStateRest)
	}
}

func TestChangeState_RestingPetDoesNotCancelFollowState(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 1,
		pets: map[int64]*domainpet.Pet{
			1: {
				ID:          1,
				CharacterID: 77,
				IsFollowing: true,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(repo, zap.NewNop())

	updated, err := service.ChangeState(context.Background(), 77, 1, int(domainpet.PetStateRest))
	if err != nil {
		t.Fatalf("ChangeState() error = %v", err)
	}

	if !updated.IsFollowing {
		t.Fatalf("updated pet IsFollowing = false, want true")
	}
	if got := updated.ClientState(); got != int(domainpet.PetStateRest) {
		t.Fatalf("updated pet ClientState() = %d, want %d", got, domainpet.PetStateRest)
	}
}

func TestChangeState_BattlePetBindsPet(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 1,
		pets: map[int64]*domainpet.Pet{
			1: {
				ID:          1,
				CharacterID: 77,
				Life:        10000,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
		},
	}
	service := NewService(repo, zap.NewNop())

	updated, err := service.ChangeState(context.Background(), 77, 1, int(domainpet.PetStateBattle))
	if err != nil {
		t.Fatalf("ChangeState() error = %v", err)
	}

	if !updated.IsBound() {
		t.Fatalf("updated pet IsBound() = false, want true")
	}

	stored, err := repo.FindByID(context.Background(), 1)
	if err != nil {
		t.Fatalf("FindByID(1) error = %v", err)
	}
	if got := stored.BindState(); got != 1 {
		t.Fatalf("stored BindState() = %d, want 1", got)
	}
}

func TestChangeState_ZeroLifePetRejectedForBattle(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 1,
		pets: map[int64]*domainpet.Pet{
			1: {
				ID:          1,
				CharacterID: 55,
				Life:        0,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateRest),
				},
			},
		},
	}
	service := NewService(repo, zap.NewNop())

	_, err := service.ChangeState(context.Background(), 55, 1, int(domainpet.PetStateBattle))
	if !errors.Is(err, pkgerrors.ErrPetDead) {
		t.Fatalf("ChangeState() error = %v, want ErrPetDead", err)
	}
}

func TestChangeState_ZeroLifePetAllowedForFollowing(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 1,
		pets: map[int64]*domainpet.Pet{
			1: {
				ID:          1,
				CharacterID: 55,
				Life:        0,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(repo, zap.NewNop())

	updated, err := service.ChangeState(context.Background(), 55, 1, int(domainpet.PetStateFollowing))
	if err != nil {
		t.Fatalf("ChangeState() to following at zero life error = %v, want nil", err)
	}
	if got := updated.ClientState(); got != int(domainpet.PetStateFollowing) {
		t.Fatalf("updated pet ClientState() = %d, want %d", got, domainpet.PetStateFollowing)
	}
}

func TestChangeState_ZeroLifePetAllowedForRest(t *testing.T) {
	repo := &contractTestPetRepo{
		nextID: 1,
		pets: map[int64]*domainpet.Pet{
			1: {
				ID:          1,
				CharacterID: 55,
				Life:        0,
				Property: map[string]interface{}{
					"state": int(domainpet.PetStateBattle),
				},
			},
		},
	}
	service := NewService(repo, zap.NewNop())

	updated, err := service.ChangeState(context.Background(), 55, 1, int(domainpet.PetStateRest))
	if err != nil {
		t.Fatalf("ChangeState() to rest at zero life error = %v, want nil", err)
	}
	if got := updated.ClientState(); got != int(domainpet.PetStateRest) {
		t.Fatalf("updated pet ClientState() = %d, want %d", got, domainpet.PetStateRest)
	}
}
