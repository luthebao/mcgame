// Open-sourced by BaoLT

// Admin HTTP server exposes read/write endpoints for the web dashboard.
package adminhttp

import (
	"context"
	"encoding/json"
	"errors"
	"net/http"
	"time"

	"go.uber.org/zap"

	appactivity "mcgame-server/internal/application/activity"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/social"
	"mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata/models"
	"mcgame-server/internal/infrastructure/cache"
	"mcgame-server/internal/infrastructure/config"
	"mcgame-server/internal/infrastructure/rtmp"
)

type SessionProvider interface {
	GetOnlineSessionSnapshots() []rtmp.OnlineSessionSnapshot
	GetConnectionByCharacterID(characterID string) *rtmp.Connection
	BroadcastToAll(method string, data interface{})
}

type HotStateProvider interface {
	GetHotState(charID int64) *cache.PlayerHotState
}

type CharacterProvider interface {
	FindByID(ctx context.Context, id int64) (*character.Character, error)
}

type CharacterUpdater interface {
	Update(ctx context.Context, char *character.Character) error
}

type PlayerTransporter interface {
	TransportPlayer(charID int64, mapID, x, y int) bool
}

type CharacterCacheUpdater interface {
	UpdateCachedCharacter(charID int64, fn func(*character.Character)) *character.Character
}

type ItemProvider interface {
	FindByCharacterID(ctx context.Context, charID int64) ([]*item.Item, error)
	FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType item.SlotType) ([]*item.Item, error)
	Create(ctx context.Context, it *item.Item) error
	Update(ctx context.Context, it *item.Item) error
	UpdateStack(ctx context.Context, id int64, stackCount int) error
	Delete(ctx context.Context, id int64) error
}

type ItemFinder interface {
	FindByID(ctx context.Context, id int64) (*item.Item, error)
}

type ItemTemplateProvider interface {
	GetEquipmentTemplate(templateID int) *models.EquiptTemplateTemplate
	GetItemTemplate(templateID int) *models.ItemTemplateTemplate
}

type PetProvider interface {
	FindByID(ctx context.Context, id int64) (*pet.Pet, error)
	FindByCharacterID(ctx context.Context, characterID int64) ([]*pet.Pet, error)
	Save(ctx context.Context, p *pet.Pet) error
	Delete(ctx context.Context, id int64) error
}

type PlayerDataSaver interface {
	SavePlayer(ctx context.Context, charID int64) error
}

type StatFeatureStore interface {
	ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*statfeature.CharacterFeatureState, error)
	UpsertCharacterFeatureState(ctx context.Context, state *statfeature.CharacterFeatureState) error
}

type RelationshipStore interface {
	ListByCharacterAll(ctx context.Context, characterID int64) ([]*social.Relationship, error)
	CreateTyped(ctx context.Context, rel *social.Relationship) error
	Create(ctx context.Context, rel *social.Relationship) error
	UpdateIntimacy(ctx context.Context, id int64, intimacy int) error
	UpdateNickname(ctx context.Context, id int64, nickname string) error
	UpdateGroup(ctx context.Context, id int64, groupID int) error
	ChangeType(ctx context.Context, id int64, newType int) error
	DeleteByIDAny(ctx context.Context, id int64) error
	GetCharacterIDByName(ctx context.Context, name string) (int64, string, error)
}

type Server struct {
	config                config.AdminHTTPConfig
	environment           string
	logger                *zap.Logger
	sessionProvider       SessionProvider
	hotStateProvider      HotStateProvider
	characterProvider     CharacterProvider
	characterUpdater      CharacterUpdater
	characterCacheUpdater CharacterCacheUpdater
	playerTransporter     PlayerTransporter
	itemProvider          ItemProvider
	itemFinder            ItemFinder
	templateProvider      ItemTemplateProvider
	petProvider           PetProvider
	playerDataSaver       PlayerDataSaver
	statFeatureStore      StatFeatureStore
	relationshipStore     RelationshipStore
	activityService       *appactivity.StartedActivityService
	server                *http.Server
}

type playerSessionItem struct {
	CharacterID int64  `json:"characterId"`
	AccountID   string `json:"accountId"`
	Username    string `json:"username"`
	MapID       int    `json:"mapId"`
	ChannelID   int    `json:"channelId"`
	LastActive  string `json:"lastActiveAt"`
	ConnectedAt string `json:"connectedAt"`
	Position    struct {
		X int `json:"x"`
		Y int `json:"y"`
	} `json:"position"`
}

type playerSessionsResponse struct {
	OK          bool                `json:"ok"`
	Items       []playerSessionItem `json:"items"`
	Total       int                 `json:"total"`
	RefreshedAt string              `json:"refreshedAt"`
}

func NewServer(
	cfg config.AdminHTTPConfig,
	environment string,
	logger *zap.Logger,
	sessionProvider SessionProvider,
	hotStateProvider HotStateProvider,
	characterProvider CharacterProvider,
	characterUpdater CharacterUpdater,
	characterCacheUpdater CharacterCacheUpdater,
	playerTransporter PlayerTransporter,
	itemProvider ItemProvider,
	itemFinder ItemFinder,
	templateProvider ItemTemplateProvider,
	petProvider PetProvider,
	playerDataSaver PlayerDataSaver,
	statFeatureStore StatFeatureStore,
	relationshipStore RelationshipStore,
	activityService *appactivity.StartedActivityService,
) *Server {
	return &Server{
		config:                cfg,
		environment:           environment,
		logger:                logger,
		sessionProvider:       sessionProvider,
		hotStateProvider:      hotStateProvider,
		characterProvider:     characterProvider,
		characterUpdater:      characterUpdater,
		characterCacheUpdater: characterCacheUpdater,
		playerTransporter:     playerTransporter,
		itemProvider:          itemProvider,
		itemFinder:            itemFinder,
		templateProvider:      templateProvider,
		petProvider:           petProvider,
		playerDataSaver:       playerDataSaver,
		statFeatureStore:      statFeatureStore,
		relationshipStore:     relationshipStore,
		activityService:       activityService,
	}
}

func (s *Server) Start() error {
	mux := http.NewServeMux()
	mux.HandleFunc("/api/admin/players/sessions", s.handlePlayerSessions)
	mux.HandleFunc("/api/admin/players/send-item", s.handlePlayerSendItem)
	mux.HandleFunc("/api/admin/players/action", s.handlePlayerAction)
	mux.HandleFunc("/api/admin/activities/broadcast", s.handleActivityBroadcast)
	mux.HandleFunc("/health", s.handleHealth)

	s.server = &http.Server{
		Addr:    s.config.Address(),
		Handler: mux,
	}

	s.logger.Info("Admin HTTP server starting", zap.String("addr", s.config.Address()))

	err := s.server.ListenAndServe()
	if errors.Is(err, http.ErrServerClosed) {
		return nil
	}

	return err
}

func (s *Server) Stop() {
	if s.server == nil {
		return
	}

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	_ = s.server.Shutdown(ctx)
}

func (s *Server) handleHealth(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	_, _ = w.Write([]byte("OK"))
}

func (s *Server) handlePlayerSessions(w http.ResponseWriter, r *http.Request) {
	if r.Method != http.MethodGet {
		http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
		return
	}

	snapshots := s.sessionProvider.GetOnlineSessionSnapshots()
	items := make([]playerSessionItem, 0, len(snapshots))

	for _, snapshot := range snapshots {
		item := playerSessionItem{
			CharacterID: snapshot.CharacterIDNum,
			AccountID:   snapshot.AccountID,
			Username:    snapshot.Username,
			MapID:       snapshot.MapID,
			ChannelID:   snapshot.ChannelID,
			LastActive:  snapshot.LastActive.UTC().Format(time.RFC3339Nano),
			ConnectedAt: snapshot.ConnectedAt.UTC().Format(time.RFC3339Nano),
		}

		if s.hotStateProvider != nil {
			if hotState := s.hotStateProvider.GetHotState(snapshot.CharacterIDNum); hotState != nil {
				item.Position.X = int(hotState.PosX)
				item.Position.Y = int(hotState.PosY)
				if hotState.MapID > 0 {
					item.MapID = int(hotState.MapID)
				}
			}
		}

		items = append(items, item)
	}

	s.writeJSON(w, http.StatusOK, playerSessionsResponse{
		OK:          true,
		Items:       items,
		Total:       len(items),
		RefreshedAt: time.Now().UTC().Format(time.RFC3339Nano),
	})
}

func (s *Server) writeJSON(w http.ResponseWriter, status int, payload interface{}) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	_ = json.NewEncoder(w).Encode(payload)
}

func (s *Server) storeReady(w http.ResponseWriter, ready bool, name string) bool {
	if ready {
		return true
	}
	s.writeJSON(w, http.StatusNotImplemented, adminErrorResponse{OK: false, Message: name + " not configured"})
	return false
}
