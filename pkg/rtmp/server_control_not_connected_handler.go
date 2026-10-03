//
// Copyright (c) 2018- yutopp (yutopp@gmail.com)
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at  https://www.boost.org/LICENSE_1_0.txt)
//

package rtmp

import (
	"time"

	"github.com/pkg/errors"

	"mcgame-server/pkg/rtmp/internal"
	"mcgame-server/pkg/rtmp/message"
)

var _ stateHandler = (*serverControlNotConnectedHandler)(nil)

// serverControlNotConnectedHandler Handle control messages from a client which has not send connect at server side.
//
//	transitions:
//	  | "connect" -> controlStreamStateConnected
//	  | _         -> self
type serverControlNotConnectedHandler struct {
	sh *streamHandler
}

func (h *serverControlNotConnectedHandler) onMessage(
	chunkStreamID int,
	timestamp uint32,
	msg message.Message,
) error {
	return internal.ErrPassThroughMsg
}

func (h *serverControlNotConnectedHandler) onData(
	chunkStreamID int,
	timestamp uint32,
	dataMsg *message.DataMessage,
	body interface{},
) error {
	return internal.ErrPassThroughMsg
}

func (h *serverControlNotConnectedHandler) onCommand(
	chunkStreamID int,
	timestamp uint32,
	cmdMsg *message.CommandMessage,
	body interface{},
) (err error) {
	l := h.sh.Logger()

	switch cmd := body.(type) {
	case *message.NetConnectionConnect:
		l.Info("Connect")
		l.Infof("Connect: ObjectEncoding = %d", cmd.Command.ObjectEncoding)
		defer func() {
			if err != nil {
				result := h.newConnectErrorResult(err)

				l.Infof("Connect(Error): ResponseBody = %#v, Err = %+v", result, err)
				if err1 := h.sh.stream.ReplyConnect(chunkStreamID, timestamp, result); err1 != nil {
					err = errors.Wrapf(err, "Failed to reply response: Err = %+v", err1)
				}
				// Add a delay to ensure the client receives the message before connection closes
				time.Sleep(100 * time.Millisecond)
			}
		}()

		if err := h.sh.stream.userHandler().OnConnect(timestamp, cmd); err != nil {
			return err
		}

		const serverChunkSize uint32 = 4096
		l.Infof("Set chunk size: Size = %d", serverChunkSize)
		if err := h.sh.stream.WriteSetChunkSize(serverChunkSize); err != nil {
			return err
		}
		// SetChunkSize is per-direction: this only tells the client what
		// chunk size the server will use for OUTGOING chunks (selfState).
		// Do NOT touch peerState here — the peer keeps the RTMP default
		// (128) until it explicitly sends its own SetChunkSize message,
		// which is handled by stream_handler.go. Updating peerState here
		// caused the server to read incoming chunks as if they were
		// 4096-byte chunks, swallowing the 0xC3 fmt=3 continuation header
		// at the 128-byte chunk boundary into the message payload (the
		// "battleUpdateCmd" decode failure root cause).
		h.sh.stream.streamer().SelfState().SetChunkSize(serverChunkSize)

		l.Infof("Set win ack size: Size = %+v", h.sh.stream.streamer().SelfState().AckWindowSize())
		if err := h.sh.stream.WriteWinAckSize(ctrlMsgChunkStreamID, timestamp, &message.WinAckSize{
			Size: h.sh.stream.streamer().SelfState().AckWindowSize(),
		}); err != nil {
			return err
		}

		l.Infof("Set peer bandwidth: Size = %+v, Limit = %+v",
			h.sh.stream.streamer().SelfState().BandwidthWindowSize(),
			h.sh.stream.streamer().SelfState().BandwidthLimitType(),
		)
		if err := h.sh.stream.WriteSetPeerBandwidth(ctrlMsgChunkStreamID, timestamp, &message.SetPeerBandwidth{
			Size:  h.sh.stream.streamer().SelfState().BandwidthWindowSize(),
			Limit: h.sh.stream.streamer().SelfState().BandwidthLimitType(),
		}); err != nil {
			return err
		}

		l.Infof("Stream Begin: ID = %d", h.sh.stream.streamID)
		if err := h.sh.stream.WriteUserCtrl(ctrlMsgChunkStreamID, timestamp, &message.UserCtrl{
			Event: &message.UserCtrlEventStreamBegin{
				StreamID: h.sh.stream.streamID,
			},
		}); err != nil {
			return err
		}

		result := h.newConnectSuccessResult()

		l.Infof("Connect: ResponseBody = %#v", result)
		if err := h.sh.stream.ReplyConnect(chunkStreamID, timestamp, result); err != nil {
			return err
		}
		l.Info("Connected")

		h.sh.ChangeState(streamStateServerConnected)

		return nil

	default:
		return internal.ErrPassThroughMsg
	}
}

func (h *serverControlNotConnectedHandler) newConnectSuccessResult() *message.NetConnectionConnectResult {
	rPreset := h.sh.stream.conn.config.RPreset
	if rPreset == nil {
		rPreset = defaultResponsePreset
	}
	return &message.NetConnectionConnectResult{
		Properties: rPreset.GetServerConnectResultProperties(),
		Information: message.NetConnectionConnectResultInformation{
			Level:       "status",
			Code:        message.NetConnectionConnectCodeSuccess,
			Description: "Connection succeeded.",
			Data:        rPreset.GetServerConnectResultData(),
		},
	}
}

func (h *serverControlNotConnectedHandler) newConnectErrorResult(err error) *message.NetConnectionConnectResult {
	rPreset := h.sh.stream.conn.config.RPreset
	if rPreset == nil {
		rPreset = defaultResponsePreset
	}

	// Default to Failed code
	code := message.NetConnectionConnectCodeFailed
	application := ""
	description := "Connection failed."
	level := "error"

	// Check if this is a ConnectionCloseError (should send Failed code with application field)
	// This is used for errors like ERR_LOGINED/ERR_LOGIN_FAILED.
	// We send Failed code so Flash treats it as a connection failure.
	if closeErr, ok := err.(interface{ IsCloseError() bool }); ok && closeErr.IsCloseError() {
		code = message.NetConnectionConnectCodeFailed
		level = "error"
		if appErr, ok := err.(interface{ ApplicationCode() string }); ok {
			application = appErr.ApplicationCode()
		}
		if descErr, ok := err.(interface{ Description() string }); ok {
			description = descErr.Description()
		}
	} else if rejectErr, ok := err.(interface{ ApplicationCode() string }); ok {
		// Check if this is a ConnectionRejectError with an application code
		code = message.NetConnectionConnectCodeRejected
		application = rejectErr.ApplicationCode()
		if descErr, ok := err.(interface{ Description() string }); ok {
			description = descErr.Description()
		}
	}

	// Fallback description from error
	if description == "Connection failed." && err != nil {
		description = err.Error()
	}

	return &message.NetConnectionConnectResult{
		Properties: rPreset.GetServerConnectResultProperties(),
		Information: message.NetConnectionConnectResultInformation{
			Level:       level,
			Code:        code,
			Description: description,
			Application: application,
			Data:        rPreset.GetServerConnectResultData(),
		},
	}
}
