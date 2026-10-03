//
// Copyright (c) 2018- yutopp (yutopp@gmail.com)
//
// Distributed under the Boost Software License, Version 1.0. (See accompanying
// file LICENSE_1_0.txt or copy at  https://www.boost.org/LICENSE_1_0.txt)
//

package rtmp

import (
	"io"

	"github.com/pkg/errors"

	"mcgame-server/pkg/rtmp/handshake"
)

// serverConn A wrapper of a connection. It prorives server-side specific features.
type serverConn struct {
	conn *Conn
}

func newServerConn(conn *Conn) *serverConn {
	return &serverConn{
		conn: conn,
	}
}

// rtmpeReadWriteCloser wraps encrypted read/write with original closer
type rtmpeReadWriteCloser struct {
	reader io.Reader
	writer io.Writer
	closer io.Closer
}

func (rwc *rtmpeReadWriteCloser) Read(p []byte) (n int, err error) {
	return rwc.reader.Read(p)
}

func (rwc *rtmpeReadWriteCloser) Write(p []byte) (n int, err error) {
	return rwc.writer.Write(p)
}

func (rwc *rtmpeReadWriteCloser) Close() error {
	return rwc.closer.Close()
}

func (sc *serverConn) Serve() error {
	keyIn, keyOut, err := handshake.HandshakeWithClient(sc.conn.rwc, sc.conn.rwc, &handshake.Config{
		SkipHandshakeVerification: sc.conn.config.SkipHandshakeVerification,
	})
	if err != nil {
		return errors.Wrap(err, "Failed to handshake")
	}

	// If RTMPE is enabled, wrap the connection with RC4 encryption
	if keyIn != nil && keyOut != nil {
		encReader := handshake.NewRC4Reader(sc.conn.rwc, keyIn)
		encWriter := handshake.NewRC4Writer(sc.conn.rwc, keyOut)

		// Replace the rwc with encrypted version
		sc.conn.rwc = &rtmpeReadWriteCloser{
			reader: encReader,
			writer: encWriter,
			closer: sc.conn.rwc,
		}

		// Also need to update the buffered reader/writer
		// since they were created before encryption
		sc.conn.resetBufferedIO()
	}

	ctrlStream, err := sc.conn.streams.Create(ControlStreamID)
	if err != nil {
		return errors.Wrap(err, "Failed to create control stream")
	}
	ctrlStream.handler.ChangeState(streamStateServerNotConnected)

	sc.conn.streamer.controlStreamWriter = ctrlStream.Write

	if sc.conn.handler != nil {
		sc.conn.handler.OnServe(sc.conn)
	}

	return sc.conn.handleMessageLoop()
}

func (sc *serverConn) Close() error {
	return sc.conn.Close()
}
