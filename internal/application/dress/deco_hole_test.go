// Open-sourced by BaoLT

package dress

import (
	"context"
	"errors"
	"math/rand"
	"testing"

	"github.com/google/uuid"
	"go.uber.org/zap"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"
)

type stubDecoHoleFeatureRepo struct{}

func (r *stubDecoHoleFeatureRepo) ListCharacterFeatureStates(_ context.Context, _ int64) ([]*domainfeature.CharacterFeatureState, error) {
	return nil, nil
}

func (r *stubDecoHoleFeatureRepo) UpsertCharacterFeatureState(_ context.Context, _ *domainfeature.CharacterFeatureState) error {
	return nil
}

type stubDecoHoleCharRepo struct {
	char        *domainchar.Character
	updateErr   error
	updateCount int
}

func (r *stubDecoHoleCharRepo) FindByID(_ context.Context, _ int64) (*domainchar.Character, error) {
	return r.char, nil
}

func (r *stubDecoHoleCharRepo) Update(_ context.Context, c *domainchar.Character) error {
	r.updateCount++
	if r.updateErr != nil {
		return r.updateErr
	}
	r.char = c
	return nil
}

type stubDecoHoleGameData struct {
	templates map[int]*models.DecoHoleTemplate
}

func (s *stubDecoHoleGameData) GetDecoHole(id int) *models.DecoHoleTemplate {
	return s.templates[id]
}

func newDecoHoleSvc(char *domainchar.Character, templates map[int]*models.DecoHoleTemplate, updateErr error, seed int64) (*DecoHoleService, *stubDecoHoleCharRepo) {
	charRepo := &stubDecoHoleCharRepo{char: char, updateErr: updateErr}
	svc := &DecoHoleService{
		featureRepo: &stubDecoHoleFeatureRepo{},
		charRepo:    charRepo,
		gameDataMgr: &stubDecoHoleGameData{templates: templates},
		logger:      zap.NewNop(),
		rng:         rand.New(rand.NewSource(seed)),
	}
	return svc, charRepo
}

func TestDecoHoleService_SuccessfulUpgrade_DeductsCurrencyAndAdvancesState(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 2001
	char.DecoSilver = 100

	templates := map[int]*models.DecoHoleTemplate{
		1: {ID: 1, CostSil: 10, Rate: 80, NextID: 2, Level: 1},
		2: {ID: 2, Level: 2},
	}
	svc, charRepo := newDecoHoleSvc(char, templates, nil, 0)

	result, err := svc.AddDecoHoleLevel(context.Background(), char.ID, 1)
	if err != nil {
		t.Fatalf("AddDecoHoleLevel() error = %v", err)
	}
	if result.SpentDecoSilver != 10 {
		t.Fatalf("SpentDecoSilver = %d, want 10", result.SpentDecoSilver)
	}
	if result.DecoSilverAfter != 90 {
		t.Fatalf("DecoSilverAfter = %d, want 90", result.DecoSilverAfter)
	}
	if charRepo.updateCount != 1 {
		t.Fatalf("charRepo.Update calls = %d, want 1", charRepo.updateCount)
	}
	hole := result.State.Positions[1]
	if hole.Hid != 2 {
		t.Fatalf("hid = %d, want 2 after upgrade", hole.Hid)
	}
	if hole.ShowLvl != 2 {
		t.Fatalf("showLvl = %d, want 2 after upgrade", hole.ShowLvl)
	}
}

func TestDecoHoleService_RngFail_DeductsCurrencyDoesNotChangeHid(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 2002
	char.DecoSilver = 100

	templates := map[int]*models.DecoHoleTemplate{
		1: {ID: 1, CostSil: 10, Rate: 80, NextID: 2, Level: 1},
		2: {ID: 2, Level: 2},
	}
	svc, charRepo := newDecoHoleSvc(char, templates, nil, 1)

	result, err := svc.AddDecoHoleLevel(context.Background(), char.ID, 1)
	if err != nil {
		t.Fatalf("AddDecoHoleLevel() error = %v", err)
	}
	if result.SpentDecoSilver != 10 {
		t.Fatalf("SpentDecoSilver = %d, want 10 on rng-fail", result.SpentDecoSilver)
	}
	if result.State.Positions[1].Hid != 1 {
		t.Fatalf("hid = %d, want 1 (unchanged on rng-fail)", result.State.Positions[1].Hid)
	}
	if charRepo.updateCount != 1 {
		t.Fatalf("charRepo.Update calls = %d, want 1 on rng-fail", charRepo.updateCount)
	}
}

func TestDecoHoleService_RngFail_PropagatesUpdateError(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 2003
	char.DecoSilver = 100

	dbErr := errors.New("db timeout")
	templates := map[int]*models.DecoHoleTemplate{
		1: {ID: 1, CostSil: 10, Rate: 80, NextID: 2, Level: 1},
		2: {ID: 2, Level: 2},
	}
	svc, _ := newDecoHoleSvc(char, templates, dbErr, 1)

	_, err := svc.AddDecoHoleLevel(context.Background(), char.ID, 1)
	if err == nil {
		t.Fatal("expected error when charRepo.Update fails on rng-fail path, got nil")
	}
	if !errors.Is(err, dbErr) {
		t.Fatalf("error = %v, want wrapping %v", err, dbErr)
	}
}

func TestDecoHoleService_InsufficientBalance_ReturnsErrNoUpdate(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 2004
	char.DecoSilver = 5

	templates := map[int]*models.DecoHoleTemplate{
		1: {ID: 1, CostSil: 10, Rate: 80, NextID: 2, Level: 1},
		2: {ID: 2, Level: 2},
	}
	svc, charRepo := newDecoHoleSvc(char, templates, nil, 0)

	_, err := svc.AddDecoHoleLevel(context.Background(), char.ID, 1)
	if !errors.Is(err, ErrDecoHoleInsufficientSil) {
		t.Fatalf("error = %v, want ErrDecoHoleInsufficientSil", err)
	}
	if charRepo.updateCount != 0 {
		t.Fatalf("charRepo.Update calls = %d, want 0 on insufficient balance", charRepo.updateCount)
	}
}

func TestDecoHoleService_MaxLevel_ReturnsUnchangedNoDeduction(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 2005
	char.DecoSilver = 100

	templates := map[int]*models.DecoHoleTemplate{
		1: {ID: 1, CostSil: 10, Rate: 80, NextID: 0, Level: 99},
	}
	svc, charRepo := newDecoHoleSvc(char, templates, nil, 0)

	result, err := svc.AddDecoHoleLevel(context.Background(), char.ID, 1)
	if err != nil {
		t.Fatalf("AddDecoHoleLevel() error = %v; want nil at max level", err)
	}
	if result.SpentDecoSilver != 0 {
		t.Fatalf("SpentDecoSilver = %d, want 0 at max level", result.SpentDecoSilver)
	}
	if char.DecoSilver != 100 {
		t.Fatalf("DecoSilver = %d, want 100 unchanged at max level", char.DecoSilver)
	}
	if charRepo.updateCount != 0 {
		t.Fatalf("charRepo.Update calls = %d, want 0 at max level", charRepo.updateCount)
	}
}
