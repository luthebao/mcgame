// Open-sourced by BaoLT

// Transport abstracts the byte-level protocol that carries an RPC session.
// RTMPTransport (AMF0 over RTMPE) is the only implementation.
// Handlers and the dispatcher never see this interface.
package rtmp

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"sync"
	"time"

	"mcgame-server/pkg/rtmp"
	rtmpmsg "mcgame-server/pkg/rtmp/message"

	"github.com/yutopp/go-amf0"
	"go.uber.org/zap"
)

type Transport interface {
	WriteCommand(ctx context.Context, method string, args []interface{}) error
	WriteCommandSync(ctx context.Context, method string, args []interface{}) error
	WriteResult(ctx context.Context, txID int64, result interface{}) error
	WriteError(ctx context.Context, txID int64, err error) error
	Kind() string
	io.Closer
}

type RTMPTransport struct {
	conn   *rtmp.Conn
	logger *zap.Logger
	mu     sync.Mutex
}

func NewRTMPTransport(conn *rtmp.Conn, logger *zap.Logger) *RTMPTransport {
	return &RTMPTransport{conn: conn, logger: logger}
}

func (t *RTMPTransport) Kind() string { return "rtmp" }

func (t *RTMPTransport) Close() error {
	return nil
}

func (t *RTMPTransport) WriteCommand(ctx context.Context, method string, args []interface{}) error {
	return t.writeCommand(ctx, method, args, false)
}

func (t *RTMPTransport) WriteCommandSync(ctx context.Context, method string, args []interface{}) error {
	return t.writeCommand(ctx, method, args, true)
}

func (t *RTMPTransport) writeCommand(ctx context.Context, method string, args []interface{}, sync bool) error {
	t.mu.Lock()
	defer t.mu.Unlock()
	if t.conn == nil {
		return fmt.Errorf("rtmp transport closed")
	}
	body, err := encodeAMFBody(args)
	if err != nil {
		return err
	}
	cmd := &rtmpmsg.CommandMessage{
		CommandName:   method,
		TransactionID: 0,
		Encoding:      rtmpmsg.EncodingTypeAMF0,
		Body:          bytes.NewReader(body),
	}
	chunkMsg := &rtmp.ChunkMessage{StreamID: 0, Message: cmd}
	if sync {
		return t.conn.WriteSync(ctx, 3, 0, chunkMsg)
	}
	return t.conn.Write(ctx, 3, 0, chunkMsg)
}

func (t *RTMPTransport) WriteResult(ctx context.Context, txID int64, result interface{}) error {
	t.mu.Lock()
	defer t.mu.Unlock()
	if t.conn == nil {
		return fmt.Errorf("rtmp transport closed")
	}
	body, err := encodeAMFResponseBody(result)
	if err != nil {
		return err
	}
	cmd := &rtmpmsg.CommandMessage{
		CommandName:   "_result",
		TransactionID: txID,
		Encoding:      rtmpmsg.EncodingTypeAMF0,
		Body:          bytes.NewReader(body),
	}
	timeoutCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
	defer cancel()
	return t.conn.WriteSync(timeoutCtx, 3, 0, &rtmp.ChunkMessage{StreamID: 0, Message: cmd})
}

func (t *RTMPTransport) WriteError(ctx context.Context, txID int64, err error) error {
	t.mu.Lock()
	defer t.mu.Unlock()
	if t.conn == nil {
		return fmt.Errorf("rtmp transport closed")
	}
	errorInfo := map[string]interface{}{
		"level":       "error",
		"code":        "NetConnection.Call.Failed",
		"description": err.Error(),
	}
	body, encErr := encodeAMFResponseBody(errorInfo)
	if encErr != nil {
		return encErr
	}
	cmd := &rtmpmsg.CommandMessage{
		CommandName:   "_error",
		TransactionID: txID,
		Encoding:      rtmpmsg.EncodingTypeAMF0,
		Body:          bytes.NewReader(body),
	}
	timeoutCtx, cancel := context.WithTimeout(ctx, 5*time.Second)
	defer cancel()
	return t.conn.WriteSync(timeoutCtx, 3, 0, &rtmp.ChunkMessage{StreamID: 0, Message: cmd})
}

func (t *RTMPTransport) UnderlyingConn() *rtmp.Conn { return t.conn }

func (t *RTMPTransport) SendSetChunkSize(chunkSize uint32) error {
	t.mu.Lock()
	defer t.mu.Unlock()
	if t.conn == nil {
		return fmt.Errorf("rtmp transport closed")
	}
	if chunkSize < 1 || chunkSize > 0x7fffffff {
		return fmt.Errorf("invalid chunk size: %d (must be 1-2147483647)", chunkSize)
	}
	msg := &rtmpmsg.SetChunkSize{ChunkSize: chunkSize}
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	return t.conn.WriteSync(ctx, 2, 0, &rtmp.ChunkMessage{StreamID: 0, Message: msg})
}

func encodeAMFBody(args []interface{}) ([]byte, error) {
	buf := new(bytes.Buffer)
	enc := amf0.NewEncoder(buf)
	if err := enc.Encode(nil); err != nil {
		return nil, fmt.Errorf("encode null cmd object: %w", err)
	}
	for i, a := range args {
		if err := enc.Encode(a); err != nil {
			return nil, fmt.Errorf("encode arg %d: %w", i, err)
		}
	}
	return buf.Bytes(), nil
}

func encodeAMFResponseBody(payload interface{}) ([]byte, error) {
	buf := new(bytes.Buffer)
	enc := amf0.NewEncoder(buf)
	if err := enc.Encode(nil); err != nil {
		return nil, fmt.Errorf("encode null cmd object: %w", err)
	}
	if err := enc.Encode(payload); err != nil {
		return nil, fmt.Errorf("encode result: %w", err)
	}
	return buf.Bytes(), nil
}
