// Open-sourced by BaoLT

package mysterytreasure

import (
	"context"
	"testing"

	appmystre "mcgame-server/internal/application/mysterytreasure"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"

	"go.uber.org/zap"
)

type fakeRepo struct {
	states map[int64][]*domainfeature.CharacterFeatureState
}

func newFakeRepo() *fakeRepo {
	return &fakeRepo{states: map[int64][]*domainfeature.CharacterFeatureState{}}
}
func (r *fakeRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.states[charID], nil
}
func (r *fakeRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	r.states[state.CharacterID] = []*domainfeature.CharacterFeatureState{state}
	return nil
}
func (r *fakeRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}
func (r *fakeRepo) UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	return nil
}
func (r *fakeRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}
func (r *fakeRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
}
func (r *fakeRepo) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}
func (r *fakeRepo) PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type fakeGameData struct{}

func (g *fakeGameData) MysGetRecipe(id int) *models.MystreRecipeTemplate {
	if id != 1 {
		return nil
	}
	return &models.MystreRecipeTemplate{ID: 1, Level: 1, St: "16-1-1", T1: 7, Q1: 2, N1: 1}
}
func (g *fakeGameData) MysListMystreByKindLevel(kind, level int) []*models.MystreTemplate {
	if kind == 1 && level == 1 {
		return []*models.MystreTemplate{{ID: 5, Kind: 1, Level: 1}, {ID: 2, Kind: 1, Level: 1}}
	}
	return nil
}

type fakeItemBag struct {
	items    map[int64]*domainitem.Item
	consumed map[int64]int
}

func (b *fakeItemBag) GetItemByID(ctx context.Context, charID, itemID int64) (*domainitem.Item, error) {
	return b.items[itemID], nil
}
func (b *fakeItemBag) ConsumeItemStackByID(ctx context.Context, charID, itemID int64, count int) (*domainitem.Item, bool, error) {
	b.consumed[itemID] += count
	return b.items[itemID], false, nil
}

type fakeChars struct {
	char  *domainchar.Character
	saved int
}

func (c *fakeChars) GetByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return c.char, nil
}
func (c *fakeChars) Save(ctx context.Context, char *domainchar.Character) error {
	c.saved++
	c.char = char
	return nil
}

func newTestHandler(t *testing.T) (*Handler, *appmystre.Service, *fakeChars) {
	t.Helper()
	repo := newFakeRepo()
	svc := appmystre.NewService(repo, zap.NewNop())
	svc.SetGameData(&fakeGameData{})
	svc.SetItemBag(&fakeItemBag{items: map[int64]*domainitem.Item{}, consumed: map[int64]int{}})
	h := NewHandler(svc, nil, zap.NewNop())
	chars := &fakeChars{char: &domainchar.Character{ID: 1, Gold: 1000}}
	h.SetCharacterService(chars)
	return h, svc, chars
}

func ctxFor(cid string) *rtmp.RPCContext {
	return &rtmp.RPCContext{Context: context.Background(), CharacterID: cid, ConnID: 1}
}

func TestHandlerGetMysAddTimes_DefaultShape(t *testing.T) {
	h, _, _ := newTestHandler(t)
	out, err := h.GetMysAddTimes(ctxFor("1"), nil)
	if err != nil {
		t.Fatalf("GetMysAddTimes: %v", err)
	}
	m := out.(map[string]interface{})
	if _, ok := m["n"]; !ok {
		t.Fatalf("missing n: %+v", m)
	}
	if _, ok := m["t"].(string); !ok {
		t.Fatalf("t must be string: %+v", m)
	}
}

func TestHandlerAddLimitMakeTimes_ChargesGold(t *testing.T) {
	h, _, chars := newTestHandler(t)
	out, err := h.AddLimitMakeTimes(ctxFor("1"), nil)
	if err != nil {
		t.Fatalf("AddLimitMakeTimes: %v", err)
	}
	if chars.char.Gold != 1000-20 {
		t.Fatalf("expected gold 980 after first purchase, got %d", chars.char.Gold)
	}
	m := out.(map[string]interface{})
	if m["n"].(float64) <= 0 {
		t.Fatalf("updateLimitMakeTimes n should be positive cap, got %v", m["n"])
	}
}

func TestHandlerAddLimitMakeTimes_InsufficientGold_NoCharge(t *testing.T) {
	h, svc, chars := newTestHandler(t)
	chars.char.Gold = 5
	_, err := h.AddLimitMakeTimes(ctxFor("1"), nil)
	if err == nil {
		t.Fatalf("expected error on insufficient gold")
	}
	if chars.char.Gold != 5 {
		t.Fatalf("gold must be unchanged on insufficient funds, got %d", chars.char.Gold)
	}
	st, _ := svc.Load(context.Background(), 1)
	if st.AddTimes.N != 0 {
		t.Fatalf("addTimes must not increment on failed purchase, got %d", st.AddTimes.N)
	}
}

func TestHandlerMakeMysTre_NullResponderReturnsNil(t *testing.T) {
	h, svc, _ := newTestHandler(t)
	ctx := ctxFor("1")
	st, _ := svc.Load(ctx.Context, 1)
	st.LearnedRec["1"] = 1
	if err := svc.Save(ctx.Context, 1, st); err != nil {
		t.Fatalf("save: %v", err)
	}
	bag := &fakeItemBag{items: map[int64]*domainitem.Item{
		100: {ID: 100, CharacterID: 1, TemplateID: 7, ColorCode: 2, StackCount: 9},
	}, consumed: map[int64]int{}}
	svc.SetItemBag(bag)

	slotMap := map[string]interface{}{"1": map[string]interface{}{"idx": float64(100)}}
	stackMap := map[string]interface{}{"1": float64(1)}
	out, err := h.MakeMysTre(ctx, []interface{}{float64(1), slotMap, stackMap})
	if out != nil || err != nil {
		t.Fatalf("makeMysTre is fire-and-forget: want (nil,nil), got (%v,%v)", out, err)
	}
	if bag.consumed[100] != 1 {
		t.Fatalf("material should be consumed once, got %+v", bag.consumed)
	}
	reloaded, _ := svc.Load(ctx.Context, 1)
	if reloaded.MysBook["1"]["2"] != 2 {
		t.Fatalf("mysBook should record lowest-id output 2: %+v", reloaded.MysBook)
	}
}

func TestHandlerMakeMysTre_BadArgsSwallowed(t *testing.T) {
	h, _, _ := newTestHandler(t)
	out, err := h.MakeMysTre(ctxFor("1"), []interface{}{float64(1)})
	if out != nil || err != nil {
		t.Fatalf("bad-arg makeMysTre must return (nil,nil), got (%v,%v)", out, err)
	}
}

func TestHandlerGetMakeLimitTimes_RealShape(t *testing.T) {
	h, _, _ := newTestHandler(t)
	out, err := h.GetMakeLimitTimes(ctxFor("1"), nil)
	if err != nil {
		t.Fatalf("GetMakeLimitTimes: %v", err)
	}
	m := out.(map[string]interface{})
	if m["n"].(float64) <= 0 {
		t.Fatalf("fresh-day cap should be base (>0), got %v", m["n"])
	}
}

func TestHandlerGetMysBookData_RealState(t *testing.T) {
	h, svc, _ := newTestHandler(t)
	ctx := ctxFor("1")
	st, _ := svc.Load(ctx.Context, 1)
	st.MysBook["3"] = map[string]int{"9": 9}
	if err := svc.Save(ctx.Context, 1, st); err != nil {
		t.Fatalf("save: %v", err)
	}
	out, err := h.GetMysBookData(ctx, nil)
	if err != nil {
		t.Fatalf("GetMysBookData: %v", err)
	}
	m := out.(map[string]interface{})
	kind := m["3"].(map[string]interface{})
	if kind["9"].(float64) != 9 {
		t.Fatalf("book not surfaced from state: %+v", m)
	}
}

func TestHandlerParseSlotMap(t *testing.T) {
	in := map[string]interface{}{
		"1": map[string]interface{}{"idx": float64(100)},
		"2": map[string]interface{}{"idx": float64(0)},
		"7": map[string]interface{}{"idx": float64(5)},
		"x": map[string]interface{}{"idx": float64(5)},
	}
	out := parseSlotMap(in)
	if out[1] != 100 {
		t.Fatalf("slot 1 should be 100, got %d", out[1])
	}
	if _, ok := out[2]; ok {
		t.Fatalf("idx<=0 should be dropped")
	}
	if _, ok := out[7]; ok {
		t.Fatalf("slot>6 should be dropped")
	}
}
