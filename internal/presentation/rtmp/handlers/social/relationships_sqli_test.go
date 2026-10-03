// Open-sourced by BaoLT

// SQLi regression pack for string-input RPCs: addRelationByName, findTeacher, findStudent.
//
// Validates two layers of defence:
//   - Handler boundary: oversized (>30 chars) and control-byte inputs (including \x00) are
//     rejected with ErrInvalidInput before any service or repository call is made.
//   - Parameterized-query safety: SQL-injection payloads that are within the length/control-byte
//     limits are allowed through the handler unchanged; they reach the repository only via
//     parameterized $1 placeholders (player.get_character_id_by_name), so the DB never
//     interprets them as SQL.  validateName confirms these are not false-positively blocked.
package social

import (
	"context"
	"net"
	"strings"
	"testing"
	"time"

	infrartmp "mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap/zaptest"
)

type sqliStubNetConn struct{}

func (s *sqliStubNetConn) Read(b []byte) (int, error)  { return 0, nil }
func (s *sqliStubNetConn) Write(b []byte) (int, error) { return len(b), nil }
func (s *sqliStubNetConn) Close() error                { return nil }
func (s *sqliStubNetConn) LocalAddr() net.Addr         { return nil }
func (s *sqliStubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *sqliStubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *sqliStubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *sqliStubNetConn) SetWriteDeadline(t time.Time) error { return nil }

func newSQLiTestHandler(t *testing.T) (*Handler, *infrartmp.RPCContext) {
	t.Helper()
	logger := zaptest.NewLogger(t)
	h := &Handler{
		socialService: nil,
		logger:        logger,
	}
	conn := infrartmp.NewConnection(1, &sqliStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1001",
		ConnID:      1,
		Connection:  conn,
	}
	return h, ctx
}

// handlerRejectedSentinels are inputs that violate the length or control-byte policy.
// The handler must return ErrInvalidInput before reaching the service.
var handlerRejectedSentinels = []struct {
	label string
	value string
}{
	{"overlong_5000", strings.Repeat("a", 5000)},
	{"sqli_union_password_hash_overlong", "' UNION SELECT password_hash FROM accounts --"},
	{"null_byte", "name\x00injected"},
	{"control_byte_0x01", "name\x01end"},
	{"control_byte_0x1F", "name\x1fend"},
	{"tab_in_name", "name\tend"},
	{"newline_in_name", "name\nend"},
}

// passThroughSentinels are SQL-injection strings that are within the 30-char cap and
// contain no control bytes.  validateName must NOT block them (they are safe because the
// repository uses parameterized queries).
var passThroughSentinels = []struct {
	label string
	value string
}{
	{"sqli_or_1_eq_1", "' OR 1=1 --"},
	{"sqli_drop_table", "'; DROP TABLE x;--"},
	{"sqli_union_select", "' UNION SELECT 1--"},
	{"percent_comment", "%' --"},
}

func TestValidateName_RejectsHandlerBoundarySentinels(t *testing.T) {
	for _, tc := range handlerRejectedSentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			err := validateName(tc.value)
			if err == nil {
				t.Fatalf("validateName: expected error for %q, got nil", tc.label)
			}
		})
	}
}

func TestValidateName_AllowsPassThroughSentinels(t *testing.T) {
	for _, tc := range passThroughSentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			err := validateName(tc.value)
			if err != nil {
				t.Fatalf("validateName: should not block %q (safe via parameterized query), got %v", tc.label, err)
			}
		})
	}
}

func TestAddRelationByName_RejectsHandlerBoundarySentinels(t *testing.T) {
	for _, tc := range handlerRejectedSentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			h, ctx := newSQLiTestHandler(t)
			_, err := h.AddRelationByName(ctx, []interface{}{tc.value, float64(1)})
			if err == nil {
				t.Fatalf("expected error for %q, got nil", tc.label)
			}
			if err != pkgerrors.ErrInvalidInput {
				t.Fatalf("expected ErrInvalidInput for %q, got: %v", tc.label, err)
			}
		})
	}
}

func TestFindTeacher_RejectsHandlerBoundarySentinels(t *testing.T) {
	for _, tc := range handlerRejectedSentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			h, ctx := newSQLiTestHandler(t)
			_, err := h.FindTeacher(ctx, []interface{}{tc.value})
			if err == nil {
				t.Fatalf("expected error for %q, got nil", tc.label)
			}
			if err != pkgerrors.ErrInvalidInput {
				t.Fatalf("expected ErrInvalidInput for %q, got: %v", tc.label, err)
			}
		})
	}
}

func TestFindStudent_RejectsHandlerBoundarySentinels(t *testing.T) {
	for _, tc := range handlerRejectedSentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			h, ctx := newSQLiTestHandler(t)
			_, err := h.FindStudent(ctx, []interface{}{tc.value})
			if err == nil {
				t.Fatalf("expected error for %q, got nil", tc.label)
			}
			if err != pkgerrors.ErrInvalidInput {
				t.Fatalf("expected ErrInvalidInput for %q, got: %v", tc.label, err)
			}
		})
	}
}
