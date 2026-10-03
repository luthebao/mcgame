// Reproduces the production bug where battleUpdateCmd's body had a stray
// 0xC3 byte at offset 101 — exactly the chunk boundary for a 170-byte
// command split at chunk size 128. Drives readChunk directly with a
// hand-crafted two-chunk wire stream.
package rtmp

import (
	"bufio"
	"bytes"
	"encoding/binary"
	"io"
	"testing"
)

func TestReadChunkContinuationStripsHeader(t *testing.T) {
	// Build a fake 170-byte command message payload with a unique byte pattern
	// so we can detect any stray chunk-header bytes (e.g. 0xC3) that leak in.
	const totalLen = 170
	payload := make([]byte, totalLen)
	for i := range payload {
		payload[i] = byte(i + 1) // 0x01..0xAA, no 0x00, lets us spot insertions
	}

	wire := buildTwoChunkWire(payload, 128)

	r := bufio.NewReaderSize(bytes.NewReader(wire), 4096)
	w := bufio.NewWriterSize(io.Discard, 4096)
	streamer := NewChunkStreamer(r, w, nil)

	reader, err := streamer.NewChunkReader()
	if err != nil {
		t.Fatalf("NewChunkReader: %v", err)
	}
	got := reader.buf.Bytes()
	if len(got) != totalLen {
		t.Fatalf("body length = %d, want %d ; got hex=%x", len(got), totalLen, got)
	}
	for i, b := range got {
		if b != payload[i] {
			t.Fatalf("byte mismatch at offset %d: got 0x%02x, want 0x%02x", i, b, payload[i])
		}
	}
}

// TestReadChunkPeerChunkSizeIndependentOfSelf pins the production fix:
// the server's SelfState chunk size (used for OUTGOING chunks) must NOT
// be propagated to PeerState. The peer keeps the RTMP default (128)
// until it explicitly sends its own SetChunkSize. If PeerState is also
// raised to 4096, readChunk would swallow the next chunk's basic header
// byte (0xC3) into the payload at the 128-byte boundary — the
// "battleUpdateCmd" decode failure root cause.
func TestReadChunkPeerChunkSizeIndependentOfSelf(t *testing.T) {
	const totalLen = 170
	payload := make([]byte, totalLen)
	for i := range payload {
		payload[i] = byte(i + 1)
	}

	wire := buildTwoChunkWire(payload, 128)

	r := bufio.NewReaderSize(bytes.NewReader(wire), 4096)
	w := bufio.NewWriterSize(io.Discard, 4096)
	streamer := NewChunkStreamer(r, w, nil)
	// Mirror the post-fix server: only SelfState advertises 4096; the
	// peer is still emitting at the default 128.
	if err := streamer.SelfState().SetChunkSize(4096); err != nil {
		t.Fatalf("SelfState.SetChunkSize: %v", err)
	}

	reader, err := streamer.NewChunkReader()
	if err != nil {
		t.Fatalf("NewChunkReader: %v", err)
	}
	got := reader.buf.Bytes()
	if len(got) != totalLen {
		t.Fatalf("body length = %d, want %d ; hex=%x", len(got), totalLen, got)
	}
	for i, b := range got {
		if b != payload[i] {
			t.Fatalf("byte mismatch at offset %d: got 0x%02x, want 0x%02x", i, b, payload[i])
		}
	}
}

func buildTwoChunkWire(payload []byte, chunkSize int) []byte {
	var wire bytes.Buffer
	wire.WriteByte(0x03)
	hdr := make([]byte, 11)
	totalLen := len(payload)
	hdr[3], hdr[4], hdr[5] = byte(totalLen>>16), byte(totalLen>>8), byte(totalLen)
	hdr[6] = 0x14
	binary.LittleEndian.PutUint32(hdr[7:11], 0)
	wire.Write(hdr)
	wire.Write(payload[:chunkSize])
	wire.WriteByte(0xC3)
	wire.Write(payload[chunkSize:])
	return wire.Bytes()
}
