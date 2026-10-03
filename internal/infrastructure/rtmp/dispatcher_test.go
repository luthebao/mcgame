// Open-sourced by BaoLT

// Unit tests for RPC dispatcher functionality.
// Tests handler registration, dispatch, rate limiting, and error handling.
// Includes concurrent access tests for thread safety verification.
package rtmp

import (
	"net"
	"testing"
	"time"

	"go.uber.org/zap"
	"go.uber.org/zap/zaptest"

	pkgerrors "mcgame-server/pkg/errors"
)

type mockConn struct {
	net.Conn
}

func (m *mockConn) Close() error                       { return nil }
func (m *mockConn) LocalAddr() net.Addr                { return nil }
func (m *mockConn) RemoteAddr() net.Addr               { return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 12345} }
func (m *mockConn) SetDeadline(t time.Time) error      { return nil }
func (m *mockConn) SetReadDeadline(t time.Time) error  { return nil }
func (m *mockConn) SetWriteDeadline(t time.Time) error { return nil }
func (m *mockConn) Read(b []byte) (n int, err error)   { return 0, nil }
func (m *mockConn) Write(b []byte) (n int, err error)  { return len(b), nil }

func newTestDispatcher(t *testing.T) *RPCDispatcher {
	logger := zaptest.NewLogger(t)
	return NewRPCDispatcher(logger)
}

func newTestConnection(t *testing.T, dispatcher *RPCDispatcher) *Connection {
	logger := zaptest.NewLogger(t)
	conn := NewConnection(1, &mockConn{}, dispatcher, logger)
	return conn
}

func TestNewRPCDispatcher(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)

	if dispatcher == nil {
		t.Fatal("NewRPCDispatcher returned nil")
	}

	if dispatcher.handlers == nil {
		t.Error("handlers map not initialized")
	}

	if dispatcher.rateLimits == nil {
		t.Error("rateLimits map not initialized")
	}

	if _, exists := dispatcher.rateLimits["udcr"]; !exists {
		t.Error("default rate limit for 'udcr' not set")
	}

	if dispatcher.rateLimits["udcr"] != 600*time.Millisecond {
		t.Errorf("expected udcr rate limit to be 600ms, got %v", dispatcher.rateLimits["udcr"])
	}
}

func TestDispatcher_Register(t *testing.T) {
	dispatcher := newTestDispatcher(t)

	handler := func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		return "test_result", nil
	}

	dispatcher.Register("testMethod", handler)

	dispatcher.mutex.RLock()
	_, exists := dispatcher.handlers["testMethod"]
	dispatcher.mutex.RUnlock()

	if !exists {
		t.Error("handler not registered")
	}
}

func TestDispatcher_Dispatch_Success(t *testing.T) {
	dispatcher := newTestDispatcher(t)
	conn := newTestConnection(t, dispatcher)

	expectedResult := map[string]interface{}{"status": "ok"}
	handler := func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		if ctx.ConnID != conn.ID {
			t.Errorf("expected ConnID %d, got %d", conn.ID, ctx.ConnID)
		}
		if ctx.Method != "testMethod" {
			t.Errorf("expected Method 'testMethod', got '%s'", ctx.Method)
		}
		if ctx.Connection != conn {
			t.Error("Connection not properly set in context")
		}
		return expectedResult, nil
	}

	dispatcher.Register("testMethod", handler)

	result, err := dispatcher.Dispatch(conn, "testMethod", []interface{}{"arg1", "arg2"})

	if err != nil {
		t.Errorf("unexpected error: %v", err)
	}

	resultMap, ok := result.(map[string]interface{})
	if !ok {
		t.Fatal("result is not a map")
	}

	if resultMap["status"] != "ok" {
		t.Errorf("expected status 'ok', got '%v'", resultMap["status"])
	}
}

func TestDispatcher_Dispatch_MethodNotFound(t *testing.T) {
	dispatcher := newTestDispatcher(t)
	conn := newTestConnection(t, dispatcher)

	result, err := dispatcher.Dispatch(conn, "nonExistentMethod", nil)

	if err == nil {
		t.Error("expected error for non-existent method")
	}

	if !pkgerrors.Is(err, pkgerrors.ErrMethodNotFound) {
		t.Errorf("expected ErrMethodNotFound, got %v", err)
	}

	if result != nil {
		t.Error("expected nil result for error case")
	}
}


func TestDispatcher_Dispatch_HandlerError(t *testing.T) {
	dispatcher := newTestDispatcher(t)
	conn := newTestConnection(t, dispatcher)

	expectedError := pkgerrors.ErrInvalidInput
	handler := func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		return nil, expectedError
	}

	dispatcher.Register("errorMethod", handler)

	result, err := dispatcher.Dispatch(conn, "errorMethod", nil)

	if err == nil {
		t.Error("expected error from handler")
	}

	if !pkgerrors.Is(err, expectedError) {
		t.Errorf("expected ErrInvalidInput, got %v", err)
	}

	if result != nil {
		t.Error("expected nil result for error case")
	}
}

func TestDispatcher_RateLimit(t *testing.T) {
	dispatcher := newTestDispatcher(t)
	conn := newTestConnection(t, dispatcher)

	callCount := 0
	handler := func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		callCount++
		return "ok", nil
	}

	dispatcher.Register("rateLimitedMethod", handler)
	dispatcher.mutex.Lock()
	dispatcher.rateLimits["rateLimitedMethod"] = 100 * time.Millisecond
	dispatcher.mutex.Unlock()

	_, err := dispatcher.Dispatch(conn, "rateLimitedMethod", nil)
	if err != nil {
		t.Errorf("first call should succeed, got error: %v", err)
	}

	_, err = dispatcher.Dispatch(conn, "rateLimitedMethod", nil)
	if err == nil {
		t.Error("second call should be rate limited")
	}
	if !pkgerrors.Is(err, pkgerrors.ErrRateLimited) {
		t.Errorf("expected ErrRateLimited, got %v", err)
	}

	time.Sleep(150 * time.Millisecond)

	_, err = dispatcher.Dispatch(conn, "rateLimitedMethod", nil)
	if err != nil {
		t.Errorf("third call should succeed after rate limit expires, got error: %v", err)
	}

	if callCount != 2 {
		t.Errorf("expected handler to be called 2 times, got %d", callCount)
	}
}

func TestDispatcher_NoRateLimit(t *testing.T) {
	dispatcher := newTestDispatcher(t)
	conn := newTestConnection(t, dispatcher)

	callCount := 0
	handler := func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		callCount++
		return "ok", nil
	}

	dispatcher.Register("unlimitedMethod", handler)

	for i := 0; i < 5; i++ {
		_, err := dispatcher.Dispatch(conn, "unlimitedMethod", nil)
		if err != nil {
			t.Errorf("call %d should succeed, got error: %v", i, err)
		}
	}

	if callCount != 5 {
		t.Errorf("expected handler to be called 5 times, got %d", callCount)
	}
}

func TestDispatcher_ContextFields(t *testing.T) {
	dispatcher := newTestDispatcher(t)
	conn := newTestConnection(t, dispatcher)

	conn.SetSession("session123", "account456", "testuser")
	conn.SetCharacter("char789")

	handler := func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		if ctx.SessionID != "session123" {
			t.Errorf("expected SessionID 'session123', got '%s'", ctx.SessionID)
		}
		if ctx.AccountID != "account456" {
			t.Errorf("expected AccountID 'account456', got '%s'", ctx.AccountID)
		}
		if ctx.CharacterID != "char789" {
			t.Errorf("expected CharacterID 'char789', got '%s'", ctx.CharacterID)
		}
		if ctx.Context == nil {
			t.Error("Context should not be nil")
		}
		if ctx.Timestamp.IsZero() {
			t.Error("Timestamp should be set")
		}
		return nil, nil
	}

	dispatcher.Register("contextTest", handler)
	dispatcher.Dispatch(conn, "contextTest", nil)
}

func TestDispatcher_ConcurrentAccess(t *testing.T) {
	dispatcher := newTestDispatcher(t)

	done := make(chan bool)
	for i := 0; i < 10; i++ {
		go func(n int) {
			methodName := "method" + string(rune('A'+n))
			dispatcher.Register(methodName, func(ctx *RPCContext, args []interface{}) (interface{}, error) {
				return n, nil
			})
			done <- true
		}(i)
	}

	for i := 0; i < 10; i++ {
		<-done
	}

	dispatcher.mutex.RLock()
	count := len(dispatcher.handlers)
	dispatcher.mutex.RUnlock()

	if count != 10 {
		t.Errorf("expected 10 handlers, got %d", count)
	}
}

func TestRPCResponse(t *testing.T) {
	t.Run("success response", func(t *testing.T) {
		data := map[string]string{"key": "value"}
		resp := NewSuccessResponse(data)

		if !resp.Success {
			t.Error("expected Success to be true")
		}
		if resp.Error != nil {
			t.Error("expected Error to be nil")
		}
		if resp.Data == nil {
			t.Error("expected Data to be set")
		}
	})

	t.Run("error response", func(t *testing.T) {
		resp := NewErrorResponse(400, "bad request")

		if resp.Success {
			t.Error("expected Success to be false")
		}
		if resp.Error == nil {
			t.Error("expected Error to be set")
		}
		if resp.Error.Code != 400 {
			t.Errorf("expected error code 400, got %d", resp.Error.Code)
		}
		if resp.Error.Message != "bad request" {
			t.Errorf("expected error message 'bad request', got '%s'", resp.Error.Message)
		}
	})
}

func TestErrorToResponse(t *testing.T) {
	tests := []struct {
		name         string
		err          error
		expectedCode int
		expectedMsg  string
	}{
		{"not found", pkgerrors.ErrNotFound, 404, "Not found"},
		{"unauthorized", pkgerrors.ErrUnauthorized, 401, "Unauthorized"},
		{"invalid input", pkgerrors.ErrInvalidInput, 400, "Invalid input"},
		{"inventory full", pkgerrors.ErrInventoryFull, 400, "Không đủ ô trống."},
		{"rate limited", pkgerrors.ErrRateLimited, 429, "Rate limited"},
		{"method not found", pkgerrors.ErrMethodNotFound, 404, "Method not found"},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			resp := ErrorToResponse(tc.err)

			if resp.Success {
				t.Error("expected Success to be false")
			}
			if resp.Error == nil {
				t.Fatal("expected Error to be set")
			}
			if resp.Error.Code != tc.expectedCode {
				t.Errorf("expected code %d, got %d", tc.expectedCode, resp.Error.Code)
			}
			if resp.Error.Message != tc.expectedMsg {
				t.Errorf("expected message %q, got %q", tc.expectedMsg, resp.Error.Message)
			}
		})
	}
}

func TestDefaultRateLimits(t *testing.T) {
	logger, _ := zap.NewDevelopment()
	dispatcher := NewRPCDispatcher(logger)

	expectedLimits := map[string]time.Duration{
		"udcr":            600 * time.Millisecond,
		"udcp":            600 * time.Millisecond,
		"say":             1100 * time.Millisecond,
		"cbom":            1000 * time.Millisecond,
		"chooseCharactor": 2100 * time.Millisecond,
		"useItem":         800 * time.Millisecond,
		"bagSort":         3000 * time.Millisecond,
	}

	for method, expectedLimit := range expectedLimits {
		t.Run(method, func(t *testing.T) {
			dispatcher.mutex.RLock()
			actualLimit, exists := dispatcher.rateLimits[method]
			dispatcher.mutex.RUnlock()

			if !exists {
				t.Errorf("rate limit for '%s' not set", method)
				return
			}

			if actualLimit != expectedLimit {
				t.Errorf("expected rate limit %v, got %v", expectedLimit, actualLimit)
			}
		})
	}
}
