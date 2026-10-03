// Open-sourced by BaoLT

package character

import (
	"context"
	"errors"
	"testing"

	appchar "mcgame-server/internal/application/character"
	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type detailTestCharacterRepo struct {
	chars map[int64]*domainchar.Character
}

type detailTestItemRepo struct{}

type detailTestBonusProvider struct {
	bonusesByChar map[int64]domainchar.EquipmentStatBonuses
}

func (r *detailTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	char, ok := r.chars[id]
	if !ok {
		return nil, errors.New("character not found")
	}
	return char, nil
}

func (r *detailTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *detailTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *detailTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *detailTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *detailTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *detailTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *detailTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *detailTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *detailTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func (r *detailTestItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	return nil, nil
}

func (r *detailTestItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (r *detailTestItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	return nil, nil
}

func (r *detailTestItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	return nil, nil
}

func (r *detailTestItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return []*domainitem.Item{}, nil
}

func (r *detailTestItemRepo) Create(ctx context.Context, item *domainitem.Item) error {
	return nil
}

func (r *detailTestItemRepo) Update(ctx context.Context, item *domainitem.Item) error {
	return nil
}

func (r *detailTestItemRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *detailTestItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	return nil
}

func (r *detailTestItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	return nil
}

func (r *detailTestItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	return nil
}

func (r *detailTestItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	return 0, nil
}

func (r *detailTestItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	return 0, nil
}

func (p detailTestBonusProvider) AggregateCharacterStatBonuses(ctx context.Context, charID int64) domainchar.EquipmentStatBonuses {
	if bonuses, ok := p.bonusesByChar[charID]; ok {
		return bonuses
	}
	return domainchar.NewEquipmentStatBonuses()
}

func TestGetCharDetailData_UsesSessionCharacter(t *testing.T) {
	char := newDetailTestCharacter(77, "owner")
	primaryBonuses := domainchar.NewEquipmentStatBonuses()
	primaryBonuses.AddFlat(domainchar.PropCombo, 11)
	primaryBonuses.AddFloat(domainchar.PropFinalMagicReduce, 8)
	extraBonuses := domainchar.NewEquipmentStatBonuses()
	extraBonuses.AddFloat(domainchar.PropCriticalDamage, 25)
	extraBonuses.AddFloat(domainchar.PropResiRage, 3.5)
	handler := newDetailTestHandler(
		map[int64]domainchar.EquipmentStatBonuses{77: primaryBonuses},
		map[int64]domainchar.EquipmentStatBonuses{77: extraBonuses},
		char,
	)

	result, err := handler.GetCharDetailData(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "77",
	}, nil)
	if err != nil {
		t.Fatalf("GetCharDetailData() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetCharDetailData() type = %T, want map[string]interface{}", result)
	}

	if len(payload) != len(domainchar.DetailStatPropSpecs()) {
		t.Fatalf("len(payload) = %d, want %d", len(payload), len(domainchar.DetailStatPropSpecs()))
	}
	if got := payload["finalCombo"]; got != float64(11) {
		t.Fatalf("payload[finalCombo] = %#v, want 11", got)
	}
	if got := payload["finalCriticalDamage"]; got != float64(25) {
		t.Fatalf("payload[finalCriticalDamage] = %#v, want 25", got)
	}
	if got := payload["finalPraMagDef"]; got != float64(8) {
		t.Fatalf("payload[finalPraMagDef] = %#v, want 8", got)
	}
	if got := payload["finalResiRage"]; got != 3.5 {
		t.Fatalf("payload[finalResiRage] = %#v, want 3.5", got)
	}
	if _, ok := payload["finalAttack"]; ok {
		t.Fatalf("payload should not include finalAttack")
	}
}

func TestGetCharDetailData_UsesExplicitTargetCharacterID(t *testing.T) {
	owner := newDetailTestCharacter(77, "owner")
	target := newDetailTestCharacter(88, "target")
	ownerBonuses := domainchar.NewEquipmentStatBonuses()
	ownerBonuses.AddFlat(domainchar.PropCombo, 11)
	targetPrimaryBonuses := domainchar.NewEquipmentStatBonuses()
	targetPrimaryBonuses.AddFlat(domainchar.PropCombo, 22)
	targetPrimaryBonuses.AddFloat(domainchar.PropFinalMagicReduce, 13)
	targetExtraBonuses := domainchar.NewEquipmentStatBonuses()
	targetExtraBonuses.AddFloat(domainchar.PropCriticalDamage, 25)
	targetExtraBonuses.AddFloat(domainchar.PropResiRage, 7.25)
	handler := newDetailTestHandler(
		map[int64]domainchar.EquipmentStatBonuses{
			77: ownerBonuses,
			88: targetPrimaryBonuses,
		},
		map[int64]domainchar.EquipmentStatBonuses{
			88: targetExtraBonuses,
		},
		owner,
		target,
	)

	result, err := handler.GetCharDetailData(&rtmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "77",
	}, []interface{}{float64(88)})
	if err != nil {
		t.Fatalf("GetCharDetailData() error = %v", err)
	}

	payload, ok := result.(map[string]interface{})
	if !ok {
		t.Fatalf("GetCharDetailData() type = %T, want map[string]interface{}", result)
	}

	if got := payload["finalCombo"]; got != float64(22) {
		t.Fatalf("payload[finalCombo] = %#v, want 22", got)
	}
	if got := payload["finalCriticalDamage"]; got != float64(25) {
		t.Fatalf("payload[finalCriticalDamage] = %#v, want 25", got)
	}
	if got := payload["finalPraMagDef"]; got != float64(13) {
		t.Fatalf("payload[finalPraMagDef] = %#v, want 13", got)
	}
	if got := payload["finalResiRage"]; got != 7.25 {
		t.Fatalf("payload[finalResiRage] = %#v, want 7.25", got)
	}
}

func newDetailTestHandler(primaryBonusesByChar, extraBonusesByChar map[int64]domainchar.EquipmentStatBonuses, chars ...*domainchar.Character) *Handler {
	repo := &detailTestCharacterRepo{
		chars: make(map[int64]*domainchar.Character, len(chars)),
	}
	for _, char := range chars {
		repo.chars[char.ID] = char
	}

	service := appchar.NewService(repo, zap.NewNop())
	handler := NewHandler(service, zap.NewNop())
	itemService := appitem.NewService(&detailTestItemRepo{}, zap.NewNop())
	itemService.SetCharacterBonusProvider(detailTestBonusProvider{bonusesByChar: primaryBonusesByChar})
	itemService.AddCharacterBonusProvider(detailTestBonusProvider{bonusesByChar: extraBonusesByChar})
	handler.SetItemService(itemService)
	return handler
}

func newDetailTestCharacter(id int64, name string) *domainchar.Character {
	char := domainchar.NewCharacter(uuid.New(), name, 1, 0)
	char.ID = id
	char.Level = 1
	char.Strength = 12
	char.Agility = 14
	char.Stamina = 16
	char.Intelligence = 18
	char.Spirit = 20
	char.CriticalDmg = 0
	return char
}
