// Open-sourced by BaoLT

// RTMP server handling connections, session management, and scene cleanup.
// Manages client sessions with sync.Map, provides broadcast functionality.
// Includes stale connection cleanup (60s timeout, 15s check interval).
package rtmp

import (
	"context"
	"errors"
	"fmt"
	"io"
	"net"
	"strconv"
	"sync"
	"time"

	"mcgame-server/internal/infrastructure/config"
	"mcgame-server/internal/presentation/rtmp/chatfmt"

	"mcgame-server/pkg/rtmp"

	proxyproto "github.com/pires/go-proxyproto"
	"github.com/sirupsen/logrus"
	"go.uber.org/zap"
)

type PlayerCacheInterface interface {
	SaveAndEvict(ctx context.Context, charID int64) error
	SaveAndEvictHotState(ctx context.Context, charID int64) error
}

type Server struct {
	config                  config.RTMPConfig
	logger                  *zap.Logger
	dispatcher              *RPCDispatcher
	rtmpServer              *rtmp.Server
	listener                net.Listener
	sessions                sync.Map
	nextConnID              uint32
	connMutex               sync.Mutex
	ctx                     context.Context
	cancel                  context.CancelFunc
	lineListProvider        LineListProvider
	lineServerOnlineChecker LineServerOnlineChecker
	chatLinkResolver        chatfmt.LinkResolver
	disconnectNotifier      DisconnectNotifier
	characterDisconnectFn   func(context.Context, *Connection, int64)
	sceneManager            *SceneManager
	playerCache             PlayerCacheInterface
	sendShutdownStatusFn    func(conn *Connection, payload map[string]interface{}) error
}

func NewServer(cfg config.RTMPConfig, logger *zap.Logger, dispatcher *RPCDispatcher) *Server {
	ctx, cancel := context.WithCancel(context.Background())
	sceneManager := NewSceneManager()
	sceneManager.SetLogger(logger)
	s := &Server{
		config:       cfg,
		logger:       logger,
		dispatcher:   dispatcher,
		ctx:          ctx,
		cancel:       cancel,
		sceneManager: sceneManager,
	}

	s.sendShutdownStatusFn = func(conn *Connection, payload map[string]interface{}) error {
		return conn.SendCallback("onStatus", payload)
	}

	s.rtmpServer = rtmp.NewServer(&rtmp.ServerConfig{
		OnConnect: s.onConnect,
	})

	return s
}

func (s *Server) AllocateConnection() *Connection {
	s.connMutex.Lock()
	connID := s.nextConnID
	s.nextConnID++
	s.connMutex.Unlock()

	conn := NewConnection(connID, nil, s.dispatcher, s.logger)

	if s.lineListProvider != nil {
		conn.SetLineListProvider(s.lineListProvider)
	}

	if s.chatLinkResolver != nil {
		conn.SetChatLinkResolver(s.chatLinkResolver)
	}

	conn.SetOnlineChecker(s)

	if s.lineServerOnlineChecker != nil {
		conn.SetLineServerOnlineChecker(s.lineServerOnlineChecker)
	}

	conn.SetOnCloseCallback(s.RemoveConnection)

	if s.disconnectNotifier != nil {
		conn.SetDisconnectNotifier(s.disconnectNotifier)
	}

	s.sessions.Store(connID, conn)

	return conn
}

func (s *Server) onConnect(netConn net.Conn) (io.ReadWriteCloser, *rtmp.ConnConfig) {
	conn := s.AllocateConnection()
	conn.netConn = netConn

	rtmpLogger := logrus.New()
	rtmpLogger.SetLevel(logrus.WarnLevel)

	return netConn, &rtmp.ConnConfig{
		Handler: conn,
		Logger:  rtmpLogger.WithField("conn_id", conn.ID),
		ControlState: rtmp.StreamControlStateConfig{
			DefaultChunkSize:     uint32(s.config.ChunkSize),
			MaxChunkSize:         0xffffff,
			DefaultAckWindowSize: int32(s.config.WindowAckSize),
			MaxMessageStreams:    64,
			MaxMessageSize:       1 * 1024 * 1024,
		},
	}
}

func (s *Server) Start() error {
	addr := s.config.Address()
	raw, err := net.Listen("tcp", addr)
	if err != nil {
		return fmt.Errorf("failed to listen on %s: %w", addr, err)
	}

	var listener net.Listener = raw
	if s.config.TrustProxyProtocol {
		listener = &proxyproto.Listener{
			Listener:          raw,
			ReadHeaderTimeout: 5 * time.Second,
			ConnPolicy: func(opts proxyproto.ConnPolicyOptions) (proxyproto.Policy, error) {
				return proxyproto.REQUIRE, nil
			},
		}
	}
	s.listener = listener

	s.logger.Info("RTMP server started",
		zap.String("address", addr),
		zap.Int("max_connections", s.config.MaxConnections),
		zap.Bool("proxy_protocol", s.config.TrustProxyProtocol),
	)

	go s.runStaleConnectionCleanup()

	return s.rtmpServer.Serve(listener)
}

func (s *Server) Stop() error {
	s.cancel()

	activeConnections := s.snapshotConnections()
	s.sendShutdownStatusCallbacks(activeConnections)
	time.Sleep(shutdownCallbackDrainTimeout)

	if s.rtmpServer != nil {
		if err := s.rtmpServer.Close(); err != nil {
			s.logger.Error("Error closing RTMP server", zap.Error(err))
		}
	}

	if s.listener != nil {
		if err := s.listener.Close(); err != nil && !errors.Is(err, net.ErrClosed) {
			return err
		}
	}

	for _, conn := range activeConnections {
		conn.Close()
	}

	s.logger.Info("RTMP server stopped")
	return nil
}

func (s *Server) buildShutdownStatusPayload() map[string]interface{} {
	return map[string]interface{}{
		"level":       "status",
		"code":        "NetConnection.Connect.Closed",
		"description": "Server is shutting down",
		"application": ServerNotReady,
	}
}

func (s *Server) snapshotConnections() []*Connection {
	connections := make([]*Connection, 0)
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			connections = append(connections, conn)
		}
		return true
	})
	return connections
}

func (s *Server) sendShutdownStatusCallbacks(connections []*Connection) {
	payload := s.buildShutdownStatusPayload()
	for _, conn := range connections {
		if err := s.sendShutdownStatusFn(conn, payload); err != nil {
			s.logger.Warn("Failed to send shutdown status callback",
				zap.Uint32("conn_id", conn.ID),
				zap.Error(err))
		}
	}
}

func (s *Server) GetConnection(connID uint32) *Connection {
	if val, ok := s.sessions.Load(connID); ok {
		return val.(*Connection)
	}
	return nil
}

func (s *Server) BroadcastToAll(method string, data interface{}) {
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			conn.SendCallback(method, data)
		}
		return true
	})
}

func (s *Server) RemoveConnection(connID uint32) {
	if val, ok := s.sessions.Load(connID); ok {
		if conn, ok := val.(*Connection); ok {
			roomID, charID := conn.GetSceneInfo()
			channelID := conn.GetChannelID()

			if s.playerCache != nil && charID > 0 {
				if err := s.playerCache.SaveAndEvict(context.Background(), charID); err != nil {
					s.logger.Error("Failed to save player data on disconnect",
						zap.Uint32("conn_id", connID),
						zap.Int64("char_id", charID),
						zap.Error(err))
				}

				if err := s.playerCache.SaveAndEvictHotState(context.Background(), charID); err != nil {
					s.logger.Warn("Failed to save hot state on disconnect",
						zap.Uint32("conn_id", connID),
						zap.Int64("char_id", charID),
						zap.Error(err))
				}
			}

			if s.characterDisconnectFn != nil && charID > 0 {
				s.characterDisconnectFn(context.Background(), conn, charID)
			}

			if roomID > 0 && charID > 0 {
				s.logger.Info("Player disconnecting from room",
					zap.Uint32("conn_id", connID),
					zap.Int("channel_id", channelID),
					zap.Int("room_id", roomID),
					zap.Int64("char_id", charID),
					zap.Int("room_players_before", s.sceneManager.GetScenePlayerCount(channelID, roomID)))

				s.sceneManager.RemoveFromScene(channelID, roomID, connID)
				s.sceneManager.BroadcastToScene(channelID, roomID, 0, "onCharLeaveScene", charID)

				s.logger.Info("Player removed from room on disconnect",
					zap.Uint32("conn_id", connID),
					zap.Int("channel_id", channelID),
					zap.Int("room_id", roomID),
					zap.Int64("char_id", charID),
					zap.Int("room_players_after", s.sceneManager.GetScenePlayerCount(channelID, roomID)))
			}
		}
	}
	s.sessions.Delete(connID)
}

func (s *Server) SetCharacterDisconnectHandler(handler func(context.Context, *Connection, int64)) {
	s.characterDisconnectFn = handler
}

func (s *Server) ConnectionCount() int {
	count := 0
	s.sessions.Range(func(key, value interface{}) bool {
		count++
		return true
	})
	return count
}

func (s *Server) GetConnectionByCharacterID(characterID string) *Connection {
	var found *Connection
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			session := conn.GetSession()
			mapID, _ := conn.GetSceneInfo()
			// Only consider online if character has entered a map
			if session != nil && session.CharacterID == characterID && mapID > 0 {
				found = conn
				return false
			}
		}
		return true
	})
	return found
}

func (s *Server) IsCharacterOnline(characterID string) bool {
	return s.GetConnectionByCharacterID(characterID) != nil
}

func (s *Server) BroadcastToCharacter(characterID int64, method string, payload interface{}) error {
	charIDStr := strconv.FormatInt(characterID, 10)
	conn := s.GetConnectionByCharacterID(charIDStr)
	if conn == nil {
		return nil
	}
	return conn.SendCallback(method, payload)
}

func (s *Server) GetOnlineCharacterIDs() []string {
	var ids []string
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			session := conn.GetSession()
			mapID, _ := conn.GetSceneInfo()
			// Only consider online if character has entered a map
			if session != nil && session.CharacterID != "" && mapID > 0 {
				ids = append(ids, session.CharacterID)
			}
		}
		return true
	})
	return ids
}

func (s *Server) GetConnectionByAccountID(accountID string) *Connection {
	var found *Connection
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			session := conn.GetSession()
			if session != nil && session.AccountID == accountID {
				found = conn
				return false
			}
		}
		return true
	})
	return found
}

func (s *Server) IsAccountOnline(accountID string, excludeConnID uint32) bool {
	if accountID == "" {
		return false
	}
	var found bool
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			if conn.ID == excludeConnID {
				return true
			}
			session := conn.GetSession()
			if session != nil && session.AccountID == accountID {
				found = true
				return false
			}
		}
		return true
	})
	return found
}

func (s *Server) ForceDisconnectAccount(accountID string, excludeConnID uint32) int {
	if accountID == "" {
		return 0
	}

	var targets []*Connection
	s.sessions.Range(func(key, value interface{}) bool {
		conn, ok := value.(*Connection)
		if !ok {
			return true
		}
		if conn.ID == excludeConnID {
			return true
		}
		session := conn.GetSession()
		if session == nil || session.AccountID != accountID {
			return true
		}
		targets = append(targets, conn)
		return true
	})

	for _, conn := range targets {
		if err := conn.SendCallbackSync("onKickChar", int64(1)); err != nil {
			s.logger.Warn("ForceDisconnectAccount: failed to send onKickChar",
				zap.String("account_id", accountID),
				zap.Uint32("conn_id", conn.ID),
				zap.Error(err))
		}
		closedStatus := map[string]interface{}{
			"level":       "status",
			"code":        "NetConnection.Connect.Closed",
			"description": "kicked by another login",
			"application": "",
		}
		if err := conn.SendCallbackSync("onStatus", closedStatus); err != nil {
			s.logger.Warn("ForceDisconnectAccount: failed to send onStatus Closed",
				zap.String("account_id", accountID),
				zap.Uint32("conn_id", conn.ID),
				zap.Error(err))
		}
		time.Sleep(500 * time.Millisecond)
		conn.Close()
		s.RemoveConnection(conn.ID)
	}

	disconnected := len(targets)

	if disconnected > 0 {
		s.logger.Info("Force disconnected account sessions",
			zap.String("account_id", accountID),
			zap.Int("count", disconnected),
			zap.Uint32("exclude_conn_id", excludeConnID))
	}

	return disconnected
}

func (s *Server) KickChannel(channelID int, reason string) int {
	if channelID <= 0 {
		return 0
	}

	var targets []*Connection
	s.sessions.Range(func(key, value interface{}) bool {
		conn, ok := value.(*Connection)
		if !ok {
			return true
		}
		if conn.GetChannelID() != channelID {
			return true
		}
		targets = append(targets, conn)
		return true
	})

	if len(targets) == 0 {
		return 0
	}

	if reason == "" {
		reason = "line taken offline"
	}

	s.kickConnections(targets, reason, "KickChannel",
		zap.Int("channel_id", channelID),
		zap.String("reason", reason))

	return len(targets)
}

func (s *Server) KickAll(reason string) int {
	var targets []*Connection
	s.sessions.Range(func(key, value interface{}) bool {
		conn, ok := value.(*Connection)
		if !ok {
			return true
		}
		targets = append(targets, conn)
		return true
	})

	if len(targets) == 0 {
		return 0
	}

	if reason == "" {
		reason = "server entering maintenance"
	}

	s.kickConnections(targets, reason, "KickAll",
		zap.String("reason", reason))

	return len(targets)
}

func (s *Server) kickConnections(targets []*Connection, description, source string, logFields ...zap.Field) {
	for _, conn := range targets {
		if err := conn.SendCallbackSync("onKickChar", int64(2)); err != nil {
			s.logger.Warn(source+": failed to send onKickChar",
				zap.Uint32("conn_id", conn.ID),
				zap.Error(err))
		}
		closedStatus := map[string]interface{}{
			"level":       "status",
			"code":        "NetConnection.Connect.Closed",
			"description": description,
			"application": "",
		}
		if err := conn.SendCallbackSync("onStatus", closedStatus); err != nil {
			s.logger.Warn(source+": failed to send onStatus Closed",
				zap.Uint32("conn_id", conn.ID),
				zap.Error(err))
		}
	}

	time.Sleep(500 * time.Millisecond)

	for _, conn := range targets {
		conn.Close()
		s.RemoveConnection(conn.ID)
	}

	s.logger.Info(source+": kicked sessions",
		append(logFields, zap.Int("count", len(targets)))...)
}

func (s *Server) GetConnectionByUsername(username string) *Connection {
	var found *Connection
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			session := conn.GetSession()
			if session != nil && session.Username == username {
				found = conn
				return false
			}
		}
		return true
	})
	return found
}

func (s *Server) IsUsernameOnline(username string, excludeConnID uint32) bool {
	if username == "" {
		return false
	}
	var found bool
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			if conn.ID == excludeConnID {
				return true
			}
			session := conn.GetSession()
			if session != nil && session.Username == username {
				found = true
				return false
			}
		}
		return true
	})
	return found
}

func (s *Server) SetLineListProvider(provider LineListProvider) {
	s.lineListProvider = provider
}

func (s *Server) SetLineServerOnlineChecker(checker LineServerOnlineChecker) {
	s.lineServerOnlineChecker = checker
}

func (s *Server) SetChatLinkResolver(resolver chatfmt.LinkResolver) {
	s.chatLinkResolver = resolver
}

func (s *Server) SetDisconnectNotifier(notifier DisconnectNotifier) {
	s.disconnectNotifier = notifier
}

func (s *Server) SetPlayerCache(cache PlayerCacheInterface) {
	s.playerCache = cache
}

func (s *Server) GetOnlineAccountIDs() []string {
	var ids []string
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			session := conn.GetSession()
			if session != nil && session.AccountID != "" {
				ids = append(ids, session.AccountID)
			}
		}
		return true
	})
	return ids
}

func (s *Server) GetSceneManager() *SceneManager {
	return s.sceneManager
}

func (s *Server) GetChannelConnectionCount(channelID int) int {
	count := 0
	s.sessions.Range(func(key, value interface{}) bool {
		if conn, ok := value.(*Connection); ok {
			if conn.GetChannelID() == channelID {
				count++
			}
		}
		return true
	})
	return count
}

const (
	connectionTimeout            = 60 * time.Second
	cleanupInterval              = 15 * time.Second
	shutdownCallbackDrainTimeout = 1 * time.Second
)

func (s *Server) runStaleConnectionCleanup() {
	ticker := time.NewTicker(cleanupInterval)
	defer ticker.Stop()

	for {
		select {
		case <-s.ctx.Done():
			s.logger.Debug("Stale connection cleanup routine stopped")
			return
		case <-ticker.C:
			s.cleanupStaleConnections()
		}
	}
}

func (s *Server) cleanupStaleConnections() {
	var staleConns []*Connection

	s.sessions.Range(func(key, value interface{}) bool {
		conn, ok := value.(*Connection)
		if !ok {
			return true
		}

		if conn.IsStale(connectionTimeout) {
			staleConns = append(staleConns, conn)
		}
		return true
	})

	for _, conn := range staleConns {

		conn.Close()
		s.RemoveConnection(conn.ID)
	}

	if len(staleConns) > 0 {
		s.logger.Info("Cleaned up stale connections", zap.Int("count", len(staleConns)), zap.Int("remaining", s.ConnectionCount()))
	}
}

