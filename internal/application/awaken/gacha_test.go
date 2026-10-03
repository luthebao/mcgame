// Open-sourced by BaoLT

package awaken

import (
	"context"
	"encoding/json"
	"errors"
	"math/rand"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type fakeCharRepo struct {
	char    *domainchar.Character
	updates int
}

func (r *fakeCharRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.char, nil
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
func (r *fakeCharRepo) Create(ctx context.Context, character *domainchar.Character) error { return nil }
func (r *fakeCharRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.updates++
	r.char = character
	return nil
}
func (r *fakeCharRepo) Delete(ctx context.Context, id int64) error { return nil }
func (r *fakeCharRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}
func (r *fakeCharRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}
func (r *fakeCharRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error { return nil }

type fakeItemPort struct {
	count      int
	added      int
	consumed   int
	consumeOK  bool
	consumeErr error
	countErr   error
}

func (p *fakeItemPort) CountCarriedItemsByTemplateID(ctx context.Context, charID int64, templateID int) (int, error) {
	if p.countErr != nil {
		return 0, p.countErr
	}
	return p.count, nil
}
func (p *fakeItemPort) ConsumeItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) (bool, error) {
	if p.consumeErr != nil {
		return false, p.consumeErr
	}
	if !p.consumeOK {
		return false, nil
	}
	p.consumed += count
	p.count -= count
	if p.count < 0 {
		p.count = 0
	}
	return true, nil
}
func (p *fakeItemPort) AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error) {
	p.added += stackCount
	p.count += stackCount
	return &domainitem.Item{TemplateID: templateID, StackCount: stackCount}, nil
}

type fakeProgress struct {
	level  int
	points int
	used   int
	calls  int
	err    error
}

func (w *fakeProgress) UpsertCharacterAwakenProgression(ctx context.Context, charID int64, awakenLevel int, awakenPoints int, awakenPointsUsed int) error {
	if w.err != nil {
		return w.err
	}
	w.calls++
	w.level = awakenLevel
	w.points = awakenPoints
	w.used = awakenPointsUsed
	return nil
}

type fixedRoller struct{ v float64 }

func (s fixedRoller) Float64() float64 { return s.v }

func newGachaService(t *testing.T, char *domainchar.Character, item *fakeItemPort, prog *fakeProgress, rng floatRoller) (*Service, *fakeFeatureRepo) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	rows := []string{
		`{"id":1,"item_num":10,"money":280000,"points":0,"rate":100,"req_level":80}`,
		`{"id":2,"item_num":12,"money":300000,"points":5,"rate":60,"req_level":85}`,
	}
	raw := make([]json.RawMessage, 0, len(rows))
	for _, r := range rows {
		raw = append(raw, json.RawMessage(r))
	}
	if err := mgr.GetCache().LoadTable(models.TableAwakening, raw); err != nil {
		t.Fatalf("LoadTable(TBL_AWAKENING): %v", err)
	}
	featRepo := &fakeFeatureRepo{charStates: map[int64][]*domainfeature.CharacterFeatureState{}, prog: nil}
	svc := NewService(featRepo, mgr, zap.NewNop())
	svc.SetCharacterRepository(&fakeCharRepo{char: char})
	svc.SetItemPort(item)
	svc.SetProgressionWriter(prog)
	svc.setRoller(rng)
	return svc, featRepo
}

func testChar() *domainchar.Character {
	return &domainchar.Character{ID: 1, Level: 200, Money: 10_000_000, Gold: 100_000, AwakenLevel: 1}
}

func TestAwaken_HitBumpsBothStores(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 50, consumeOK: true}
	prog := &fakeProgress{}
	svc, featRepo := newGachaService(t, char, item, prog, fixedRoller{v: 0.0})

	reply, err := svc.Awaken(context.Background(), 1, false)
	if err != nil {
		t.Fatalf("Awaken: %v", err)
	}
	if reply["success"] != true {
		t.Fatalf("expected success=true, got %+v", reply)
	}
	if reply["awakenLevel"] != 2 {
		t.Fatalf("awakenLevel = %v, want 2", reply["awakenLevel"])
	}
	if reply["awakenPoint"] != 5 {
		t.Fatalf("awakenPoint = %v, want 5 (row2 points)", reply["awakenPoint"])
	}
	if reply["awakenAdd"] != 0 {
		t.Fatalf("awakenAdd = %v, want 0 reset on hit", reply["awakenAdd"])
	}
	if prog.calls != 1 || prog.level != 2 || prog.points != 5 {
		t.Fatalf("progression not written: calls=%d level=%d points=%d", prog.calls, prog.level, prog.points)
	}
	states := featRepo.charStates[1]
	if len(states) != 1 {
		t.Fatalf("expected 1 feature state written, got %d", len(states))
	}
	got := stateFromMap(states[0].State)
	if got.Point != 5 {
		t.Fatalf("feature pool point = %d, want 5", got.Point)
	}
	if got.AwakenAdd != 0 {
		t.Fatalf("feature pool awakenAdd = %d, want 0", got.AwakenAdd)
	}
	if item.consumed != 12 {
		t.Fatalf("consumed = %d, want 12 (row2 item_num)", item.consumed)
	}
	if char.Money != 10_000_000-300_000 {
		t.Fatalf("money = %d, want %d", char.Money, 10_000_000-300_000)
	}
}

func TestAwaken_MissAccruesPity(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 50, consumeOK: true}
	prog := &fakeProgress{}
	svc, featRepo := newGachaService(t, char, item, prog, fixedRoller{v: 0.99})

	reply, err := svc.Awaken(context.Background(), 1, false)
	if err != nil {
		t.Fatalf("Awaken: %v", err)
	}
	if reply["success"] != false {
		t.Fatalf("expected success=false, got %+v", reply)
	}
	if reply["awakenAdd"] != AwakenPityStepPercent {
		t.Fatalf("awakenAdd = %v, want %d", reply["awakenAdd"], AwakenPityStepPercent)
	}
	if reply["itemNum"] != 50-12 {
		t.Fatalf("itemNum = %v, want %d remaining", reply["itemNum"], 50-12)
	}
	if prog.calls != 0 {
		t.Fatalf("progression must NOT be written on miss, calls=%d", prog.calls)
	}
	got := stateFromMap(featRepo.charStates[1][0].State)
	if got.AwakenAdd != AwakenPityStepPercent {
		t.Fatalf("persisted awakenAdd = %d, want %d", got.AwakenAdd, AwakenPityStepPercent)
	}
}

func TestAwaken_PityRaisesEffectiveRate(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 99, consumeOK: true}
	prog := &fakeProgress{}
	svc, featRepo := newGachaService(t, char, item, prog, fixedRoller{v: 0.605})

	if err := svc.AddAwakenPoints(context.Background(), 1, 0); err == nil {
		_ = err
	}
	st := defaultState()
	st.AwakenAdd = 10
	if err := svc.saveState(context.Background(), 1, st); err != nil {
		t.Fatalf("seed pity: %v", err)
	}

	reply, err := svc.Awaken(context.Background(), 1, false)
	if err != nil {
		t.Fatalf("Awaken: %v", err)
	}
	if reply["success"] != true {
		t.Fatalf("with rate 60 + pity 10 = 70%%, roll 60.5%% must HIT, got %+v", reply)
	}
	_ = featRepo
}

func TestAwaken_NeedGoldWhenLackItemAndNoAutoBuy(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 3, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, fixedRoller{v: 0.0})

	reply, err := svc.Awaken(context.Background(), 1, false)
	if err != nil {
		t.Fatalf("Awaken: %v", err)
	}
	want := (12 - 3) * AwakenBuyGoldPerItem
	if reply["needGold"] != want {
		t.Fatalf("needGold = %v, want %d", reply["needGold"], want)
	}
	if _, ok := reply["success"]; ok {
		t.Fatalf("needGold reply must not carry success: %+v", reply)
	}
	if item.consumed != 0 {
		t.Fatalf("nothing should be consumed on needGold, consumed=%d", item.consumed)
	}
	if char.Money != 10_000_000 {
		t.Fatalf("money must be untouched on needGold, got %d", char.Money)
	}
}

func TestAwaken_AutoBuyThenConsume(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 3, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, fixedRoller{v: 0.0})

	reply, err := svc.Awaken(context.Background(), 1, true)
	if err != nil {
		t.Fatalf("Awaken: %v", err)
	}
	if reply["success"] != true {
		t.Fatalf("expected success after auto-buy, got %+v", reply)
	}
	missing := 12 - 3
	if item.added != missing {
		t.Fatalf("auto-bought %d, want %d", item.added, missing)
	}
	wantGold := int64(100_000 - missing*AwakenBuyGoldPerItem)
	if char.Gold != wantGold {
		t.Fatalf("gold = %d, want %d", char.Gold, wantGold)
	}
}

func TestEnsureBuyAwaken_BuysAndRetries(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 0, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, fixedRoller{v: 0.0})

	reply, err := svc.EnsureBuyAwaken(context.Background(), 1)
	if err != nil {
		t.Fatalf("EnsureBuyAwaken: %v", err)
	}
	if reply["success"] != true {
		t.Fatalf("expected success, got %+v", reply)
	}
	if item.added != 12 {
		t.Fatalf("bought %d, want 12", item.added)
	}
}

func TestAwaken_MaxLevelGate(t *testing.T) {
	char := testChar()
	char.AwakenLevel = AwakenEdge
	item := &fakeItemPort{count: 99, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, nil)

	if _, err := svc.Awaken(context.Background(), 1, false); !errors.Is(err, ErrMaxAwakenLevel) {
		t.Fatalf("want ErrMaxAwakenLevel at edge, got %v", err)
	}
}

func TestAwaken_ReqLevelGate(t *testing.T) {
	char := testChar()
	char.Level = 10
	item := &fakeItemPort{count: 99, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, nil)

	if _, err := svc.Awaken(context.Background(), 1, false); !errors.Is(err, ErrReqLevelNotMet) {
		t.Fatalf("want ErrReqLevelNotMet (char L10 < req 85), got %v", err)
	}
}

func TestAwaken_InsufficientGoldForAutoBuy(t *testing.T) {
	char := testChar()
	char.Gold = 1
	item := &fakeItemPort{count: 0, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, nil)

	if _, err := svc.Awaken(context.Background(), 1, true); !errors.Is(err, ErrInsufficientGold) {
		t.Fatalf("want ErrInsufficientGold, got %v", err)
	}
	if item.added != 0 {
		t.Fatalf("must not grant item when gold short, added=%d", item.added)
	}
}

func TestAwaken_InsufficientMoneyNoCreditNoConsume(t *testing.T) {
	char := testChar()
	char.Money = 100
	item := &fakeItemPort{count: 99, consumeOK: true}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, fixedRoller{v: 0.0})

	if _, err := svc.Awaken(context.Background(), 1, false); !errors.Is(err, ErrInsufficientMoney) {
		t.Fatalf("want ErrInsufficientMoney, got %v", err)
	}
	if item.consumed != 0 {
		t.Fatalf("must not consume item when money short, consumed=%d", item.consumed)
	}
	if prog.calls != 0 {
		t.Fatalf("must not write progression when money short, calls=%d", prog.calls)
	}
}

func TestAwaken_NotConfigured(t *testing.T) {
	mgr := gamedata.NewManager(nil, zap.NewNop())
	svc := NewService(&fakeFeatureRepo{charStates: map[int64][]*domainfeature.CharacterFeatureState{}}, mgr, zap.NewNop())
	if _, err := svc.Awaken(context.Background(), 1, false); !errors.Is(err, ErrServiceNotConfigured) {
		t.Fatalf("want ErrServiceNotConfigured, got %v", err)
	}
}

func TestAwaken_ConsumeFailsAfterMoneyDeduct(t *testing.T) {
	char := testChar()
	item := &fakeItemPort{count: 99, consumeOK: false}
	prog := &fakeProgress{}
	svc, _ := newGachaService(t, char, item, prog, fixedRoller{v: 0.0})

	if _, err := svc.Awaken(context.Background(), 1, false); !errors.Is(err, ErrConsumeFailed) {
		t.Fatalf("want ErrConsumeFailed, got %v", err)
	}
	if prog.calls != 0 {
		t.Fatalf("no progression credit when consume fails, calls=%d", prog.calls)
	}
}

func TestAwaken_RNGPropertyDistribution(t *testing.T) {
	hits := 0
	trials := 4000
	rng := rand.New(rand.NewSource(42))
	for i := 0; i < trials; i++ {
		char := testChar()
		item := &fakeItemPort{count: 99, consumeOK: true}
		prog := &fakeProgress{}
		svc, _ := newGachaService(t, char, item, prog, rng)
		reply, err := svc.Awaken(context.Background(), 1, false)
		if err != nil {
			t.Fatalf("Awaken trial %d: %v", i, err)
		}
		if reply["success"] == true {
			hits++
		}
	}
	got := float64(hits) / float64(trials)
	if got < 0.55 || got > 0.65 {
		t.Fatalf("hit rate %.3f outside [0.55,0.65] for base rate 60%%", got)
	}
}
