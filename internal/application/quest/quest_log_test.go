// Open-sourced by BaoLT

package quest

import (
	"context"
	"errors"
	"testing"

	domainquest "mcgame-server/internal/domain/quest"

	"go.uber.org/zap"
)

type questLogTestRepo struct {
	ids []int
	err error
}

func (r *questLogTestRepo) GetCompletedQuestIDs(_ context.Context, _ int64) ([]int, error) {
	return r.ids, r.err
}

func (r *questLogTestRepo) Save(_ context.Context, _ *domainquest.QuestProgress) error { return nil }
func (r *questLogTestRepo) FindByID(_ context.Context, _ int64) (*domainquest.QuestProgress, error) {
	return nil, nil
}
func (r *questLogTestRepo) FindByCharacterAndQuest(_ context.Context, _ int64, _ int) (*domainquest.QuestProgress, error) {
	return nil, nil
}
func (r *questLogTestRepo) FindActiveByCharacter(_ context.Context, _ int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}
func (r *questLogTestRepo) FindCompletedByCharacter(_ context.Context, _ int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}
func (r *questLogTestRepo) FindAllByCharacter(_ context.Context, _ int64) ([]*domainquest.QuestProgress, error) {
	return nil, nil
}
func (r *questLogTestRepo) Update(_ context.Context, _ *domainquest.QuestProgress) error { return nil }
func (r *questLogTestRepo) Delete(_ context.Context, _ int64) error                      { return nil }
func (r *questLogTestRepo) RecordHistory(_ context.Context, _ *domainquest.QuestHistory) error {
	return nil
}
func (r *questLogTestRepo) CountCompletedByCharacter(_ context.Context, _ int64) (int, error) {
	return 0, nil
}

func TestBuildQuestLogString(t *testing.T) {
	logger, _ := zap.NewDevelopment()

	cases := []struct {
		name    string
		ids     []int
		repoErr error
		want    string
		wantErr bool
	}{
		{
			name: "empty list returns leading pipe only",
			ids:  []int{},
			want: "|",
		},
		{
			name: "single id wraps with pipes",
			ids:  []int{1001},
			want: "|1001|",
		},
		{
			name: "multiple ids each separated by pipe",
			ids:  []int{101, 202, 303},
			want: "|101|202|303|",
		},
		{
			name:    "repo error returns leading pipe and error",
			repoErr: errors.New("db down"),
			want:    "|",
			wantErr: true,
		},
	}

	for _, tc := range cases {
		tc := tc
		t.Run(tc.name, func(t *testing.T) {
			repo := &questLogTestRepo{ids: tc.ids, err: tc.repoErr}
			svc := NewService(repo, logger)

			got, err := svc.BuildQuestLogString(context.Background(), 1)
			if tc.wantErr && err == nil {
				t.Fatal("expected error, got nil")
			}
			if !tc.wantErr && err != nil {
				t.Fatalf("unexpected error: %v", err)
			}
			if got != tc.want {
				t.Fatalf("BuildQuestLogString = %q, want %q", got, tc.want)
			}
		})
	}
}
