// Open-sourced by BaoLT

package adminhttp

import (
	"testing"
)

func TestNormalizeDressCounterMap(t *testing.T) {
	got, err := normalizeDressCounterMap("book", map[string]int{"1001": 1, "1002": 0})
	if err != nil {
		t.Fatalf("normalizeDressCounterMap() error = %v", err)
	}
	if len(got) != 1 || got["1001"] != 1 {
		t.Fatalf("normalizeDressCounterMap() = %#v, want only 1001 => 1", got)
	}
}

func TestNormalizeDressCounterMap_RejectsNonNumericKeys(t *testing.T) {
	if _, err := normalizeDressCounterMap("book", map[string]int{"abc": 1}); err == nil {
		t.Fatal("normalizeDressCounterMap() error = nil, want validation error")
	}
}

func TestDecodeDressInfoForAdmin_DefaultsInvalidJSON(t *testing.T) {
	info := decodeDressInfoForAdmin("{invalid")
	if info == nil {
		t.Fatal("decodeDressInfoForAdmin() returned nil")
	}
	clientEncoded, err := info.EncodeClient()
	if err != nil {
		t.Fatalf("EncodeClient() error = %v", err)
	}
	want := `{"book":{},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`
	if clientEncoded != want {
		t.Fatalf("EncodeClient() = %v, want %v", clientEncoded, want)
	}
}
