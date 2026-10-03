// Open-sourced by BaoLT

package trade

import (
	"testing"

	amf0 "github.com/yutopp/go-amf0"
)

func TestToInterfaceSliceAcceptsAMFObjectArray(t *testing.T) {
	values, ok := toInterfaceSlice(map[string]interface{}{
		"0": float64(-1),
		"1": float64(-1),
		"2": float64(5),
		"3": float64(-1),
		"4": float64(-1),
	})
	if !ok {
		t.Fatal("expected map-backed array payload to be accepted")
	}
	if len(values) != 5 {
		t.Fatalf("expected 5 values, got %d", len(values))
	}
	if values[2] != float64(5) {
		t.Fatalf("expected ordered values, got %#v", values)
	}
}

func TestToInterfaceSliceAcceptsAMFECMAArray(t *testing.T) {
	values, ok := toInterfaceSlice(amf0.ECMAArray{
		"0": float64(-1),
		"1": float64(-1),
		"2": float64(5),
		"3": float64(-1),
		"4": float64(-1),
	})
	if !ok {
		t.Fatal("expected ECMA array payload to be accepted")
	}
	if len(values) != 5 {
		t.Fatalf("expected 5 values, got %d", len(values))
	}
	if values[2] != float64(5) {
		t.Fatalf("expected ordered values, got %#v", values)
	}
}

func TestToInterfaceSliceIgnoresLengthKey(t *testing.T) {
	values, ok := toInterfaceSlice(amf0.ECMAArray{
		"0":      float64(-1),
		"1":      float64(-1),
		"2":      float64(5),
		"3":      float64(-1),
		"4":      float64(-1),
		"length": float64(5),
	})
	if !ok {
		t.Fatal("expected ECMA array payload with length key to be accepted")
	}
	if len(values) != 5 {
		t.Fatalf("expected 5 values, got %d", len(values))
	}
	if values[2] != float64(5) {
		t.Fatalf("expected ordered values, got %#v", values)
	}
}
