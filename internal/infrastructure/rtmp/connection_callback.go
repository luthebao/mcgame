// Open-sourced by BaoLT

// Callback sending methods for RTMP connections.
// Handles onLineList, onIcl, and connection status messages.
// Supports line list provider for dynamic multi-gateway mode.
package rtmp

import (
	"context"
	"fmt"
	"time"

	"go.uber.org/zap"
)

type LineListProvider interface {
	GetLineList(ctx context.Context) ([]map[string]interface{}, error)
}

func (c *Connection) SendCallback(method string, args ...interface{}) error {
	if c == nil {
		return fmt.Errorf("connection is nil")
	}
	args = normalizeTextCallbackArgs(method, args, c.chatLinkResolver)
	t := c.GetTransport()
	if t == nil {
		return fmt.Errorf("transport not initialized")
	}
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	return t.WriteCommand(ctx, method, args)
}

func (c *Connection) SendCallbackSync(method string, args ...interface{}) error {
	if c == nil {
		return fmt.Errorf("connection is nil")
	}
	args = normalizeTextCallbackArgs(method, args, c.chatLinkResolver)
	t := c.GetTransport()
	if t == nil {
		return fmt.Errorf("transport not initialized")
	}
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	return t.WriteCommandSync(ctx, method, args)
}

func (c *Connection) sendOnLineListCallback() {
	version := "0.9.9a33.490"

	var lineList []map[string]interface{}

	if c.lineListProvider != nil {
		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		defer cancel()

		var err error
		lineList, err = c.lineListProvider.GetLineList(ctx)
		if err != nil {
			c.logger.Error("Failed to get line list from provider",
				zap.Uint32("conn_id", c.ID),
				zap.Error(err))
			lineList = []map[string]interface{}{}
		}
	} else {
		c.logger.Warn("No line list provider configured",
			zap.Uint32("conn_id", c.ID))
		lineList = []map[string]interface{}{}
	}

	info := map[string]interface{}{
		"lastLogInfo":  "",
		"loginTimes":   1,
		"forceRefresh": false,
		"lineList":     lineList,
	}

	if err := c.SendCallbackSync("onLineList", version, info); err != nil {
		c.logger.Error("Failed to send onLineList callback",
			zap.Uint32("conn_id", c.ID),
			zap.Error(err))
	}
}

func (c *Connection) sendOnIclCallback() {
	if c.dispatcher == nil {
		c.logger.Error("Cannot send onIcl: dispatcher not set",
			zap.Uint32("conn_id", c.ID))
		return
	}

	_, err := c.dispatcher.Dispatch(c, "sendCharList", nil)
	if err != nil {
		c.logger.Error("Failed to dispatch sendCharList",
			zap.Uint32("conn_id", c.ID),
			zap.Error(err))
	}
}

func (c *Connection) SendConnectionStatus(code string, application string, description string) error {
	statusInfo := map[string]interface{}{
		"level":       "error",
		"code":        code,
		"description": description,
		"application": application,
	}
	return c.SendCallbackSync("onStatus", statusInfo)
}

func (c *Connection) RejectConnection(applicationCode string, description string) error {
	err := c.SendConnectionStatus("NetConnection.Connect.Rejected", applicationCode, description)
	if err != nil {
		return err
	}
	go func() {
		time.Sleep(1 * time.Second)
		c.Close()
	}()
	return nil
}
