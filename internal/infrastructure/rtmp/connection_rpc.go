// Open-sourced by BaoLT

// RPC message handling for RTMP connections.
// Handles OnUnknownCommandMessage for custom RPC dispatch.
// Sanitizes NaN/Infinity values for JSON compatibility.
package rtmp

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"math"
	"strings"
	"time"

	pkgerrors "mcgame-server/pkg/errors"
	rtmpmsg "mcgame-server/pkg/rtmp/message"

	"github.com/yutopp/go-amf0"
	"go.uber.org/zap"
)

func sanitizeForJSON(v interface{}) interface{} {
	switch val := v.(type) {
	case float64:
		if math.IsNaN(val) || math.IsInf(val, 0) {
			return nil
		}
		return val
	case []interface{}:
		result := make([]interface{}, len(val))
		for i, item := range val {
			result[i] = sanitizeForJSON(item)
		}
		return result
	case map[string]interface{}:
		result := make(map[string]interface{}, len(val))
		for k, item := range val {
			result[k] = sanitizeForJSON(item)
		}
		return result
	default:
		return val
	}
}

func rpcFailureMessage(result interface{}) string {
	switch value := result.(type) {
	case *RPCResponse:
		if value != nil && !value.Success && value.Error != nil {
			return value.Error.Message
		}
	case RPCResponse:
		if !value.Success && value.Error != nil {
			return value.Error.Message
		}
	}
	return ""
}

func shouldNotifyConnectionError(session *SessionContext, message string) bool {
	trimmed := strings.TrimSpace(message)
	if session == nil || trimmed == "" {
		return false
	}
	if strings.HasPrefix(trimmed, "[Connection]") {
		trimmed = strings.TrimSpace(strings.TrimPrefix(trimmed, "[Connection]"))
	}
	if strings.EqualFold(trimmed, pkgerrors.ErrRateLimited.Error()) {
		return false
	}
	return session.CharacterID != ""
}

func shouldSuppressDispatchError(err error) bool {
	return pkgerrors.Is(err, pkgerrors.ErrRateLimited)
}

func formatConnectionErrorMessage(message string) string {
	trimmed := strings.TrimSpace(message)
	if trimmed == "" {
		return ""
	}
	if strings.HasPrefix(trimmed, "[Connection]") {
		return trimmed
	}
	return "[Connection] " + trimmed
}

func notifyConnectionError(send func(method string, args ...interface{}) error, session *SessionContext, message string) {
	if send == nil || !shouldNotifyConnectionError(session, message) {
		return
	}
	_ = send("a", formatConnectionErrorMessage(message))
}

func (c *Connection) OnUnknownCommandMessage(timestamp uint32, cmd *rtmpmsg.CommandMessage) error {
	c.UpdateLastActive()

	var args []interface{}
	quiet := c.dispatcher != nil && c.dispatcher.IsQuiet(cmd.CommandName)

	if cmd.DecodeError != nil {
		c.logger.Warn("RPC body decode stopped early",
			zap.Uint32("conn_id", c.ID),
			zap.String("method", cmd.CommandName),
			zap.Int("decoded_count", len(cmd.DecodedArgs)),
			zap.Error(cmd.DecodeError))
	}

	if cmd.DecodedArgs != nil {
		// First decoded value is the responder/command-object (typically nil),
		// real args follow. Skip the leading nil to match the legacy splitting.
		if len(cmd.DecodedArgs) > 0 {
			args = make([]interface{}, 0, len(cmd.DecodedArgs)-1)
			for i, v := range cmd.DecodedArgs {
				if i == 0 {
					continue
				}
				args = append(args, v)
			}
		}
		if !quiet {
			c.logger.Debug("RPC pre-decoded args",
				zap.Uint32("conn_id", c.ID),
				zap.String("method", cmd.CommandName),
				zap.Int("decoded_count", len(cmd.DecodedArgs)))
		}
	} else if cmd.Body != nil {
		bodyBytes, _ := io.ReadAll(cmd.Body)
		if !quiet {
			c.logger.Debug("RPC body raw",
				zap.Uint32("conn_id", c.ID),
				zap.String("method", cmd.CommandName),
				zap.Int("body_len", len(bodyBytes)),
				zap.String("body_hex", fmt.Sprintf("%x", bodyBytes)))
		}

		decoder := amf0.NewDecoder(bytes.NewReader(bodyBytes))

		var cmdObj interface{}
		if err := decoder.Decode(&cmdObj); err != nil && err != io.EOF {
			c.logger.Warn("Failed to decode CommandObject", zap.Uint32("conn_id", c.ID), zap.Error(err))
		}

		for {
			var arg interface{}
			if err := decoder.Decode(&arg); err != nil {
				if err == io.EOF {
					break
				}
				c.logger.Warn("Failed to decode AMF0 argument", zap.Uint32("conn_id", c.ID), zap.Error(err))
				break
			}
			args = append(args, arg)
		}
	}

	if !quiet {
		c.logger.Debug("RPC call received",
			zap.Uint32("conn_id", c.ID),
			zap.String("name", cmd.CommandName),
			zap.Int64("transaction_id", cmd.TransactionID),
			zap.Any("args", sanitizeForJSON(args)))
	}

	onLineListConfirmRPCs := map[string]bool{
		"getShopConfig":       true,
		"getLimitShopConfig":  true,
		"getRemainShopConfig": true,
		"getLineInfo":         true,
	}
	if onLineListConfirmRPCs[cmd.CommandName] {
		c.mutex.Lock()
		if !c.session.OnLineListConfirmed {
			c.session.OnLineListConfirmed = true
			c.session.NeedOnLineList = false
		}
		c.mutex.Unlock()
	}

	if c.dispatcher != nil {
		result, err := c.dispatcher.Dispatch(c, cmd.CommandName, args)
		if err != nil {
			if shouldSuppressDispatchError(err) {
				return nil
			}
			notifyConnectionError(c.SendCallback, c.GetSession(), err.Error())
			c.logger.Error("RPC dispatch error",
				zap.Uint32("conn_id", c.ID),
				zap.String("method", cmd.CommandName),
				zap.Error(err))
			if cmd.TransactionID > 0 {
				c.sendRPCError(cmd.TransactionID, cmd.CommandName, err)
			}
			return nil
		}
		if failureMsg := rpcFailureMessage(result); failureMsg != "" {
			c.logger.Warn("RPC failure response",
				zap.Uint32("conn_id", c.ID),
				zap.String("method", cmd.CommandName),
				zap.String("message", failureMsg))
		}
		notifyConnectionError(c.SendCallback, c.GetSession(), rpcFailureMessage(result))

		if cmd.TransactionID > 0 && result != nil {
			if err := c.sendRPCResult(cmd.TransactionID, result, quiet); err != nil {
				c.logger.Error("Failed to send RPC result",
					zap.Uint32("conn_id", c.ID),
					zap.String("method", cmd.CommandName),
					zap.Error(err))
			}
		}
	}

	return nil
}

func (c *Connection) sendRPCResult(transactionID int64, result interface{}, quiet bool) error {
	t := c.GetTransport()
	if t == nil {
		return fmt.Errorf("transport not initialized")
	}
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if !quiet {
		c.logger.Debug("Sending RPC result",
			zap.Uint32("conn_id", c.ID),
			zap.Int64("transaction_id", transactionID),
			zap.Any("result", result))
	}
	return t.WriteResult(ctx, transactionID, result)
}

func (c *Connection) sendRPCError(transactionID int64, method string, err error) error {
	t := c.GetTransport()
	if t == nil {
		return fmt.Errorf("transport not initialized")
	}
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	c.logger.Debug("Sending RPC error",
		zap.Uint32("conn_id", c.ID),
		zap.Int64("transaction_id", transactionID),
		zap.String("method", method),
		zap.Error(err))
	return t.WriteError(ctx, transactionID, err)
}
