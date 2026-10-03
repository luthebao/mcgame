// Open-sourced by BaoLT

package activity

import (
	"context"
	"testing"
	"time"

	apppet "mcgame-server/internal/application/pet"
	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type activityTestCharacterRepo struct {
	char *domainchar.Character
}

func (r *activityTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil {
		return nil, nil
	}
	copy := *r.char
	return &copy, nil
}

func (r *activityTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *activityTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *activityTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *activityTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *activityTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *activityTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *activityTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *activityTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *activityTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func TestGetConsumeNoticeData_ReturnsStarterFields(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())
	handler.SetCharacterRepository(&activityTestCharacterRepo{})

	result, err := handler.GetConsumeNoticeData(&rtmp.RPCContext{ConnID: 14, CharacterID: "6"}, nil)
	if err != nil {
		t.Fatalf("GetConsumeNoticeData() error = %v", err)
	}

	payload := result.(map[string]interface{})
	for _, key := range []string{"t", "start", "end", "at", "info", "it"} {
		if _, exists := payload[key]; !exists {
			t.Fatalf("payload missing %s", key)
		}
	}
}

func TestInitPPVEPanel_PreservesMasterLevelAndAppliesReset(t *testing.T) {
	repo := &premiumHandlerStatFeatureRepo{}
	if err := repo.UpsertCharacterFeatureState(context.Background(), &domainfeature.CharacterFeatureState{
		CharacterID: 8,
		FeatureKey:  domainfeature.FeaturePetPVE,
		State:       map[string]interface{}{"mlv": 44, "lastResetDay": ""},
	}); err != nil {
		t.Fatalf("seed state: %v", err)
	}

	handler := NewHandler(nil, zap.NewNop())
	handler.SetPPVEService(apppet.NewPPVEService(repo, &activityTestCharacterRepo{}, zap.NewNop()))

	result, err := handler.InitPPVEPanel(&rtmp.RPCContext{ConnID: 15, CharacterID: "8"}, nil)
	if err != nil {
		t.Fatalf("InitPPVEPanel() error = %v", err)
	}
	if result != nil {
		t.Fatalf("InitPPVEPanel is push-style, want nil result, got %v", result)
	}

	persisted := repo.characterState[8][domainfeature.FeaturePetPVE]
	if got := persisted["mlv"]; got != 44 {
		t.Fatalf("mlv = %v, want 44 (master carve level preserved, not char.Level)", got)
	}
	today := time.Now().Format("2006-01-02")
	if got := persisted["lastResetDay"]; got != today {
		t.Fatalf("lastResetDay = %v, want %v (daily reset applied)", got, today)
	}
}

func TestInitEMPanel_ReturnsExpectedArrayShape(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())
	handler.SetCharacterRepository(&activityTestCharacterRepo{})

	result, err := handler.InitEMPanel(&rtmp.RPCContext{ConnID: 16, CharacterID: "9"}, nil)
	if err != nil {
		t.Fatalf("InitEMPanel() error = %v", err)
	}

	payload, ok := result.([]interface{})
	if !ok {
		t.Fatalf("InitEMPanel() type = %T, want []interface{}", result)
	}
	if len(payload) != 4 {
		t.Fatalf("len(payload) = %d, want 4", len(payload))
	}
}

func TestGetMCZDData_ReturnsRankAndFlagShape(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())
	handler.SetCharacterRepository(&activityTestCharacterRepo{})

	result, err := handler.GetMCZDData(&rtmp.RPCContext{ConnID: 17, CharacterID: "10"}, nil)
	if err != nil {
		t.Fatalf("GetMCZDData() error = %v", err)
	}

	payload := result.(map[string]interface{})
	if _, ok := payload["mczdTodayRank"].(map[string]interface{}); !ok {
		t.Fatalf("mczdTodayRank type = %T, want map[string]interface{}", payload["mczdTodayRank"])
	}
	if _, ok := payload["flag"].(map[string]interface{}); !ok {
		t.Fatalf("flag type = %T, want map[string]interface{}", payload["flag"])
	}
}

func TestGetHMTXLSData_UsesCharacterLevel(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 11
	char.Level = 60

	handler := NewHandler(nil, zap.NewNop())
	handler.SetCharacterRepository(&activityTestCharacterRepo{char: char})

	result, err := handler.GetHMTXLSData(&rtmp.RPCContext{ConnID: 18, CharacterID: "11"}, nil)
	if err != nil {
		t.Fatalf("GetHMTXLSData() error = %v", err)
	}

	payload := result.(map[string]interface{})
	if got := payload["lev"]; got != 60 {
		t.Fatalf("lev = %v, want 60", got)
	}
}

func TestGetTXKCData_ReturnsStarterFlagShape(t *testing.T) {
	handler := NewHandler(nil, zap.NewNop())
	handler.SetCharacterRepository(&activityTestCharacterRepo{})

	result, err := handler.GetTXKCData(&rtmp.RPCContext{ConnID: 19, CharacterID: "12"}, nil)
	if err != nil {
		t.Fatalf("GetTXKCData() error = %v", err)
	}

	payload := result.(map[string]interface{})
	flag, ok := payload["flag"].(map[string]interface{})
	if !ok {
		t.Fatalf("flag type = %T, want map[string]interface{}", payload["flag"])
	}
	if got := flag["lev"]; got != 1 {
		t.Fatalf("flag[lev] = %v, want 1", got)
	}
}
