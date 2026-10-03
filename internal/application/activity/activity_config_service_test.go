// Open-sourced by BaoLT

package activity

import (
	"context"
	"testing"

	domainactivity "mcgame-server/internal/domain/activity"
	pkgerrors "mcgame-server/pkg/errors"
)

type startedActivityTestRepo struct {
	configs []*domainactivity.ActivityConfig
}

func (r *startedActivityTestRepo) List(ctx context.Context) ([]*domainactivity.ActivityConfig, error) {
	return r.configs, nil
}

func (r *startedActivityTestRepo) Get(ctx context.Context, id int) (*domainactivity.ActivityConfig, error) {
	for _, c := range r.configs {
		if c != nil && c.ID == id {
			return c, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func TestStartedActivityServiceBuildStartedActList(t *testing.T) {
	service := NewStartedActivityService(&startedActivityTestRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 0, SortType: 5, Enable: true, Type: 0, Flag: 1},
			{ID: 12, SortType: 3, Enable: true, Type: 2, Flag: 30},
			{ID: 49, SortType: 1, Enable: true, Type: 3, Flag: 2},
			{ID: 60, SortType: 7, Enable: false, Type: 4, Flag: 1},
		},
	})

	result, err := service.BuildStartedActList(context.Background())
	if err != nil {
		t.Fatalf("BuildStartedActList() error = %v", err)
	}
	if len(result) != 4 {
		t.Fatalf("BuildStartedActList() len = %d, want 4", len(result))
	}

	first, ok := result[0].(map[string]interface{})
	if !ok {
		t.Fatalf("result[0] type = %T, want map[string]interface{}", result[0])
	}
	if got := first["flag"]; got != true {
		t.Fatalf("result[0][flag] = %v, want true", got)
	}
	if _, hasType := first["type"]; hasType {
		t.Fatalf("result[0][type] present, want absent")
	}

	second := result[1].(map[string]interface{})
	if got := second["type"]; got != 2 {
		t.Fatalf("result[1][type] = %v, want 2", got)
	}
	if got := second["flag"]; got != 30 {
		t.Fatalf("result[1][flag] = %v, want 30", got)
	}

	third := result[2].(map[string]interface{})
	if got := third["type"]; got != 3 {
		t.Fatalf("result[2][type] = %v, want 3", got)
	}
	if got := third["flag"]; got != 2 {
		t.Fatalf("result[2][flag] = %v, want 2", got)
	}

	fourth := result[3].(map[string]interface{})
	if got := fourth["flag"]; got != false {
		t.Fatalf("result[3][flag] = %v, want false", got)
	}
	if _, hasType := fourth["type"]; hasType {
		t.Fatalf("result[3][type] present, want absent")
	}
}

func TestBuildStartedActListIfLevelGateCrossed(t *testing.T) {
	repo := &startedActivityTestRepo{
		configs: []*domainactivity.ActivityConfig{
			{ID: 0, SortType: 0, Enable: true, Type: 0, Flag: 1},
			{ID: 1, SortType: 1, Enable: true, Type: 2, Flag: 50},
			{ID: 2, SortType: 2, Enable: true, Type: 2, Flag: 80},
			{ID: 3, SortType: 3, Enable: false, Type: 2, Flag: 60},
			{ID: 4, SortType: 4, Enable: true, Type: 3, Flag: 70},
		},
	}
	service := NewStartedActivityService(repo)
	ctx := context.Background()

	cases := []struct {
		name        string
		oldLevel    int
		newLevel    int
		wantCrossed bool
	}{
		{"no level change", 50, 50, false},
		{"level dropped", 60, 55, false},
		{"jump misses every gate", 51, 79, false},
		{"crosses 50 threshold", 49, 50, true},
		{"crosses 80 threshold", 79, 80, true},
		{"jump crosses two gates", 49, 81, true},
		{"disabled gate ignored", 59, 60, false},
		{"non-gate type ignored", 69, 70, false},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			payload, crossed, err := service.BuildStartedActListIfLevelGateCrossed(ctx, tc.oldLevel, tc.newLevel)
			if err != nil {
				t.Fatalf("unexpected error: %v", err)
			}
			if crossed != tc.wantCrossed {
				t.Fatalf("crossed = %v, want %v", crossed, tc.wantCrossed)
			}
			if !crossed && payload != nil {
				t.Fatalf("payload not nil when not crossed: %v", payload)
			}
			if crossed && len(payload) == 0 {
				t.Fatalf("expected payload when crossed")
			}
		})
	}
}
