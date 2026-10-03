// Open-sourced by BaoLT

package stoneseal

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type fakeFeatureRepo struct {
	charStates map[int64][]*domainfeature.CharacterFeatureState
}

func newFakeRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{charStates: map[int64][]*domainfeature.CharacterFeatureState{}}
}

func (r *fakeFeatureRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.charStates[charID], nil
}

func (r *fakeFeatureRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	list := r.charStates[state.CharacterID]
	for i, st := range list {
		if st.FeatureKey == state.FeatureKey {
			list[i] = state
			r.charStates[state.CharacterID] = list
			return nil
		}
	}
	r.charStates[state.CharacterID] = append(list, state)
	return nil
}

func (r *fakeFeatureRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
}
func (r *fakeFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	return nil
}
func (r *fakeFeatureRepo) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}
func (r *fakeFeatureRepo) PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeCharRepo struct {
	chars map[int64]*domainchar.Character
}

func (r *fakeCharRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.chars[id], nil
}
func (r *fakeCharRepo) Update(ctx context.Context, c *domainchar.Character) error {
	r.chars[c.ID] = c
	return nil
}
func (r *fakeCharRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *fakeCharRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *fakeCharRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}
func (r *fakeCharRepo) Create(ctx context.Context, c *domainchar.Character) error { return nil }
func (r *fakeCharRepo) Delete(ctx context.Context, id int64) error                { return nil }
func (r *fakeCharRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}
func (r *fakeCharRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}
func (r *fakeCharRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error { return nil }

type addedItem struct {
	templateID int
	count      int
}

type fakeItemPort struct {
	items    map[int64]*domainitem.Item
	diamonds map[int]bool
	added    []addedItem
	consumed []int64
}

func newFakeItemPort() *fakeItemPort {
	return &fakeItemPort{items: map[int64]*domainitem.Item{}, diamonds: map[int]bool{}}
}

func (p *fakeItemPort) GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error) {
	return p.items[itemID], nil
}
func (p *fakeItemPort) ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error) {
	it := p.items[itemID]
	if it == nil {
		return nil, false, errors.New("no item")
	}
	p.consumed = append(p.consumed, itemID)
	delete(p.items, itemID)
	return it, true, nil
}
func (p *fakeItemPort) AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error) {
	p.added = append(p.added, addedItem{templateID: templateID, count: stackCount})
	return &domainitem.Item{TemplateID: templateID}, nil
}
func (p *fakeItemPort) IsDiamondItem(templateID int) bool { return p.diamonds[templateID] }

func newTestService(char *domainchar.Character) (*Service, *fakeCharRepo, *fakeItemPort) {
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	items := newFakeItemPort()
	return NewService(newFakeRepo(), charRepo, items, zap.NewNop()), charRepo, items
}

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	e := s.entry(3)
	e.Lvl = 2
	e.Data[1] = 5001
	e.Data[2] = EmptyHole
	s.entry(7).Data[1] = 6002

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)

	g3, ok := got.Slots[3]
	if !ok || g3.Lvl != 2 {
		t.Fatalf("equip 3 lvl mismatch: %+v", g3)
	}
	if g3.Data[1] != 5001 {
		t.Fatalf("equip 3 hole 1 = %d, want 5001", g3.Data[1])
	}
	if v, ok := g3.Data[2]; !ok || v != EmptyHole {
		t.Fatalf("equip 3 hole 2 = %d ok=%v, want -1 present (bored-empty survives JSON float64)", v, ok)
	}
	if got.Slots[7].Data[1] != 6002 {
		t.Fatalf("equip 7 hole 1 = %d, want 6002", got.Slots[7].Data[1])
	}
}

func TestState_ToPersistHasStoneKey(t *testing.T) {
	s := defaultState()
	s.entry(1).Data[1] = 42
	persist := s.toPersist()
	stone, ok := persist[stoneStateKey].(map[string]interface{})
	if !ok {
		t.Fatalf("toPersist missing %q key for login read-path parity", stoneStateKey)
	}
	entry, ok := stone["1"].(map[string]interface{})
	if !ok {
		t.Fatalf("stone[1] missing")
	}
	data, ok := entry["data"].(map[string]interface{})
	if !ok || data["s1"] != 42 {
		t.Fatalf("stone[1].data.s1 = %v, want 42", data["s1"])
	}
}

func TestBore_DustPath_OpensHoleAndDeducts(t *testing.T) {
	char := &domainchar.Character{ID: 1, StoneSealPoint: 1000}
	svc, charRepo, items := newTestService(char)
	ctx := context.Background()
	items.items[900] = &domainitem.Item{ID: 900, TemplateID: 16}
	items.diamonds[16] = true

	data, err := svc.Bore(ctx, 1, 3, 1, PayModeBoreDust, 900)
	if err != nil {
		t.Fatalf("Bore: %v", err)
	}
	if charRepo.chars[1].StoneSealPoint != 950 {
		t.Fatalf("dust after bore = %d, want 950 (1000-50)", charRepo.chars[1].StoneSealPoint)
	}
	if len(items.consumed) != 1 || items.consumed[0] != 900 {
		t.Fatalf("diamond not consumed: %+v", items.consumed)
	}
	entry := data["3"].(map[string]interface{})
	holes := entry["data"].(map[string]interface{})
	if holes["s1"] != EmptyHole {
		t.Fatalf("bored hole s1 = %v, want -1", holes["s1"])
	}
}

func TestBore_GoldPath_DeductsGold(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 10000}
	svc, charRepo, _ := newTestService(char)
	ctx := context.Background()

	if _, err := svc.Bore(ctx, 1, 3, 1, PayModeGold, 0); err != nil {
		t.Fatalf("Bore gold: %v", err)
	}
	if charRepo.chars[1].Gold != 10000-71 {
		t.Fatalf("gold after bore = %d, want %d (10000-71)", charRepo.chars[1].Gold, 10000-71)
	}
}

func TestBore_NonDiamondRejected(t *testing.T) {
	char := &domainchar.Character{ID: 1, StoneSealPoint: 1000}
	svc, _, items := newTestService(char)
	ctx := context.Background()
	items.items[900] = &domainitem.Item{ID: 900, TemplateID: 99}

	if _, err := svc.Bore(ctx, 1, 3, 1, PayModeBoreDust, 900); !errors.Is(err, ErrNotDiamond) {
		t.Fatalf("want ErrNotDiamond, got %v", err)
	}
}

func TestBore_InsufficientDust(t *testing.T) {
	char := &domainchar.Character{ID: 1, StoneSealPoint: 10}
	svc, _, items := newTestService(char)
	ctx := context.Background()
	items.items[900] = &domainitem.Item{ID: 900, TemplateID: 16}
	items.diamonds[16] = true

	if _, err := svc.Bore(ctx, 1, 3, 1, PayModeBoreDust, 900); !errors.Is(err, ErrInsufficientDust) {
		t.Fatalf("want ErrInsufficientDust, got %v", err)
	}
}

func TestBore_CostIndexedByFilledHoleCount(t *testing.T) {
	char := &domainchar.Character{ID: 1, StoneSealPoint: 100000}
	svc, charRepo, items := newTestService(char)
	ctx := context.Background()
	items.diamonds[16] = true
	stoneItem := func(id int64) { items.items[id] = &domainitem.Item{ID: id, TemplateID: 16} }

	stoneItem(901)
	mustBore(t, svc, ctx, 3, 1, 901) // filled=0 -> cost[0]=50
	stoneItem(902)
	mustBore(t, svc, ctx, 3, 2, 902) // hole1 still empty(-1), filled=0 -> cost[0]=50 again

	spentTwoBores := 100000 - charRepo.chars[1].StoneSealPoint
	if spentTwoBores != 100 {
		t.Fatalf("two bores on empty holes spent %d, want 100 (50+50; bored-empty not counted)", spentTwoBores)
	}

	// fill hole 1, then bore a third hole -> filled=1 -> cost[1]=60
	items.items[950] = &domainitem.Item{ID: 950, TemplateID: 5001}
	if _, err := svc.SetStone(ctx, 1, 3, 1, 950); err != nil {
		t.Fatalf("SetStone: %v", err)
	}
	before := charRepo.chars[1].StoneSealPoint
	stoneItem(903)
	mustBore(t, svc, ctx, 3, 3, 903)
	if before-charRepo.chars[1].StoneSealPoint != 60 {
		t.Fatalf("third bore (1 filled hole) spent %d, want 60 (cost[1])", before-charRepo.chars[1].StoneSealPoint)
	}
}

func TestSetStone_RequiresBoredHole(t *testing.T) {
	char := &domainchar.Character{ID: 1, StoneSealPoint: 1000}
	svc, _, items := newTestService(char)
	ctx := context.Background()
	items.items[950] = &domainitem.Item{ID: 950, TemplateID: 5001}

	if _, err := svc.SetStone(ctx, 1, 3, 1, 950); !errors.Is(err, ErrHoleNotBored) {
		t.Fatalf("set on unbored hole: want ErrHoleNotBored, got %v", err)
	}
}

func TestSetThenRemoveStone_ConsumesAndReturns(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 10000}
	svc, _, items := newTestService(char)
	ctx := context.Background()
	if _, err := svc.Bore(ctx, 1, 3, 1, PayModeGold, 0); err != nil {
		t.Fatalf("Bore: %v", err)
	}
	items.items[950] = &domainitem.Item{ID: 950, TemplateID: 5001}

	if _, err := svc.SetStone(ctx, 1, 3, 1, 950); err != nil {
		t.Fatalf("SetStone: %v", err)
	}
	if len(items.consumed) != 1 || items.consumed[0] != 950 {
		t.Fatalf("stone not consumed: %+v", items.consumed)
	}

	// re-setting the now-occupied hole must fail
	items.items[951] = &domainitem.Item{ID: 951, TemplateID: 5002}
	if _, err := svc.SetStone(ctx, 1, 3, 1, 951); !errors.Is(err, ErrHoleOccupied) {
		t.Fatalf("set on occupied hole: want ErrHoleOccupied, got %v", err)
	}

	data, err := svc.RemoveStone(ctx, 1, 3, 1)
	if err != nil {
		t.Fatalf("RemoveStone: %v", err)
	}
	if len(items.added) != 1 || items.added[0].templateID != 5001 {
		t.Fatalf("stone not returned to bag: %+v", items.added)
	}
	holes := data["3"].(map[string]interface{})["data"].(map[string]interface{})
	if holes["s1"] != EmptyHole {
		t.Fatalf("hole after remove = %v, want -1 (still bored)", holes["s1"])
	}
}

func TestSwapStone_SwapsHoles(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 100000}
	svc, _, items := newTestService(char)
	ctx := context.Background()
	mustBoreGold(t, svc, ctx, 3, 1)
	mustBoreGold(t, svc, ctx, 3, 2)
	items.items[950] = &domainitem.Item{ID: 950, TemplateID: 5001}
	items.items[951] = &domainitem.Item{ID: 951, TemplateID: 5002}
	mustSet(t, svc, ctx, 3, 1, 950)
	mustSet(t, svc, ctx, 3, 2, 951)

	data, err := svc.SwapStone(ctx, 1, 3, 1, 2)
	if err != nil {
		t.Fatalf("SwapStone: %v", err)
	}
	holes := data["3"].(map[string]interface{})["data"].(map[string]interface{})
	if holes["s1"] != 5002 || holes["s2"] != 5001 {
		t.Fatalf("after swap s1=%v s2=%v, want s1=5002 s2=5001", holes["s1"], holes["s2"])
	}
}

func TestSuccinct_LevelsUpAndCaps(t *testing.T) {
	char := &domainchar.Character{ID: 1, StoneSealPoint: 100000}
	svc, charRepo, _ := newTestService(char)
	ctx := context.Background()

	data, err := svc.Succinct(ctx, 1, 3, PayModeSuccDust)
	if err != nil {
		t.Fatalf("Succinct: %v", err)
	}
	if charRepo.chars[1].StoneSealPoint != 100000-110 {
		t.Fatalf("dust after succinct = %d, want %d (cost[0]=110)", charRepo.chars[1].StoneSealPoint, 100000-110)
	}
	if int(data["3"].(map[string]interface{})["lvl"].(int)) != 1 {
		t.Fatalf("lvl after succinct = %v, want 1", data["3"].(map[string]interface{})["lvl"])
	}

	for i := 0; i < MaxSealLevel-1; i++ {
		if _, err := svc.Succinct(ctx, 1, 3, PayModeSuccDust); err != nil {
			t.Fatalf("succinct step %d: %v", i, err)
		}
	}
	if _, err := svc.Succinct(ctx, 1, 3, PayModeSuccDust); !errors.Is(err, ErrMaxSealLevel) {
		t.Fatalf("succinct past max: want ErrMaxSealLevel, got %v", err)
	}
}

func TestValidation_RejectsOutOfRange(t *testing.T) {
	svc, _, _ := newTestService(&domainchar.Character{ID: 1, Gold: 1000})
	ctx := context.Background()
	if _, err := svc.Bore(ctx, 1, 13, 1, PayModeGold, 0); !errors.Is(err, ErrInvalidEquip) {
		t.Fatalf("equip 13: want ErrInvalidEquip, got %v", err)
	}
	if _, err := svc.Bore(ctx, 1, 3, 11, PayModeGold, 0); !errors.Is(err, ErrInvalidSeal) {
		t.Fatalf("seal 11: want ErrInvalidSeal, got %v", err)
	}
}

func mustBore(t *testing.T, svc *Service, ctx context.Context, equip, seal int, material int64) {
	t.Helper()
	if _, err := svc.Bore(ctx, 1, equip, seal, PayModeBoreDust, material); err != nil {
		t.Fatalf("Bore(%d,%d): %v", equip, seal, err)
	}
}

func mustBoreGold(t *testing.T, svc *Service, ctx context.Context, equip, seal int) {
	t.Helper()
	if _, err := svc.Bore(ctx, 1, equip, seal, PayModeGold, 0); err != nil {
		t.Fatalf("BoreGold(%d,%d): %v", equip, seal, err)
	}
}

func mustSet(t *testing.T, svc *Service, ctx context.Context, equip, seal int, itemID int64) {
	t.Helper()
	if _, err := svc.SetStone(ctx, 1, equip, seal, itemID); err != nil {
		t.Fatalf("SetStone(%d,%d): %v", equip, seal, err)
	}
}
