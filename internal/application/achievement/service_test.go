// Open-sourced by BaoLT

package achievement

import (
	"context"
	"encoding/json"
	"testing"
	"time"

	domainachievement "mcgame-server/internal/domain/achievement"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type achievementTestRepo struct {
	rows       []*domainachievement.Progress
	claimedIDs []int64
}

func (r *achievementTestRepo) GetProgressByCharacter(ctx context.Context, characterID int64) ([]*domainachievement.Progress, error) {
	return r.rows, nil
}

func (r *achievementTestRepo) UpsertProgress(ctx context.Context, progress *domainachievement.Progress) (*domainachievement.Progress, error) {
	return progress, nil
}

func (r *achievementTestRepo) MarkCompleted(ctx context.Context, characterID, achievementID int64, completedAt time.Time) (*domainachievement.Progress, error) {
	return nil, nil
}

func (r *achievementTestRepo) MarkClaimed(ctx context.Context, characterID, achievementID int64, claimedAt time.Time) (*domainachievement.Progress, error) {
	r.claimedIDs = append(r.claimedIDs, achievementID)
	for _, row := range r.rows {
		if row == nil || row.AchievementID != achievementID {
			continue
		}
		row.IsClaimed = true
		row.ClaimedAt = &claimedAt
		return row, nil
	}
	return nil, nil
}

func (r *achievementTestRepo) ListClaimedCounts(ctx context.Context, characterID int64) (map[int64]int, error) {
	return nil, nil
}

func TestLoadSnapshotBuildsClientMaps(t *testing.T) {
	now := time.Date(2026, 4, 21, 10, 0, 0, 0, time.UTC)
	manager := gamedata.NewManager(nil, zap.NewNop())

	achievementRows := []json.RawMessage{
		mustAchievementJSON(t, models.AchievementTemplate{ID: 1001, Award: 5}),
		mustAchievementJSON(t, models.AchievementTemplate{ID: 1002, Award: 7}),
	}
	requirementRows := []json.RawMessage{
		mustAchievementJSON(t, models.AchievementRequireTemplate{ID: 1, Aid: 1001, Num: 10}),
		mustAchievementJSON(t, models.AchievementRequireTemplate{ID: 2, Aid: 1002, Num: 8}),
	}

	if err := manager.GetCache().LoadTable(models.TableAchievement, achievementRows); err != nil {
		t.Fatalf("load achievement table: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableAchievementRequire, requirementRows); err != nil {
		t.Fatalf("load achievement require table: %v", err)
	}

	repo := &achievementTestRepo{rows: []*domainachievement.Progress{
		{
			ID:            1,
			CharacterID:   99,
			AchievementID: 1001,
			Progress:      10,
			Target:        0,
			IsCompleted:   true,
			IsClaimed:     true,
			CompletedAt:   &now,
		},
		{
			ID:            2,
			CharacterID:   99,
			AchievementID: 1002,
			Progress:      3,
			Target:        0,
			IsCompleted:   false,
			IsClaimed:     false,
		},
	}}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(manager)

	snapshot, err := service.LoadSnapshot(context.Background(), 99)
	if err != nil {
		t.Fatalf("LoadSnapshot() error = %v", err)
	}

	if got := snapshot.AchievementPoints; got != 5 {
		t.Fatalf("AchievementPoints = %d, want 5", got)
	}
	if got := snapshot.AchieveLog["1001"]; got != now.UnixMilli() {
		t.Fatalf("AchieveLog[1001] = %v, want %d", got, now.UnixMilli())
	}
	if got := snapshot.TakeAchieveAwardLog["1001"]; got != 1 {
		t.Fatalf("TakeAchieveAwardLog[1001] = %v, want 1", got)
	}

	progressEntry, ok := snapshot.AchieveReqLog["1002"].(map[string]interface{})
	if !ok {
		t.Fatalf("AchieveReqLog[1002] type = %T, want map[string]interface{}", snapshot.AchieveReqLog["1002"])
	}
	if got := progressEntry["done"]; got != 8 {
		t.Fatalf("AchieveReqLog[1002][done] = %v, want 8", got)
	}
	if got := progressEntry["progress"]; got != 3 {
		t.Fatalf("AchieveReqLog[1002][progress] = %v, want 3", got)
	}
}

func TestClaimRewardMarksCompletedAchievementClaimed(t *testing.T) {
	repo := &achievementTestRepo{rows: []*domainachievement.Progress{{
		ID:            1,
		CharacterID:   99,
		AchievementID: 1008,
		Progress:      1,
		Target:        1,
		IsCompleted:   true,
		IsClaimed:     false,
	}}}

	service := NewService(repo, zap.NewNop())
	result, err := service.ClaimReward(context.Background(), 99, 1008)
	if err != nil {
		t.Fatalf("ClaimReward() error = %v", err)
	}
	if result.AchievementID != 1008 {
		t.Fatalf("AchievementID = %d, want 1008", result.AchievementID)
	}
	if result.ClaimCount != 1 {
		t.Fatalf("ClaimCount = %d, want 1", result.ClaimCount)
	}
	if len(repo.claimedIDs) != 1 || repo.claimedIDs[0] != 1008 {
		t.Fatalf("claimedIDs = %#v, want [1008]", repo.claimedIDs)
	}
	if !repo.rows[0].IsClaimed {
		t.Fatalf("progress row should be marked claimed")
	}
}

func TestClaimRewardRejectsAlreadyClaimedAchievement(t *testing.T) {
	repo := &achievementTestRepo{rows: []*domainachievement.Progress{{
		ID:            1,
		CharacterID:   99,
		AchievementID: 1021,
		Progress:      1,
		Target:        1,
		IsCompleted:   true,
		IsClaimed:     true,
	}}}

	service := NewService(repo, zap.NewNop())
	_, err := service.ClaimReward(context.Background(), 99, 1021)
	if err == nil {
		t.Fatalf("ClaimReward() error = nil, want already claimed error")
	}
	if len(repo.claimedIDs) != 0 {
		t.Fatalf("claimedIDs = %#v, want empty", repo.claimedIDs)
	}
}

func mustAchievementJSON(t *testing.T, value interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("marshal json: %v", err)
	}
	return data
}
