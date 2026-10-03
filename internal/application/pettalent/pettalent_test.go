// Open-sourced by BaoLT

package pettalent

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"

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

type fakeItemPort struct {
	items    map[int64]*domainitem.Item
	consumed map[int64]int
}

func newFakeItemPort() *fakeItemPort {
	return &fakeItemPort{items: map[int64]*domainitem.Item{}, consumed: map[int64]int{}}
}
func (p *fakeItemPort) GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error) {
	return p.items[itemID], nil
}
func (p *fakeItemPort) ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error) {
	it := p.items[itemID]
	if it == nil {
		return nil, false, errors.New("no item")
	}
	p.consumed[itemID] += count
	return it, true, nil
}
func (p *fakeItemPort) AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error) {
	return &domainitem.Item{TemplateID: templateID}, nil
}
func (p *fakeItemPort) IsDiamondItem(templateID int) bool { return false }

type fakeGameData struct {
	byID map[int]*models.PetTalentTemplate
}

func newFakeGameData(recs ...*models.PetTalentTemplate) *fakeGameData {
	g := &fakeGameData{byID: map[int]*models.PetTalentTemplate{}}
	for _, r := range recs {
		g.byID[int(r.ID)] = r
	}
	return g
}
func (g *fakeGameData) GetPetTalent(id int) *models.PetTalentTemplate { return g.byID[id] }
func (g *fakeGameData) FindPetTalentBySidLv(sid, lv int) *models.PetTalentTemplate {
	for _, r := range g.byID {
		if int(r.Sid) == sid && int(r.Lv) == lv {
			return r
		}
	}
	return nil
}
func (g *fakeGameData) GetAllPetTalents() []*models.PetTalentTemplate {
	out := make([]*models.PetTalentTemplate, 0, len(g.byID))
	for _, r := range g.byID {
		out = append(out, r)
	}
	return out
}

func slotRec(id, sid, lv int, upExp float64) *models.PetTalentTemplate {
	return &models.PetTalentTemplate{
		ID: int64(id), Sid: float64(sid), Lv: float64(lv),
		PropType: 1, UpExp: upExp,
	}
}

func stoneRec(id, lv, propType int, exp float64) *models.PetTalentTemplate {
	return &models.PetTalentTemplate{
		ID: int64(id), BasicTid: float64(id), Sid: 10011, Lv: float64(lv),
		PropType: float64(propType), UpExp: 0, Exp: exp,
	}
}

// stoneFamily mirrors the real data layout: a family is 5 consecutive ids
// (startID..startID+4) for lv 1..5, all sharing basic_tid=startID, one prop_type,
// and the family grade carried as the lv1 record's exp. The level-matched pool used
// by reroll/fuse keys off (lv, family grade), so a realistic pool needs several
// families of distinct prop_types sharing the SAME lv1 grade.
func stoneFamily(startID, propType int, gradeExp float64) []*models.PetTalentTemplate {
	recs := make([]*models.PetTalentTemplate, 0, maxSlotLevel)
	for lv := 1; lv <= maxSlotLevel; lv++ {
		exp := gradeExp
		if lv > 1 {
			exp = gradeExp * float64(lv)
		}
		recs = append(recs, &models.PetTalentTemplate{
			ID: int64(startID + lv - 1), BasicTid: float64(startID), Sid: 10011,
			Lv: float64(lv), PropType: float64(propType), UpExp: 0, Exp: exp,
		})
	}
	return recs
}

func gradePool(gradeExp float64, startIDs map[int]int) []*models.PetTalentTemplate {
	out := make([]*models.PetTalentTemplate, 0, len(startIDs)*maxSlotLevel)
	for startID, prop := range startIDs {
		out = append(out, stoneFamily(startID, prop, gradeExp)...)
	}
	return out
}

func newSvc(char *domainchar.Character, g GameData) (*Service, *fakeCharRepo, *fakeItemPort) {
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	items := newFakeItemPort()
	return NewService(newFakeRepo(), charRepo, items, g, zap.NewNop()), charRepo, items
}

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	s.Tal[10001] = 6
	s.Tal[10005] = 30
	s.InTal[10010] = 265
	s.Bag[1] = BagEntry{T: 270, N: 5}
	s.Bag[2] = BagEntry{T: 275, N: 3}

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)
	if got.Tal[10001] != 6 || got.Tal[10005] != 30 {
		t.Fatalf("tal round-trip mismatch: %+v", got.Tal)
	}
	if got.InTal[10010] != 265 {
		t.Fatalf("inTal round-trip mismatch: %+v", got.InTal)
	}
	if got.Bag[1] != (BagEntry{T: 270, N: 5}) || got.Bag[2] != (BagEntry{T: 275, N: 3}) {
		t.Fatalf("bag round-trip mismatch: %+v", got.Bag)
	}
}

func TestState_PersistShapeKeys(t *testing.T) {
	s := defaultState()
	s.Tal[10001] = 6
	s.Bag[1] = BagEntry{T: 270, N: 5}
	p := s.toPersist()
	for _, k := range []string{"tal", "inTal", "b"} {
		if _, ok := p[k]; !ok {
			t.Fatalf("toPersist missing %q key for client wire parity", k)
		}
	}
	bag := p["b"].(map[string]interface{})
	e := bag["1"].(map[string]interface{})
	if e["t"] != 270 || e["n"] != 5 {
		t.Fatalf("bag entry shape = %+v, want {t:270,n:5}", e)
	}
}

func TestUpTalentSlotLv_PvePath(t *testing.T) {
	g := newFakeGameData(slotRec(2, 10001, 1, 480))
	char := &domainchar.Character{ID: 1, PvePoint: 1000}
	svc, repo, _ := newSvc(char, g)

	delta, err := svc.UpTalentSlotLv(context.Background(), 1, 10001, false)
	if err != nil {
		t.Fatalf("UpTalentSlotLv: %v", err)
	}
	if repo.chars[1].PvePoint != 520 {
		t.Fatalf("pvePoint = %d, want 520 (1000-480)", repo.chars[1].PvePoint)
	}
	if delta["10001"] != 2 {
		t.Fatalf("tal delta = %+v, want {10001:2}", delta)
	}
}

func TestUpTalentSlotLv_GoldPath_CeilCost(t *testing.T) {
	g := newFakeGameData(slotRec(2, 10001, 1, 480))
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, repo, _ := newSvc(char, g)

	if _, err := svc.UpTalentSlotLv(context.Background(), 1, 10001, true); err != nil {
		t.Fatalf("UpTalentSlotLv gold: %v", err)
	}
	if repo.chars[1].Gold != 967 {
		t.Fatalf("gold = %d, want 967 (1000-ceil(480*0.0666666666666667)=33)", repo.chars[1].Gold)
	}
}

func TestUpTalentSlotLv_RejectStoneSlot(t *testing.T) {
	g := newFakeGameData()
	char := &domainchar.Character{ID: 1, PvePoint: 1000}
	svc, _, _ := newSvc(char, g)
	if _, err := svc.UpTalentSlotLv(context.Background(), 1, 10010, false); !errors.Is(err, ErrInvalidSlot) {
		t.Fatalf("slot 10 should reject with ErrInvalidSlot, got %v", err)
	}
}

func TestUpTalentSlotLv_RejectMaxLevel(t *testing.T) {
	g := newFakeGameData(slotRec(6, 10001, 5, 2400))
	char := &domainchar.Character{ID: 1, PvePoint: 1000000}
	svc, _, _ := newSvc(char, g)
	repo := svc.featureRepo.(*fakeFeatureRepo)
	repo.charStates[1] = []*domainfeature.CharacterFeatureState{{
		CharacterID: 1, FeatureKey: featureKey,
		State: map[string]interface{}{"tal": map[string]interface{}{"10001": 6}},
	}}
	if _, err := svc.UpTalentSlotLv(context.Background(), 1, 10001, false); !errors.Is(err, ErrMaxSlotLevel) {
		t.Fatalf("want ErrMaxSlotLevel at lv5, got %v", err)
	}
}

func TestBreakTalentStone_YieldsPvePoint(t *testing.T) {
	g := newFakeGameData(stoneRec(265, 1, 1, 44))
	char := &domainchar.Character{ID: 1, PvePoint: 0}
	svc, repo, _ := newSvc(char, g)
	frepo := svc.featureRepo.(*fakeFeatureRepo)
	frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
		CharacterID: 1, FeatureKey: featureKey,
		State: map[string]interface{}{"b": map[string]interface{}{"3": map[string]interface{}{"t": 265, "n": 5}}},
	}}

	delta, err := svc.BreakTalentStone(context.Background(), 1, 3, 265, 2)
	if err != nil {
		t.Fatalf("BreakTalentStone: %v", err)
	}
	if repo.chars[1].PvePoint != 88 {
		t.Fatalf("pvePoint = %d, want 88 (2*44)", repo.chars[1].PvePoint)
	}
	d := delta["d"].(map[string]interface{})
	cell := d["3"].(map[string]interface{})
	if cell["ln"] != 3 {
		t.Fatalf("remaining ln = %v, want 3", cell["ln"])
	}
}

func TestFillTalentStone_UnlockGateAndMove(t *testing.T) {
	g := newFakeGameData(
		slotRec(6, 10001, 5, 0), slotRec(12, 10002, 5, 0), slotRec(18, 10003, 5, 0),
		slotRec(24, 10004, 5, 0), stoneRec(265, 1, 1, 44),
	)
	char := &domainchar.Character{ID: 1}
	svc, _, _ := newSvc(char, g)
	frepo := svc.featureRepo.(*fakeFeatureRepo)
	frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
		CharacterID: 1, FeatureKey: featureKey,
		State: map[string]interface{}{
			"tal": map[string]interface{}{"10001": 6, "10002": 12, "10003": 18, "10004": 24},
			"b":   map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 1}},
		},
	}}

	payload, err := svc.FillTalentStone(context.Background(), 1, 1, 10010, 265)
	if err != nil {
		t.Fatalf("FillTalentStone (total lv 20 should pass gate): %v", err)
	}
	pan := payload["pan"].(map[string]interface{})
	a := pan["a"].(map[string]interface{})
	if a["10010"].(map[string]interface{})["tid"] != 265 {
		t.Fatalf("pan.a missing inlaid stone: %+v", a)
	}
	st := stateFromMap(frepo.charStates[1][0].State)
	if st.InTal[10010] != 265 {
		t.Fatalf("inTal not persisted: %+v", st.InTal)
	}
	if _, ok := st.Bag[1]; ok {
		t.Fatalf("bag stone not consumed: %+v", st.Bag)
	}
}

func TestFillTalentStone_LockedBelowGate(t *testing.T) {
	g := newFakeGameData(slotRec(2, 10001, 1, 0), stoneRec(265, 1, 1, 44))
	char := &domainchar.Character{ID: 1}
	svc, _, _ := newSvc(char, g)
	frepo := svc.featureRepo.(*fakeFeatureRepo)
	frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
		CharacterID: 1, FeatureKey: featureKey,
		State: map[string]interface{}{
			"tal": map[string]interface{}{"10001": 2},
			"b":   map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 1}},
		},
	}}
	if _, err := svc.FillTalentStone(context.Background(), 1, 1, 10010, 265); !errors.Is(err, ErrSlotLocked) {
		t.Fatalf("want ErrSlotLocked below gate, got %v", err)
	}
}

func TestUpTalentStone_FuseFiveIntoNextLevel_RandomLine(t *testing.T) {
	g := newFakeGameData(gradePool(44, map[int]int{265: 1, 270: 2, 275: 6})...)
	allowedLv2 := map[int]bool{266: true, 271: true, 276: true}
	allowedProp := map[int]bool{1: true, 2: true, 6: true}

	seen := map[int]bool{}
	for seed := int64(0); seed < 40; seed++ {
		char := &domainchar.Character{ID: 1}
		svc, _, _ := newSvc(char, g)
		svc.SetRandSeed(seed)
		frepo := svc.featureRepo.(*fakeFeatureRepo)
		frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
			CharacterID: 1, FeatureKey: featureKey,
			State: map[string]interface{}{"b": map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 5}}},
		}}

		delta, err := svc.UpTalentStone(context.Background(), 1, "1|1|1|1|1", "265|265|265|265|265", false)
		if err != nil {
			t.Fatalf("seed %d UpTalentStone: %v", seed, err)
		}
		st := stateFromMap(frepo.charStates[1][0].State)
		if _, ok := st.Bag[1]; ok {
			t.Fatalf("seed %d: source stack should be consumed: %+v", seed, st.Bag)
		}
		if delta["a"] == nil || delta["d"] == nil {
			t.Fatalf("seed %d: delta missing a/d: %+v", seed, delta)
		}
		var produced int
		for _, e := range st.Bag {
			if e.N == 1 {
				produced = e.T
			}
		}
		rec := g.GetPetTalent(produced)
		if rec == nil {
			t.Fatalf("seed %d: produced id %d not a gamedata record (bag=%+v)", seed, produced, st.Bag)
		}
		if int(rec.Lv) != 2 {
			t.Fatalf("seed %d: fuse result must be lv2, got lv%d (id=%d)", seed, int(rec.Lv), produced)
		}
		if !allowedLv2[produced] || !allowedProp[int(rec.PropType)] {
			t.Fatalf("seed %d: fuse result id=%d prop=%d outside the lv2 grade-44 pool", seed, produced, int(rec.PropType))
		}
		seen[int(rec.PropType)] = true
	}
	if len(seen) < 2 {
		t.Fatalf("expected the seeded RNG to pick >=2 distinct result lines across seeds, got %v", seen)
	}
}

func TestUpTalentStone_DeterministicFallbackWhenSingletonPool(t *testing.T) {
	g := newFakeGameData(stoneFamily(265, 1, 44)...)
	char := &domainchar.Character{ID: 1}
	svc, _, _ := newSvc(char, g)
	svc.SetRandSeed(7)
	frepo := svc.featureRepo.(*fakeFeatureRepo)
	frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
		CharacterID: 1, FeatureKey: featureKey,
		State: map[string]interface{}{"b": map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 5}}},
	}}

	if _, err := svc.UpTalentStone(context.Background(), 1, "1|1|1|1|1", "265|265|265|265|265", false); err != nil {
		t.Fatalf("UpTalentStone: %v", err)
	}
	st := stateFromMap(frepo.charStates[1][0].State)
	var produced int
	for _, e := range st.Bag {
		produced = e.T
	}
	if produced != 266 {
		t.Fatalf("single-line pool must fuse to the same-line lv2 id 266, got %d (bag=%+v)", produced, st.Bag)
	}
}

func TestResetTalentSlot_RerollsWithinPool(t *testing.T) {
	g := newFakeGameData(gradePool(44, map[int]int{265: 1, 270: 2, 275: 6})...)
	allowedLv1 := map[int]bool{265: true, 270: true, 275: true}
	allowedProp := map[int]bool{1: true, 2: true, 6: true}

	seen := map[int]bool{}
	for seed := int64(0); seed < 40; seed++ {
		char := &domainchar.Character{ID: 1}
		svc, _, _ := newSvc(char, g)
		svc.SetRandSeed(seed)
		frepo := svc.featureRepo.(*fakeFeatureRepo)
		frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
			CharacterID: 1, FeatureKey: featureKey,
			State: map[string]interface{}{"b": map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 2}}},
		}}

		if _, err := svc.ResetTalentSlot(context.Background(), 1, "265|265", "1|1"); err != nil {
			t.Fatalf("seed %d ResetTalentSlot: %v", seed, err)
		}
		st := stateFromMap(frepo.charStates[1][0].State)
		var produced int
		for _, e := range st.Bag {
			produced = e.T
		}
		rec := g.GetPetTalent(produced)
		if rec == nil || int(rec.Lv) != 1 {
			t.Fatalf("seed %d: reroll must yield a valid lv1 stone, got %d (%+v)", seed, produced, rec)
		}
		if !allowedLv1[produced] || !allowedProp[int(rec.PropType)] {
			t.Fatalf("seed %d: reroll id=%d prop=%d outside the lv1 grade-44 pool", seed, produced, int(rec.PropType))
		}
		seen[int(rec.PropType)] = true
	}
	if len(seen) < 2 {
		t.Fatalf("expected the seeded reroll to span >=2 distinct lines across seeds, got %v", seen)
	}
}

func TestResetTalentSlot_SameLineAllowed(t *testing.T) {
	g := newFakeGameData(gradePool(44, map[int]int{265: 1, 270: 2, 275: 6})...)
	sawSameLine := false
	for seed := int64(0); seed < 60 && !sawSameLine; seed++ {
		char := &domainchar.Character{ID: 1}
		svc, _, _ := newSvc(char, g)
		svc.SetRandSeed(seed)
		frepo := svc.featureRepo.(*fakeFeatureRepo)
		frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
			CharacterID: 1, FeatureKey: featureKey,
			State: map[string]interface{}{"b": map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 2}}},
		}}
		if _, err := svc.ResetTalentSlot(context.Background(), 1, "265|265", "1|1"); err != nil {
			t.Fatalf("seed %d ResetTalentSlot: %v", seed, err)
		}
		st := stateFromMap(frepo.charStates[1][0].State)
		for _, e := range st.Bag {
			if e.T == 265 {
				sawSameLine = true
			}
		}
	}
	if !sawSameLine {
		t.Fatalf("documented assumption: same prop line must be reachable on reroll, but it never appeared across seeds")
	}
}

func TestResetTalentSlot_SeedDeterminism(t *testing.T) {
	g := newFakeGameData(gradePool(44, map[int]int{265: 1, 270: 2, 275: 6})...)
	run := func() int {
		char := &domainchar.Character{ID: 1}
		svc, _, _ := newSvc(char, g)
		svc.SetRandSeed(123)
		frepo := svc.featureRepo.(*fakeFeatureRepo)
		frepo.charStates[1] = []*domainfeature.CharacterFeatureState{{
			CharacterID: 1, FeatureKey: featureKey,
			State: map[string]interface{}{"b": map[string]interface{}{"1": map[string]interface{}{"t": 265, "n": 2}}},
		}}
		if _, err := svc.ResetTalentSlot(context.Background(), 1, "265|265", "1|1"); err != nil {
			t.Fatalf("ResetTalentSlot: %v", err)
		}
		st := stateFromMap(frepo.charStates[1][0].State)
		for _, e := range st.Bag {
			return e.T
		}
		return 0
	}
	if a, b := run(), run(); a != b {
		t.Fatalf("same seed must reproduce the same reroll result: %d vs %d", a, b)
	}
}
