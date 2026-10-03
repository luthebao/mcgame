// Open-sourced by BaoLT

package dress

import (
	"testing"

	appdress "mcgame-server/internal/application/dress"

	amf0 "github.com/yutopp/go-amf0"
)

type dressCallbackRecorder struct {
	calls []dressCallbackCall
}

type dressCallbackCall struct {
	method string
	args   []interface{}
}

func (r *dressCallbackRecorder) SendCallback(method string, args ...interface{}) error {
	r.calls = append(r.calls, dressCallbackCall{method: method, args: args})
	return nil
}

func (r *dressCallbackRecorder) systemMessages() []string {
	out := make([]string, 0, len(r.calls))
	for _, call := range r.calls {
		if call.method != "onSystemSay" || len(call.args) == 0 {
			continue
		}
		msg, ok := call.args[0].(string)
		if !ok {
			continue
		}
		out = append(out, msg)
	}
	return out
}

func (r *dressCallbackRecorder) uppPayload() map[string]interface{} {
	for _, call := range r.calls {
		if call.method != "onUPP" || len(call.args) == 0 {
			continue
		}
		payload, ok := call.args[0].(map[string]interface{})
		if ok {
			return payload
		}
	}
	return nil
}

func TestSendSpendNotices_SendsCurrencyAndPointMessages(t *testing.T) {
	recorder := &dressCallbackRecorder{}
	spend := appdress.SpendSummary{
		Gold:      30,
		GoldBind:  4,
		Money:     5,
		MoneyBind: 6,
		Points: []appdress.PointSpend{
			{Label: "điểm thời trang", Amount: 7},
		},
	}

	sendSpendNotices(recorder, spend)

	want := []string{
		"Tiêu hao 30 vàng.",
		"Tiêu hao 4 vàng khóa.",
		"Tiêu hao 5 bạc.",
		"Tiêu hao 6 bạc khóa.",
		"Tiêu hao 7 điểm thời trang.",
	}
	got := recorder.systemMessages()
	if len(got) != len(want) {
		t.Fatalf("call count = %d, want %d (%#v)", len(got), len(want), got)
	}
	for idx, expected := range want {
		if got[idx] != expected {
			t.Fatalf("call[%d] = %q, want %q", idx, got[idx], expected)
		}
	}
}

func TestSendSpendNotices_SendsCurrencyTotalsViaOnUPP(t *testing.T) {
	recorder := &dressCallbackRecorder{}
	spend := appdress.SpendSummary{
		CurrencyTotals: map[string]int64{
			"gold":  70,
			"money": 12,
		},
	}

	sendSpendNotices(recorder, spend)

	got := recorder.uppPayload()
	if got == nil {
		t.Fatalf("onUPP payload missing")
	}
	if got["gold"] != int64(70) {
		t.Fatalf("gold = %#v, want 70", got["gold"])
	}
	if got["money"] != int64(12) {
		t.Fatalf("money = %#v, want 12", got["money"])
	}
}

func TestPlanDropsToArr_UsesNumKey(t *testing.T) {
	got := planDropsToArr([]appdress.RecipeDrop{{RecipeID: 2001, Num: 2}})
	entry := got[0].(map[string]interface{})
	if entry["num"] != 2 {
		t.Fatalf("num = %#v, want 2", entry["num"])
	}
	if _, ok := entry["recipeNum"]; ok {
		t.Fatalf("unexpected recipeNum key in %#v", entry)
	}
}

func TestProduceDropsToArr_UsesRecipeNumKey(t *testing.T) {
	got := produceDropsToArr([]appdress.RecipeDrop{{RecipeID: 3001, Num: 4}})
	entry := got[0].(map[string]interface{})
	if entry["recipeNum"] != 4 {
		t.Fatalf("recipeNum = %#v, want 4", entry["recipeNum"])
	}
	if _, ok := entry["num"]; ok {
		t.Fatalf("unexpected num key in %#v", entry)
	}
}

func TestToIDArray_OrdersECMAArrayValues(t *testing.T) {
	got := toIDArray(amf0.ECMAArray{
		"2": float64(1019),
		"0": float64(1008),
		"1": float64(1058),
	})

	want := []int64{1008, 1058, 1019}
	if len(got) != len(want) {
		t.Fatalf("len = %d, want %d (%#v)", len(got), len(want), got)
	}
	for idx, expected := range want {
		if got[idx] != expected {
			t.Fatalf("got[%d] = %d, want %d", idx, got[idx], expected)
		}
	}
}
