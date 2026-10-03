// Open-sourced by BaoLT

package soul

import (
	"context"
	"encoding/json"
	"math/rand"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

func newAcquireService(t *testing.T, char *domainchar.Character) (*Service, *fakeCharRepo) {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	rows := []string{
		`{"id":1,"type":-1,"color":0,"req_chip":0,"chip":1,"up_exp":100}`,
		`{"id":2,"type":-1,"color":0,"req_chip":0,"chip":1,"up_exp":100}`,
		`{"id":11,"type":-1,"color":1,"req_chip":0,"chip":2,"up_exp":200}`,
		`{"id":21,"type":-1,"color":2,"req_chip":0,"chip":3,"up_exp":300}`,
		`{"id":32,"type":-1,"color":3,"req_chip":5,"chip":4,"up_exp":400}`,
		`{"id":42,"type":-1,"color":4,"req_chip":20,"chip":5,"up_exp":500}`,
		`{"id":31,"type":1,"color":3,"req_chip":5,"chip":4,"up_exp":400}`,
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
	return NewService(newFakeRepo(), charRepo, mgr, zap.NewNop()), charRepo
}

func openSlots(t *testing.T, svc *Service, charID int64, n int) {
	t.Helper()
	state, err := svc.loadCharState(context.Background(), charID)
	if err != nil {
		t.Fatalf("loadCharState: %v", err)
	}
	state.Open = n
	if err := svc.saveCharState(context.Background(), charID, state); err != nil {
		t.Fatalf("saveCharState: %v", err)
	}
}

func TestPreySoul_DeductsAndRollsTier(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000}
	svc, charRepo := newAcquireService(t, char)
	ctx := context.Background()
	rng := rand.New(rand.NewSource(1))

	payload, err := svc.PreySoul(ctx, 1, 3, false, rng)
	if err != nil {
		t.Fatalf("PreySoul: %v", err)
	}
	if charRepo.chars[1].SoulPoints != 100000-7000 {
		t.Fatalf("soulPnt after prey = %d, want %d", charRepo.chars[1].SoulPoints, 100000-7000)
	}
	if payload["newIndex"].(int) != 3 {
		t.Fatalf("newIndex = %v, want 3", payload["newIndex"])
	}
	sidObj := payload["sidObj"].(map[string]any)
	if sidObj["ii"].(int) != 21 {
		t.Fatalf("rolled ii = %v, want 21 (only color-2 id)", sidObj["ii"])
	}
	if sidObj["index"].(int) != 1 {
		t.Fatalf("temp index = %v, want 1", sidObj["index"])
	}
	if payload["point"].(int64) != 93000 {
		t.Fatalf("point = %v, want 93000", payload["point"])
	}

	state, _ := svc.loadCharState(ctx, 1)
	if state.CrystalSid != 3 {
		t.Fatalf("crystalSid persisted = %d, want 3", state.CrystalSid)
	}
	if state.TempBag[1] != 21 {
		t.Fatalf("temp bag[1] = %d, want 21", state.TempBag[1])
	}
}

func TestPreySoul_CrystalSidClampedForIndex1And6(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 100000})
	ctx := context.Background()
	if _, err := svc.PreySoul(ctx, 1, 1, false, rand.New(rand.NewSource(2))); err != nil {
		t.Fatalf("PreySoul idx1: %v", err)
	}
	state, _ := svc.loadCharState(ctx, 1)
	if state.CrystalSid != 0 {
		t.Fatalf("crystalSid for index 1 = %d, want 0 (not in 2..5)", state.CrystalSid)
	}
	if _, err := svc.PreySoul(ctx, 1, 6, true, rand.New(rand.NewSource(3))); err != nil {
		t.Fatalf("PreySoul idx6 money: %v", err)
	}
	state, _ = svc.loadCharState(ctx, 1)
	if state.CrystalSid != 0 {
		t.Fatalf("crystalSid for index 6 = %d, want 0", state.CrystalSid)
	}
}

func TestPreySoul_MoneyPathSkipsChipDeduction(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 0}
	svc, charRepo := newAcquireService(t, char)
	ctx := context.Background()
	payload, err := svc.PreySoul(ctx, 1, 2, true, rand.New(rand.NewSource(4)))
	if err != nil {
		t.Fatalf("PreySoul money path: %v", err)
	}
	if charRepo.chars[1].SoulPoints != 0 {
		t.Fatalf("money path must not touch soulPnt, got %d", charRepo.chars[1].SoulPoints)
	}
	if payload["moneyFlag"].(bool) != true {
		t.Fatalf("moneyFlag flag missing")
	}
}

func TestPreySoul_InsufficientChip(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 100})
	if _, err := svc.PreySoul(context.Background(), 1, 1, false, rand.New(rand.NewSource(5))); err != ErrInsufficientChip {
		t.Fatalf("want ErrInsufficientChip, got %v", err)
	}
}

func TestPreySoul_InvalidCrystal(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 100000})
	if _, err := svc.PreySoul(context.Background(), 7, 7, false, nil); err != ErrInvalidCrystal {
		t.Fatalf("want ErrInvalidCrystal, got %v", err)
	}
	if _, err := svc.PreySoul(context.Background(), 0, 0, false, nil); err != ErrInvalidCrystal {
		t.Fatalf("want ErrInvalidCrystal for 0, got %v", err)
	}
}

func TestPreySoul_TempBagFull(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000000}
	svc, _ := newAcquireService(t, char)
	ctx := context.Background()
	state, _ := svc.loadCharState(ctx, 1)
	for i := 1; i <= maxTempSoulSlots; i++ {
		state.TempBag[i] = 1
	}
	_ = svc.saveCharState(ctx, 1, state)
	if _, err := svc.PreySoul(ctx, 1, 1, false, nil); err != ErrTempBagFull {
		t.Fatalf("want ErrTempBagFull, got %v", err)
	}
}

func TestPreySoul_PoolStaysWithinTier_Property(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 1_000_000_000})
	ctx := context.Background()
	rng := rand.New(rand.NewSource(99))
	allowed := map[int]int{1: 0, 2: 1, 3: 2, 4: 3, 5: 4}
	for idx := 1; idx <= 5; idx++ {
		for n := 0; n < 50; n++ {
			st, _ := svc.loadCharState(ctx, 1)
			st.TempBag = map[int]int{}
			_ = svc.saveCharState(ctx, 1, st)
			payload, err := svc.PreySoul(ctx, 1, idx, true, rng)
			if err != nil {
				t.Fatalf("PreySoul idx %d: %v", idx, err)
			}
			ii := payload["sidObj"].(map[string]any)["ii"].(int)
			tpl := svc.gameData.GetPetSoul(ii)
			if tpl == nil {
				t.Fatalf("rolled unknown id %d", ii)
			}
			if int(tpl.Color) != allowed[idx] {
				t.Fatalf("crystal %d rolled color %d, want %d (id %d)", idx, int(tpl.Color), allowed[idx], ii)
			}
			if int(tpl.Type) != -1 {
				t.Fatalf("crystal %d rolled type %d, want -1 (id %d)", idx, int(tpl.Type), ii)
			}
		}
	}
}

func TestExchangeSoul_Success(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 50}
	svc, charRepo := newAcquireService(t, char)
	ctx := context.Background()
	openSlots(t, svc, 1, 4)

	payload, err := svc.ExchangeSoul(ctx, 1, 41)
	if err != nil {
		t.Fatalf("ExchangeSoul: %v", err)
	}
	if payload["type"].(int) != 1 {
		t.Fatalf("type = %v, want 1", payload["type"])
	}
	if charRepo.chars[1].SoulPoints != 25 {
		t.Fatalf("chip after exchange = %d, want 25 (50-25 req_chip)", charRepo.chars[1].SoulPoints)
	}
	if payload["chip"].(int64) != 25 {
		t.Fatalf("chip field = %v, want 25", payload["chip"])
	}
	soulData := payload["soulData"].(map[string]any)
	if soulData["sid"].(int) != 41 || soulData["s"].(int) != 1 {
		t.Fatalf("soulData wrong: %+v", soulData)
	}
	state, _ := svc.loadCharState(ctx, 1)
	if state.Slots[1].Sid != 41 {
		t.Fatalf("gem not placed in slot 1: %+v", state.Slots)
	}
}

func TestExchangeSoul_InsufficientChip_Type3(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 1})
	openSlots(t, svc, 1, 4)
	payload, err := svc.ExchangeSoul(context.Background(), 1, 41)
	if err != nil {
		t.Fatalf("ExchangeSoul: %v", err)
	}
	if payload["type"].(int) != 3 {
		t.Fatalf("type = %v, want 3 (insufficient chip)", payload["type"])
	}
}

func TestExchangeSoul_BagFull_Type2(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 1000})
	ctx := context.Background()
	openSlots(t, svc, 1, 1)
	if _, err := svc.ExchangeSoul(ctx, 1, 41); err != nil {
		t.Fatalf("first exchange: %v", err)
	}
	payload, err := svc.ExchangeSoul(ctx, 1, 41)
	if err != nil {
		t.Fatalf("second exchange: %v", err)
	}
	if payload["type"].(int) != 2 {
		t.Fatalf("type = %v, want 2 (bag full)", payload["type"])
	}
}

func TestExchangeSoul_UnknownId_Type3(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 1000})
	openSlots(t, svc, 1, 4)
	payload, err := svc.ExchangeSoul(context.Background(), 1, 99999)
	if err != nil {
		t.Fatalf("ExchangeSoul: %v", err)
	}
	if payload["type"].(int) != 3 {
		t.Fatalf("unknown id type = %v, want 3", payload["type"])
	}
}

func TestExchangeSoul_NonExchangeableRejected_Type3(t *testing.T) {
	svc, charRepo := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 1000})
	openSlots(t, svc, 1, 4)
	payload, err := svc.ExchangeSoul(context.Background(), 1, 21)
	if err != nil {
		t.Fatalf("ExchangeSoul: %v", err)
	}
	if payload["type"].(int) != 3 {
		t.Fatalf("type=-1 row should be rejected with type 3, got %v", payload["type"])
	}
	if charRepo.chars[1].SoulPoints != 1000 {
		t.Fatalf("rejected exchange must not deduct chip, got %d", charRepo.chars[1].SoulPoints)
	}
}

func TestPutSoulToBag_Single(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000}
	svc, _ := newAcquireService(t, char)
	ctx := context.Background()
	openSlots(t, svc, 1, 4)
	if _, err := svc.PreySoul(ctx, 1, 3, false, rand.New(rand.NewSource(1))); err != nil {
		t.Fatalf("PreySoul: %v", err)
	}

	payload, err := svc.PutSoulToBag(ctx, 1, 1)
	if err != nil {
		t.Fatalf("PutSoulToBag: %v", err)
	}
	if payload["f"].(int) != 1 {
		t.Fatalf("f = %v, want 1", payload["f"])
	}
	if payload["index"].(int) != 1 {
		t.Fatalf("index = %v, want 1", payload["index"])
	}
	soulData := payload["soulData"].(map[string]any)
	if soulData["sid"].(int) != 21 {
		t.Fatalf("moved gem sid = %v, want 21", soulData["sid"])
	}
	state, _ := svc.loadCharState(ctx, 1)
	if _, exists := state.TempBag[1]; exists {
		t.Fatalf("temp bag slot 1 should be cleared")
	}
	if state.Slots[soulData["s"].(int)].Sid != 21 {
		t.Fatalf("gem not in char bag: %+v", state.Slots)
	}
}

func TestPutSoulToBag_BagFull(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000}
	svc, _ := newAcquireService(t, char)
	ctx := context.Background()
	openSlots(t, svc, 1, 0)
	if _, err := svc.PreySoul(ctx, 1, 3, false, rand.New(rand.NewSource(1))); err != nil {
		t.Fatalf("PreySoul: %v", err)
	}
	payload, err := svc.PutSoulToBag(ctx, 1, 1)
	if err != nil {
		t.Fatalf("PutSoulToBag: %v", err)
	}
	if payload["f"].(int) != 0 || payload["type"].(int) != 2 {
		t.Fatalf("want f=0 type=2 (bag full), got %+v", payload)
	}
}

func TestPutAllSoulToBag(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000}
	svc, _ := newAcquireService(t, char)
	ctx := context.Background()
	openSlots(t, svc, 1, 6)
	for i := 0; i < 3; i++ {
		if _, err := svc.PreySoul(ctx, 1, 4, true, rand.New(rand.NewSource(int64(i)))); err != nil {
			t.Fatalf("PreySoul %d: %v", i, err)
		}
	}
	out, err := svc.PutAllSoulToBag(ctx, 1)
	if err != nil {
		t.Fatalf("PutAllSoulToBag: %v", err)
	}
	if len(out) != 3 {
		t.Fatalf("moved count = %d, want 3", len(out))
	}
	state, _ := svc.loadCharState(ctx, 1)
	if len(state.TempBag) != 0 {
		t.Fatalf("temp bag should be empty, got %d", len(state.TempBag))
	}
	if len(state.Slots) != 3 {
		t.Fatalf("char bag should have 3 gems, got %d", len(state.Slots))
	}
}

func TestPutAllSoulToBag_PartialWhenBagFills(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulPoints: 100000}
	svc, _ := newAcquireService(t, char)
	ctx := context.Background()
	openSlots(t, svc, 1, 2)
	for i := 0; i < 3; i++ {
		if _, err := svc.PreySoul(ctx, 1, 4, true, rand.New(rand.NewSource(int64(i)))); err != nil {
			t.Fatalf("PreySoul %d: %v", i, err)
		}
	}
	out, err := svc.PutAllSoulToBag(ctx, 1)
	if err != nil {
		t.Fatalf("PutAllSoulToBag: %v", err)
	}
	if len(out) != 2 {
		t.Fatalf("moved count = %d, want 2 (bag holds 2)", len(out))
	}
	state, _ := svc.loadCharState(ctx, 1)
	if len(state.TempBag) != 1 {
		t.Fatalf("1 gem should remain in temp bag, got %d", len(state.TempBag))
	}
}

func TestOpenPetSoulBag_Success(t *testing.T) {
	char := &domainchar.Character{ID: 1, SoulExp: 30000}
	svc, charRepo := newAcquireService(t, char)
	ctx := context.Background()
	petState := defaultPetSoulState()
	petState.OpenNum = 5
	petState.OpenNum2 = 0
	_ = svc.savePetState(ctx, 77, petState)

	payload, err := svc.OpenPetSoulBag(ctx, 1, 77)
	if err != nil {
		t.Fatalf("OpenPetSoulBag: %v", err)
	}
	if payload["openNum2"].(int) != 1 {
		t.Fatalf("openNum2 = %v, want 1", payload["openNum2"])
	}
	if payload["pid"].(int64) != 77 {
		t.Fatalf("pid = %v, want 77", payload["pid"])
	}
	if charRepo.chars[1].SoulExp != 10000 {
		t.Fatalf("soulExp after = %d, want 10000 (30000-20000)", charRepo.chars[1].SoulExp)
	}
	if payload["soulExp"].(int64) != 10000 {
		t.Fatalf("soulExp field = %v, want 10000", payload["soulExp"])
	}
}

func TestOpenPetSoulBag_LockedWhenOpenNumBelow5(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulExp: 99999})
	ctx := context.Background()
	petState := defaultPetSoulState()
	petState.OpenNum = 4
	_ = svc.savePetState(ctx, 77, petState)
	if _, err := svc.OpenPetSoulBag(ctx, 1, 77); err != ErrPetBagLocked {
		t.Fatalf("want ErrPetBagLocked, got %v", err)
	}
}

func TestOpenPetSoulBag_MaxedAt8(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulExp: 99999999})
	ctx := context.Background()
	petState := defaultPetSoulState()
	petState.OpenNum = 5
	petState.OpenNum2 = 8
	_ = svc.savePetState(ctx, 77, petState)
	if _, err := svc.OpenPetSoulBag(ctx, 1, 77); err != ErrPetBagMaxed {
		t.Fatalf("want ErrPetBagMaxed, got %v", err)
	}
}

func TestOpenPetSoulBag_InsufficientExp(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulExp: 100})
	ctx := context.Background()
	petState := defaultPetSoulState()
	petState.OpenNum = 5
	petState.OpenNum2 = 0
	_ = svc.savePetState(ctx, 77, petState)
	if _, err := svc.OpenPetSoulBag(ctx, 1, 77); err != ErrInsufficientExp {
		t.Fatalf("want ErrInsufficientExp, got %v", err)
	}
}

func TestMoveSoul_CharChar_Type1(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	openSlots(t, svc, 1, 4)
	_ = svc.AddSoulToSlot(ctx, 1, 1, 11, 50)
	_ = svc.AddSoulToSlot(ctx, 1, 2, 21, 70)

	payload, err := svc.MoveSoul(ctx, 1, 0, 1, 2)
	if err != nil {
		t.Fatalf("MoveSoul: %v", err)
	}
	if payload["type"].(int) != 1 {
		t.Fatalf("type = %v, want 1", payload["type"])
	}
	state, _ := svc.loadCharState(ctx, 1)
	if state.Slots[1].Sid != 21 || state.Slots[2].Sid != 11 {
		t.Fatalf("char slots not swapped: %+v", state.Slots)
	}
}

func TestMoveSoul_PetPet_Type2(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	petState := defaultPetSoulState()
	petState.OpenNum = 5
	petState.Slots[1] = SoulSlot{Sid: 11}
	petState.Slots[2] = SoulSlot{Sid: 21}
	_ = svc.savePetState(ctx, 77, petState)

	payload, err := svc.MoveSoul(ctx, 1, 77, 101, 102)
	if err != nil {
		t.Fatalf("MoveSoul: %v", err)
	}
	if payload["type"].(int) != 2 {
		t.Fatalf("type = %v, want 2", payload["type"])
	}
	got, _ := svc.loadPetState(ctx, 77)
	if got.Slots[1].Sid != 21 || got.Slots[2].Sid != 11 {
		t.Fatalf("pet slots not swapped: %+v", got.Slots)
	}
}

func TestMoveSoul_PetFromBag_Type3(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	openSlots(t, svc, 1, 4)
	_ = svc.AddSoulToSlot(ctx, 1, 2, 99, 0)
	petState := defaultPetSoulState()
	petState.OpenNum = 5
	petState.Slots[1] = SoulSlot{Sid: 11}
	_ = svc.savePetState(ctx, 77, petState)

	payload, err := svc.MoveSoul(ctx, 1, 77, 101, 2)
	if err != nil {
		t.Fatalf("MoveSoul: %v", err)
	}
	if payload["type"].(int) != 3 {
		t.Fatalf("type = %v, want 3", payload["type"])
	}
	pet, _ := svc.loadPetState(ctx, 77)
	bag, _ := svc.loadCharState(ctx, 1)
	if pet.Slots[1].Sid != 99 {
		t.Fatalf("pet slot should now hold bag gem 99, got %+v", pet.Slots[1])
	}
	if bag.Slots[2].Sid != 11 {
		t.Fatalf("bag slot should now hold pet gem 11, got %+v", bag.Slots[2])
	}
}

func TestMoveSoul_BagFromPet_Type4(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1})
	ctx := context.Background()
	openSlots(t, svc, 1, 4)
	_ = svc.AddSoulToSlot(ctx, 1, 1, 99, 0)
	petState := defaultPetSoulState()
	petState.OpenNum = 5
	petState.Slots[2] = SoulSlot{Sid: 11}
	_ = svc.savePetState(ctx, 77, petState)

	payload, err := svc.MoveSoul(ctx, 1, 77, 1, 102)
	if err != nil {
		t.Fatalf("MoveSoul: %v", err)
	}
	if payload["type"].(int) != 4 {
		t.Fatalf("type = %v, want 4", payload["type"])
	}
	pet, _ := svc.loadPetState(ctx, 77)
	bag, _ := svc.loadCharState(ctx, 1)
	if bag.Slots[1].Sid != 11 {
		t.Fatalf("bag slot should now hold pet gem 11, got %+v", bag.Slots[1])
	}
	if pet.Slots[2].Sid != 99 {
		t.Fatalf("pet slot should now hold bag gem 99, got %+v", pet.Slots[2])
	}
}

func TestMoveSoul_PetSwapWithoutPetIDFails(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1})
	payload, err := svc.MoveSoul(context.Background(), 1, 0, 101, 102)
	if err != nil {
		t.Fatalf("MoveSoul: %v", err)
	}
	if payload["f"].(int) != 0 {
		t.Fatalf("want f=0 fail when petID missing, got %+v", payload)
	}
}

func TestTempBag_RoundTripAndLoginEmit(t *testing.T) {
	svc, _ := newAcquireService(t, &domainchar.Character{ID: 1, SoulPoints: 100000})
	ctx := context.Background()
	if _, err := svc.PreySoul(ctx, 1, 5, false, rand.New(rand.NewSource(7))); err != nil {
		t.Fatalf("PreySoul: %v", err)
	}
	emit := svc.TempSoulDataForLogin(ctx, 1)
	if emit["1"].(int) != 42 {
		t.Fatalf("login tempSoulData[1] = %v, want 42", emit["1"])
	}

	s := defaultCharSoulState()
	s.TempBag[2] = 11
	s.TempBag[5] = 21
	got := charSoulStateFromMap(s.ToMap())
	if got.TempBag[2] != 11 || got.TempBag[5] != 21 {
		t.Fatalf("temp bag round-trip mismatch: %+v", got.TempBag)
	}
	if _, leaked := s.LoginObj()["tempSoulData"]; leaked {
		t.Fatalf("tempSoulData must not leak into soulBagData (it is a sibling top-level field)")
	}
}
