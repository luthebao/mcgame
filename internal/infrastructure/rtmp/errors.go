// Open-sourced by BaoLT

// Connection error types for RTMP client rejection and close scenarios.
// Error codes match Flash client handlers in CallBackGlobal.as and RemoteObj.nsHandler.
// Supports both Rejected and Closed connection states for proper client handling.
package rtmp

import "fmt"

const (
	ErrClassify      = "ERR_CLASSIFY"
	ErrClassify2     = "ERR_CLASSIFY2"
	ErrClassify3     = "ERR_CLASSIFY3"
	ErrClassify4     = "ERR_CLASSIFY4"
	ErrClassify5     = "ERR_CLASSIFY5"
	ErrClassify6     = "ERR_CLASSIFY6"
	ErrClassify7     = "ERR_CLASSIFY7"
	ErrLogined       = "ERR_LOGINED"
	ErrLoginFailed   = "ERR_LOGIN_FAILED"
	ErrLoginBanned   = "ERR_LOGIN_BANNED"
	ErrIPBan         = "ERR_IP_BAN"
	ErrInCrossServer = "IN_CROSS_SERVER"
	ServerNotReady   = "SERVER_NOT_READY"
)

type ConnectionRejectError struct {
	Code string
	Desc string
}

func (e *ConnectionRejectError) Error() string {
	return fmt.Sprintf("connection rejected: %s - %s", e.Code, e.Desc)
}

func (e *ConnectionRejectError) ApplicationCode() string {
	return e.Code
}

func (e *ConnectionRejectError) Description() string {
	return e.Desc
}

func NewConnectionRejectError(applicationCode, description string) *ConnectionRejectError {
	return &ConnectionRejectError{
		Code: applicationCode,
		Desc: description,
	}
}

type ConnectionCloseError struct {
	Code string
	Desc string
}

func (e *ConnectionCloseError) Error() string {
	return fmt.Sprintf("connection closed: %s - %s", e.Code, e.Desc)
}

func (e *ConnectionCloseError) ApplicationCode() string {
	return e.Code
}

func (e *ConnectionCloseError) Description() string {
	return e.Desc
}

func (e *ConnectionCloseError) IsCloseError() bool {
	return true
}

func NewConnectionCloseError(applicationCode, description string) *ConnectionCloseError {
	return &ConnectionCloseError{
		Code: applicationCode,
		Desc: description,
	}
}
