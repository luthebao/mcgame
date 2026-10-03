// Open-sourced by BaoLT

package warsprite

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	domainwsp "mcgame-server/internal/domain/warsprite"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type fakeRepo struct {
	state map[string]any
}

func (f *fakeRepo) GetCharacterProgression(_ context.Context, _ int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}

func (f *fakeRepo) ListCharacterFeatureStates(_ context.Context, _ int64) ([]*domainfeature.CharacterFeatureState, error) {
	if f.state == nil {
		return nil, nil
	}
	return []*domainfeature.CharacterFeatureState{
		{FeatureKey: domainfeature.FeatureWarSprite, State: f.state},
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

type fakeChars struct {
	chars map[int64]*domainchar.Character
}

func newFakeChars(c ...*domainchar.Character) *fakeChars {
	m := make(map[int64]*domainchar.Character, len(c))
	for _, ch := range c {
		m[ch.ID] = ch
	}
	return &fakeChars{chars: m}
}

func (f *fakeChars) GetByID(_ context.Context, id int64) (*domainchar.Character, error) {
	c, ok := f.chars[id]
	if !ok {
		return nil, errors.New("not found")
	}
	return c, nil
}

func (f *fakeChars) Save(_ context.Context, _ *domainchar.Character) error {
	return nil
}

func loadGameData(t *testing.T, rows []map[string]any) *gamedata.Manager {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	payloads := make([]json.RawMessage, 0, len(rows))
	for _, row := range rows {
		raw, err := json.Marshal(row)
		if err != nil {
			t.Fatalf("marshal: %v", err)
		}
		payloads = append(payloads, raw)
	}
	if err := mgr.GetCache().LoadTable(models.TableWarSprite, payloads); err != nil {
		t.Fatalf("LoadTable: %v", err)
	}
	return mgr
}

func newSvc(t *testing.T, char *domainchar.Character) (*Service, *fakeRepo, *gamedata.Manager) {
	t.Helper()
	rows := []map[string]any{
		{"id": 1100, "kind": 1, "level": 0, "name": "T1", "next_id": 1101, "cost_num": 350, "cost_gold": 350,
			"p_t1": 1, "p_n1": 0, "p_t2": 4, "p_n2": 0, "p_t3": 5, "p_n3": 0, "p_t4": 11, "p_n4": 0,
			"p_t5": 59, "p_n5": 0, "p_t6": 62, "p_n6": 0, "p_t7": 61, "p_n7": 0, "p_t8": 0, "p_n8": 0},
		{"id": 1101, "kind": 1, "level": 1, "name": "T1", "next_id": 1102, "cost_num": 420, "cost_gold": 420,
			"p_t1": 1, "p_n1": 150, "p_t2": 4, "p_n2": 38, "p_t3": 5, "p_n3": 38, "p_t4": 11, "p_n4": 15,
			"p_t5": 59, "p_n5": 2, "p_t6": 62, "p_n6": 2, "p_t7": 61, "p_n7": 100, "p_t8": 0, "p_n8": 0},
		{"id": 1110, "kind": 1, "level": 10, "name": "T1", "next_id": 0, "cost_num": 0, "cost_gold": 0,
			"p_t1": 1, "p_n1": 3000, "p_t2": 4, "p_n2": 750, "p_t3": 5, "p_n3": 750, "p_t4": 11, "p_n4": 300,
			"p_t5": 59, "p_n5": 50, "p_t6": 62, "p_n6": 50, "p_t7": 61, "p_n7": 2500, "p_t8": 0, "p_n8": 0},
		{"id": 2100, "kind": 2, "level": 0, "name": "T1", "next_id": 2101, "cost_num": 28, "cost_gold": 280,
			"p_t1": 1, "p_n1": 0, "p_t2": 4, "p_n2": 0, "p_t3": 5, "p_n3": 0, "p_t4": 11, "p_n4": 0,
			"p_t5": 59, "p_n5": 0, "p_t6": 62, "p_n6": 0, "p_t7": 61, "p_n7": 0, "p_t8": 0, "p_n8": 0},
		{"id": 2101, "kind": 2, "level": 1, "name": "T1", "next_id": 2102, "cost_num": 56, "cost_gold": 560,
			"p_t1": 1, "p_n1": 400, "p_t2": 4, "p_n2": 400, "p_t3": 5, "p_n3": 400, "p_t4": 11, "p_n4": 400,
			"p_t5": 59, "p_n5": 400, "p_t6": 62, "p_n6": 400, "p_t7": 61, "p_n7": 400, "p_t8": 0, "p_n8": 0},
		{"id": 2110, "kind": 2, "level": 10, "name": "T1", "next_id": 0, "cost_num": 0, "cost_gold": 0,
			"p_t1": 1, "p_n1": 40000, "p_t2": 4, "p_n2": 40000, "p_t3": 5, "p_n3": 40000, "p_t4": 11, "p_n4": 40000,
			"p_t5": 59, "p_n5": 40000, "p_t6": 62, "p_n6": 40000, "p_t7": 61, "p_n7": 40000, "p_t8": 0, "p_n8": 0},
		{"id": 1200, "kind": 1, "level": 0, "name": "T2", "next_id": 1201, "cost_num": 300, "cost_gold": 300},
		{"id": 1300, "kind": 1, "level": 0, "name": "T3", "next_id": 1301, "cost_num": 250, "cost_gold": 250},
		{"id": 1400, "kind": 1, "level": 0, "name": "T4", "next_id": 1401, "cost_num": 300, "cost_gold": 300},
		{"id": 1500, "kind": 1, "level": 0, "name": "T5", "next_id": 1501, "cost_num": 250, "cost_gold": 250},
		{"id": 1600, "kind": 1, "level": 0, "name": "T6", "next_id": 1601, "cost_num": 300, "cost_gold": 300},
		{"id": 1700, "kind": 1, "level": 0, "name": "T7", "next_id": 1701, "cost_num": 300, "cost_gold": 300},
		{"id": 1800, "kind": 1, "level": 0, "name": "T8", "next_id": 1801, "cost_num": 350, "cost_gold": 350},
		{"id": 2200, "kind": 2, "level": 0, "name": "T2", "next_id": 2201, "cost_num": 28, "cost_gold": 280},
		{"id": 2300, "kind": 2, "level": 0, "name": "T3", "next_id": 2301, "cost_num": 28, "cost_gold": 280},
		{"id": 2400, "kind": 2, "level": 0, "name": "T4", "next_id": 2401, "cost_num": 28, "cost_gold": 280},
		{"id": 2500, "kind": 2, "level": 0, "name": "T5", "next_id": 2501, "cost_num": 28, "cost_gold": 280},
		{"id": 2600, "kind": 2, "level": 0, "name": "T6", "next_id": 2601, "cost_num": 28, "cost_gold": 280},
		{"id": 2700, "kind": 2, "level": 0, "name": "T7", "next_id": 2701, "cost_num": 28, "cost_gold": 280},
		{"id": 2800, "kind": 2, "level": 0, "name": "T8", "next_id": 2801, "cost_num": 28, "cost_gold": 280},
	}
	mgr := loadGameData(t, rows)
	repo := &fakeRepo{}
	svc := NewService(repo, newFakeChars(char), mgr, zap.NewNop())
	return svc, repo, mgr
}

func TestGetState_ReturnsDefaultsWithoutPersistingOnFirstRead(t *testing.T) {
	svc, repo, _ := newSvc(t, &domainchar.Character{ID: 1})

	state, err := svc.GetState(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetState: %v", err)
	}
	if got, _ := state.Get(domainwsp.KindWarSprite, 1); got != 1100 {
		t.Fatalf("default WObj[1]: got %d, want 1100", got)
	}
	if repo.state != nil {
		t.Fatalf("GetState should be read-only; expected no persistence on first read")
	}
}

func TestInitDefault_PersistsRootsForFreshCharacter(t *testing.T) {
	svc, repo, _ := newSvc(t, &domainchar.Character{ID: 1})
	if err := svc.InitDefault(context.Background(), 1); err != nil {
		t.Fatalf("InitDefault: %v", err)
	}
	if repo.state == nil {
		t.Fatalf("InitDefault should persist root state for fresh character")
	}
}

func TestUpgrade_StonePathDeductsAndAdvances(t *testing.T) {
	char := &domainchar.Character{ID: 7, WarSprite: 1000}
	svc, _, _ := newSvc(t, char)

	result, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, 1, false)
	if err != nil {
		t.Fatalf("Upgrade: %v", err)
	}
	if result.NewID != 1101 {
		t.Fatalf("NewID: got %d, want 1101", result.NewID)
	}
	if char.WarSprite != 650 {
		t.Fatalf("WarSprite stone count: got %d, want 650 (1000-350)", char.WarSprite)
	}
	if result.WalletDelta.Field != "warSprite" {
		t.Fatalf("WalletDelta.Field: got %q, want warSprite", result.WalletDelta.Field)
	}
}

func TestUpgrade_GoldPathDeductsGold(t *testing.T) {
	char := &domainchar.Character{ID: 7, Gold: 5000}
	svc, _, _ := newSvc(t, char)

	result, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, 1, true)
	if err != nil {
		t.Fatalf("Upgrade: %v", err)
	}
	if char.Gold != 4650 {
		t.Fatalf("Gold: got %d, want 4650 (5000-350)", char.Gold)
	}
	if result.WalletDelta.Field != "gold" {
		t.Fatalf("WalletDelta.Field: got %q, want gold", result.WalletDelta.Field)
	}
}

func TestUpgrade_BattleSpriteUsesBattleStone(t *testing.T) {
	char := &domainchar.Character{ID: 7, BattleSprite: 100}
	svc, _, _ := newSvc(t, char)

	result, err := svc.Upgrade(context.Background(), 7, domainwsp.KindBattleSprite, 1, false)
	if err != nil {
		t.Fatalf("Upgrade kind=2: %v", err)
	}
	if result.NewID != 2101 {
		t.Fatalf("NewID kind=2: got %d, want 2101", result.NewID)
	}
	if char.BattleSprite != 72 {
		t.Fatalf("BattleSprite stone count: got %d, want 72 (100-28)", char.BattleSprite)
	}
}

func TestUpgrade_RejectsInsufficientStone(t *testing.T) {
	char := &domainchar.Character{ID: 7, WarSprite: 10}
	svc, _, _ := newSvc(t, char)

	_, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, 1, false)
	if !errors.Is(err, domainwsp.ErrInsufficientStone) {
		t.Fatalf("want ErrInsufficientStone, got %v", err)
	}
	if char.WarSprite != 10 {
		t.Fatalf("char.WarSprite should not change on failed upgrade: got %d", char.WarSprite)
	}
}

func TestUpgrade_RejectsInsufficientGold(t *testing.T) {
	char := &domainchar.Character{ID: 7, Gold: 100}
	svc, _, _ := newSvc(t, char)

	_, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, 1, true)
	if !errors.Is(err, domainwsp.ErrInsufficientGold) {
		t.Fatalf("want ErrInsufficientGold, got %v", err)
	}
}

func TestUpgrade_RejectsMaxLevelSlot(t *testing.T) {
	char := &domainchar.Character{ID: 7, WarSprite: 9999}
	svc, repo, _ := newSvc(t, char)

	state := domainwsp.Default()
	_ = state.Set(domainwsp.KindWarSprite, 1, 1110)
	repo.state = state.Encode()

	_, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, 1, false)
	if !errors.Is(err, domainwsp.ErrMaxLevel) {
		t.Fatalf("want ErrMaxLevel, got %v", err)
	}
}

func TestUpgrade_RejectsInvalidIndex(t *testing.T) {
	char := &domainchar.Character{ID: 7, WarSprite: 9999}
	svc, _, _ := newSvc(t, char)

	for _, idx := range []int{-1, 0, 9, 100} {
		_, err := svc.Upgrade(context.Background(), 7, domainwsp.KindWarSprite, idx, false)
		if !errors.Is(err, domainwsp.ErrInvalidIndex) {
			t.Fatalf("idx=%d: want ErrInvalidIndex, got %v", idx, err)
		}
	}
}

func TestUpgrade_RejectsInvalidKind(t *testing.T) {
	char := &domainchar.Character{ID: 7}
	svc, _, _ := newSvc(t, char)

	for _, kind := range []int{0, 3, 99} {
		_, err := svc.Upgrade(context.Background(), 7, kind, 1, false)
		if !errors.Is(err, domainwsp.ErrInvalidKind) {
			t.Fatalf("kind=%d: want ErrInvalidKind, got %v", kind, err)
		}
	}
}

func TestAggregateBonuses_AppliesWarPlusPercentMultiplier(t *testing.T) {
	char := &domainchar.Character{ID: 7}
	svc, repo, _ := newSvc(t, char)

	state := domainwsp.Default()
	_ = state.Set(domainwsp.KindWarSprite, 1, 1101)
	_ = state.Set(domainwsp.KindBattleSprite, 1, 2101)
	repo.state = state.Encode()

	totals, err := svc.AggregateBonuses(context.Background(), 7)
	if err != nil {
		t.Fatalf("AggregateBonuses: %v", err)
	}
	if totals[1] != 156 {
		t.Fatalf("p_t=1 total: war=150 + 150×400/10000 = 156; got %d", totals[1])
	}
	if totals[4] != 39 {
		t.Fatalf("p_t=4 total: war=38 + 38×400/10000 = 39; got %d", totals[4])
	}
	if totals[61] != 104 {
		t.Fatalf("p_t=61 total: war=100 + 100×400/10000 = 104; got %d", totals[61])
	}
}

func TestAggregateBonuses_MaxLevelMatchesUserExample(t *testing.T) {
	char := &domainchar.Character{ID: 7}
	svc, repo, _ := newSvc(t, char)

	state := domainwsp.Default()
	_ = state.Set(domainwsp.KindWarSprite, 1, 1110)
	_ = state.Set(domainwsp.KindBattleSprite, 1, 2110)
	repo.state = state.Encode()

	totals, err := svc.AggregateBonuses(context.Background(), 7)
	if err != nil {
		t.Fatalf("AggregateBonuses: %v", err)
	}
	if totals[1] != 15000 {
		t.Fatalf("user example: war HP=3000 + 3000×400%% = 15000; got %d", totals[1])
	}
}

func TestAggregateBonuses_BattleAtRootGivesWarOnly(t *testing.T) {
	char := &domainchar.Character{ID: 7}
	svc, repo, _ := newSvc(t, char)

	state := domainwsp.Default()
	_ = state.Set(domainwsp.KindWarSprite, 1, 1101)
	repo.state = state.Encode()

	totals, err := svc.AggregateBonuses(context.Background(), 7)
	if err != nil {
		t.Fatalf("AggregateBonuses: %v", err)
	}
	if totals[1] != 150 {
		t.Fatalf("battleSprite at root should leave war p_n unchanged: war=150, got %d", totals[1])
	}
	if totals[4] != 38 {
		t.Fatalf("battleSprite at root: war=38 unchanged; got %d", totals[4])
	}
}

func TestInitDefault_IdempotentOnExistingState(t *testing.T) {
	svc, repo, _ := newSvc(t, &domainchar.Character{ID: 7})

	repo.state = map[string]any{
		"wObj": map[string]any{"1": int64(1105)},
		"bObj": map[string]any{},
	}
	if err := svc.InitDefault(context.Background(), 7); err != nil {
		t.Fatalf("InitDefault: %v", err)
	}

	state, err := svc.GetState(context.Background(), 7)
	if err != nil {
		t.Fatalf("GetState: %v", err)
	}
	if got, _ := state.Get(domainwsp.KindWarSprite, 1); got != 1105 {
		t.Fatalf("InitDefault should not overwrite: got %d, want 1105", got)
	}
}
