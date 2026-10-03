// Open-sourced by BaoLT

package fairy

import (
	"context"
	"encoding/json"
	"errors"
	"testing"
	"time"

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
	items              map[int64]*domainitem.Item
	byTemplate         map[int]*domainitem.Item
	added              []int
	consumed           []int64
	consumedByTemplate []int
}

func newFakeItemPort() *fakeItemPort {
	return &fakeItemPort{
		items:      map[int64]*domainitem.Item{},
		byTemplate: map[int]*domainitem.Item{},
	}
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
	it.StackCount -= count
	if it.StackCount <= 0 {
		delete(p.items, itemID)
		return &domainitem.Item{TemplateID: it.TemplateID, StackCount: 0}, true, nil
	}
	return it, false, nil
}
func (p *fakeItemPort) ConsumeItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) (bool, error) {
	it := p.byTemplate[templateID]
	if it == nil || it.StackCount < count {
		return false, nil
	}
	p.consumedByTemplate = append(p.consumedByTemplate, templateID)
	it.StackCount -= count
	if it.StackCount <= 0 {
		delete(p.byTemplate, templateID)
	}
	return true, nil
}
func (p *fakeItemPort) AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error) {
	p.added = append(p.added, templateID)
	return &domainitem.Item{TemplateID: templateID}, nil
}
func (p *fakeItemPort) IsDiamondItem(templateID int) bool { return false }

type fakeClock struct{ t time.Time }

func (c *fakeClock) Now() time.Time { return c.t }

func newTestService(char *domainchar.Character) (*Service, *fakeFeatureRepo, *fakeCharRepo, *fakeItemPort, *fakeClock) {
	repo := newFakeRepo()
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	items := newFakeItemPort()
	clock := &fakeClock{t: time.Date(2026, 6, 14, 12, 0, 0, 0, time.UTC)}
	svc := NewService(repo, charRepo, items, nil, zap.NewNop())
	svc.clock = clock
	return svc, repo, charRepo, items, clock
}

func seedFairy(t *testing.T, repo *fakeFeatureRepo, charID int64, f *Fairy) {
	t.Helper()
	state := defaultState()
	state.Fairies[f.ID] = f
	repo.charStates[charID] = append(repo.charStates[charID], &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  rosterFeatureKey,
		State:       state.toPersist(),
	})
}

type fakeSkillData struct {
	byID map[int]*models.SkillTemplate
	all  []*models.SkillTemplate
}

func newFakeSkillData(rows []*models.SkillTemplate) *fakeSkillData {
	fd := &fakeSkillData{byID: map[int]*models.SkillTemplate{}, all: rows}
	for _, r := range rows {
		fd.byID[int(r.ID)] = r
	}
	return fd
}

func (f *fakeSkillData) GetSkill(id int) *models.SkillTemplate {
	return f.byID[id]
}
func (f *fakeSkillData) GetAllSkills() []*models.SkillTemplate {
	return f.all
}

func chainSkills(codeName string, id1, id2, id3 int) []*models.SkillTemplate {
	return []*models.SkillTemplate{
		{ID: int64(id1), CodeName: codeName, Level: 1},
		{ID: int64(id2), CodeName: codeName, Level: 2},
		{ID: int64(id3), CodeName: codeName, Level: 3},
	}
}

func TestState_RoundTripThroughJSON(t *testing.T) {
	s := defaultState()
	f := newFairy(101)
	f.Tid = 86001
	f.Name = "Linh"
	f.Exp = 1500
	f.Gexp = 3500
	f.Doh = 250
	f.StaG = 1.5
	f.Cc = 3
	f.Binded = 1
	f.State = 1
	f.Gnum = 7
	f.En = 9
	f.ResetDay = "2026-06-14"
	f.SkillFlag["s1"] = 5001
	f.SkillFlag["s3"] = 5003
	f.Config = map[string]interface{}{"select": float64(1), "0": map[string]interface{}{"c0": float64(11)}}
	s.Fairies[101] = f

	raw, err := json.Marshal(s.toPersist())
	if err != nil {
		t.Fatalf("marshal: %v", err)
	}
	var decoded map[string]interface{}
	if err := json.Unmarshal(raw, &decoded); err != nil {
		t.Fatalf("unmarshal: %v", err)
	}
	got := stateFromMap(decoded)

	g, ok := got.fairy(101)
	if !ok {
		t.Fatalf("fairy 101 missing after round-trip")
	}
	if g.Tid != 86001 || g.Name != "Linh" || g.Exp != 1500 || g.Gexp != 3500 || g.Doh != 250 {
		t.Fatalf("scalar mismatch: %+v", g)
	}
	if g.StaG != 1.5 {
		t.Fatalf("float StaG = %v, want 1.5", g.StaG)
	}
	if g.Cc != 3 || g.Binded != 1 || g.State != 1 {
		t.Fatalf("flags mismatch: cc=%d binded=%d state=%d", g.Cc, g.Binded, g.State)
	}
	if g.Gnum != 7 || g.En != 9 || g.ResetDay != "2026-06-14" {
		t.Fatalf("daily flag mismatch: gnum=%d en=%d rs=%s", g.Gnum, g.En, g.ResetDay)
	}
	if g.SkillFlag["s1"] != 5001 || g.SkillFlag["s3"] != 5003 {
		t.Fatalf("skillFlag mismatch: %+v", g.SkillFlag)
	}
	if g.Config["select"] != float64(1) {
		t.Fatalf("config select = %v, want 1", g.Config["select"])
	}
}

func TestRoster_ToWireShape(t *testing.T) {
	svc, repo, _, _, _ := newTestService(nil)
	f := newFairy(7)
	f.Tid = 86002
	f.ResetDay = "2026-06-14"
	seedFairy(t, repo, 1, f)

	roster, err := svc.Roster(context.Background(), 1)
	if err != nil {
		t.Fatalf("Roster: %v", err)
	}
	entry, ok := roster["7"].(map[string]interface{})
	if !ok {
		t.Fatalf("roster[7] missing, got %+v", roster)
	}
	if entry["tid"] != 86002 {
		t.Fatalf("tid = %v, want 86002", entry["tid"])
	}
	flag, ok := entry["flag"].(map[string]interface{})
	if !ok || flag["gnum"] == nil || flag["en"] == nil {
		t.Fatalf("flag missing gnum/en: %+v", entry["flag"])
	}
	if _, ok := entry["skillFlag"].(map[string]interface{}); !ok {
		t.Fatalf("skillFlag not an object: %+v", entry["skillFlag"])
	}
}

func TestRoster_DailyResetRefills(t *testing.T) {
	svc, repo, _, _, clock := newTestService(nil)
	f := newFairy(7)
	f.Gnum = 0
	f.En = 0
	f.ResetDay = "2026-06-10"
	seedFairy(t, repo, 1, f)

	clock.t = time.Date(2026, 6, 14, 0, 0, 0, 0, time.UTC)
	roster, err := svc.Roster(context.Background(), 1)
	if err != nil {
		t.Fatalf("Roster: %v", err)
	}
	flag := roster["7"].(map[string]interface{})["flag"].(map[string]interface{})
	if flag["gnum"].(int) != dailyCultivations || flag["en"].(int) != dailyFruitFeeds {
		t.Fatalf("daily not refilled: gnum=%v en=%v", flag["gnum"], flag["en"])
	}
	if flag["rs"].(string) != "2026-06-14" {
		t.Fatalf("reset day = %v, want 2026-06-14", flag["rs"])
	}
}

func TestGrowUp_MoneyPath_DeductsAndGrows(t *testing.T) {
	char := &domainchar.Character{ID: 1, Money: 200000}
	svc, repo, charRepo, _, _ := newTestService(char)
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.Gnum = 5
	seedFairy(t, repo, 1, f)

	res, err := svc.GrowUp(context.Background(), 1, 7, GrowTypeMoney)
	if err != nil {
		t.Fatalf("GrowUp money: %v", err)
	}
	if !res.F || res.Cri != 0 {
		t.Fatalf("money grow result: %+v (cri must be 0)", res)
	}
	if res.Exp <= 0 {
		t.Fatalf("gexp gain = %d, want > 0", res.Exp)
	}
	if res.Gnum != 4 {
		t.Fatalf("gnum after grow = %d, want 4", res.Gnum)
	}
	if charRepo.chars[1].Money != 200000-GrowCostMoney {
		t.Fatalf("money after grow = %d, want %d", charRepo.chars[1].Money, 200000-GrowCostMoney)
	}
}

func TestGrowUp_GoldPath_DeductsGold(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 100}
	svc, repo, charRepo, _, _ := newTestService(char)
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.Gnum = 5
	seedFairy(t, repo, 1, f)

	if _, err := svc.GrowUp(context.Background(), 1, 7, GrowTypeGold); err != nil {
		t.Fatalf("GrowUp gold: %v", err)
	}
	if charRepo.chars[1].Gold != 100-GrowCostGold {
		t.Fatalf("gold after grow = %d, want %d", charRepo.chars[1].Gold, 100-GrowCostGold)
	}
}

func TestGrowUp_GoldBatch_RunsUpToTwentyAndChargesEach(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, repo, charRepo, _, _ := newTestService(char)
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.Gnum = GrowBatchMultiple
	seedFairy(t, repo, 1, f)

	res, err := svc.GrowUp(context.Background(), 1, 7, GrowTypeGoldBatch)
	if err != nil {
		t.Fatalf("GrowUp batch: %v", err)
	}
	if !res.F {
		t.Fatalf("batch result not applied: %+v", res)
	}
	if res.Gnum != 0 {
		t.Fatalf("gnum after full batch = %d, want 0", res.Gnum)
	}
	wantSpent := int64(GrowBatchMultiple * GrowCostGold)
	if charRepo.chars[1].Gold != 1000-wantSpent {
		t.Fatalf("gold after batch = %d, want %d", charRepo.chars[1].Gold, 1000-wantSpent)
	}
	if res.Exp <= 0 {
		t.Fatalf("batch total gexp = %d, want > 0", res.Exp)
	}
}

func TestGrowUp_GoldBatch_StopsWhenGoldRunsOut(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 12}
	svc, repo, charRepo, _, _ := newTestService(char)
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.Gnum = GrowBatchMultiple
	seedFairy(t, repo, 1, f)

	res, err := svc.GrowUp(context.Background(), 1, 7, GrowTypeGoldBatch)
	if err != nil {
		t.Fatalf("GrowUp partial batch: %v", err)
	}
	if !res.F {
		t.Fatalf("partial batch not applied: %+v", res)
	}
	if charRepo.chars[1].Gold != 12-2*GrowCostGold {
		t.Fatalf("gold after partial batch = %d, want %d", charRepo.chars[1].Gold, 12-2*GrowCostGold)
	}
	if res.Gnum != GrowBatchMultiple-2 {
		t.Fatalf("gnum after partial batch = %d, want %d", res.Gnum, GrowBatchMultiple-2)
	}
}

func TestGrowUp_InsufficientMoney(t *testing.T) {
	char := &domainchar.Character{ID: 1, Money: 10}
	svc, repo, _, _, _ := newTestService(char)
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.Gnum = 5
	seedFairy(t, repo, 1, f)

	if _, err := svc.GrowUp(context.Background(), 1, 7, GrowTypeMoney); !errors.Is(err, ErrInsufficientMoney) {
		t.Fatalf("want ErrInsufficientMoney, got %v", err)
	}
}

func TestGrowUp_NoCultivationsLeft(t *testing.T) {
	char := &domainchar.Character{ID: 1, Money: 200000}
	svc, repo, _, _, _ := newTestService(char)
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.Gnum = 0
	seedFairy(t, repo, 1, f)

	if _, err := svc.GrowUp(context.Background(), 1, 7, GrowTypeMoney); !errors.Is(err, ErrNoCultivations) {
		t.Fatalf("want ErrNoCultivations, got %v", err)
	}
}

func TestAddExp_ConsumesFruitAndAddsExp(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.En = 5
	seedFairy(t, repo, 1, f)
	items.items[500] = &domainitem.Item{ID: 500, TemplateID: 3390, StackCount: 3}

	res, err := svc.AddExp(context.Background(), 1, 7, []int64{500}, 1)
	if err != nil {
		t.Fatalf("AddExp: %v", err)
	}
	if !res.F || res.Num != 1 {
		t.Fatalf("addexp result: %+v", res)
	}
	if res.En != 4 {
		t.Fatalf("feeds left = %d, want 4", res.En)
	}
	state := stateFromMap(repo.charStates[1][0].State)
	g, _ := state.fairy(7)
	if g.Exp != FairyExpFruitGain[3390] {
		t.Fatalf("exp after feed = %d, want %d", g.Exp, FairyExpFruitGain[3390])
	}
}

func TestAddExp_PerFruitMagnitudes(t *testing.T) {
	for tid, want := range FairyExpFruitGain {
		svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
		f := newFairy(7)
		f.ResetDay = "2026-06-14"
		f.En = 5
		seedFairy(t, repo, 1, f)
		items.items[500] = &domainitem.Item{ID: 500, TemplateID: tid, StackCount: 3}

		res, err := svc.AddExp(context.Background(), 1, 7, []int64{500}, 1)
		if err != nil {
			t.Fatalf("AddExp fruit %d: %v", tid, err)
		}
		if !res.F {
			t.Fatalf("AddExp fruit %d not applied: %+v", tid, res)
		}
		g, _ := stateFromMap(repo.charStates[1][0].State).fairy(7)
		if g.Exp != want {
			t.Fatalf("fruit %d exp = %d, want %d", tid, g.Exp, want)
		}
	}
}

func TestAddExp_RejectsNonFruit(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.En = 5
	seedFairy(t, repo, 1, f)
	items.items[500] = &domainitem.Item{ID: 500, TemplateID: 9999, StackCount: 3}

	if _, err := svc.AddExp(context.Background(), 1, 7, []int64{500}, 1); !errors.Is(err, ErrItemNotFound) {
		t.Fatalf("non-fruit feed: want ErrItemNotFound, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("non-fruit must not be consumed: %+v", items.consumed)
	}
}

func TestOnSkill_TeachesAndConsumesBook(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	seedFairy(t, repo, 1, f)
	items.items[600] = &domainitem.Item{ID: 600, TemplateID: 3577, StackCount: 1}

	res, err := svc.OnSkill(context.Background(), 1, 7, 600)
	if err != nil {
		t.Fatalf("OnSkill: %v", err)
	}
	wantSkillID := SkillItemToTblSkill[3577]
	if !res.Flag || res.Sindex != "s1" || res.Skill != wantSkillID {
		t.Fatalf("onSkill result: %+v (want Skill=%d)", res, wantSkillID)
	}
	if len(items.consumed) != 1 || items.consumed[0] != 600 {
		t.Fatalf("skill book not consumed: %+v", items.consumed)
	}
	state := stateFromMap(repo.charStates[1][0].State)
	g, _ := state.fairy(7)
	if g.SkillFlag["s1"] != wantSkillID {
		t.Fatalf("skillFlag.s1 = %d, want %d", g.SkillFlag["s1"], wantSkillID)
	}
}

func TestOnSkill_RejectsUnknownTemplateID(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	seedFairy(t, repo, 1, f)
	items.items[600] = &domainitem.Item{ID: 600, TemplateID: 9999, StackCount: 1}

	res, err := svc.OnSkill(context.Background(), 1, 7, 600)
	if err == nil || res.Flag {
		t.Fatalf("expected failure for unknown template id, got res=%+v err=%v", res, err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("book must not be consumed for unknown template: %+v", items.consumed)
	}
}

func TestUpSkill_Lv1ToLv2_ConsumesOneBook(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.SkillFlag["s1"] = 5917
	seedFairy(t, repo, 1, f)

	sd := newFakeSkillData(chainSkills("fairy_skill_a", 5917, 5918, 5919))
	svc.SetSkillData(sd)
	items.byTemplate[ItemFairySkillUpItem] = &domainitem.Item{TemplateID: ItemFairySkillUpItem, StackCount: 5}

	res, err := svc.UpSkill(context.Background(), 1, 7, 1)
	if err != nil {
		t.Fatalf("UpSkill lv1->2: %v", err)
	}
	if !res.Flag || res.Sindex != "s1" || res.Skill != 5918 {
		t.Fatalf("UpSkill result: %+v (want Skill=5918)", res)
	}
	if len(items.consumedByTemplate) != 1 || items.consumedByTemplate[0] != ItemFairySkillUpItem {
		t.Fatalf("book consume record: %+v", items.consumedByTemplate)
	}
	if items.byTemplate[ItemFairySkillUpItem].StackCount != 4 {
		t.Fatalf("book count after lv1->2 = %d, want 4", items.byTemplate[ItemFairySkillUpItem].StackCount)
	}
	state := stateFromMap(repo.charStates[1][0].State)
	g, _ := state.fairy(7)
	if g.SkillFlag["s1"] != 5918 {
		t.Fatalf("persisted skillFlag.s1 = %d, want 5918", g.SkillFlag["s1"])
	}
}

func TestUpSkill_Lv2ToLv3_ConsumesThreeBooks(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.SkillFlag["s2"] = 5918
	seedFairy(t, repo, 1, f)

	sd := newFakeSkillData(chainSkills("fairy_skill_a", 5917, 5918, 5919))
	svc.SetSkillData(sd)
	items.byTemplate[ItemFairySkillUpItem] = &domainitem.Item{TemplateID: ItemFairySkillUpItem, StackCount: 5}

	res, err := svc.UpSkill(context.Background(), 1, 7, 2)
	if err != nil {
		t.Fatalf("UpSkill lv2->3: %v", err)
	}
	if !res.Flag || res.Sindex != "s2" || res.Skill != 5919 {
		t.Fatalf("UpSkill result: %+v (want Skill=5919 at s2)", res)
	}
	remaining := 0
	if it := items.byTemplate[ItemFairySkillUpItem]; it != nil {
		remaining = it.StackCount
	}
	if remaining != 2 {
		t.Fatalf("book count after lv2->3 = %d, want 2", remaining)
	}
}

func TestUpSkill_AtMaxLevel_ReturnsError(t *testing.T) {
	svc, repo, _, items, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.SkillFlag["s3"] = 5919
	seedFairy(t, repo, 1, f)

	sd := newFakeSkillData(chainSkills("fairy_skill_a", 5917, 5918, 5919))
	svc.SetSkillData(sd)
	items.byTemplate[ItemFairySkillUpItem] = &domainitem.Item{TemplateID: ItemFairySkillUpItem, StackCount: 5}

	res, err := svc.UpSkill(context.Background(), 1, 7, 3)
	if err == nil {
		t.Fatalf("expected error at max level, got nil")
	}
	if res.Flag {
		t.Fatalf("Flag must be false at max level: %+v", res)
	}
	if !errors.Is(err, ErrSkillMaxLevel) {
		t.Fatalf("want ErrSkillMaxLevel, got %v", err)
	}
	if len(items.consumedByTemplate) != 0 {
		t.Fatalf("no books should be consumed at max level")
	}
}

func TestUpSkill_ErrorOnUnlearnedSlot(t *testing.T) {
	svc, repo, _, _, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.SkillFlag["s1"] = 5917
	seedFairy(t, repo, 1, f)

	sd := newFakeSkillData(chainSkills("fairy_skill_a", 5917, 5918, 5919))
	svc.SetSkillData(sd)

	if _, err := svc.UpSkill(context.Background(), 1, 7, 5); !errors.Is(err, ErrSkillFailed) {
		t.Fatalf("UpSkill empty slot: want ErrSkillFailed, got %v", err)
	}
}

func TestUpSkill_NoSkillData_EchoesCurrentID(t *testing.T) {
	svc, repo, _, _, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	f.SkillFlag["s1"] = 5917
	seedFairy(t, repo, 1, f)

	res, err := svc.UpSkill(context.Background(), 1, 7, 1)
	if err != nil {
		t.Fatalf("UpSkill no skill data: %v", err)
	}
	if !res.Flag || res.Sindex != "s1" || res.Skill != 5917 {
		t.Fatalf("UpSkill result (no skill data): %+v", res)
	}
}

func TestChangeState_TogglesAndComputesResCode(t *testing.T) {
	svc, repo, _, _, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.Tid = 86005
	f.ResetDay = "2026-06-14"
	seedFairy(t, repo, 1, f)

	res, err := svc.ChangeState(context.Background(), 1, 7, 1)
	if err != nil {
		t.Fatalf("ChangeState on: %v", err)
	}
	if res.State != 1 || res.ResCode != 86005 {
		t.Fatalf("guard state: %+v (resCode should fall back to tid)", res)
	}

	off, err := svc.ChangeState(context.Background(), 1, 7, 0)
	if err != nil {
		t.Fatalf("ChangeState off: %v", err)
	}
	if off.State != 0 {
		t.Fatalf("rest state = %d, want 0", off.State)
	}
}

func TestDelete_RemovesFairy(t *testing.T) {
	svc, repo, _, _, _ := newTestService(&domainchar.Character{ID: 1})
	f := newFairy(7)
	f.ResetDay = "2026-06-14"
	seedFairy(t, repo, 1, f)

	if err := svc.Delete(context.Background(), 1, 7); err != nil {
		t.Fatalf("Delete: %v", err)
	}
	state := stateFromMap(repo.charStates[1][0].State)
	if _, ok := state.fairy(7); ok {
		t.Fatalf("fairy 7 still present after delete")
	}
	if err := svc.Delete(context.Background(), 1, 7); !errors.Is(err, ErrFairyMissing) {
		t.Fatalf("delete missing: want ErrFairyMissing, got %v", err)
	}
}

func TestSkin_UnlockActivateRoundTrip(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 1000}
	svc, _, charRepo, _, _ := newTestService(char)
	ctx := context.Background()

	res, err := svc.SetResList(ctx, 1, 15)
	if err != nil {
		t.Fatalf("SetResList: %v", err)
	}
	if res["actFairyList"].(string) != "15" {
		t.Fatalf("actFairyList = %v, want '15'", res["actFairyList"])
	}
	if charRepo.chars[1].Gold != 1000-SkinUnlockGoldCost {
		t.Fatalf("gold after skin unlock = %d, want %d", charRepo.chars[1].Gold, 1000-SkinUnlockGoldCost)
	}

	if _, err := svc.SetResList(ctx, 1, 15); !errors.Is(err, ErrSkinOwned) {
		t.Fatalf("re-unlock: want ErrSkinOwned, got %v", err)
	}

	act, err := svc.SetRes(ctx, 1, 15, SetFairyResShow)
	if err != nil {
		t.Fatalf("SetRes show: %v", err)
	}
	if act.Type != SetFairyResShow || act.Tid != 15 {
		t.Fatalf("setRes result: %+v", act)
	}
	list, err := svc.GetResAndList(ctx, 1)
	if err != nil {
		t.Fatalf("GetResAndList: %v", err)
	}
	if list["actFairy"].(int) != 15 {
		t.Fatalf("actFairy = %v, want 15", list["actFairy"])
	}

	if _, err := svc.SetRes(ctx, 1, 99, SetFairyResShow); !errors.Is(err, ErrSkinNotOwned) {
		t.Fatalf("activate unowned: want ErrSkinNotOwned, got %v", err)
	}
}
