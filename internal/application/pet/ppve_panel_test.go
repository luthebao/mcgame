// Open-sourced by BaoLT

package pet

import (
	"context"
	"testing"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type fakePPVEGameData struct {
	rows map[int]*models.CarveAwardTemplate
}

func (g *fakePPVEGameData) GetCarveAward(id int) *models.CarveAwardTemplate { return g.rows[id] }

type ppveFeatureRepo struct {
	states map[int64][]*domainfeature.CharacterFeatureState
}

func newPPVEFeatureRepo() *ppveFeatureRepo {
	return &ppveFeatureRepo{states: map[int64][]*domainfeature.CharacterFeatureState{}}
}

func (r *ppveFeatureRepo) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.states[charID], nil
}

func (r *ppveFeatureRepo) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	list := r.states[state.CharacterID]
	for i, st := range list {
		if st.FeatureKey == state.FeatureKey {
			list[i] = state
			r.states[state.CharacterID] = list
			return nil
		}
	}
	r.states[state.CharacterID] = append(list, state)
	return nil
}

func (r *ppveFeatureRepo) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return nil, nil
}
func (r *ppveFeatureRepo) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
}
func (r *ppveFeatureRepo) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return nil, nil
}
func (r *ppveFeatureRepo) UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error {
	return nil
}
func (r *ppveFeatureRepo) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return nil, nil
}
func (r *ppveFeatureRepo) PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

type ppveCharRepo struct {
	chars map[int64]*domainchar.Character
}

func (r *ppveCharRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.chars[id], nil
}
func (r *ppveCharRepo) Update(ctx context.Context, c *domainchar.Character) error {
	r.chars[c.ID] = c
	return nil
}
func (r *ppveCharRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *ppveCharRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *ppveCharRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}
func (r *ppveCharRepo) Create(ctx context.Context, c *domainchar.Character) error { return nil }
func (r *ppveCharRepo) Delete(ctx context.Context, id int64) error                { return nil }
func (r *ppveCharRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}
func (r *ppveCharRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}
func (r *ppveCharRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error { return nil }

func newPPVEServiceForTest(gold int64) (*PPVEService, *ppveFeatureRepo, *ppveCharRepo) {
	feat := newPPVEFeatureRepo()
	chars := &ppveCharRepo{chars: map[int64]*domainchar.Character{1: {ID: 1, Gold: gold}}}
	return NewPPVEService(feat, chars, zap.NewNop()), feat, chars
}

func seedPPVEState(repo *ppveFeatureRepo, charID int64, s *PPVEState) {
	_ = repo.UpsertCharacterFeatureState(context.Background(), &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeaturePetPVE,
		State:       encodePPVEState(s),
	})
}

func TestPPVEInitPanel_FreshAppliesDailyResetAndPersists(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	state, err := svc.InitPanel(context.Background(), 1)
	if err != nil {
		t.Fatalf("InitPanel: %v", err)
	}
	today := time.Now().Format("2006-01-02")
	if state.FreeTime != PPVEFreeChallenges {
		t.Fatalf("freeTime = %d, want %d", state.FreeTime, PPVEFreeChallenges)
	}
	if state.AwardTime != PPVEFreeExchanges {
		t.Fatalf("awardTime = %d, want %d", state.AwardTime, PPVEFreeExchanges)
	}
	if state.LastResetDay != today || state.LastDailyDay != today {
		t.Fatalf("reset markers = (%q,%q), want today %q", state.LastResetDay, state.LastDailyDay, today)
	}
	persisted, _ := svc.LoadState(context.Background(), 1)
	if persisted.LastResetDay != today {
		t.Fatalf("reset not persisted: %q", persisted.LastResetDay)
	}
	_ = feat
}

func TestPPVEInitPanel_GoldMarkerResetsIndependentlyOfFloorMarker(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{
		FreeTime:     1,
		AwardTime:    0,
		GoldTime:     2,
		LastResetDay: today,
		LastDailyDay: "2000-01-01",
	})
	state, err := svc.InitPanel(context.Background(), 1)
	if err != nil {
		t.Fatalf("InitPanel: %v", err)
	}
	if state.FreeTime != 1 {
		t.Fatalf("freeTime should be untouched (lastResetDay==today): got %d", state.FreeTime)
	}
	if state.AwardTime != PPVEFreeExchanges || state.GoldTime != 0 {
		t.Fatalf("gold counters not reset: awardTime=%d goldTime=%d", state.AwardTime, state.GoldTime)
	}
}

func TestPPVESaveConfig_RoundTripsConfigAndP(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{
		MasterLevel:  7,
		P:            map[string]interface{}{"s0": map[string]interface{}{"0": float64(1120)}},
		LastResetDay: today,
		LastDailyDay: today,
	})
	config := map[string]interface{}{
		"1": map[string]interface{}{"pid": float64(99), "pos": float64(1)},
	}
	if _, err := svc.SaveConfig(context.Background(), 1, config); err != nil {
		t.Fatalf("SaveConfig: %v", err)
	}
	reloaded, _ := svc.LoadState(context.Background(), 1)
	if reloaded.MasterLevel != 7 {
		t.Fatalf("mlv lost: %d", reloaded.MasterLevel)
	}
	if _, ok := reloaded.PPVEConfig["1"]; !ok {
		t.Fatalf("config not persisted: %+v", reloaded.PPVEConfig)
	}
	if _, ok := reloaded.P["s0"]; !ok {
		t.Fatalf("p not preserved across save: %+v", reloaded.P)
	}
}

func TestPPVEExchangeKPByGold_ChargesGoldCreditsKP(t *testing.T) {
	svc, feat, chars := newPPVEServiceForTest(100)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{KP: 5, LastResetDay: today, LastDailyDay: today})
	state, err := svc.ExchangeKPByGold(context.Background(), 1)
	if err != nil {
		t.Fatalf("ExchangeKPByGold: %v", err)
	}
	if chars.chars[1].Gold != 100-ppveKPByGoldCost {
		t.Fatalf("gold = %d, want %d", chars.chars[1].Gold, 100-ppveKPByGoldCost)
	}
	if state.KP != 5+ppveKPByGoldYield {
		t.Fatalf("kp = %d, want %d", state.KP, 5+ppveKPByGoldYield)
	}
	if state.Gold4AwardTimeDaily != 1 {
		t.Fatalf("gold4awardTimeDaily = %d, want 1", state.Gold4AwardTimeDaily)
	}
}

func TestPPVEExchangeKPByGold_InsufficientGoldNoMutation(t *testing.T) {
	svc, feat, chars := newPPVEServiceForTest(10)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{KP: 5, LastResetDay: today, LastDailyDay: today})
	if _, err := svc.ExchangeKPByGold(context.Background(), 1); err != ErrPPVEInsufficientGold {
		t.Fatalf("err = %v, want ErrPPVEInsufficientGold", err)
	}
	if chars.chars[1].Gold != 10 {
		t.Fatalf("gold mutated on failure: %d", chars.chars[1].Gold)
	}
	reloaded, _ := svc.LoadState(context.Background(), 1)
	if reloaded.KP != 5 {
		t.Fatalf("kp mutated on failure: %d", reloaded.KP)
	}
}

func TestPPVEExchangeKPFree_DecrementsAwardThenExhausts(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{KP: 0, AwardTime: 1, LastResetDay: today, LastDailyDay: today})
	state, err := svc.ExchangeKPFree(context.Background(), 1)
	if err != nil {
		t.Fatalf("ExchangeKPFree: %v", err)
	}
	if state.AwardTime != 0 || state.KP != ppveFreeKPAward {
		t.Fatalf("after free exchange: awardTime=%d kp=%d", state.AwardTime, state.KP)
	}
	if _, err := svc.ExchangeKPFree(context.Background(), 1); err != ErrPPVENoFreeExchange {
		t.Fatalf("second free exchange err = %v, want ErrPPVENoFreeExchange", err)
	}
}

func TestPPVEExchangeKPFree_UsesCarveAwardByFloor(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	svc.SetGameData(&fakePPVEGameData{rows: map[int]*models.CarveAwardTemplate{
		11: {ID: 11, FreeExchagne: 55},
	}})
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{PPVEFloor: 10, KP: 0, AwardTime: 1, LastResetDay: today, LastDailyDay: today})
	state, err := svc.ExchangeKPFree(context.Background(), 1)
	if err != nil {
		t.Fatalf("ExchangeKPFree: %v", err)
	}
	if state.KP != 55 {
		t.Fatalf("KP = %d, want 55 (TBL_CARVE_AWARD row floor 10 -> id 11)", state.KP)
	}
}

func TestPPVEExchangeKPFree_ClampsFloorToMax(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	svc.SetGameData(&fakePPVEGameData{rows: map[int]*models.CarveAwardTemplate{
		PPVEMaxFloor: {ID: int64(PPVEMaxFloor), FreeExchagne: 2025},
	}})
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{PPVEFloor: PPVEMaxFloor, KP: 0, AwardTime: 1, LastResetDay: today, LastDailyDay: today})
	state, err := svc.ExchangeKPFree(context.Background(), 1)
	if err != nil {
		t.Fatalf("ExchangeKPFree: %v", err)
	}
	if state.KP != 2025 {
		t.Fatalf("KP = %d, want 2025 (PPVEFloor+1 clamped to %d)", state.KP, PPVEMaxFloor)
	}
}

func TestPPVEExchangeKPFree_FallsBackWithoutGameData(t *testing.T) {
	svc, feat, _ := newPPVEServiceForTest(0)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{PPVEFloor: 10, KP: 0, AwardTime: 1, LastResetDay: today, LastDailyDay: today})
	state, err := svc.ExchangeKPFree(context.Background(), 1)
	if err != nil {
		t.Fatalf("ExchangeKPFree: %v", err)
	}
	if state.KP != ppveFreeKPAward {
		t.Fatalf("KP = %d, want fallback %d when gameData unwired", state.KP, ppveFreeKPAward)
	}
}

func TestPPVEIncreaseChallengeTime_TieredCostAndGrant(t *testing.T) {
	svc, feat, chars := newPPVEServiceForTest(100)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{FreeTime: 3, LastResetDay: today, LastDailyDay: today})

	wantGold := []int64{90, 70, 20}
	for i, want := range wantGold {
		if _, err := svc.IncreaseChallengeTime(context.Background(), 1); err != nil {
			t.Fatalf("IncreaseChallengeTime #%d: %v", i+1, err)
		}
		if chars.chars[1].Gold != want {
			t.Fatalf("after purchase #%d gold = %d, want %d", i+1, chars.chars[1].Gold, want)
		}
	}
	final, _ := svc.LoadState(context.Background(), 1)
	if final.GoldTime != 3 || final.GoldClgTime != 3 || final.FreeTime != 6 {
		t.Fatalf("counters: goldTime=%d goldClgTime=%d freeTime=%d", final.GoldTime, final.GoldClgTime, final.FreeTime)
	}
	if _, err := svc.IncreaseChallengeTime(context.Background(), 1); err != ErrPPVEChallengeCapReached {
		t.Fatalf("4th purchase err = %v, want ErrPPVEChallengeCapReached (3 purchases/day cap)", err)
	}
}

func TestPPVEIncreaseChallengeTime_InsufficientGoldBeforeCap(t *testing.T) {
	svc, feat, chars := newPPVEServiceForTest(25)
	today := time.Now().Format("2006-01-02")
	seedPPVEState(feat, 1, &PPVEState{FreeTime: 3, LastResetDay: today, LastDailyDay: today})

	if _, err := svc.IncreaseChallengeTime(context.Background(), 1); err != nil {
		t.Fatalf("first purchase (cost 10): %v", err)
	}
	if chars.chars[1].Gold != 15 {
		t.Fatalf("gold after first = %d, want 15", chars.chars[1].Gold)
	}
	if _, err := svc.IncreaseChallengeTime(context.Background(), 1); err != ErrPPVEInsufficientGold {
		t.Fatalf("second purchase err = %v, want ErrPPVEInsufficientGold (cost 20 > 15)", err)
	}
	if chars.chars[1].Gold != 15 {
		t.Fatalf("gold mutated on insufficient: %d", chars.chars[1].Gold)
	}
}

func TestPPVEStateRoundTrip_PreservesLoginWireFields(t *testing.T) {
	original := defaultPPVEState()
	original.MasterLevel = 48
	original.P = map[string]interface{}{"s7": map[string]interface{}{"5": float64(8620)}}
	original.PPVEConfig = map[string]interface{}{"1": map[string]interface{}{"pid": float64(3)}}
	original.Gold4AwardTimeDaily = 4

	decoded := decodePPVEState(encodePPVEState(original))
	if decoded.MasterLevel != 48 {
		t.Fatalf("mlv lost: %d", decoded.MasterLevel)
	}
	if decoded.Gold4AwardTimeDaily != 4 {
		t.Fatalf("gold4awardTimeDaily lost: %d", decoded.Gold4AwardTimeDaily)
	}
	if _, ok := decoded.P["s7"]; !ok {
		t.Fatalf("p lost: %+v", decoded.P)
	}
	if _, ok := decoded.PPVEConfig["1"]; !ok {
		t.Fatalf("ppveConfig lost: %+v", decoded.PPVEConfig)
	}
}
