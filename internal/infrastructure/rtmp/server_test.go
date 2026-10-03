// Open-sourced by BaoLT

// Unit tests for RTMP server functionality.
// Tests server initialization, connection management, and session handling.
// Includes mock implementations for net.Conn and net.Listener.
package rtmp

import (
	"context"
	"net"
	"testing"
	"time"

	"go.uber.org/zap/zaptest"

	"mcgame-server/internal/infrastructure/config"
)

func newTestServer(t *testing.T) *Server {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)

	cfg := config.RTMPConfig{
		Host:           "127.0.0.1",
		Port:           0,
		ChunkSize:      128,
		WindowAckSize:  2500000,
		MaxConnections: 100,
	}

	return NewServer(cfg, logger, dispatcher)
}

func TestNewServer(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)

	cfg := config.RTMPConfig{
		Host:           "127.0.0.1",
		Port:           1935,
		ChunkSize:      128,
		WindowAckSize:  2500000,
		MaxConnections: 100,
	}

	server := NewServer(cfg, logger, dispatcher)

	if server == nil {
		t.Fatal("NewServer returned nil")
	}

	if server.config.Host != "127.0.0.1" {
		t.Errorf("expected host '127.0.0.1', got '%s'", server.config.Host)
	}

	if server.config.Port != 1935 {
		t.Errorf("expected port 1935, got %d", server.config.Port)
	}

	if server.dispatcher != dispatcher {
		t.Error("dispatcher not properly set")
	}

	if server.rtmpServer == nil {
		t.Error("rtmpServer not initialized")
	}
}

func TestServer_GetConnection(t *testing.T) {
	server := newTestServer(t)

	conn := server.GetConnection(999)
	if conn != nil {
		t.Error("expected nil for non-existent connection")
	}

	mockNetConn := &mockConn{}
	testConn := NewConnection(1, mockNetConn, server.dispatcher, server.logger)
	server.sessions.Store(uint32(1), testConn)

	retrieved := server.GetConnection(1)
	if retrieved == nil {
		t.Error("expected to retrieve connection")
	}

	if retrieved.ID != 1 {
		t.Errorf("expected connection ID 1, got %d", retrieved.ID)
	}
}

func TestIsGlobalServerApp(t *testing.T) {
	tests := []struct {
		appName  string
		expected bool
	}{
		{"tcn", true},
		{"tcn/", true},
		{"master/test", true},
		{"master/test/", true},
		{"scene", false},
		{"scene/", false},
		{"line/0", false},
		{"line/0/", false},
		{"other", false},
		{"", false},
	}

	for _, tc := range tests {
		t.Run(tc.appName, func(t *testing.T) {
			result := isGlobalServerApp(tc.appName)
			if result != tc.expected {
				t.Errorf("isGlobalServerApp(%q) = %v, expected %v", tc.appName, result, tc.expected)
			}
		})
	}
}

func TestConnection_IsGlobalConnection(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)

	tests := []struct {
		appName  string
		expected bool
	}{
		{"tcn", true},
		{"tcn/", true},
		{"scene", false},
	}

	for _, tc := range tests {
		t.Run(tc.appName, func(t *testing.T) {
			conn := NewConnection(1, &mockConn{}, dispatcher, logger)
			conn.session.AppName = tc.appName

			result := conn.IsGlobalConnection()
			if result != tc.expected {
				t.Errorf("IsGlobalConnection() = %v, expected %v for app '%s'", result, tc.expected, tc.appName)
			}
		})
	}
}

func TestConnection_IsSceneConnection(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)

	tests := []struct {
		appName  string
		expected bool
	}{
		{"scene", true},
		{"scene/", true},
		{"line/0", true},
		{"line/0/", true},
		{"tcn", false},
		{"other", false},
	}

	for _, tc := range tests {
		t.Run(tc.appName, func(t *testing.T) {
			conn := NewConnection(1, &mockConn{}, dispatcher, logger)
			conn.session.AppName = tc.appName

			result := conn.IsSceneConnection()
			if result != tc.expected {
				t.Errorf("IsSceneConnection() = %v, expected %v for app '%s'", result, tc.expected, tc.appName)
			}
		})
	}
}

func TestConnectionRejectError(t *testing.T) {
	err := NewConnectionRejectError("ERR_CLASSIFY", "test description")

	if err.Code != "ERR_CLASSIFY" {
		t.Errorf("expected code 'ERR_CLASSIFY', got '%s'", err.Code)
	}

	if err.Desc != "test description" {
		t.Errorf("expected desc 'test description', got '%s'", err.Desc)
	}

	errorMsg := err.Error()
	if errorMsg == "" {
		t.Error("Error() should return non-empty string")
	}

	if err.ApplicationCode() != "ERR_CLASSIFY" {
		t.Errorf("ApplicationCode() returned '%s'", err.ApplicationCode())
	}

	if err.Description() != "test description" {
		t.Errorf("Description() returned '%s'", err.Description())
	}
}

func TestConnection_SessionManagement(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)
	conn := NewConnection(1, &mockConn{}, dispatcher, logger)

	session := conn.GetSession()
	if session.SessionID != "" {
		t.Error("initial SessionID should be empty")
	}
	if session.State != 0 {
		t.Errorf("initial State should be 0, got %d", session.State)
	}

	conn.SetSession("sess123", "acct456", "testuser")

	session = conn.GetSession()
	if session.SessionID != "sess123" {
		t.Errorf("expected SessionID 'sess123', got '%s'", session.SessionID)
	}
	if session.AccountID != "acct456" {
		t.Errorf("expected AccountID 'acct456', got '%s'", session.AccountID)
	}
	if session.Username != "testuser" {
		t.Errorf("expected Username 'testuser', got '%s'", session.Username)
	}
	if session.State != 1 {
		t.Errorf("expected State 1 (authenticated), got %d", session.State)
	}

	conn.SetCharacter("char789")

	session = conn.GetSession()
	if session.CharacterID != "char789" {
		t.Errorf("expected CharacterID 'char789', got '%s'", session.CharacterID)
	}
	if session.State != 2 {
		t.Errorf("expected State 2 (character selected), got %d", session.State)
	}
}

func TestConnection_GetAppName(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)
	conn := NewConnection(1, &mockConn{}, dispatcher, logger)

	conn.session.AppName = "testApp"

	appName := conn.GetAppName()
	if appName != "testApp" {
		t.Errorf("expected 'testApp', got '%s'", appName)
	}
}

func TestConnection_Close(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)
	conn := NewConnection(1, &mockConn{}, dispatcher, logger)

	conn.Close()

	conn.Close()

	select {
	case <-conn.closeChan:
	default:
		t.Error("closeChan should be closed")
	}
}

func TestConnection_SendCallback_NilReceiverReturnsError(t *testing.T) {
	var conn *Connection

	if err := conn.SendCallback("onGroupDismiss"); err == nil {
		t.Fatal("expected error for nil connection receiver")
	}
}

func TestSessionContext_RateLimits(t *testing.T) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)
	conn := NewConnection(1, &mockConn{}, dispatcher, logger)

	session := conn.GetSession()

	if session.RateLimits == nil {
		t.Error("RateLimits map should be initialized")
	}

	now := time.Now()
	session.RateLimits["testMethod"] = now

	if session.RateLimits["testMethod"] != now {
		t.Error("rate limit not properly stored")
	}
}

func TestServer_BroadcastToAll(t *testing.T) {
	server := newTestServer(t)

	for i := uint32(1); i <= 3; i++ {
		mockNetConn := &mockConn{}
		testConn := NewConnection(i, mockNetConn, server.dispatcher, server.logger)
		server.sessions.Store(i, testConn)
	}

	server.BroadcastToAll("testCallback", map[string]interface{}{"data": "test"})
}

func TestServer_OnConnect_Callback(t *testing.T) {
	server := newTestServer(t)

	mockNetConn := &mockConn{}
	rwc, config := server.onConnect(mockNetConn)

	if rwc == nil {
		t.Error("onConnect should return non-nil ReadWriteCloser")
	}

	if config == nil {
		t.Fatal("onConnect should return non-nil ConnConfig")
	}

	if config.Handler == nil {
		t.Error("ConnConfig.Handler should be set")
	}

	if config.Logger == nil {
		t.Error("ConnConfig.Logger should be set")
	}

	if server.nextConnID != 1 {
		t.Errorf("expected nextConnID to be 1, got %d", server.nextConnID)
	}

	server.onConnect(&mockConn{})
	if server.nextConnID != 2 {
		t.Errorf("expected nextConnID to be 2, got %d", server.nextConnID)
	}
}

type mockListener struct {
	closed bool
}

func (m *mockListener) Accept() (net.Conn, error) {
	select {}
}

func (m *mockListener) Close() error {
	m.closed = true
	return nil
}

func (m *mockListener) Addr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}

type closeTrackingConn struct {
	mockConn
	closeCount int
}

func (m *closeTrackingConn) Close() error {
	m.closeCount++
	return nil
}

func TestServer_BuildShutdownStatusPayload(t *testing.T) {
	server := newTestServer(t)

	payload := server.buildShutdownStatusPayload()
	if payload["level"] != "status" {
		t.Errorf("expected level 'status', got %v", payload["level"])
	}
	if payload["code"] != "NetConnection.Connect.Closed" {
		t.Errorf("expected code 'NetConnection.Connect.Closed', got %v", payload["code"])
	}
	if payload["description"] != "Server is shutting down" {
		t.Errorf("expected description 'Server is shutting down', got %v", payload["description"])
	}
	if payload["application"] != ServerNotReady {
		t.Errorf("expected application '%s', got %v", ServerNotReady, payload["application"])
	}
}

func TestServer_Stop_NoSessions_Idempotent(t *testing.T) {
	server := newTestServer(t)
	server.listener = &mockListener{}

	if err := server.Stop(); err != nil {
		t.Fatalf("first Stop returned error: %v", err)
	}
	if err := server.Stop(); err != nil {
		t.Fatalf("second Stop returned error: %v", err)
	}

	if ml, ok := server.listener.(*mockListener); ok {
		if !ml.closed {
			t.Error("listener should be closed")
		}
	}
}

func TestServer_Stop_WithSessions_ClosesConnectionsWhenCallbackFails(t *testing.T) {
	server := newTestServer(t)
	server.listener = &mockListener{}

	conn1Net := &closeTrackingConn{}
	conn2Net := &closeTrackingConn{}
	conn1 := NewConnection(1, conn1Net, server.dispatcher, server.logger)
	conn2 := NewConnection(2, conn2Net, server.dispatcher, server.logger)
	server.sessions.Store(uint32(1), conn1)
	server.sessions.Store(uint32(2), conn2)

	if err := server.Stop(); err != nil {
		t.Fatalf("Stop returned error: %v", err)
	}

	if conn1Net.closeCount != 1 {
		t.Errorf("expected conn1 close count 1, got %d", conn1Net.closeCount)
	}
	if conn2Net.closeCount != 1 {
		t.Errorf("expected conn2 close count 1, got %d", conn2Net.closeCount)
	}
}

func TestServer_Stop_SendsShutdownStatusBeforeListenerClose(t *testing.T) {
	server := newTestServer(t)
	listener := &mockListener{}
	server.listener = listener

	conn := NewConnection(1, &closeTrackingConn{}, server.dispatcher, server.logger)
	server.sessions.Store(uint32(1), conn)

	sentAfterListenerClose := false
	server.sendShutdownStatusFn = func(conn *Connection, payload map[string]interface{}) error {
		if listener.closed {
			sentAfterListenerClose = true
		}
		return nil
	}

	if err := server.Stop(); err != nil {
		t.Fatalf("Stop returned error: %v", err)
	}

	if sentAfterListenerClose {
		t.Fatal("shutdown status callback was sent after listener close")
	}
}

func TestServer_ForceDisconnectAccount_DisconnectsAllMatchingSessions(t *testing.T) {
	server := newTestServer(t)

	conn1Net := &closeTrackingConn{}
	conn2Net := &closeTrackingConn{}
	conn3Net := &closeTrackingConn{}

	conn1 := NewConnection(1, conn1Net, server.dispatcher, server.logger)
	conn1.SetSession("s1", "acc-1", "u1")
	conn2 := NewConnection(2, conn2Net, server.dispatcher, server.logger)
	conn2.SetSession("s2", "acc-1", "u2")
	conn3 := NewConnection(3, conn3Net, server.dispatcher, server.logger)
	conn3.SetSession("s3", "acc-2", "u3")

	server.sessions.Store(uint32(1), conn1)
	server.sessions.Store(uint32(2), conn2)
	server.sessions.Store(uint32(3), conn3)

	disconnected := server.ForceDisconnectAccount("acc-1", 0)

	if disconnected != 2 {
		t.Fatalf("expected 2 disconnected sessions, got %d", disconnected)
	}
	if conn1Net.closeCount != 1 {
		t.Fatalf("expected conn1 to close once, got %d", conn1Net.closeCount)
	}
	if conn2Net.closeCount != 1 {
		t.Fatalf("expected conn2 to close once, got %d", conn2Net.closeCount)
	}
	if conn3Net.closeCount != 0 {
		t.Fatalf("expected conn3 to remain open, got %d", conn3Net.closeCount)
	}
}

func TestServer_ForceDisconnectAccount_RespectsExcludeConnID(t *testing.T) {
	server := newTestServer(t)

	conn1Net := &closeTrackingConn{}
	conn2Net := &closeTrackingConn{}

	conn1 := NewConnection(1, conn1Net, server.dispatcher, server.logger)
	conn1.SetSession("s1", "acc-1", "u1")
	conn2 := NewConnection(2, conn2Net, server.dispatcher, server.logger)
	conn2.SetSession("s2", "acc-1", "u2")

	server.sessions.Store(uint32(1), conn1)
	server.sessions.Store(uint32(2), conn2)

	disconnected := server.ForceDisconnectAccount("acc-1", 1)

	if disconnected != 1 {
		t.Fatalf("expected 1 disconnected session, got %d", disconnected)
	}
	if conn1Net.closeCount != 0 {
		t.Fatalf("expected excluded conn1 to remain open, got %d", conn1Net.closeCount)
	}
	if conn2Net.closeCount != 1 {
		t.Fatalf("expected conn2 to close once, got %d", conn2Net.closeCount)
	}
}

func TestServer_ForceDisconnectAccount_EmptyAccountNoop(t *testing.T) {
	server := newTestServer(t)

	conn1Net := &closeTrackingConn{}
	conn1 := NewConnection(1, conn1Net, server.dispatcher, server.logger)
	conn1.SetSession("s1", "acc-1", "u1")
	server.sessions.Store(uint32(1), conn1)

	disconnected := server.ForceDisconnectAccount("", 0)
	if disconnected != 0 {
		t.Fatalf("expected 0 disconnected sessions, got %d", disconnected)
	}
	if conn1Net.closeCount != 0 {
		t.Fatalf("expected no close call, got %d", conn1Net.closeCount)
	}
}

func TestServer_ForceDisconnectAccount_RemovesConnectionAndRunsDisconnectHandler(t *testing.T) {
	server := newTestServer(t)

	connNet := &closeTrackingConn{}
	conn := NewConnection(1, connNet, server.dispatcher, server.logger)
	conn.SetSession("s1", "acc-1", "u1")
	conn.SetSceneInfo(20, 77)
	server.sessions.Store(uint32(1), conn)

	called := false
	var gotCharID int64
	server.SetCharacterDisconnectHandler(func(ctx context.Context, conn *Connection, charID int64) {
		called = true
		gotCharID = charID
		if conn == nil {
			t.Fatal("expected disconnect handler connection")
		}
	})

	disconnected := server.ForceDisconnectAccount("acc-1", 0)

	if disconnected != 1 {
		t.Fatalf("expected 1 disconnected session, got %d", disconnected)
	}
	if connNet.closeCount != 1 {
		t.Fatalf("expected conn close count 1, got %d", connNet.closeCount)
	}
	if !called {
		t.Fatal("expected disconnect handler to be called")
	}
	if gotCharID != 77 {
		t.Fatalf("disconnect handler charID = %d, want 77", gotCharID)
	}
	if conn := server.GetConnection(1); conn != nil {
		t.Fatal("expected connection to be removed after force disconnect")
	}
}

func TestServer_RemoveConnection_CallsCharacterDisconnectHandler(t *testing.T) {
	server := newTestServer(t)

	conn := NewConnection(1, &mockConn{}, server.dispatcher, server.logger)
	conn.SetSceneInfo(0, 42)
	server.sessions.Store(uint32(1), conn)

	called := false
	var gotCharID int64
	server.SetCharacterDisconnectHandler(func(ctx context.Context, conn *Connection, charID int64) {
		called = true
		gotCharID = charID
		if conn == nil {
			t.Fatal("expected disconnect handler connection")
		}
	})

	server.RemoveConnection(1)

	if !called {
		t.Fatal("expected disconnect handler to be called")
	}
	if gotCharID != 42 {
		t.Fatalf("disconnect handler charID = %d, want 42", gotCharID)
	}
	if conn := server.GetConnection(1); conn != nil {
		t.Fatal("expected connection to be removed from server sessions")
	}
}
