// Open-sourced by BaoLT

package soultrain

import (
	"context"
	"encoding/json"
	"errors"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type fakeChars struct {
	char      *domainchar.Character
	saveCalls int
}

func (f *fakeChars) GetByID(_ context.Context, _ int64) (*domainchar.Character, error) {
	if f.char == nil {
		return nil, errors.New("not found")
	}
	return f.char, nil
}

func (f *fakeChars) Save(_ context.Context, _ *domainchar.Character) error {
	f.saveCalls++
	return nil
}

type fakeProg struct {
	soulLevel  int
	soulExp    int64
	saveCalls  int
	savedLevel int
	savedExp   int64
}

func (f *fakeProg) GetSoulProgression(_ context.Context, _ int64) (int, int64, error) {
	return f.soulLevel, f.soulExp, nil
}

func (f *fakeProg) SaveSoulProgression(_ context.Context, _ int64, level int, exp int64) error {
	f.saveCalls++
	f.savedLevel = level
	f.savedExp = exp
	return nil
}

func loadSoulManager(t *testing.T, rows []map[string]interface{}) *gamedata.Manager {
	t.Helper()
	mgr := gamedata.NewManager(nil, zap.NewNop())
	payloads := make([]json.RawMessage, 0, len(rows))
	for _, row := range rows {
		raw, err := json.Marshal(row)
		if err != nil {
			t.Fatalf("marshal soul row: %v", err)
		}
		payloads = append(payloads, raw)
	}
	if err := mgr.GetCache().LoadTable(models.TableSoul, payloads); err != nil {
		t.Fatalf("LoadTable souls: %v", err)
	}
	return mgr
}

func defaultSoulRows() []map[string]interface{} {
	return []map[string]interface{}{
		{"id": 1, "require_num": 10000},
		{"id": 2, "require_num": 20000},
		{"id": 3, "require_num": 30000},
	}
}

func newTestService(char *domainchar.Character, prog *fakeProg, mgr *gamedata.Manager) *Service {
	return NewService(&fakeChars{char: char}, prog, mgr)
}

func TestTrain_InsufficientBalance_RejectsAndDoesNotSave(t *testing.T) {
	char := &domainchar.Character{ID: 1, MysteryCrystal: TrainCostMysteryCrystal - 1}
	prog := &fakeProg{soulLevel: 0, soulExp: 0}
	mgr := loadSoulManager(t, defaultSoulRows())
	svc := newTestService(char, prog, mgr)

	_, err := svc.Train(context.Background(), 1)
	if !errors.Is(err, ErrInsufficientCrystal) {
		t.Fatalf("expected ErrInsufficientCrystal, got %v", err)
	}
	if prog.saveCalls != 0 {
		t.Fatalf("expected SaveSoulProgression not called, called %d times", prog.saveCalls)
	}
	if char.MysteryCrystal != TrainCostMysteryCrystal-1 {
		t.Fatalf("expected MysteryCrystal unchanged, got %d", char.MysteryCrystal)
	}
}

func TestTrain_MaxSoulLevel_RejectsAndDoesNotSave(t *testing.T) {
	mgr := loadSoulManager(t, defaultSoulRows())
	char := &domainchar.Character{ID: 1, MysteryCrystal: 100000}
	prog := &fakeProg{soulLevel: 3, soulExp: 0}
	svc := newTestService(char, prog, mgr)

	_, err := svc.Train(context.Background(), 1)
	if !errors.Is(err, ErrMaxSoulLevel) {
		t.Fatalf("expected ErrMaxSoulLevel (templates only go to ID=3, so level+1=4 is nil), got %v", err)
	}
	if prog.saveCalls != 0 {
		t.Fatalf("expected SaveSoulProgression not called, called %d times", prog.saveCalls)
	}
}

func TestTrain_Success_DeductsAndSavesProgression(t *testing.T) {
	mgr := loadSoulManager(t, defaultSoulRows())
	char := &domainchar.Character{ID: 1, MysteryCrystal: TrainCostMysteryCrystal * 2}
	prog := &fakeProg{soulLevel: 0, soulExp: 0}
	svc := newTestService(char, prog, mgr)

	result, err := svc.Train(context.Background(), 1)
	if err != nil {
		t.Fatalf("Train: %v", err)
	}

	if char.MysteryCrystal != TrainCostMysteryCrystal {
		t.Fatalf("expected MysteryCrystal=%d after deduction, got %d", TrainCostMysteryCrystal, char.MysteryCrystal)
	}
	if prog.saveCalls != 1 {
		t.Fatalf("expected SaveSoulProgression called once, called %d times", prog.saveCalls)
	}
	expectedExp := int64(TrainExpGain)
	if prog.savedExp != expectedExp {
		t.Fatalf("SaveSoulProgression: exp=%d, want %d", prog.savedExp, expectedExp)
	}
	if result.SoulExp != expectedExp {
		t.Fatalf("result.SoulExp=%d, want %d", result.SoulExp, expectedExp)
	}
	if result.SoulLvl != prog.savedLevel {
		t.Fatalf("result.SoulLvl=%d, want %d", result.SoulLvl, prog.savedLevel)
	}
}

func TestTrain_MultiLevelUp_AppliesAllLevels(t *testing.T) {
	rows := []map[string]interface{}{
		{"id": 1, "require_num": 1},
		{"id": 2, "require_num": 1},
		{"id": 3, "require_num": 1},
		{"id": 4, "require_num": 999999},
	}
	mgr := loadSoulManager(t, rows)
	char := &domainchar.Character{ID: 1, MysteryCrystal: TrainCostMysteryCrystal * 2}
	prog := &fakeProg{soulLevel: 0, soulExp: 0}
	svc := newTestService(char, prog, mgr)

	result, err := svc.Train(context.Background(), 1)
	if err != nil {
		t.Fatalf("Train multi-level: %v", err)
	}

	if result.SoulLvl != 3 {
		t.Fatalf("expected SoulLvl=3 after multi-level-up (require_num=1 for levels 1-3), got %d", result.SoulLvl)
	}
	if prog.savedLevel != 3 {
		t.Fatalf("SaveSoulProgression: level=%d, want 3", prog.savedLevel)
	}
	if result.SoulExp != TrainExpGain {
		t.Fatalf("result.SoulExp=%d, want %d", result.SoulExp, TrainExpGain)
	}
}
