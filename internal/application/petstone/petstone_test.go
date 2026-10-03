// Open-sourced by BaoLT

package petstone

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	gamedata "mcgame-server/internal/gamedata"
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

type fakeItemPort struct{}

func (p *fakeItemPort) GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error) {
	return nil, nil
}
func (p *fakeItemPort) ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error) {
	return nil, false, errors.New("unused")
}
func (p *fakeItemPort) AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error) {
	return nil, nil
}
func (p *fakeItemPort) IsDiamondItem(templateID int) bool { return false }

func loadTable(t *testing.T, m *gamedata.Manager, table string, rows []map[string]interface{}) {
	t.Helper()
	payloads := make([]json.RawMessage, 0, len(rows))
	for _, row := range rows {
		raw, err := json.Marshal(row)
		if err != nil {
			t.Fatalf("marshal row: %v", err)
		}
		payloads = append(payloads, raw)
	}
	if err := m.GetCache().LoadTable(table, payloads); err != nil {
		t.Fatalf("LoadTable(%s): %v", table, err)
	}
}

// passiveSkillIDs / specialSkillIDs mirror the real TBL_SKILL ex_stone_sid model:
// each base (passive) skill carries ex_stone_sid>0 pointing at its special
// counterpart, and each special target carries ex_stone_sid=-1.
var (
	passiveSkillIDs = []int{3303, 4057, 3415}
	specialSkillIDs = []int{60710, 60701, 60719}
)

func testGameData(t *testing.T) *gamedata.Manager {
	t.Helper()
	m := gamedata.NewManager(nil, zap.NewNop())
	loadTable(t, m, models.TablePetStone, []map[string]interface{}{
		{"id": 16, "cost_sil": 250000, "energy_flag": 0, "energy_id": 0, "level": 4, "name": "L4", "next_id": 17, "resolve_num": 31},
		{"id": 17, "cost_sil": 300000, "energy_flag": 0, "energy_id": 18, "level": 5, "name": "L5", "next_id": 0, "resolve_num": 54},
		{"id": 18, "cost_sil": 0, "energy_flag": 1, "energy_id": 0, "level": 6, "name": "Energy", "next_id": 0, "resolve_num": 60},
	})
	loadTable(t, m, models.TableSkill, []map[string]interface{}{
		{"id": 3303, "name": "Da Thu Cuong Vu", "type": 1, "ex_stone_sid": 60710},
		{"id": 4057, "name": "Tan Cong Cap Toc", "type": 1, "ex_stone_sid": 60701},
		{"id": 3415, "name": "Ai Tam Tri Du", "type": 5, "ex_stone_sid": 60719},
		{"id": 60710, "name": "Bao Thach Da Thu Cuong Vu", "type": 1, "ex_stone_sid": -1},
		{"id": 60701, "name": "Bao Thach Tan Cong Cap Toc", "type": 1, "ex_stone_sid": -1},
		{"id": 60719, "name": "Bao Thach Ai Tam Tri Du", "type": 5, "ex_stone_sid": -1},
		{"id": 100, "name": "Plain skill no exstone", "type": 1, "ex_stone_sid": 0},
	})
	return m
}

func newTestService(t *testing.T, char *domainchar.Character) (*Service, *fakeCharRepo) {
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	return NewService(newFakeRepo(), charRepo, &fakeItemPort{}, testGameData(t), zap.NewNop()), charRepo
}

func TestBagState_RoundTripThroughJSON(t *testing.T) {
	s := defaultBagState()
	s.Slots[0] = &BagEntry{Giid: 16, StackNum: 4, SkillID: 0}
	s.Slots[2] = &BagEntry{Giid: 18, StackNum: 1, SkillID: 777}

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := bagStateFromMap(decoded)

	if e := got.Slots[0]; e == nil || e.Giid != 16 || e.StackNum != 4 || e.SkillID != 0 {
		t.Fatalf("slot 0 mismatch: %+v", e)
	}
	if e := got.Slots[2]; e == nil || e.Giid != 18 || e.StackNum != 1 || e.SkillID != 777 {
		t.Fatalf("slot 2 mismatch: %+v", e)
	}

	arr := got.toArray()
	if len(arr) != 3 {
		t.Fatalf("array len = %d, want 3 (max slot index 2)", len(arr))
	}
	if arr[1] != nil {
		t.Fatalf("array[1] should be nil (empty slot), got %v", arr[1])
	}
	row, ok := arr[0].([]interface{})
	if !ok || row[0] != 16 || row[1] != 4 || row[2] != 0 {
		t.Fatalf("array[0] = %v, want [16 4 0]", arr[0])
	}
}

func TestInlayState_RoundTripThroughJSON(t *testing.T) {
	s := defaultInlayState()
	s.slots(50001)[1] = 18
	s.slots(50001)[3] = 16

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := inlayStateFromMap(decoded)
	slots := got.Equip[50001]
	if slots == nil || slots[1] != 18 || slots[3] != 16 {
		t.Fatalf("inlay round-trip mismatch: %+v", slots)
	}
}

func TestCompose_ConsumesSourceProducesNextTier(t *testing.T) {
	char := &domainchar.Character{ID: 1, Money: 10_000_000}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()

	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 16, StackNum: 5}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}

	if _, err := svc.Compose(ctx, 1, 0, 2); err != nil {
		t.Fatalf("Compose: %v", err)
	}
	got, _ := svc.loadBag(ctx, 1)
	if e := got.Slots[0]; e == nil || e.Giid != 16 || e.StackNum != 3 {
		t.Fatalf("source after compose = %+v, want giid 16 stack 3", e)
	}
	var nextEntry *BagEntry
	for _, e := range got.Slots {
		if e != nil && e.Giid == 17 {
			nextEntry = e
		}
	}
	if nextEntry == nil || nextEntry.StackNum != 2 {
		t.Fatalf("next-tier entry = %+v, want giid 17 stack 2", nextEntry)
	}
	wantMoney := int64(10_000_000) - int64(300000)*0 - int64(250000)*2
	if charRepo.chars[1].Money != wantMoney {
		t.Fatalf("money after compose = %d, want %d (10M - costSil(16)*2)", charRepo.chars[1].Money, wantMoney)
	}
}

func TestCompose_RejectsMaxTier(t *testing.T) {
	char := &domainchar.Character{ID: 1, Money: 10_000_000}
	svc, _ := newTestService(t, char)
	ctx := context.Background()
	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 17, StackNum: 5}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}
	if _, err := svc.Compose(ctx, 1, 0, 1); !errors.Is(err, ErrNoNextTier) {
		t.Fatalf("Compose level-5 err = %v, want ErrNoNextTier", err)
	}
}

func TestAbsorb_FiveLevel5ProducesEnergyStone(t *testing.T) {
	char := &domainchar.Character{ID: 1}
	svc, _ := newTestService(t, char)
	ctx := context.Background()
	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 17, StackNum: 5}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}

	if _, err := svc.Absorb(ctx, 1, []int{0, 0, 0, 0, 0}); err != nil {
		t.Fatalf("Absorb: %v", err)
	}
	got, _ := svc.loadBag(ctx, 1)
	if len(got.Slots) != 1 {
		t.Fatalf("bag should hold exactly the 1 produced energy stone, got %d slots", len(got.Slots))
	}
	var energy *BagEntry
	for _, e := range got.Slots {
		if e != nil && e.Giid == 18 {
			energy = e
		}
	}
	if energy == nil || energy.StackNum != 1 {
		t.Fatalf("energy stone entry = %+v, want giid 18 stack 1", energy)
	}
}

func TestResolve_AddsEnergyCurrencyAndConsumes(t *testing.T) {
	char := &domainchar.Character{ID: 1, EnergyStone: 10}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()
	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 18, StackNum: 3}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}

	if _, err := svc.Resolve(ctx, 1, 0, 2); err != nil {
		t.Fatalf("Resolve: %v", err)
	}
	if charRepo.chars[1].EnergyStone != 10+60*2 {
		t.Fatalf("energyStone after resolve = %d, want %d (10 + resolveNum*2)", charRepo.chars[1].EnergyStone, 10+60*2)
	}
	got, _ := svc.loadBag(ctx, 1)
	if e := got.Slots[0]; e == nil || e.StackNum != 1 {
		t.Fatalf("source after resolve = %+v, want stack 1", e)
	}
}

func TestSetThenRemove_MovesStoneBetweenBagAndInlay(t *testing.T) {
	char := &domainchar.Character{ID: 1}
	svc, _ := newTestService(t, char)
	ctx := context.Background()
	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 18, StackNum: 1, SkillID: 555}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}

	res, err := svc.Set(ctx, 1, 90001, EnergySlot, 0)
	if err != nil {
		t.Fatalf("Set: %v", err)
	}
	if res.NewID != 18 || res.SlotID != EnergySlot || res.SkillID != 555 {
		t.Fatalf("Set result = %+v, want newId 18 slot 1 skillId 555", res)
	}
	afterSet, _ := svc.loadBag(ctx, 1)
	if e := afterSet.Slots[0]; e != nil {
		t.Fatalf("bag slot 0 should be empty after inlay, got %+v", e)
	}
	inlay, _ := svc.loadInlay(ctx, 1)
	if inlay.Equip[90001][EnergySlot] != 18 {
		t.Fatalf("inlay[90001][1] = %d, want 18", inlay.Equip[90001][EnergySlot])
	}

	if _, err := svc.Remove(ctx, 1, 90001, EnergySlot); err != nil {
		t.Fatalf("Remove: %v", err)
	}
	afterRemove, _ := svc.loadBag(ctx, 1)
	var back *BagEntry
	for _, e := range afterRemove.Slots {
		if e != nil && e.Giid == 18 {
			back = e
		}
	}
	if back == nil || back.StackNum != 1 {
		t.Fatalf("stone not returned to bag: %+v", back)
	}
	inlay2, _ := svc.loadInlay(ctx, 1)
	if _, ok := inlay2.Equip[90001]; ok {
		t.Fatalf("inlay[90001] should be gone after removing last stone")
	}
}

func contains(ids []int, v int) bool {
	for _, id := range ids {
		if id == v {
			return true
		}
	}
	return false
}

func TestChangeEnergy_DeductsCurrencyByType(t *testing.T) {
	cases := []struct {
		name      string
		skillType int
		start     int
		wantLeft  int
		wantPool  []int
		wantErr   bool
	}{
		{"passive", skillTypePassive, 600, 100, passiveSkillIDs, false},
		{"special", skillTypeSpecial, 1500, 500, specialSkillIDs, false},
		{"insufficient", skillTypeSpecial, 100, 100, nil, true},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			char := &domainchar.Character{ID: 1, EnergyStone: tc.start}
			svc, charRepo := newTestService(t, char)
			ctx := context.Background()
			bag := defaultBagState()
			bag.Slots[0] = &BagEntry{Giid: 18, StackNum: 1}
			if err := svc.saveBag(ctx, 1, bag); err != nil {
				t.Fatalf("seed bag: %v", err)
			}
			res, err := svc.ChangeEnergy(ctx, 1, 0, tc.skillType)
			if tc.wantErr {
				if err == nil {
					t.Fatalf("expected error, got nil")
				}
				if charRepo.chars[1].EnergyStone != tc.start {
					t.Fatalf("energyStone changed on failure: %d, want %d (consume-then-credit, no charge without grant)", charRepo.chars[1].EnergyStone, tc.start)
				}
				return
			}
			if err != nil {
				t.Fatalf("ChangeEnergy: %v", err)
			}
			if charRepo.chars[1].EnergyStone != tc.wantLeft {
				t.Fatalf("energyStone = %d, want %d", charRepo.chars[1].EnergyStone, tc.wantLeft)
			}
			if res.SkillID <= 0 {
				t.Fatalf("skillId = %d, want a real skill id (not the pay-for-nothing 0 stub)", res.SkillID)
			}
			if !contains(tc.wantPool, res.SkillID) {
				t.Fatalf("skillId = %d not drawn from %v pool %v", res.SkillID, tc.name, tc.wantPool)
			}
			got, _ := svc.loadBag(ctx, 1)
			if e := got.Slots[0]; e == nil || e.SkillID != res.SkillID {
				t.Fatalf("bag entry skillId = %+v, want persisted %d", e, res.SkillID)
			}
		})
	}
}

func TestChangeEnergy_RejectsInvalidSkillType(t *testing.T) {
	char := &domainchar.Character{ID: 1, EnergyStone: 5000}
	svc, charRepo := newTestService(t, char)
	ctx := context.Background()
	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 18, StackNum: 1}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}
	if _, err := svc.ChangeEnergy(ctx, 1, 0, 3); !errors.Is(err, ErrInvalidSkillType) {
		t.Fatalf("ChangeEnergy type 3 err = %v, want ErrInvalidSkillType", err)
	}
	if charRepo.chars[1].EnergyStone != 5000 {
		t.Fatalf("energyStone changed on invalid type: %d, want 5000", charRepo.chars[1].EnergyStone)
	}
}

func TestChangeEnergy_UniformDrawCoversWholePool(t *testing.T) {
	passive, special := buildPoolFrom(t)
	for _, tc := range []struct {
		name      string
		skillType int
		pool      []int
	}{
		{"passive", skillTypePassive, passive},
		{"special", skillTypeSpecial, special},
	} {
		t.Run(tc.name, func(t *testing.T) {
			seen := map[int]int{}
			for i := 0; i < 600; i++ {
				char := &domainchar.Character{ID: 1, EnergyStone: 5000}
				svc, _ := newTestService(t, char)
				idx := i % len(tc.pool)
				svc.rng = func(int) int { return idx }
				ctx := context.Background()
				bag := defaultBagState()
				bag.Slots[0] = &BagEntry{Giid: 18, StackNum: 1}
				if err := svc.saveBag(ctx, 1, bag); err != nil {
					t.Fatalf("seed bag: %v", err)
				}
				res, err := svc.ChangeEnergy(ctx, 1, 0, tc.skillType)
				if err != nil {
					t.Fatalf("ChangeEnergy: %v", err)
				}
				if !contains(tc.pool, res.SkillID) {
					t.Fatalf("drew %d outside pool %v", res.SkillID, tc.pool)
				}
				seen[res.SkillID]++
			}
			for _, id := range tc.pool {
				if seen[id] == 0 {
					t.Fatalf("pool id %d never reachable via uniform index draw; pool=%v seen=%v", id, tc.pool, seen)
				}
			}
		})
	}
}

func buildPoolFrom(t *testing.T) (passive, special []int) {
	t.Helper()
	m := testGameData(t)
	return m.PetStoneExSkillPool()
}

func TestPetStoneExSkillPool_SegmentsBaseAndSpecial(t *testing.T) {
	passive, special := buildPoolFrom(t)

	wantPassive := []int{3303, 3415, 4057}
	wantSpecial := []int{60701, 60710, 60719}
	if !equalInts(passive, wantPassive) {
		t.Fatalf("passive pool = %v, want %v (ex_stone_sid>0 base rows, sorted)", passive, wantPassive)
	}
	if !equalInts(special, wantSpecial) {
		t.Fatalf("special pool = %v, want %v (ex_stone_sid targets, sorted)", special, wantSpecial)
	}
	if contains(passive, 100) || contains(special, 100) {
		t.Fatalf("plain skill 100 (ex_stone_sid=0) must not appear in either pool")
	}
	if contains(passive, 60710) {
		t.Fatalf("special target 60710 must not appear in the passive pool")
	}
}

func equalInts(a, b []int) bool {
	if len(a) != len(b) {
		return false
	}
	for i := range a {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}

func TestChangeEnergy_RejectsNonEnergyStone(t *testing.T) {
	char := &domainchar.Character{ID: 1, EnergyStone: 5000}
	svc, _ := newTestService(t, char)
	ctx := context.Background()
	bag := defaultBagState()
	bag.Slots[0] = &BagEntry{Giid: 17, StackNum: 1}
	if err := svc.saveBag(ctx, 1, bag); err != nil {
		t.Fatalf("seed bag: %v", err)
	}
	if _, err := svc.ChangeEnergy(ctx, 1, 0, 2); !errors.Is(err, ErrNotEnergyStone) {
		t.Fatalf("ChangeEnergy on non-energy stone err = %v, want ErrNotEnergyStone", err)
	}
}
