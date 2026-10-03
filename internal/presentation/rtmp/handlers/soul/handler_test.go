// Open-sourced by BaoLT

package soul

import (
	"context"
	"encoding/json"
	"testing"

	appsoul "mcgame-server/internal/application/soul"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type capturedCall struct {
	method string
	args   []interface{}
}

func newTestHandler(t *testing.T, char *domainchar.Character) (*Handler, *appsoul.Service, *[]capturedCall) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	rows := []string{
		`{"id":1,"type":-1,"color":0,"req_chip":0,"chip":1,"up_exp":100}`,
		`{"id":21,"type":-1,"color":2,"req_chip":0,"chip":3,"up_exp":300}`,
		`{"id":41,"type":1,"color":4,"req_chip":25,"chip":5,"up_exp":500}`,
	}
	raw := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		raw = append(raw, json.RawMessage(r))
	}
	if err := mgr.GetCache().LoadTable(models.TablePetSoul, raw); err != nil {
		t.Fatalf("LoadTable error = %v", err)
	}
	charRepo := &fakeCharRepo{chars: map[int64]*domainchar.Character{}}
	if char != nil {
		charRepo.chars[char.ID] = char
	}
	svc := appsoul.NewService(newFakeFeatureRepo(), charRepo, mgr, zap.NewNop())
	h := NewHandler(svc, zap.NewNop())
	calls := &[]capturedCall{}
	h.sendCallbackFn = func(_ *rtmp.Connection, method string, args ...interface{}) error {
		*calls = append(*calls, capturedCall{method: method, args: args})
		return nil
	}
	return h, svc, calls
}

func ctxFor(charID string) *rtmp.RPCContext {
	return &rtmp.RPCContext{Context: context.Background(), CharacterID: charID}
}

func findCall(calls []capturedCall, method string) (capturedCall, bool) {
	for _, c := range calls {
		if c.method == method {
			return c, true
		}
	}
	return capturedCall{}, false
}

func TestHandler_PreySoul_PushesSingleAndAddMoney(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000}
	h, _, calls := newTestHandler(t, char)

	res, err := h.PreySoul(ctxFor("1"), []interface{}{float64(3), false, false})
	if err != nil || res != nil {
		t.Fatalf("preySoul should be push-style (nil,nil), got res=%v err=%v", res, err)
	}
	if _, ok := findCall(*calls, "onAddMoney"); !ok {
		t.Fatalf("expected onAddMoney push, calls=%+v", *calls)
	}
	addMoney, _ := findCall(*calls, "onAddMoney")
	if addMoney.args[1].(string) != "soulPnt" {
		t.Fatalf("onAddMoney key = %v, want soulPnt", addMoney.args[1])
	}
	if addMoney.args[2].(float64) != -7000 {
		t.Fatalf("onAddMoney delta = %v, want -7000 (crystal 3 cost)", addMoney.args[2])
	}
	if addMoney.args[3].(int64) != 93000 {
		t.Fatalf("onAddMoney newTotal = %v, want 93000", addMoney.args[3])
	}
	prey, ok := findCall(*calls, "onPreySoulSingle")
	if !ok {
		t.Fatalf("expected onPreySoulSingle push, calls=%+v", *calls)
	}
	payload := prey.args[0].(map[string]any)
	if _, leaked := payload["moneyFlag"]; leaked {
		t.Fatalf("internal moneyFlag must be stripped before push")
	}
	if _, leaked := payload["spent"]; leaked {
		t.Fatalf("internal spent must be stripped before push")
	}
	if payload["newIndex"].(int) != 3 {
		t.Fatalf("newIndex = %v, want 3", payload["newIndex"])
	}
}

func TestHandler_PreySoul_MoneyPathSkipsAddMoney(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 0}
	h, _, calls := newTestHandler(t, char)

	if _, err := h.PreySoul(ctxFor("1"), []interface{}{float64(3), false, true}); err != nil {
		t.Fatalf("preySoul money: %v", err)
	}
	if _, ok := findCall(*calls, "onAddMoney"); ok {
		t.Fatalf("money path must not push onAddMoney")
	}
	if _, ok := findCall(*calls, "onPreySoulSingle"); !ok {
		t.Fatalf("expected onPreySoulSingle push")
	}
}

func TestHandler_ExchangeSoul_ReturnsResponderResult(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100, Gold: 100}
	h, svc, _ := newTestHandler(t, char)
	if _, err := svc.OpenBag(context.Background(), 1); err != nil {
		t.Fatalf("OpenBag: %v", err)
	}

	res, err := h.ExchangeSoul(ctxFor("1"), []interface{}{float64(41)})
	if err != nil {
		t.Fatalf("ExchangeSoul: %v", err)
	}
	m, ok := res.(map[string]any)
	if !ok {
		t.Fatalf("exchange must return responder map, got %T", res)
	}
	if m["type"].(int) != 1 {
		t.Fatalf("exchange type = %v, want 1", m["type"])
	}
}

func TestHandler_PutSoulToBag_RoutesSingleVsAll(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000, Gold: 100}
	h, svc, calls := newTestHandler(t, char)
	ctx := context.Background()
	if _, err := svc.OpenBag(ctx, 1); err != nil {
		t.Fatalf("OpenBag: %v", err)
	}

	if _, err := h.PreySoul(ctxFor("1"), []interface{}{float64(3), false, false}); err != nil {
		t.Fatalf("seed prey: %v", err)
	}

	if _, err := h.PutSoulToBag(ctxFor("1"), []interface{}{float64(1)}); err != nil {
		t.Fatalf("PutSoulToBag single: %v", err)
	}
	if _, ok := findCall(*calls, "onPutSoulToBag"); !ok {
		t.Fatalf("expected onPutSoulToBag push for single")
	}

	if _, err := h.PutSoulToBag(ctxFor("1"), []interface{}{float64(-1), true}); err != nil {
		t.Fatalf("PutSoulToBag all: %v", err)
	}
	if _, ok := findCall(*calls, "onPutAllSoulToBag"); !ok {
		t.Fatalf("expected onPutAllSoulToBag push for (-1,true)")
	}
}

func TestHandler_OpenPetSoulBag_ReturnsResponderResult(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulExp: 30000}
	h, svc, _ := newTestHandler(t, char)
	ctx := context.Background()
	seedPetOpenNum(t, svc, 99, 5)

	res, err := h.OpenPetSoulBag(ctxFor("1"), []interface{}{float64(99)})
	if err != nil {
		t.Fatalf("OpenPetSoulBag: %v", err)
	}
	m, ok := res.(map[string]any)
	if !ok {
		t.Fatalf("openPetSoulBag must return responder map, got %T", res)
	}
	if m["openNum2"].(int) != 1 {
		t.Fatalf("openNum2 = %v, want 1", m["openNum2"])
	}
	_ = ctx
}

func TestHandler_MoveSoul_PushesUpdateSlot(t *testing.T) {
	char := &domainchar.Character{ID: 1, Gold: 100}
	h, svc, calls := newTestHandler(t, char)
	ctx := context.Background()
	if _, err := svc.OpenBag(ctx, 1); err != nil {
		t.Fatalf("OpenBag: %v", err)
	}
	if _, err := svc.OpenBag(ctx, 1); err != nil {
		t.Fatalf("OpenBag: %v", err)
	}
	_ = svc.AddSoulToSlot(ctx, 1, 1, 21, 0)

	if _, err := h.MoveSoul(ctxFor("1"), []interface{}{float64(1), float64(2)}); err != nil {
		t.Fatalf("MoveSoul: %v", err)
	}
	call, ok := findCall(*calls, "onUpdateSoulSlot")
	if !ok {
		t.Fatalf("expected onUpdateSoulSlot push")
	}
	payload := call.args[0].(map[string]any)
	if payload["type"].(int) != 1 {
		t.Fatalf("char-char move type = %v, want 1", payload["type"])
	}
}

func TestHandler_NoCharIDIsNoop(t *testing.T) {
	h, _, calls := newTestHandler(t, &domainchar.Character{ID: 1})
	if res, err := h.PreySoul(ctxFor(""), []interface{}{float64(3), false, false}); res != nil || err != nil {
		t.Fatalf("missing charID must be noop, got res=%v err=%v", res, err)
	}
	if len(*calls) != 0 {
		t.Fatalf("no callbacks should fire without charID, got %+v", *calls)
	}
}

func seedPetOpenNum(t *testing.T, svc *appsoul.Service, petID int64, openNum int) {
	t.Helper()
	if err := svc.SeedPetOpenNum(context.Background(), petID, openNum); err != nil {
		t.Fatalf("SeedPetOpenNum: %v", err)
	}
}

type fakeFeatureRepo struct {
	charStates map[int64][]*domainfeature.CharacterFeatureState
	petStates  map[int64][]*domainfeature.PetFeatureState
}

func newFakeFeatureRepo() *fakeFeatureRepo {
	return &fakeFeatureRepo{
		charStates: map[int64][]*domainfeature.CharacterFeatureState{},
		petStates:  map[int64][]*domainfeature.PetFeatureState{},
	}
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
	return r.petStates[petID], nil
}

func (r *fakeFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	list := r.petStates[state.PetID]
	for i, st := range list {
		if st.FeatureKey == state.FeatureKey {
			list[i] = state
			r.petStates[state.PetID] = list
			return nil
		}
	}
	r.petStates[state.PetID] = append(list, state)
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
