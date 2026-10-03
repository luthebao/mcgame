// Open-sourced by BaoLT

package rtmp

import (
	"errors"
	"testing"

	pkgerrors "mcgame-server/pkg/errors"
	rtmpmsg "mcgame-server/pkg/rtmp/message"

	"github.com/yutopp/go-amf0"
	"go.uber.org/zap/zaptest"
)

type stubOnlineChecker struct {
	isOnline               bool
	forceDisconnectCalls   int
	forceDisconnectAccount string
	forceDisconnectExclude uint32
}

func (s *stubOnlineChecker) IsUsernameOnline(username string, excludeConnID uint32) bool {
	return false
}

func (s *stubOnlineChecker) IsAccountOnline(accountID string, excludeConnID uint32) bool {
	return s.isOnline
}

func (s *stubOnlineChecker) ForceDisconnectAccount(accountID string, excludeConnID uint32) int {
	s.forceDisconnectCalls++
	s.forceDisconnectAccount = accountID
	s.forceDisconnectExclude = excludeConnID
	return 1
}

type stubLineServerChecker struct {
	remoteOnline   bool
	requestCalls   int
	requestAccount string
	requestErr     error
}

func (s *stubLineServerChecker) IsAccountOnlineOnLineServers(accountID string) bool {
	return s.remoteOnline
}

func (s *stubLineServerChecker) RequestForceDisconnectOnLineServers(accountID string) error {
	s.requestCalls++
	s.requestAccount = accountID
	return s.requestErr
}

func buildGlobalConnectCommand() *rtmpmsg.NetConnectionConnect {
	return &rtmpmsg.NetConnectionConnect{
		Command: rtmpmsg.NetConnectionConnectCommand{App: "tcn", TCURL: "rtmp://127.0.0.1/tcn"},
		ExtraArgs: []interface{}{
			[]interface{}{"G", "user1", "pass1", "1700000000", "", "hash1"},
		},
	}
}

func buildGlobalConnectCommandTypeF() *rtmpmsg.NetConnectionConnect {
	return &rtmpmsg.NetConnectionConnect{
		Command: rtmpmsg.NetConnectionConnectCommand{App: "tcn", TCURL: "rtmp://127.0.0.1/tcn"},
		ExtraArgs: []interface{}{
			[]interface{}{"F", "user1", "pass1", "1700000000", "", "hash1"},
		},
	}
}

func buildGlobalConnectCommandTypeC() *rtmpmsg.NetConnectionConnect {
	return &rtmpmsg.NetConnectionConnect{
		Command: rtmpmsg.NetConnectionConnectCommand{App: "tcn", TCURL: "rtmp://127.0.0.1/tcn"},
		ExtraArgs: []interface{}{
			[]interface{}{"C", "user1", "pass1", "1700000000", "false", "hash1"},
		},
	}
}

func buildSceneConnectCommandWithECMAArrayTypeC() *rtmpmsg.NetConnectionConnect {
	return &rtmpmsg.NetConnectionConnect{
		Command: rtmpmsg.NetConnectionConnectCommand{App: "line/2", TCURL: "rtmpe://127.0.0.1:1935/line/2"},
		ExtraArgs: []interface{}{
			amf0.ECMAArray{
				"0": "C",
				"1": "user1",
				"2": "pass1",
				"3": "1700000000",
				"4": "false",
				"5": float64(2),
				"6": float64(123),
			},
		},
	}
}

func newGlobalConnectionForTest(t *testing.T) (*Connection, *RPCDispatcher) {
	logger := zaptest.NewLogger(t)
	dispatcher := NewRPCDispatcher(logger)
	conn := NewConnection(99, &mockConn{}, dispatcher, logger)
	return conn, dispatcher
}

func TestHandleGlobalConnect_TypeGDuplicateLocalOnlineReturnsErrLogined(t *testing.T) {
	conn, dispatcher := newGlobalConnectionForTest(t)

	onlineChecker := &stubOnlineChecker{isOnline: true}
	lineChecker := &stubLineServerChecker{}
	conn.SetOnlineChecker(onlineChecker)
	conn.SetLineServerOnlineChecker(lineChecker)

	dispatcher.Register("onConnectAuth", func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		ctx.Connection.SetSession("sess-1", "acc-1", "user1")
		return nil, nil
	})

	err := conn.handleGlobalConnect(buildGlobalConnectCommand())
	if err == nil {
		t.Fatalf("expected ERR_LOGINED close error, got nil")
	}
	var closeErr *ConnectionCloseError
	if !errors.As(err, &closeErr) {
		t.Fatalf("expected ConnectionCloseError, got %T", err)
	}
	if closeErr.ApplicationCode() != ErrLogined {
		t.Fatalf("expected ERR_LOGINED, got %s", closeErr.ApplicationCode())
	}
	if onlineChecker.forceDisconnectCalls != 0 {
		t.Fatalf("expected no force disconnect for type G, got %d", onlineChecker.forceDisconnectCalls)
	}
	if lineChecker.requestCalls != 0 {
		t.Fatalf("expected no remote force-disconnect request for type G, got %d", lineChecker.requestCalls)
	}
}

func TestHandleGlobalConnect_TypeGDuplicateRemoteOnlineReturnsErrLogined(t *testing.T) {
	conn, dispatcher := newGlobalConnectionForTest(t)

	onlineChecker := &stubOnlineChecker{}
	lineChecker := &stubLineServerChecker{remoteOnline: true}
	conn.SetOnlineChecker(onlineChecker)
	conn.SetLineServerOnlineChecker(lineChecker)

	dispatcher.Register("onConnectAuth", func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		ctx.Connection.SetSession("sess-1", "acc-remote", "user1")
		return nil, nil
	})

	err := conn.handleGlobalConnect(buildGlobalConnectCommand())
	if err == nil {
		t.Fatalf("expected ERR_LOGINED close error, got nil")
	}
	var closeErr *ConnectionCloseError
	if !errors.As(err, &closeErr) {
		t.Fatalf("expected ConnectionCloseError, got %T", err)
	}
	if closeErr.ApplicationCode() != ErrLogined {
		t.Fatalf("expected ERR_LOGINED, got %s", closeErr.ApplicationCode())
	}
	if lineChecker.requestCalls != 0 {
		t.Fatalf("expected no remote force-disconnect request for type G, got %d", lineChecker.requestCalls)
	}
}

func TestHandleGlobalConnect_TypeFForcesLocalAndRemoteDisconnect(t *testing.T) {
	conn, dispatcher := newGlobalConnectionForTest(t)

	onlineChecker := &stubOnlineChecker{isOnline: true}
	lineChecker := &stubLineServerChecker{remoteOnline: true}
	conn.SetOnlineChecker(onlineChecker)
	conn.SetLineServerOnlineChecker(lineChecker)

	dispatcher.Register("onConnectAuth", func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		ctx.Connection.SetSession("sess-1", "acc-1", "user1")
		return nil, nil
	})

	err := conn.handleGlobalConnect(buildGlobalConnectCommandTypeF())
	if err != nil {
		t.Fatalf("expected no error for type F login, got %v", err)
	}

	if onlineChecker.forceDisconnectCalls != 1 {
		t.Fatalf("expected local force disconnect to be called once for type F, got %d", onlineChecker.forceDisconnectCalls)
	}
	if onlineChecker.forceDisconnectAccount != "acc-1" {
		t.Fatalf("expected force disconnect account acc-1, got %s", onlineChecker.forceDisconnectAccount)
	}
	if onlineChecker.forceDisconnectExclude != conn.ID {
		t.Fatalf("expected exclude conn id %d, got %d", conn.ID, onlineChecker.forceDisconnectExclude)
	}
	if lineChecker.requestCalls != 1 {
		t.Fatalf("expected 1 remote force-disconnect request for type F, got %d", lineChecker.requestCalls)
	}
	if lineChecker.requestAccount != "acc-1" {
		t.Fatalf("expected remote request for acc-1, got %s", lineChecker.requestAccount)
	}
}

func TestHandleGlobalConnect_TypeGNotOnlineAccepts(t *testing.T) {
	conn, dispatcher := newGlobalConnectionForTest(t)

	onlineChecker := &stubOnlineChecker{}
	lineChecker := &stubLineServerChecker{}
	conn.SetOnlineChecker(onlineChecker)
	conn.SetLineServerOnlineChecker(lineChecker)

	dispatcher.Register("onConnectAuth", func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		ctx.Connection.SetSession("sess-1", "acc-1", "user1")
		return nil, nil
	})

	if err := conn.handleGlobalConnect(buildGlobalConnectCommand()); err != nil {
		t.Fatalf("expected no error when account is offline, got %v", err)
	}
	if onlineChecker.forceDisconnectCalls != 0 {
		t.Fatalf("expected no force disconnect when account offline, got %d", onlineChecker.forceDisconnectCalls)
	}
	if lineChecker.requestCalls != 0 {
		t.Fatalf("expected no remote force-disconnect when account offline, got %d", lineChecker.requestCalls)
	}
}

func TestHandleGlobalConnect_TypeCSkipsForceDisconnect(t *testing.T) {
	conn, dispatcher := newGlobalConnectionForTest(t)

	onlineChecker := &stubOnlineChecker{isOnline: true}
	lineChecker := &stubLineServerChecker{remoteOnline: true}
	conn.SetOnlineChecker(onlineChecker)
	conn.SetLineServerOnlineChecker(lineChecker)

	dispatcher.Register("onConnectAuth", func(ctx *RPCContext, args []interface{}) (interface{}, error) {
		ctx.Connection.SetSession("sess-1", "acc-1", "user1")
		return nil, nil
	})

	err := conn.handleGlobalConnect(buildGlobalConnectCommandTypeC())
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if onlineChecker.forceDisconnectCalls != 0 {
		t.Fatalf("expected no local force disconnect for type C, got %d", onlineChecker.forceDisconnectCalls)
	}
	if lineChecker.requestCalls != 0 {
		t.Fatalf("expected no remote force-disconnect request for type C, got %d", lineChecker.requestCalls)
	}
}

func TestHandleGlobalConnect_AuthErrorMappingUnchanged(t *testing.T) {
	tests := []struct {
		name         string
		authErr      error
		expectedCode string
	}{
		{name: "invalid credentials", authErr: pkgerrors.ErrInvalidCredentials, expectedCode: ErrLoginFailed},
		{name: "account banned", authErr: pkgerrors.ErrAccountBanned, expectedCode: ErrLoginBanned},
		{name: "generic error", authErr: errors.New("db unavailable"), expectedCode: ErrClassify6},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			conn, dispatcher := newGlobalConnectionForTest(t)
			dispatcher.Register("onConnectAuth", func(ctx *RPCContext, args []interface{}) (interface{}, error) {
				return nil, tt.authErr
			})

			err := conn.handleGlobalConnect(buildGlobalConnectCommand())
			if err == nil {
				t.Fatalf("expected error, got nil")
			}

			var closeErr *ConnectionCloseError
			if !errors.As(err, &closeErr) {
				t.Fatalf("expected ConnectionCloseError, got %T", err)
			}
			if closeErr.ApplicationCode() != tt.expectedCode {
				t.Fatalf("expected code %s, got %s", tt.expectedCode, closeErr.ApplicationCode())
			}
		})
	}
}

func TestParseSceneCredentials_ECMAArrayTypeCParsesCharacterID(t *testing.T) {
	conn, _ := newGlobalConnectionForTest(t)
	cmd := buildSceneConnectCommandWithECMAArrayTypeC()

	connectType, username, password, timeStr, bySession, lineID, characterID := conn.parseSceneCredentials(cmd.ExtraArgs)

	if connectType != "C" {
		t.Fatalf("expected connectType C, got %q", connectType)
	}
	if username != "user1" {
		t.Fatalf("expected username user1, got %q", username)
	}
	if password != "pass1" {
		t.Fatalf("expected password pass1, got %q", password)
	}
	if timeStr != "1700000000" {
		t.Fatalf("expected time 1700000000, got %q", timeStr)
	}
	if bySession != "false" {
		t.Fatalf("expected bySession false, got %q", bySession)
	}
	if lineID != 2 {
		t.Fatalf("expected lineID 2, got %d", lineID)
	}
	if characterID != 123 {
		t.Fatalf("expected characterID 123, got %d", characterID)
	}
}
