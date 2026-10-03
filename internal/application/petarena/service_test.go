// Open-sourced by BaoLT

package petarena

import (
	"context"
	"testing"

	domainpet "mcgame-server/internal/domain/pet"
	domainpetarena "mcgame-server/internal/domain/petarena"

	"go.uber.org/zap"
)

type stubPetArenaRepo struct {
	configs map[string]*domainpetarena.FightConfig
	entries map[string]*domainpetarena.Entry
}

func (r *stubPetArenaRepo) configKey(characterID int64, key string) string {
	return string(rune(characterID)) + ":" + key
}

func (r *stubPetArenaRepo) GetRanking(ctx context.Context, characterID int64, season int) (*domainpetarena.ArenaRanking, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) GetOrCreateRanking(ctx context.Context, characterID int64, season int) (*domainpetarena.ArenaRanking, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) SaveRanking(ctx context.Context, ranking *domainpetarena.ArenaRanking) error {
	return nil
}
func (r *stubPetArenaRepo) GetTopRankings(ctx context.Context, season int, limit, offset int) ([]*domainpetarena.ArenaRanking, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) GetRank(ctx context.Context, characterID int64, season int) (int, error) {
	return 0, nil
}
func (r *stubPetArenaRepo) SaveBattle(ctx context.Context, battle *domainpetarena.ArenaBattle) error {
	return nil
}
func (r *stubPetArenaRepo) GetBattle(ctx context.Context, battleID int64) (*domainpetarena.ArenaBattle, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) GetBattleHistory(ctx context.Context, characterID int64, limit int) ([]*domainpetarena.ArenaBattle, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) GetReward(ctx context.Context, characterID int64, season int) (*domainpetarena.ArenaReward, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) SaveReward(ctx context.Context, reward *domainpetarena.ArenaReward) error {
	return nil
}
func (r *stubPetArenaRepo) FindOpponents(ctx context.Context, characterID int64, rating int, season int, limit int) ([]*domainpetarena.ArenaRanking, error) {
	return nil, nil
}
func (r *stubPetArenaRepo) GetFightConfig(ctx context.Context, characterID int64, configKey string) (*domainpetarena.FightConfig, error) {
	if r.configs == nil {
		return nil, nil
	}
	return r.configs[r.configKey(characterID, configKey)], nil
}
func (r *stubPetArenaRepo) SaveFightConfig(ctx context.Context, config *domainpetarena.FightConfig) error {
	if r.configs == nil {
		r.configs = map[string]*domainpetarena.FightConfig{}
	}
	r.configs[r.configKey(config.CharacterID, config.ConfigKey)] = config
	return nil
}
func (r *stubPetArenaRepo) GetEntry(ctx context.Context, characterID int64, season int) (*domainpetarena.Entry, error) {
	if r.entries == nil {
		return nil, nil
	}
	return r.entries[r.configKey(characterID, string(rune(season)))], nil
}
func (r *stubPetArenaRepo) SaveEntry(ctx context.Context, entry *domainpetarena.Entry) error {
	if r.entries == nil {
		r.entries = map[string]*domainpetarena.Entry{}
	}
	r.entries[r.configKey(entry.CharacterID, string(rune(entry.Season)))] = entry
	return nil
}
func (r *stubPetArenaRepo) ListEntries(ctx context.Context, season int, limit int) ([]*domainpetarena.Entry, error) {
	result := make([]*domainpetarena.Entry, 0)
	for _, entry := range r.entries {
		if entry.Season == season {
			result = append(result, entry)
		}
	}
	return result, nil
}

type stubPetRepo struct{}

func (r *stubPetRepo) Save(ctx context.Context, pet *domainpet.Pet) error { return nil }
func (r *stubPetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	return nil, nil
}
func (r *stubPetRepo) FindByCharacterID(ctx context.Context, characterID int64) ([]*domainpet.Pet, error) {
	return nil, nil
}
func (r *stubPetRepo) FindFollowingPet(ctx context.Context, characterID int64) (*domainpet.Pet, error) {
	return nil, nil
}
func (r *stubPetRepo) Delete(ctx context.Context, id int64) error { return nil }
func (r *stubPetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}
func (r *stubPetRepo) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	return nil
}
func (r *stubPetRepo) ClearFollowing(ctx context.Context, characterID int64) error { return nil }

func TestSaveAndLoadPetFightConfig(t *testing.T) {
	repo := &stubPetArenaRepo{}
	service := NewService(repo, &stubPetRepo{}, zap.NewNop())

	conf := map[string]interface{}{
		"conf1": map[string]interface{}{
			"5": map[string]interface{}{
				"pid": 4733382,
				"pos": 5,
				"cmdList": []interface{}{
					map[string]interface{}{
						"id":     "5345",
						"level":  "3",
						"action": -50,
						"t":      "54",
					},
				},
			},
		},
	}

	if err := service.SavePetFightConfig(context.Background(), 35644, "farm", conf); err != nil {
		t.Fatalf("SavePetFightConfig() error = %v", err)
	}

	loaded, err := service.GetPetFightConfig(context.Background(), 35644, "farm")
	if err != nil {
		t.Fatalf("GetPetFightConfig() error = %v", err)
	}

	conf1, ok := loaded["conf1"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected conf1 map in loaded config")
	}
	slot5, ok := conf1["5"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected slot 5 entry in loaded config")
	}
	if slot5["pos"] != 5 {
		t.Fatalf("slot5 pos = %#v, expected 5", slot5["pos"])
	}
}
