// Open-sourced by BaoLT

package item

import (
	"testing"

	"mcgame-server/internal/gamedata/models"
)

func TestAwardPicker_EmptyAwards(t *testing.T) {
	picker := newAwardPicker(func(min, _ int) int { return min }, nil)
	if got := picker.Pick(0, nil); got != nil {
		t.Fatalf("Pick(nil) = %v, want nil", got)
	}
	if got := picker.Pick(0, []*models.ItemAwardTemplate{}); len(got) != 0 {
		t.Fatalf("Pick(empty) = %v, want empty", got)
	}
}

func TestAwardPicker_GuaranteedOnly(t *testing.T) {
	rows := []*models.ItemAwardTemplate{
		{ID: 1, AwardID: 100, Rate: 50, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}},
		{ID: 2, AwardID: 200, Rate: 1, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}},
	}
	picker := newAwardPicker(func(min, _ int) int { return min }, nil)
	got := picker.Pick(1, rows)
	if len(got) != 2 {
		t.Fatalf("Pick() len = %d, want 2", len(got))
	}
	if got[0].AwardID != 100 || got[1].AwardID != 200 {
		t.Fatalf("Pick() ids = [%v %v], want [100 200]", got[0].AwardID, got[1].AwardID)
	}
}

func TestAwardPicker_PoolPicksOne(t *testing.T) {
	rows := []*models.ItemAwardTemplate{
		{ID: 1, AwardID: 10, Rate: 90},
		{ID: 2, AwardID: 20, Rate: 10},
	}
	picker := newAwardPicker(func(min, _ int) int { return min }, nil)
	got := picker.Pick(1, rows)
	if len(got) != 1 {
		t.Fatalf("Pick() len = %d, want 1", len(got))
	}
}

func TestAwardPicker_HighRollFiltersLightWeights(t *testing.T) {
	rows := []*models.ItemAwardTemplate{
		{ID: 1, AwardID: 10, Rate: 90},
		{ID: 2, AwardID: 20, Rate: 10},
	}
	picker := newAwardPicker(func(_, max int) int { return max }, nil)
	got := picker.Pick(1, rows)
	if len(got) != 1 {
		t.Fatalf("Pick() len = %d, want 1", len(got))
	}
	if got[0].AwardID != 10 {
		t.Fatalf("Pick() chose AwardID %v, want 10 (only row with weight >= max roll)", got[0].AwardID)
	}
}

func TestAwardPicker_GuaranteedPlusPool(t *testing.T) {
	rows := []*models.ItemAwardTemplate{
		{ID: 1, AwardID: 999, Rate: 100, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}},
		{ID: 2, AwardID: 10, Rate: 50},
		{ID: 3, AwardID: 20, Rate: 50},
	}
	picker := newAwardPicker(func(min, _ int) int { return min }, nil)
	got := picker.Pick(1, rows)
	if len(got) != 2 {
		t.Fatalf("Pick() len = %d, want 2", len(got))
	}
	if got[0].AwardID != 999 {
		t.Fatalf("Pick()[0] = %v, want guaranteed AwardID 999", got[0].AwardID)
	}
}

func TestAwardPicker_PoolWithZeroWeightSkipped(t *testing.T) {
	rows := []*models.ItemAwardTemplate{
		{ID: 1, AwardID: 10, Rate: 0},
		{ID: 2, AwardID: 20, Rate: 5},
	}
	picker := newAwardPicker(func(min, _ int) int { return min }, nil)
	got := picker.Pick(1, rows)
	if len(got) != 1 || got[0].AwardID != 20 {
		t.Fatalf("Pick() = %v, want only AwardID 20", got)
	}
}

func TestAwardPicker_OnlyGuaranteedNoPoolPick(t *testing.T) {
	rows := []*models.ItemAwardTemplate{
		{ID: 1, AwardID: 1, Payload: map[string]interface{}{models.AwardPayloadGuaranteedKey: true}},
	}
	calls := 0
	picker := newAwardPicker(func(min, _ int) int { calls++; return min }, nil)
	got := picker.Pick(1, rows)
	if len(got) != 1 {
		t.Fatalf("Pick() len = %d, want 1", len(got))
	}
	if calls != 0 {
		t.Fatalf("rng called %d times, want 0", calls)
	}
}

func TestItemAwardTemplate_IsGuaranteed(t *testing.T) {
	cases := []struct {
		name    string
		payload map[string]interface{}
		want    bool
	}{
		{"nil payload", nil, false},
		{"missing key", map[string]interface{}{"x": 1}, false},
		{"bool true", map[string]interface{}{models.AwardPayloadGuaranteedKey: true}, true},
		{"bool false", map[string]interface{}{models.AwardPayloadGuaranteedKey: false}, false},
		{"float 1", map[string]interface{}{models.AwardPayloadGuaranteedKey: 1.0}, true},
		{"float 0", map[string]interface{}{models.AwardPayloadGuaranteedKey: 0.0}, false},
	}
	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			tpl := &models.ItemAwardTemplate{Payload: tc.payload}
			if got := tpl.IsGuaranteed(); got != tc.want {
				t.Fatalf("IsGuaranteed() = %v, want %v", got, tc.want)
			}
		})
	}
}
