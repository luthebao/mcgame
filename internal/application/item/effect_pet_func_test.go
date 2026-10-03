// Open-sourced by BaoLT

package item

import (
	"context"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type petFuncTestPetService struct {
	pets  map[int64]*domainpet.Pet
	saved []*domainpet.Pet
}

func (s *petFuncTestPetService) ContractPets(_ context.Context, _ int64, _ []int) ([]*domainpet.Pet, error) {
	return nil, nil
}

func (s *petFuncTestPetService) ContractPetsWithQuality(_ context.Context, _ int64, _ []int, _ int) ([]*domainpet.Pet, error) {
	return nil, nil
}

func (s *petFuncTestPetService) GetPetDetail(_ context.Context, charID int64, petID int64) (*domainpet.Pet, error) {
	p, ok := s.pets[petID]
	if !ok || p.CharacterID != charID {
		return nil, pkgerrors.ErrNotFound
	}
	cp := *p
	return &cp, nil
}

func (s *petFuncTestPetService) Save(_ context.Context, pet *domainpet.Pet) error {
	cp := *pet
	s.pets[pet.ID] = &cp
	s.saved = append(s.saved, &cp)
	return nil
}

func TestPetFuncHandler_CanHandle(t *testing.T) {
	h := &petFuncHandler{}

	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507}
	if !h.CanHandle(tpl) {
		t.Fatal("expected CanHandle=true for Type=507")
	}

	tpl2 := &models.ItemTemplateTemplate{ID: 1000, Type: 501}
	if h.CanHandle(tpl2) {
		t.Fatal("expected CanHandle=false for Type=501")
	}
}

func TestPetFuncHandler_Apply_NoPetID_ReturnsError(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	petSvc := &petFuncTestPetService{
		pets: map[int64]*domainpet.Pet{
			99: {ID: 99, CharacterID: 1, Life: 5000},
		},
	}
	svc.SetPetService(petSvc)

	h := &petFuncHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1000}
	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507, N1: 2000}

	uctx := &UseContext{PetID: 0}
	_, err := h.Apply(ctx, uctx, char, it, tpl)
	if err == nil {
		t.Fatal("expected error when PetID=0")
	}
	if !pkgerrors.Is(err, pkgerrors.ErrCannotUseItem) {
		t.Fatalf("expected ErrCannotUseItem, got %v", err)
	}
}

func TestPetFuncHandler_Apply_RestoresLife(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	petSvc := &petFuncTestPetService{
		pets: map[int64]*domainpet.Pet{
			99: {ID: 99, CharacterID: 1, Life: 5000},
		},
	}
	svc.SetPetService(petSvc)

	h := &petFuncHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1000}
	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507, N1: 2000}

	uctx := &UseContext{PetID: 99}
	result, err := h.Apply(ctx, uctx, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if len(result.UpdatedPets) != 1 {
		t.Fatalf("expected 1 pet in result, got %d", len(result.UpdatedPets))
	}
	if result.UpdatedPets[0].Life != 7000 {
		t.Fatalf("expected Life=7000 (5000+2000), got %d", result.UpdatedPets[0].Life)
	}
	if len(petSvc.saved) == 0 {
		t.Fatal("expected pet to be saved")
	}
	if petSvc.saved[0].Life != 7000 {
		t.Fatalf("expected saved Life=7000, got %d", petSvc.saved[0].Life)
	}
	if !result.ConsumeItem {
		t.Fatal("expected ConsumeItem=true")
	}
}

func TestPetFuncHandler_Apply_CapAt10000(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	petSvc := &petFuncTestPetService{
		pets: map[int64]*domainpet.Pet{
			99: {ID: 99, CharacterID: 1, Life: 9000},
		},
	}
	svc.SetPetService(petSvc)

	h := &petFuncHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1000}
	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507, N1: 5000}

	uctx := &UseContext{PetID: 99}
	result, err := h.Apply(ctx, uctx, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if len(result.UpdatedPets) != 1 {
		t.Fatalf("expected 1 pet in result, got %d", len(result.UpdatedPets))
	}
	if result.UpdatedPets[0].Life != 10000 {
		t.Fatalf("expected Life capped at 10000, got %d", result.UpdatedPets[0].Life)
	}
	if petSvc.saved[0].Life != 10000 {
		t.Fatalf("expected saved Life capped at 10000, got %d", petSvc.saved[0].Life)
	}
}

func TestPetFuncHandler_Apply_AlreadyMaxLife_NoChange(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	petSvc := &petFuncTestPetService{
		pets: map[int64]*domainpet.Pet{
			99: {ID: 99, CharacterID: 1, Life: 10000},
		},
	}
	svc.SetPetService(petSvc)

	h := &petFuncHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1000}
	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507, N1: 500}

	uctx := &UseContext{PetID: 99}
	result, err := h.Apply(ctx, uctx, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if result.UpdatedPets[0].Life != 10000 {
		t.Fatalf("expected Life to remain 10000, got %d", result.UpdatedPets[0].Life)
	}
}

func TestPetFuncHandler_Apply_NoRestoreService_ReturnsError(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	h := &petFuncHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1000}
	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507, N1: 2000}

	uctx := &UseContext{PetID: 99}
	_, err := h.Apply(ctx, uctx, char, it, tpl)
	if err == nil {
		t.Fatal("expected error when no pet life restore service available")
	}
}

func TestPetFuncHandler_Apply_ZeroN1_FullRestores(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	petSvc := &petFuncTestPetService{
		pets: map[int64]*domainpet.Pet{
			99: {ID: 99, CharacterID: 1, Life: 3000},
		},
	}
	svc.SetPetService(petSvc)

	h := &petFuncHandler{itemService: svc}
	ctx := context.Background()

	char := &domainchar.Character{ID: 1}
	it := &domainitem.Item{ID: 1, TemplateID: 1000}
	tpl := &models.ItemTemplateTemplate{ID: 1000, Type: 507, N1: 0}

	uctx := &UseContext{PetID: 99}
	result, err := h.Apply(ctx, uctx, char, it, tpl)
	if err != nil {
		t.Fatalf("Apply() error = %v", err)
	}
	if result.UpdatedPets[0].Life != 10000 {
		t.Fatalf("expected full restore to 10000 when N1=0, got %d", result.UpdatedPets[0].Life)
	}
}
