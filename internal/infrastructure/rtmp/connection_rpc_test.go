// Open-sourced by BaoLT

package rtmp

import "testing"

func TestRPCFailureMessage(t *testing.T) {
	tests := []struct {
		name   string
		result interface{}
		want   string
	}{
		{
			name:   "nil",
			result: nil,
			want:   "",
		},
		{
			name:   "success pointer response",
			result: &RPCResponse{Success: true},
			want:   "",
		},
		{
			name:   "failure pointer response",
			result: &RPCResponse{Success: false, Error: &RPCError{Message: "Invalid input"}},
			want:   "Invalid input",
		},
		{
			name:   "failure value response",
			result: RPCResponse{Success: false, Error: &RPCError{Message: "Unauthorized"}},
			want:   "Unauthorized",
		},
		{
			name:   "non rpc response",
			result: map[string]interface{}{"ok": false},
			want:   "",
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			if got := rpcFailureMessage(tc.result); got != tc.want {
				t.Fatalf("rpcFailureMessage() = %q, want %q", got, tc.want)
			}
		})
	}
}

func TestFormatConnectionErrorMessage(t *testing.T) {
	if got := formatConnectionErrorMessage("Invalid input"); got != "[Connection] Invalid input" {
		t.Fatalf("formatConnectionErrorMessage() = %q, want %q", got, "[Connection] Invalid input")
	}
	if got := formatConnectionErrorMessage("[Connection] Invalid input"); got != "[Connection] Invalid input" {
		t.Fatalf("formatConnectionErrorMessage() = %q, want existing prefix preserved", got)
	}
}

func TestNotifyConnectionError(t *testing.T) {
	session := &SessionContext{CharacterID: "1001"}
	calls := 0
	var method string
	var args []interface{}

	notifyConnectionError(func(m string, a ...interface{}) error {
		calls++
		method = m
		args = a
		return nil
	}, session, "Invalid input")

	if calls != 1 {
		t.Fatalf("notifyConnectionError() calls = %d, want 1", calls)
	}
	if method != "a" {
		t.Fatalf("notifyConnectionError() method = %q, want %q", method, "a")
	}
	if len(args) != 1 || args[0] != "[Connection] Invalid input" {
		t.Fatalf("notifyConnectionError() args = %#v, want tagged message", args)
	}
}

func TestNotifyConnectionError_IgnoresRateLimited(t *testing.T) {
	calls := 0

	notifyConnectionError(func(m string, a ...interface{}) error {
		calls++
		return nil
	}, &SessionContext{CharacterID: "1001"}, "rate limited")

	if calls != 0 {
		t.Fatalf("notifyConnectionError() calls = %d, want 0", calls)
	}
}

func TestNotifyConnectionError_IgnoresNonCharacterSession(t *testing.T) {
	calls := 0

	notifyConnectionError(func(m string, a ...interface{}) error {
		calls++
		return nil
	}, &SessionContext{}, "Invalid input")

	if calls != 0 {
		t.Fatalf("notifyConnectionError() calls = %d, want 0", calls)
	}
}
