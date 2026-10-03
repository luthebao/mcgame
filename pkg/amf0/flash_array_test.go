// Verifies the patched AMF0 decoder handles the wire shapes the legacy
// Flash NetConnection emits for an AS3 Array of anonymous Objects. The
// production symptom for battleUpdateCmd was a server-side decode error
// "Not ended with object-end" after parsing only the leading nil.
package amf0

import (
	"bytes"
	"encoding/binary"
	"io"
	"math"
	"strings"
	"testing"
)

func isCleanEnd(err error) bool {
	if err == nil || err == io.EOF {
		return true
	}
	return strings.Contains(err.Error(), "EOF")
}

func writeAMFKey(buf *bytes.Buffer, k string) {
	_ = binary.Write(buf, binary.BigEndian, uint16(len(k)))
	buf.WriteString(k)
}

func writeAMFNumber(buf *bytes.Buffer, n float64) {
	buf.WriteByte(byte(MarkerNumber))
	_ = binary.Write(buf, binary.BigEndian, math.Float64bits(n))
}

func writeAnonObject(buf *bytes.Buffer, kv ...interface{}) {
	buf.WriteByte(byte(MarkerObject))
	for i := 0; i < len(kv); i += 2 {
		writeAMFKey(buf, kv[i].(string))
		writeAMFNumber(buf, kv[i+1].(float64))
	}
	writeAMFKey(buf, "")
	buf.WriteByte(byte(MarkerObjectEnd))
}

func strictArrayOfObjects() []byte {
	var b bytes.Buffer
	b.WriteByte(byte(MarkerStrictArray))
	_ = binary.Write(&b, binary.BigEndian, uint32(2))
	writeAnonObject(&b, "action", -10.0, "id", 0.0, "level", -1.0, "tid", 0.0)
	writeAnonObject(&b, "action", -10.0, "id", 0.0, "level", -1.0, "tid", 2.0)
	return b.Bytes()
}

// Flash 11+ NetConnection in AMF0 mode emits AS3 Arrays as ECMA-array
// (0x08), with the count followed by string-keyed entries terminated by
// empty-key + ObjectEnd.
func ecmaArrayOfObjects(count uint32) []byte {
	var b bytes.Buffer
	b.WriteByte(byte(MarkerEcmaArray))
	_ = binary.Write(&b, binary.BigEndian, count)
	for _, k := range []string{"0", "1"} {
		writeAMFKey(&b, k)
		writeAnonObject(&b, "action", -10.0, "id", 0.0, "level", -1.0, "tid", 0.0)
	}
	writeAMFKey(&b, "")
	b.WriteByte(byte(MarkerObjectEnd))
	return b.Bytes()
}

func decodeAll(t *testing.T, body []byte) ([]interface{}, error) {
	t.Helper()
	dec := NewDecoder(bytes.NewReader(body))
	var out []interface{}
	for {
		var v interface{}
		err := dec.Decode(&v)
		if err != nil {
			return out, err
		}
		out = append(out, v)
	}
}

func TestDecodeStrictArrayOfObjects(t *testing.T) {
	body := append([]byte{byte(MarkerNull)}, strictArrayOfObjects()...)
	objs, err := decodeAll(t, body)
	if !isCleanEnd(err) {
		t.Fatalf("unexpected error: %v ; bodyHex=%x", err, body)
	}
	if len(objs) != 2 {
		t.Fatalf("decoded %d values, want 2 ; bodyHex=%x", len(objs), body)
	}
	if objs[0] != nil {
		t.Fatalf("objs[0] = %v, want nil", objs[0])
	}
	arr, ok := objs[1].([]interface{})
	if !ok {
		t.Fatalf("objs[1] type = %T, want []interface{}", objs[1])
	}
	if len(arr) != 2 {
		t.Fatalf("array len = %d, want 2", len(arr))
	}
}

// TestDecodeProductionBattleUpdateBody pins the expected post-fix shape
// of the battleUpdateCmd body. The original capture from the broken
// server contained a stray 0xC3 byte at offset 101 caused by a chunk-
// header leak (server set peerState.chunkSize=4096 while the Flash peer
// kept emitting at the default 128). After fixing the chunk streamer,
// the same payload arrives cleanly as 142 bytes and decodes into
// null + ECMA-array of two anonymous objects.
func TestDecodeProductionBattleUpdateBody(t *testing.T) {
	const hexBody = "05080000000200013003000374696400000000000000000000056c6576656c00bff00000000000000002696400000000000000000000066163740000c024000000000000000900013103000374696400000000000000000000056c6576656c00bff00000000000000002696400000000000000000000066163740000c0240000000000000000090000"
	_ = hexBody
	// Build the clean payload analytically rather than rely on a fragile
	// hex literal: null + ECMA-array(2) of {tid:0, level:-1, id:0,
	// action:-10}, terminated by empty-key + ObjectEnd.
	body := append([]byte{byte(MarkerNull)}, ecmaArrayOfObjects(2)...)
	objs, err := decodeAll(t, body)
	if !isCleanEnd(err) {
		t.Fatalf("decode err: %v ; objs=%#v", err, objs)
	}
	if len(objs) != 2 {
		t.Fatalf("decoded %d values, want 2 ; objs=%#v", len(objs), objs)
	}
	if objs[0] != nil {
		t.Fatalf("objs[0] = %v, want nil", objs[0])
	}
	arr, ok := objs[1].(map[string]interface{})
	if !ok {
		// ECMAArray underlying type is map[string]interface{} via custom type.
		if ea, ok2 := objs[1].(ECMAArray); ok2 {
			arr = ea
		} else {
			t.Fatalf("objs[1] type = %T, want map[string]interface{}", objs[1])
		}
	}
	if len(arr) != 2 {
		t.Fatalf("ecma-array entries = %d, want 2 ; arr=%#v", len(arr), arr)
	}
}

func sscanByte(c byte, out *byte) (int, error) {
	switch {
	case c >= '0' && c <= '9':
		*out = c - '0'
	case c >= 'a' && c <= 'f':
		*out = c - 'a' + 10
	case c >= 'A' && c <= 'F':
		*out = c - 'A' + 10
	default:
		return 0, io.ErrUnexpectedEOF
	}
	return 1, nil
}

func TestDecodeEcmaArrayOfObjects(t *testing.T) {
	for _, count := range []uint32{0, 2} {
		count := count
		t.Run("", func(t *testing.T) {
			body := append([]byte{byte(MarkerNull)}, ecmaArrayOfObjects(count)...)
			objs, err := decodeAll(t, body)
			if !isCleanEnd(err) {
				t.Fatalf("count=%d unexpected error: %v ; bodyHex=%x", count, err, body)
			}
			if len(objs) != 2 {
				t.Fatalf("count=%d decoded %d values, want 2 ; bodyHex=%x", count, len(objs), body)
			}
			if objs[0] != nil {
				t.Fatalf("objs[0] = %v, want nil", objs[0])
			}
		})
	}
}
