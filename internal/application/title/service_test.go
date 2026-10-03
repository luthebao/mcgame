// Open-sourced by BaoLT

package title

import (
	"context"
	"testing"

	"go.uber.org/zap"
)

type titleTestRepo struct {
	regularTitles []int
	specialTitles []int
	specialSet    map[int]bool
	addCalls      []int
	owned         map[int]bool
}

func (r *titleTestRepo) GetCharacterTitles(ctx context.Context, characterID int64) ([]int, error) {
	out := make([]int, len(r.regularTitles))
	copy(out, r.regularTitles)
	return out, nil
}

func (r *titleTestRepo) GetCharacterSpecialTitles(ctx context.Context, characterID int64) ([]int, error) {
	out := make([]int, len(r.specialTitles))
	copy(out, r.specialTitles)
	return out, nil
}

func (r *titleTestRepo) AddTitle(ctx context.Context, characterID int64, titleID int) error {
	r.addCalls = append(r.addCalls, titleID)
	if r.owned == nil {
		r.owned = map[int]bool{}
	}
	r.owned[titleID] = true
	if r.specialSet != nil && r.specialSet[titleID] {
		r.specialTitles = append(r.specialTitles, titleID)
		return nil
	}
	r.regularTitles = append(r.regularTitles, titleID)
	return nil
}

func (r *titleTestRepo) SetActiveTitle(ctx context.Context, characterID int64, titleID int) error {
	return nil
}

func (r *titleTestRepo) SetActiveSpecialTitle(ctx context.Context, characterID int64, titleID int) error {
	return nil
}

func (r *titleTestRepo) HasTitle(ctx context.Context, characterID int64, titleID int) (bool, error) {
	return r.owned[titleID], nil
}

func (r *titleTestRepo) GetActiveTitle(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}

func (r *titleTestRepo) GetActiveSpecialTitle(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}

func TestGrantTitleAddsRegularTitle(t *testing.T) {
	repo := &titleTestRepo{owned: map[int]bool{3: true}, regularTitles: []int{3}}
	service := NewService(repo, zap.NewNop())

	result, err := service.GrantTitle(context.Background(), 99, 115)
	if err != nil {
		t.Fatalf("GrantTitle() error = %v", err)
	}
	if !result.Added {
		t.Fatalf("Added = false, want true")
	}
	if result.IsSpecial {
		t.Fatalf("IsSpecial = true, want false")
	}
	if result.Titles != "3|115" {
		t.Fatalf("Titles = %q, want %q", result.Titles, "3|115")
	}
	if len(repo.addCalls) != 1 || repo.addCalls[0] != 115 {
		t.Fatalf("addCalls = %#v, want [115]", repo.addCalls)
	}
}

func TestGrantTitleAddsSpecialTitle(t *testing.T) {
	repo := &titleTestRepo{owned: map[int]bool{}, specialSet: map[int]bool{211: true}}
	service := NewService(repo, zap.NewNop())

	result, err := service.GrantTitle(context.Background(), 77, 211)
	if err != nil {
		t.Fatalf("GrantTitle() error = %v", err)
	}
	if !result.Added {
		t.Fatalf("Added = false, want true")
	}
	if !result.IsSpecial {
		t.Fatalf("IsSpecial = false, want true")
	}
	if result.SpecialTitles != "211" {
		t.Fatalf("SpecialTitles = %q, want %q", result.SpecialTitles, "211")
	}
}
