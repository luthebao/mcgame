// Open-sourced by BaoLT

// SQLi regression pack for MysteryExchangeItem and MysteryExchangeScore.
//
// Three layers of defence are verified:
//
//  1. md5pass charset/length rejection: inputs that contain any byte outside [0-9a-fA-F],
//     exceed 64 bytes, or are empty are rejected by validateMD5Pass before any account lookup.
//     This includes SQL-injection strings (which contain spaces, quotes, semicolons) as well as
//     control bytes (\x00..\x1f, DEL 0x7f, high bytes). The handler returns ErrInvalidInput.
//
//  2. Map-key numeric rejection: strings like "' OR 1=1 --" supplied as itemDict / scoreDict
//     keys are rejected by parseItemDict / parseScoreDict as non-numeric. ErrInvalidInput.
//
//  3. Password-gate rejection: a valid-format (32-char hex) md5pass that does not match the
//     stored SecondaryPassword is rejected by account.CheckSecondaryPassword. The handler
//     returns ErrInvalidInput. This test wires a real stub accountRepo so the gate is exercised.
package mysteryexchange

import (
	"context"
	"net"
	"strings"
	"testing"
	"time"

	domainauth "mcgame-server/internal/domain/auth"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
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
		accountRepo: nil,
		mysService:  nil,
		chars:       nil,
		inventory:   nil,
		logger:      logger,
	}
	conn := infrartmp.NewConnection(1, &sqliStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1001",
		AccountID:   "00000000-0000-0000-0000-000000000001",
		ConnID:      1,
		Connection:  conn,
	}
	return h, ctx
}

type stubAccountRepo struct {
	account *domainauth.Account
}

func (r *stubAccountRepo) FindByID(_ context.Context, _ uuid.UUID) (*domainauth.Account, error) {
	return r.account, nil
}
func (r *stubAccountRepo) FindByUsername(_ context.Context, _ string) (*domainauth.Account, error) {
	return nil, pkgerrors.ErrInvalidInput
}
func (r *stubAccountRepo) Create(_ context.Context, _ *domainauth.Account) error {
	return nil
}
func (r *stubAccountRepo) Update(_ context.Context, _ *domainauth.Account) error {
	return nil
}
func (r *stubAccountRepo) ExistsByUsername(_ context.Context, _ string) (bool, error) {
	return false, nil
}
func (r *stubAccountRepo) UpdateLastLogin(_ context.Context, _ uuid.UUID) error {
	return nil
}

var handlerRejectedMD5Sentinels = []struct {
	label string
	value string
}{
	{"overlong_5000", strings.Repeat("a", 5000)},
	{"overlong_65", strings.Repeat("a", 65)},
	{"null_byte", "4297f44b13955235\x00injected"},
	{"control_byte_0x01", "4297f44b\x01end"},
	{"control_byte_0x1F", "4297f44b\x1fend"},
	{"tab_in_pass", "4297f44b\tend"},
	{"newline_in_pass", "4297f44b\nend"},
	{"empty_pass", ""},
	{"sqli_or_1_eq_1", "' OR 1=1 --"},
	{"sqli_drop_table", "'; DROP TABLE x;--"},
	{"sqli_union_select", "' UNION SELECT password_hash FROM accounts --"},
	{"percent_comment", "%' --"},
}

var sqliMapKeys = []struct {
	label string
	key   string
}{
	{"sqli_or_key", "' OR 1=1 --"},
	{"sqli_drop_key", "'; DROP TABLE x;--"},
	{"sqli_union_key", "' UNION SELECT 1--"},
	{"non_numeric_alpha", "abc"},
	{"float_key", "1.5"},
	{"negative_key", "-1"},
	{"empty_key", ""},
}

func TestExchangeItem_HandlerRejectedMD5Sentinels(t *testing.T) {
	for _, tc := range handlerRejectedMD5Sentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			h, ctx := newSQLiTestHandler(t)
			args := []interface{}{
				map[string]interface{}{"335941832": true},
				tc.value,
			}
			_, err := h.ExchangeItem(ctx, args)
			if err == nil {
				t.Fatalf("expected error for %q, got nil", tc.label)
			}
			if err != pkgerrors.ErrInvalidInput && err != pkgerrors.ErrUnauthorized {
				t.Fatalf("expected ErrInvalidInput/ErrUnauthorized for %q, got: %v", tc.label, err)
			}
		})
	}
}

func TestExchangeScore_HandlerRejectedMD5Sentinels(t *testing.T) {
	for _, tc := range handlerRejectedMD5Sentinels {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			h, ctx := newSQLiTestHandler(t)
			args := []interface{}{
				map[string]interface{}{"2": float64(1)},
				tc.value,
			}
			_, err := h.ExchangeScore(ctx, args)
			if err == nil {
				t.Fatalf("expected error for %q, got nil", tc.label)
			}
			if err != pkgerrors.ErrInvalidInput && err != pkgerrors.ErrUnauthorized {
				t.Fatalf("expected ErrInvalidInput/ErrUnauthorized for %q, got: %v", tc.label, err)
			}
		})
	}
}

func TestExchangeItem_PasswordGateRejectsWrongHexPass(t *testing.T) {
	logger := zaptest.NewLogger(t)
	storedHash := "aabbccddeeff00112233445566778899"
	wrongPass := "00000000000000000000000000000000"
	account := &domainauth.Account{
		ID:                uuid.MustParse("00000000-0000-0000-0000-000000000001"),
		SecondaryPassword: storedHash,
	}
	h := &Handler{
		accountRepo: &stubAccountRepo{account: account},
		mysService:  nil,
		chars:       nil,
		inventory:   nil,
		logger:      logger,
	}
	conn := infrartmp.NewConnection(1, &sqliStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1001",
		AccountID:   "00000000-0000-0000-0000-000000000001",
		ConnID:      1,
		Connection:  conn,
	}
	args := []interface{}{
		map[string]interface{}{"335941832": true},
		wrongPass,
	}
	_, err := h.ExchangeItem(ctx, args)
	if err == nil {
		t.Fatal("expected ErrInvalidInput from password gate, got nil")
	}
	if err != pkgerrors.ErrInvalidInput {
		t.Fatalf("expected ErrInvalidInput from password gate, got: %v", err)
	}
}

func TestExchangeScore_PasswordGateRejectsWrongHexPass(t *testing.T) {
	logger := zaptest.NewLogger(t)
	storedHash := "aabbccddeeff00112233445566778899"
	wrongPass := "00000000000000000000000000000000"
	account := &domainauth.Account{
		ID:                uuid.MustParse("00000000-0000-0000-0000-000000000001"),
		SecondaryPassword: storedHash,
	}
	h := &Handler{
		accountRepo: &stubAccountRepo{account: account},
		mysService:  nil,
		chars:       nil,
		inventory:   nil,
		logger:      logger,
	}
	conn := infrartmp.NewConnection(1, &sqliStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: "1001",
		AccountID:   "00000000-0000-0000-0000-000000000001",
		ConnID:      1,
		Connection:  conn,
	}
	args := []interface{}{
		map[string]interface{}{"2": float64(1)},
		wrongPass,
	}
	_, err := h.ExchangeScore(ctx, args)
	if err == nil {
		t.Fatal("expected ErrInvalidInput from password gate, got nil")
	}
	if err != pkgerrors.ErrInvalidInput {
		t.Fatalf("expected ErrInvalidInput from password gate, got: %v", err)
	}
}

func TestExchangeItem_SQLiMapKeys_Rejected(t *testing.T) {
	for _, tc := range sqliMapKeys {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			_, err := parseItemDict(map[string]interface{}{tc.key: true})
			if err == nil {
				t.Fatalf("parseItemDict should reject key %q, got nil", tc.key)
			}
		})
	}
}

func TestExchangeScore_SQLiMapKeys_Rejected(t *testing.T) {
	for _, tc := range sqliMapKeys {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			_, err := parseScoreDict(map[string]interface{}{tc.key: float64(1)})
			if err == nil {
				t.Fatalf("parseScoreDict should reject key %q, got nil", tc.key)
			}
		})
	}
}

func TestValidateMD5Pass_ControlBytes(t *testing.T) {
	for b := byte(0x00); b < 0x20; b++ {
		s := "4141414141414141" + string([]byte{b}) + "4141414141414141"
		if err := validateMD5Pass(s); err == nil {
			t.Errorf("validateMD5Pass should reject control byte 0x%02x", b)
		}
	}
}

func TestValidateMD5Pass_NonHexBytes(t *testing.T) {
	nonHexCases := []struct {
		label string
		value string
	}{
		{"space", "4297f44b 3955235a"},
		{"uppercase_G", "4297f44bG3955235"},
		{"del_0x7f", "4297f44b\x7f955235"},
		{"high_byte", "4297f44b\x80955235"},
		{"dash", "4297f44b-3955235a"},
		{"quote", "4297f44b'3955235a"},
	}
	for _, tc := range nonHexCases {
		tc := tc
		t.Run(tc.label, func(t *testing.T) {
			if err := validateMD5Pass(tc.value); err == nil {
				t.Errorf("validateMD5Pass should reject non-hex input %q", tc.value)
			}
		})
	}
}

func TestValidateMD5Pass_LengthCap(t *testing.T) {
	if err := validateMD5Pass(strings.Repeat("a", 32)); err != nil {
		t.Errorf("32-char hex pass should be accepted: %v", err)
	}
	if err := validateMD5Pass(strings.Repeat("a", 64)); err != nil {
		t.Errorf("64-char pass should be accepted: %v", err)
	}
	if err := validateMD5Pass(strings.Repeat("a", 65)); err == nil {
		t.Error("65-char pass should be rejected")
	}
	if err := validateMD5Pass(""); err == nil {
		t.Error("empty pass should be rejected")
	}
}

func TestParseItemDict_ValidInput(t *testing.T) {
	ids, err := parseItemDict(map[string]interface{}{
		"335941832": true,
		"100000001": true,
	})
	if err != nil {
		t.Fatalf("valid dict should parse without error: %v", err)
	}
	if len(ids) != 2 {
		t.Fatalf("expected 2 ids, got %d", len(ids))
	}
}

func TestParseScoreDict_ValidInput(t *testing.T) {
	entries, err := parseScoreDict(map[string]interface{}{
		"2":  float64(1),
		"17": float64(0),
	})
	if err != nil {
		t.Fatalf("valid score dict should parse without error: %v", err)
	}
	if len(entries) != 2 {
		t.Fatalf("expected 2 entries, got %d", len(entries))
	}
}

func TestParseScoreDict_UnknownScoreType(t *testing.T) {
	_, err := parseScoreDict(map[string]interface{}{
		"99": float64(1),
	})
	if err == nil {
		t.Error("unknown score type 99 should be rejected")
	}
}

func TestParseScoreDict_NegativeCount(t *testing.T) {
	_, err := parseScoreDict(map[string]interface{}{
		"2": float64(-1),
	})
	if err == nil {
		t.Error("negative count should be rejected")
	}
}
