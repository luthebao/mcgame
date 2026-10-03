// Open-sourced by BaoLT

package magiccrystal

import (
	"context"
	"errors"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

type fakeRepo struct {
	state map[string]interface{}
}

func newFakeRepo() *fakeRepo {
	return &fakeRepo{}
}

func (f *fakeRepo) GetCharacterProgression(_ context.Context, _ int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}

func (f *fakeRepo) ListCharacterFeatureStates(_ context.Context, _ int64) ([]*domainfeature.CharacterFeatureState, error) {
	if f.state == nil {
		return nil, nil
	}
	return []*domainfeature.CharacterFeatureState{
		{FeatureKey: domainfeature.FeatureMagicCrystal, State: f.state},
	}, nil
}

func (f *fakeRepo) UpsertCharacterSoulProgression(_ context.Context, _ int64, _ int, _ int64) error {
	return nil
}

func (f *fakeRepo) UpsertCharacterFeatureState(_ context.Context, st *domainfeature.CharacterFeatureState) error {
	f.state = st.State
	return nil
}

func (f *fakeRepo) ListPetFeatureStates(_ context.Context, _ int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}

func (f *fakeRepo) UpsertPetFeatureState(_ context.Context, _ *domainfeature.PetFeatureState) error {
	return nil
}

func (f *fakeRepo) GetActiveMount(_ context.Context, _ int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}

func (f *fakeRepo) PPVEChallengeNextFloor(_ context.Context, _ int64, _ int, _ int, _ string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeChar struct {
	char *domainchar.Character
}

func (f *fakeChar) GetByID(_ context.Context, _ int64) (*domainchar.Character, error) {
	if f.char == nil {
		return nil, errors.New("not found")
	}
	return f.char, nil
}

func (f *fakeChar) Save(_ context.Context, _ *domainchar.Character) error {
	return nil
}

func newServiceForTest(t *testing.T, char *domainchar.Character) (*Service, *fakeRepo, *fakeChar) {
	t.Helper()
	repo := newFakeRepo()
	chars := &fakeChar{char: char}
	svc := NewService(repo, chars, zap.NewNop())
	return svc, repo, chars
}

func TestActivateConsumesCostAndFlipsSlot(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 50}
	svc, _, _ := newServiceForTest(t, char)

	result, err := svc.Activate(context.Background(), 1, 0)
	if err != nil {
		t.Fatalf("Activate returned error: %v", err)
	}
	if result.Crystal.A != 1 {
		t.Fatalf("expected A=1, got %d", result.Crystal.A)
	}
	if result.Crystal.Max != 100 {
		t.Fatalf("expected Max=100, got %d", result.Crystal.Max)
	}
	if char.MagicCrystalRec != 40 {
		t.Fatalf("expected rec=40 after 10-cost activate, got %d", char.MagicCrystalRec)
	}
	if len(result.Deltas) != 1 || result.Deltas[0].Field != "magiccystalrec" || result.Deltas[0].NewTotal != 40 {
		t.Fatalf("expected single magiccystalrec delta = 40, got %+v", result.Deltas)
	}
}

func TestActivateRejectsInsufficientRec(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 5}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); !errors.Is(err, ErrInsufficientRec) {
		t.Fatalf("expected ErrInsufficientRec, got %v", err)
	}
	if char.MagicCrystalRec != 5 {
		t.Fatalf("expected rec unchanged, got %d", char.MagicCrystalRec)
	}
}

func TestActivateRejectsAlreadyActive(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("first activate err: %v", err)
	}
	if _, err := svc.Activate(context.Background(), 1, 0); !errors.Is(err, ErrSlotAlreadyActive) {
		t.Fatalf("expected ErrSlotAlreadyActive, got %v", err)
	}
}

func TestActivateRejectsOutOfRangeIndex(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, -1); !errors.Is(err, ErrInvalidIndex) {
		t.Fatalf("expected ErrInvalidIndex for -1, got %v", err)
	}
	if _, err := svc.Activate(context.Background(), 1, 16); !errors.Is(err, ErrInvalidIndex) {
		t.Fatalf("expected ErrInvalidIndex for 16, got %v", err)
	}
}

func TestLevelUpAdvancesAndRecomputesMax(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	result, err := svc.LevelUp(context.Background(), 1, 0)
	if err != nil {
		t.Fatalf("LevelUp error: %v", err)
	}
	if result.Crystal.Lv != 1 {
		t.Fatalf("expected Lv=1, got %d", result.Crystal.Lv)
	}
	if result.Crystal.Max != 200 {
		t.Fatalf("expected Max=200 at lv1, got %d", result.Crystal.Max)
	}
	if char.MagicCrystalRec != 70 {
		t.Fatalf("expected rec 100 - 10(activate) - 20(lv0->1) = 70, got %d", char.MagicCrystalRec)
	}
}

func TestLevelUpRejectsAtMaxLevel(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100000}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	for lv := 0; lv < MaxLevel; lv++ {
		if _, err := svc.LevelUp(context.Background(), 1, 0); err != nil {
			t.Fatalf("LevelUp at lv=%d failed: %v", lv, err)
		}
	}
	if _, err := svc.LevelUp(context.Background(), 1, 0); !errors.Is(err, ErrSlotMaxLevel) {
		t.Fatalf("expected ErrSlotMaxLevel, got %v", err)
	}
}

func TestLevelUpRejectsInactive(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.LevelUp(context.Background(), 1, 0); !errors.Is(err, ErrSlotInactive) {
		t.Fatalf("expected ErrSlotInactive, got %v", err)
	}
}

func TestAddPowerLMCConsumesPreAndFillsL(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalPre: 200}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	result, err := svc.AddPower(context.Background(), 1, 0, 50, PointTypePower)
	if err != nil {
		t.Fatalf("AddPower error: %v", err)
	}
	if result.Crystal.L != 50 || result.Crystal.S != 0 {
		t.Fatalf("expected L=50,S=0, got L=%d S=%d", result.Crystal.L, result.Crystal.S)
	}
	if char.MagicCrystalPre != 150 {
		t.Fatalf("expected pre=150, got %d", char.MagicCrystalPre)
	}
	if len(result.Deltas) != 1 || result.Deltas[0].Field != "magiccystalpre" || result.Deltas[0].NewTotal != 150 {
		t.Fatalf("unexpected delta: %+v", result.Deltas)
	}
}

func TestAddPowerSMCConsumesLimitAndFillsS(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalLimit: 200}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	result, err := svc.AddPower(context.Background(), 1, 0, 30, PointTypeSoul)
	if err != nil {
		t.Fatalf("AddPower error: %v", err)
	}
	if result.Crystal.S != 30 || result.Crystal.L != 0 {
		t.Fatalf("expected L=0,S=30, got L=%d S=%d", result.Crystal.L, result.Crystal.S)
	}
	if char.MagicCrystalLimit != 170 {
		t.Fatalf("expected limit=170, got %d", char.MagicCrystalLimit)
	}
}

func TestAddPowerRejectsOverflow(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalPre: 1000}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	if _, err := svc.AddPower(context.Background(), 1, 0, 101, PointTypePower); !errors.Is(err, ErrSlotFull) {
		t.Fatalf("expected ErrSlotFull, got %v", err)
	}
}

func TestAddPowerRejectsInsufficientResource(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalPre: 5}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	if _, err := svc.AddPower(context.Background(), 1, 0, 10, PointTypePower); !errors.Is(err, ErrInsufficientPre) {
		t.Fatalf("expected ErrInsufficientPre, got %v", err)
	}
}

func TestAddPowerRejectsInvalidPointType(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalPre: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	if _, err := svc.AddPower(context.Background(), 1, 0, 5, "3"); !errors.Is(err, ErrInvalidPointType) {
		t.Fatalf("expected ErrInvalidPointType, got %v", err)
	}
}

func TestAddPowerRejectsInactive(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalPre: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.AddPower(context.Background(), 1, 0, 5, PointTypePower); !errors.Is(err, ErrSlotInactive) {
		t.Fatalf("expected ErrSlotInactive, got %v", err)
	}
}

func TestRecoverRefundsAndCharges(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100, MagicCrystalPre: 200, MagicCrystalLimit: 200}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	if _, err := svc.AddPower(context.Background(), 1, 0, 40, PointTypePower); err != nil {
		t.Fatalf("AddPower power err: %v", err)
	}
	if _, err := svc.AddPower(context.Background(), 1, 0, 30, PointTypeSoul); err != nil {
		t.Fatalf("AddPower soul err: %v", err)
	}

	result, err := svc.Recover(context.Background(), 1, 0)
	if err != nil {
		t.Fatalf("Recover err: %v", err)
	}
	if result.Crystal.L != 0 || result.Crystal.S != 0 {
		t.Fatalf("expected slot zeroed, got L=%d S=%d", result.Crystal.L, result.Crystal.S)
	}
	expectedRec := 100 - 10 - 1
	if char.MagicCrystalRec != expectedRec {
		t.Fatalf("expected rec=%d, got %d", expectedRec, char.MagicCrystalRec)
	}
	if char.MagicCrystalPre != 200 {
		t.Fatalf("expected pre refund to 200, got %d", char.MagicCrystalPre)
	}
	if char.MagicCrystalLimit != 200 {
		t.Fatalf("expected limit refund to 200, got %d", char.MagicCrystalLimit)
	}
	if len(result.Deltas) != 3 {
		t.Fatalf("expected 3 deltas, got %d", len(result.Deltas))
	}
}

func TestRecoverRejectsEmptySlot(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	if _, err := svc.Recover(context.Background(), 1, 0); !errors.Is(err, ErrSlotEmpty) {
		t.Fatalf("expected ErrSlotEmpty, got %v", err)
	}
}

func TestRecoverRejectsInsufficientRec(t *testing.T) {
	char := &domainchar.Character{ID: 1, MagicCrystalRec: 10, MagicCrystalPre: 100}
	svc, _, _ := newServiceForTest(t, char)
	if _, err := svc.Activate(context.Background(), 1, 0); err != nil {
		t.Fatalf("activate err: %v", err)
	}
	if _, err := svc.AddPower(context.Background(), 1, 0, 5, PointTypePower); err != nil {
		t.Fatalf("AddPower err: %v", err)
	}
	if _, err := svc.Recover(context.Background(), 1, 0); !errors.Is(err, ErrInsufficientRec) {
		t.Fatalf("expected ErrInsufficientRec, got %v", err)
	}
}

func TestLoadDefaultsTo16Slots(t *testing.T) {
	char := &domainchar.Character{ID: 1}
	svc, _, _ := newServiceForTest(t, char)
	crystals, err := svc.Load(context.Background(), 1)
	if err != nil {
		t.Fatalf("Load err: %v", err)
	}
	if len(crystals) != MaxSlots {
		t.Fatalf("expected %d crystals, got %d", MaxSlots, len(crystals))
	}
	for i, c := range crystals {
		if c.Index != i {
			t.Fatalf("expected slot %d to have Index=%d, got %d", i, i, c.Index)
		}
		if c.A != 0 || c.L != 0 || c.S != 0 || c.Lv != 0 || c.Max != 0 {
			t.Fatalf("expected slot %d zeroed, got %+v", i, c)
		}
	}
}

func TestDecodeLegacyFourSlotPadsToSixteen(t *testing.T) {
	legacy := map[string]interface{}{
		"crystals": []interface{}{
			map[string]interface{}{"index": 1, "a": 1, "max": 100.0, "l": 30.0, "s": 10.0, "lv": 0},
			map[string]interface{}{"index": 2, "a": 0, "max": 0, "l": 0, "s": 0, "lv": 0},
			map[string]interface{}{"index": 3, "a": 0, "max": 0, "l": 0, "s": 0, "lv": 0},
			map[string]interface{}{"index": 4, "a": 0, "max": 0, "l": 0, "s": 0, "lv": 0},
		},
	}
	out := decodeCrystals(legacy)
	if len(out) != MaxSlots {
		t.Fatalf("expected %d slots, got %d", MaxSlots, len(out))
	}
	if out[1].A != 1 || out[1].L != 30 || out[1].S != 10 {
		t.Fatalf("expected legacy slot 1 to carry over, got %+v", out[1])
	}
	if out[1].Max != 100 {
		t.Fatalf("expected legacy slot 1 Max=100 (canonical for lv=0), got %d", out[1].Max)
	}
	for i := 4; i < MaxSlots; i++ {
		if out[i].A != 0 || out[i].L != 0 || out[i].S != 0 || out[i].Lv != 0 || out[i].Max != 0 {
			t.Fatalf("expected slot %d zeroed (legacy padding), got %+v", i, out[i])
		}
	}
}

func TestCrystalsToWireKeyedByIndex(t *testing.T) {
	crystals := defaultCrystals()
	crystals[0].A = 1
	crystals[0].L = 100
	crystals[15].A = 1
	crystals[15].L = 50
	wire := CrystalsToWire(crystals)
	if len(wire) != MaxSlots {
		t.Fatalf("expected %d wire entries, got %d", MaxSlots, len(wire))
	}
	if _, ok := wire["0"]; !ok {
		t.Fatalf("missing key '0'")
	}
	if _, ok := wire["15"]; !ok {
		t.Fatalf("missing key '15'")
	}
	slot0, _ := wire["0"].(map[string]interface{})
	if slot0 == nil || slot0["l"] != 100 {
		t.Fatalf("wire slot 0 wrong: %+v", slot0)
	}
}
