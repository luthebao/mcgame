// Open-sourced by BaoLT

package dress

import "testing"

func TestEncodeClient_StripsInternalDay(t *testing.T) {
	info := &Info{
		Book:           map[string]int{"12": 1},
		Recipe:         map[string]int{"21": 2},
		Bag:            Bag{Crystal: 3, Jewel: 4},
		Extract:        1,
		Score:          5,
		FakeDressID:    12,
		FakeFlyDressID: 13,
		Day:            "2026-04-21",
	}

	got, err := info.EncodeClient()
	if err != nil {
		t.Fatalf("EncodeClient() error = %v", err)
	}

	want := `{"book":{"12":1},"recipe":{"21":2},"bag":{"crystal":3,"jewel":4},"extract":1,"score":5,"fakeDressId":12,"fakeFlyDressId":13}`
	if got != want {
		t.Fatalf("EncodeClient() = %v, want %v", got, want)
	}
}
