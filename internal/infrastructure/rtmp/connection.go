// Open-sourced by BaoLT

// Connection wrapper for RTMP client connections.
// Manages session state, scene tracking, and provides interfaces for online checking.
// App names: "tcn" for global/login server, "scene" for game server.
package rtmp

import (
	"net"
	"strings"
	"sync"
	"time"

	"mcgame-server/internal/presentation/rtmp/chatfmt"

	"go.uber.org/zap"
)

type OnlineChecker interface {
	IsUsernameOnline(username string, excludeConnID uint32) bool
	IsAccountOnline(accountID string, excludeConnID uint32) bool
	ForceDisconnectAccount(accountID string, excludeConnID uint32) int
}

type LineServerOnlineChecker interface {
	IsAccountOnlineOnLineServers(accountID string) bool
	RequestForceDisconnectOnLineServers(accountID string) error
}

type DisconnectNotifier interface {
	NotifyUserDisconnect(accountID string)
}

type Connection struct {
	ID                      uint32
	netConn                 net.Conn
	transport               Transport
	dispatcher              *RPCDispatcher
	logger                  *zap.Logger
	session                 *SessionContext
	lineListProvider        LineListProvider
	onlineChecker           OnlineChecker
	lineServerOnlineChecker LineServerOnlineChecker
	chatLinkResolver        chatfmt.LinkResolver
	disconnectNotifier      DisconnectNotifier
	onCloseCallback         func(connID uint32)
	mutex                   sync.RWMutex
	closeChan               chan struct{}
	closeOnce               sync.Once
	currentMapID            int
	currentChannelID        int
	characterIDNum          int64
	viewedFarmCharacterID   int64
	lastGuildBuildID        int
	lastGuildBuildType      int
	battleID                string
	expSkill                int64
	randomEncounterUntil    time.Time
	offlineSeconds          int64
	playerInFront           bool
}

type SessionContext struct {
	SessionID           string
	AccountID           string
	CharacterID         string
	Username            string
	State               int
	LastActive          time.Time
	RateLimits          map[string]time.Time
	AppName             string
	TCUrl               string
	Protocol            string
	ConnectedAt         time.Time
	NeedOnLineList      bool
	OnLineListConfirmed bool
	OnLineListStop      chan struct{}
}

func NewConnection(id uint32, netConn net.Conn, dispatcher *RPCDispatcher, logger *zap.Logger) *Connection {
	return &Connection{
		ID:         id,
		netConn:    netConn,
		dispatcher: dispatcher,
		logger:     logger,
		session: &SessionContext{
			RateLimits: make(map[string]time.Time),
			LastActive: time.Now(),
		},
		closeChan:     make(chan struct{}),
		playerInFront: false,
	}
}

func (c *Connection) SetTransport(t Transport) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.transport = t
}

func (c *Connection) GetTransport() Transport {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.transport
}

func (c *Connection) ResetSceneEntryRateLimits() {
	if c == nil {
		return
	}
	c.mutex.Lock()
	defer c.mutex.Unlock()
	if c.session == nil || c.session.RateLimits == nil {
		return
	}
	for _, method := range []string{"createChars", "createNpcs", "createBoss", "createSceneItems", "createGuildBuildings", "sceneLogin", "sceneChange", "toMovable", "toSafe"} {
		delete(c.session.RateLimits, method)
	}
}

func (c *Connection) Close() {
	c.closeOnce.Do(func() {
		close(c.closeChan)
		if c.session.OnLineListStop != nil {
			select {
			case <-c.session.OnLineListStop:
			default:
				close(c.session.OnLineListStop)
			}
		}
		if c.transport != nil {
			_ = c.transport.Close()
		}
		if c.netConn != nil {
			_ = c.netConn.Close()
		}
	})
}

func (c *Connection) SetSession(sessionID, accountID, username string) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.session.SessionID = sessionID
	c.session.AccountID = accountID
	c.session.Username = username
	c.session.State = 1
}

func (c *Connection) SetCharacter(characterID string) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.session.CharacterID = characterID
	c.session.State = 2
}

func (c *Connection) GetSession() *SessionContext {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.session
}

func (c *Connection) GetAppName() string {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.session.AppName
}

func (c *Connection) SetAppName(app string) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.session.AppName = app
}

func (c *Connection) IsGlobalConnection() bool {
	return isGlobalServerApp(c.GetAppName())
}

func (c *Connection) IsSceneConnection() bool {
	normalized := strings.TrimSuffix(c.GetAppName(), "/")
	return strings.HasPrefix(normalized, "line") || strings.HasPrefix(normalized, "scene")
}

func isGlobalServerApp(appName string) bool {
	normalized := strings.TrimSuffix(appName, "/")
	return normalized == "tcn" || normalized == "master/test"
}

func (c *Connection) SetLineListProvider(provider LineListProvider) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.lineListProvider = provider
}

func (c *Connection) SetOnlineChecker(checker OnlineChecker) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.onlineChecker = checker
}

func (c *Connection) GetOnlineChecker() OnlineChecker {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.onlineChecker
}

func (c *Connection) SetLineServerOnlineChecker(checker LineServerOnlineChecker) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.lineServerOnlineChecker = checker
}

func (c *Connection) SetChatLinkResolver(resolver chatfmt.LinkResolver) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.chatLinkResolver = resolver
}

func (c *Connection) GetLineServerOnlineChecker() LineServerOnlineChecker {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.lineServerOnlineChecker
}

func (c *Connection) SetOnCloseCallback(callback func(connID uint32)) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.onCloseCallback = callback
}

func (c *Connection) GetOnCloseCallback() func(connID uint32) {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.onCloseCallback
}

func (c *Connection) SetDisconnectNotifier(notifier DisconnectNotifier) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.disconnectNotifier = notifier
}

func (c *Connection) GetDisconnectNotifier() DisconnectNotifier {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.disconnectNotifier
}

func (c *Connection) SetSceneInfo(mapID int, characterID int64) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.currentMapID = mapID
	c.characterIDNum = characterID
}

func (c *Connection) GetSceneInfo() (int, int64) {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.currentMapID, c.characterIDNum
}

func (c *Connection) GetCharacterID() int64 {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.characterIDNum
}

func (c *Connection) SetViewedFarmCharacterID(characterID int64) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.viewedFarmCharacterID = characterID
}

func (c *Connection) GetViewedFarmCharacterID() int64 {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.viewedFarmCharacterID
}

func (c *Connection) SetChannelID(channelID int) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.currentChannelID = channelID
}

func (c *Connection) GetChannelID() int {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.currentChannelID
}

func (c *Connection) SetLastGuildBuildContext(buildID int, buildType int) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.lastGuildBuildID = buildID
	c.lastGuildBuildType = buildType
}

func (c *Connection) GetLastGuildBuildContext() (int, int) {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.lastGuildBuildID, c.lastGuildBuildType
}

func (c *Connection) SetOfflineSeconds(seconds int64) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	if seconds < 0 {
		seconds = 0
	}
	c.offlineSeconds = seconds
}

func (c *Connection) GetOfflineSeconds() int64 {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.offlineSeconds
}

func (c *Connection) SetExpSkill(val int64) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.expSkill = val
}

func (c *Connection) AddExpSkill(amount int64) int64 {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.expSkill += amount
	return c.expSkill
}

func (c *Connection) GetExpSkill() int64 {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.expSkill
}

func (c *Connection) SetBattleID(battleID string) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.battleID = battleID
}

func (c *Connection) GetBattleID() string {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.battleID
}

func (c *Connection) IsInBattle() bool {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.battleID != ""
}

func (c *Connection) ClearBattle() {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.battleID = ""
}

func (c *Connection) SetRandomEncounterCooldown(until time.Time) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.randomEncounterUntil = until
}

func (c *Connection) IsRandomEncounterOnCooldown(now time.Time) bool {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return !c.randomEncounterUntil.IsZero() && now.Before(c.randomEncounterUntil)
}

func (c *Connection) SetPlayerInFront(front bool) {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.playerInFront = front
}

func (c *Connection) IsPlayerInFront() bool {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.playerInFront
}

func (c *Connection) UpdateLastActive() {
	c.mutex.Lock()
	defer c.mutex.Unlock()
	c.session.LastActive = time.Now()
}

func (c *Connection) GetLastActive() time.Time {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return c.session.LastActive
}

func (c *Connection) IsStale(timeout time.Duration) bool {
	c.mutex.RLock()
	defer c.mutex.RUnlock()
	return time.Since(c.session.LastActive) > timeout
}
