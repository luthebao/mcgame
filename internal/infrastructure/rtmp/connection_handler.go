// Open-sourced by BaoLT

// RTMP connection handler implementing rtmp.Handler interface.
// Handles OnConnect for authentication, OnClose for cleanup.
// Supports global (tcn) and scene connection types with credential parsing.
package rtmp

import (
	"errors"
	"fmt"
	"io"
	"strings"
	"time"

	pkgerrors "mcgame-server/pkg/errors"
	"mcgame-server/pkg/rtmp"
	rtmpmsg "mcgame-server/pkg/rtmp/message"

	"github.com/yutopp/go-amf0"
	"go.uber.org/zap"
)

func (c *Connection) OnServe(conn *rtmp.Conn) {
	c.SetTransport(NewRTMPTransport(conn, c.logger))
}

func (c *Connection) OnConnect(timestamp uint32, cmd *rtmpmsg.NetConnectionConnect) error {
	c.mutex.Lock()
	c.session.AppName = cmd.Command.App
	c.session.TCUrl = cmd.Command.TCURL
	c.session.ConnectedAt = time.Now()

	if strings.HasPrefix(cmd.Command.TCURL, "rtmpe://") {
		c.session.Protocol = "rtmpe"
	} else if strings.HasPrefix(cmd.Command.TCURL, "rtmpte://") {
		c.session.Protocol = "rtmpte"
	} else {
		c.session.Protocol = "rtmp"
	}
	c.mutex.Unlock()

	isGlobalApp := isGlobalServerApp(cmd.Command.App)

	if isGlobalApp {
		return c.handleGlobalConnect(cmd)
	} else if c.IsSceneConnection() {
		return c.handleSceneConnect(cmd)
	}

	return nil
}

func (c *Connection) handleGlobalConnect(cmd *rtmpmsg.NetConnectionConnect) error {
	connectType, username, password, timeStr, bySession, hash := c.parseCredentials(cmd.ExtraArgs)

	c.mutex.Lock()
	c.session.Username = username
	c.mutex.Unlock()

	if username != "" {
		if c.dispatcher != nil {
			authArgs := []interface{}{connectType, username, password, timeStr, bySession, hash}
			_, err := c.dispatcher.Dispatch(c, "onConnectAuth", authArgs)
			if err != nil {
				if pkgerrors.IsExpected(err) {
					c.logger.Warn("Authentication rejected", zap.String("username", username), zap.Error(err))
				} else {
					c.logger.Error("Authentication failed", zap.String("username", username), zap.Error(err))
				}

				appCode := ErrClassify6
				switch {
				case errors.Is(err, pkgerrors.ErrInvalidCredentials),
					errors.Is(err, pkgerrors.ErrAccountNotFound),
					errors.Is(err, pkgerrors.ErrUnauthorized):
					appCode = ErrLoginFailed
				case errors.Is(err, pkgerrors.ErrAccountBanned):
					appCode = ErrLoginBanned
				case errors.Is(err, pkgerrors.ErrServerMaintenance):
					appCode = ServerNotReady
				}

				return NewConnectionCloseError(appCode, err.Error())
			}
		}

		session := c.GetSession()
		if session != nil && session.AccountID != "" && connectType != "C" {
			onlineChecker := c.GetOnlineChecker()
			lineChecker := c.GetLineServerOnlineChecker()

			switch connectType {
			case "F":
				if onlineChecker != nil {
					disconnected := onlineChecker.ForceDisconnectAccount(session.AccountID, c.ID)
					if disconnected > 0 {
						c.logger.Info("Force login: disconnected existing local sessions",
							zap.String("username", username),
							zap.String("account_id", session.AccountID),
							zap.Int("disconnected", disconnected),
							zap.Uint32("conn_id", c.ID))
					}
				}
				if lineChecker != nil && lineChecker.IsAccountOnlineOnLineServers(session.AccountID) {
					if err := lineChecker.RequestForceDisconnectOnLineServers(session.AccountID); err != nil {
						c.logger.Warn("Force login: failed requesting remote force disconnect",
							zap.String("username", username),
							zap.String("account_id", session.AccountID),
							zap.Uint32("conn_id", c.ID),
							zap.Error(err))
					} else {
						c.logger.Info("Force login: queued remote force disconnect",
							zap.String("username", username),
							zap.String("account_id", session.AccountID),
							zap.Uint32("conn_id", c.ID))
					}
				}
			default:
				localOnline := onlineChecker != nil && onlineChecker.IsAccountOnline(session.AccountID, c.ID)
				remoteOnline := lineChecker != nil && lineChecker.IsAccountOnlineOnLineServers(session.AccountID)
				if localOnline || remoteOnline {
					c.logger.Info("Login rejected: account already online",
						zap.String("username", username),
						zap.String("account_id", session.AccountID),
						zap.Bool("local_online", localOnline),
						zap.Bool("remote_online", remoteOnline),
						zap.Uint32("conn_id", c.ID))
					return NewConnectionCloseError(ErrLogined, "account already logged in")
				}
			}
		}
	} else {
		c.logger.Info("No credentials provided, skipping authentication (guest mode)")
	}

	c.session.NeedOnLineList = true
	c.session.OnLineListConfirmed = false
	c.session.OnLineListStop = make(chan struct{})

	if rt, ok := c.GetTransport().(*RTMPTransport); ok {
		chunkSize := rt.UnderlyingConn().GetChunkStreamer().SelfState().ChunkSize()
		if chunkSize > 128 {
			if err := rt.SendSetChunkSize(chunkSize); err != nil {
				c.logger.Error("Failed to send SetChunkSize to client",
					zap.Uint32("conn_id", c.ID),
					zap.Uint32("chunk_size", chunkSize),
					zap.Error(err))
			}
		}
	}

	go c.runOnLineListRetryLoop()

	return nil
}

func (c *Connection) handleSceneConnect(cmd *rtmpmsg.NetConnectionConnect) error {
	connectType, username, password, timeStr, bySession, lineID, characterID := c.parseSceneCredentials(cmd.ExtraArgs)

	c.mutex.Lock()
	c.session.Username = username
	c.currentChannelID = lineID
	c.mutex.Unlock()

	if username != "" && c.dispatcher != nil {
		authArgs := []interface{}{connectType, username, password, timeStr, bySession, ""}
		_, err := c.dispatcher.Dispatch(c, "onConnectAuth", authArgs)
		if err != nil {
			c.logger.Error("Scene authentication failed", zap.String("username", username), zap.Error(err))

			appCode := ""
			switch {
			case errors.Is(err, pkgerrors.ErrInvalidCredentials),
				errors.Is(err, pkgerrors.ErrAccountNotFound),
				errors.Is(err, pkgerrors.ErrUnauthorized):
				appCode = ErrLoginFailed
			case errors.Is(err, pkgerrors.ErrAccountBanned):
				appCode = ErrLoginBanned
			}

			if appCode != "" {
				return NewConnectionCloseError(appCode, err.Error())
			}

			return NewConnectionRejectError(ErrClassify6, err.Error())
		}
	}

	if rt, ok := c.GetTransport().(*RTMPTransport); ok {
		chunkSize := rt.UnderlyingConn().GetChunkStreamer().SelfState().ChunkSize()
		if chunkSize > 128 {
			if err := rt.SendSetChunkSize(chunkSize); err != nil {
				c.logger.Error("Failed to send SetChunkSize to client",
					zap.Uint32("conn_id", c.ID),
					zap.Uint32("chunk_size", chunkSize),
					zap.Error(err))
			}
		}
	}

	if connectType == "C" && characterID > 0 {
		c.logger.Info("Change line connection - auto-selecting character",
			zap.Uint32("conn_id", c.ID),
			zap.Int64("character_id", characterID),
			zap.Int("channel_id", lineID))

		c.mutex.Lock()
		c.session.CharacterID = fmt.Sprintf("%d", characterID)
		c.session.State = 2
		c.mutex.Unlock()

		go func() {
			time.Sleep(500 * time.Millisecond)
			if c.dispatcher != nil {
				c.logger.Info("Auto-selecting character for line change",
					zap.Uint32("conn_id", c.ID),
					zap.Int64("character_id", characterID))
				_, err := c.dispatcher.Dispatch(c, "chooseCharactor", []interface{}{float64(characterID)})
				if err != nil {
					c.logger.Error("Failed to auto-select character",
						zap.Uint32("conn_id", c.ID),
						zap.Int64("character_id", characterID),
						zap.Error(err))
				}
			}
		}()
	} else {
		go func() {
			time.Sleep(500 * time.Millisecond)
			c.sendOnIclCallback()
		}()
	}

	return nil
}

func (c *Connection) sendRejectionOnStatus(appCode string) {
	c.logger.Info("Sending rejection onStatus callback",
		zap.String("app_code", appCode),
		zap.Uint32("conn_id", c.ID))
	statusInfo := map[string]interface{}{
		"level":       "error",
		"code":        "NetConnection.Connect.Rejected",
		"description": "Connection rejected",
		"application": appCode,
	}
	if err := c.SendCallbackSync("onStatus", statusInfo); err != nil {
		c.logger.Warn("Failed to send rejection onStatus",
			zap.String("app_code", appCode),
			zap.Uint32("conn_id", c.ID),
			zap.Error(err))
	} else {
		c.logger.Info("Successfully sent rejection onStatus callback",
			zap.String("app_code", appCode),
			zap.Uint32("conn_id", c.ID))
	}
	time.Sleep(50 * time.Millisecond)
}

func (c *Connection) runOnLineListRetryLoop() {
	stopChan := c.session.OnLineListStop
	ticker := time.NewTicker(2 * time.Second)
	defer ticker.Stop()

	select {
	case <-time.After(1 * time.Second):
	case <-stopChan:
		return
	}

	maxAttempts := 15
	attempts := 0

	for attempts < maxAttempts {
		select {
		case <-stopChan:
			c.logger.Debug("onLineList retry loop stopped (connection closed)", zap.Uint32("conn_id", c.ID))
			return
		default:
		}

		c.mutex.Lock()
		confirmed := c.session.OnLineListConfirmed
		needSend := c.session.NeedOnLineList
		c.mutex.Unlock()

		if confirmed {
			return
		}

		if needSend {
			attempts++
			c.sendOnLineListCallback()
		}

		select {
		case <-ticker.C:
		case <-stopChan:
			c.logger.Debug("onLineList retry loop stopped (connection closed)", zap.Uint32("conn_id", c.ID))
			return
		}
	}

	c.logger.Warn("onLineList max attempts reached without confirmation",
		zap.Uint32("conn_id", c.ID),
		zap.Int("attempts", attempts))
}

func (c *Connection) parseCredentials(extraArgs []interface{}) (connectType, username, password, timeStr, bySession, hash string) {
	if len(extraArgs) == 0 {
		c.logger.Warn("No ExtraArgs provided, no credentials")
		return
	}

	if credArray, ok := extraArgs[0].([]interface{}); ok && len(credArray) >= 3 {
		connectType, _ = credArray[0].(string)
		username, _ = credArray[1].(string)
		password, _ = credArray[2].(string)
		if len(credArray) > 3 {
			timeStr, _ = credArray[3].(string)
		}
		if len(credArray) > 4 {
			bySession, _ = credArray[4].(string)
		}
		if len(credArray) > 5 {
			hash, _ = credArray[5].(string)
		}
	} else if ecmaArray, ok := extraArgs[0].(amf0.ECMAArray); ok {
		connectType, _ = ecmaArray["0"].(string)
		username, _ = ecmaArray["1"].(string)
		password, _ = ecmaArray["2"].(string)
		timeStr, _ = ecmaArray["3"].(string)
		bySession, _ = ecmaArray["4"].(string)
		hash, _ = ecmaArray["5"].(string)
	} else if credMap, ok := extraArgs[0].(map[string]interface{}); ok {
		connectType, _ = credMap["0"].(string)
		username, _ = credMap["1"].(string)
		password, _ = credMap["2"].(string)
		timeStr, _ = credMap["3"].(string)
		bySession, _ = credMap["4"].(string)
		hash, _ = credMap["5"].(string)
	} else {
		c.logger.Warn("ExtraArgs[0] is not an array or ECMAArray, trying direct extraction",
			zap.Any("value", extraArgs[0]),
			zap.String("type", fmt.Sprintf("%T", extraArgs[0])))

		if len(extraArgs) >= 3 {
			connectType, _ = extraArgs[0].(string)
			username, _ = extraArgs[1].(string)
			password, _ = extraArgs[2].(string)
			if len(extraArgs) > 3 {
				timeStr, _ = extraArgs[3].(string)
			}
			if len(extraArgs) > 4 {
				bySession, _ = extraArgs[4].(string)
			}
			if len(extraArgs) > 5 {
				hash, _ = extraArgs[5].(string)
			}
			c.logger.Info("Extracted credentials from direct ExtraArgs",
				zap.String("connectType", connectType),
				zap.String("username", username),
				zap.Bool("has_password", password != ""))
		}
	}

	return
}

func (c *Connection) parseSceneCredentials(extraArgs []interface{}) (connectType, username, password, timeStr, bySession string, lineID int, characterID int64) {
	if len(extraArgs) == 0 {
		return
	}

	if credArray, ok := extraArgs[0].([]interface{}); ok && len(credArray) >= 3 {
		connectType, _ = credArray[0].(string)
		username, _ = credArray[1].(string)
		password, _ = credArray[2].(string)
		if len(credArray) > 3 {
			timeStr, _ = credArray[3].(string)
		}
		if len(credArray) > 4 {
			bySession, _ = credArray[4].(string)
		}
		if len(credArray) > 5 {
			switch v := credArray[5].(type) {
			case float64:
				lineID = int(v)
			case int:
				lineID = v
			}
		}
		if len(credArray) > 6 {
			switch v := credArray[6].(type) {
			case float64:
				characterID = int64(v)
			case int:
				characterID = int64(v)
			case int64:
				characterID = v
			}
		}
	} else if ecmaArray, ok := extraArgs[0].(amf0.ECMAArray); ok {
		connectType, _ = ecmaArray["0"].(string)
		username, _ = ecmaArray["1"].(string)
		password, _ = ecmaArray["2"].(string)
		timeStr, _ = ecmaArray["3"].(string)
		bySession, _ = ecmaArray["4"].(string)
		if v, ok := ecmaArray["5"].(float64); ok {
			lineID = int(v)
		}
		if v, ok := ecmaArray["6"].(float64); ok {
			characterID = int64(v)
		}
	}

	return
}

func (c *Connection) OnCreateStream(timestamp uint32, cmd *rtmpmsg.NetConnectionCreateStream) error {
	return nil
}

func (c *Connection) OnReleaseStream(timestamp uint32, cmd *rtmpmsg.NetConnectionReleaseStream) error {
	return nil
}

func (c *Connection) OnDeleteStream(timestamp uint32, cmd *rtmpmsg.NetStreamDeleteStream) error {
	return nil
}

func (c *Connection) OnPublish(ctx *rtmp.StreamContext, timestamp uint32, cmd *rtmpmsg.NetStreamPublish) error {
	return nil
}

func (c *Connection) OnPlay(ctx *rtmp.StreamContext, timestamp uint32, cmd *rtmpmsg.NetStreamPlay) error {
	return nil
}

func (c *Connection) OnFCPublish(timestamp uint32, cmd *rtmpmsg.NetStreamFCPublish) error {
	return nil
}

func (c *Connection) OnFCUnpublish(timestamp uint32, cmd *rtmpmsg.NetStreamFCUnpublish) error {
	return nil
}

func (c *Connection) OnSetDataFrame(timestamp uint32, data *rtmpmsg.NetStreamSetDataFrame) error {
	return nil
}

func (c *Connection) OnAudio(timestamp uint32, payload io.Reader) error {
	return nil
}

func (c *Connection) OnVideo(timestamp uint32, payload io.Reader) error {
	return nil
}

func (c *Connection) OnUnknownMessage(timestamp uint32, message rtmpmsg.Message) error {
	return nil
}

func (c *Connection) OnUnknownDataMessage(timestamp uint32, data *rtmpmsg.DataMessage) error {
	c.logger.Debug("Unknown data message", zap.Uint32("conn_id", c.ID), zap.String("name", data.Name))
	return nil
}

func (c *Connection) StartGlobalPostAuth() {
	c.mutex.Lock()
	c.session.NeedOnLineList = true
	c.session.OnLineListConfirmed = false
	c.session.OnLineListStop = make(chan struct{})
	c.mutex.Unlock()
	go c.runOnLineListRetryLoop()
}

func (c *Connection) StartScenePostAuth() {
	go func() {
		time.Sleep(500 * time.Millisecond)
		c.sendOnIclCallback()
	}()
}

func (c *Connection) OnClose() {

	if notifier := c.GetDisconnectNotifier(); notifier != nil && c.session.AccountID != "" {
		notifier.NotifyUserDisconnect(c.session.AccountID)
	}

	if callback := c.GetOnCloseCallback(); callback != nil {
		callback(c.ID)
	}

	c.Close()
}
