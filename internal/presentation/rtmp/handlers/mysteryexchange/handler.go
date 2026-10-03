// Open-sourced by BaoLT

// Package mysteryexchange handles the password-gated Mystery Furnace exchange sinks.
//
// RPC contracts (both require a valid secondary/delete password via MD5):
//   - MysteryExchangeItem  [itemDict, md5pass] -> _result {currency snapshot}
//   - MysteryExchangeScore [scoreDict, md5pass] -> _result {num: newMysteryCrystal}
//
// Security envelope (all enforced before any mutation):
//  1. Password gate: md5pass verified against account.CheckSecondaryPassword; absent/empty/invalid -> generic sentinel.
//  2. Ownership re-validation: items checked against loaded inventory in Go (parameterized repo);
//     scores checked against loaded feature state.
//  3. Input hardening: map keys parsed as int64; md5pass capped at 64 bytes, control bytes rejected;
//     dict size capped at maxExchangeDictSize (256).
//  4. Economic integrity: mysteryCrystal re-read server-side; client balance never trusted.
//  5. SQLi regression: exchange_sqli_test.go covers handler-rejected and pass-through sentinels.
//
// Conversion rates are documented stubs (OPEN QUESTION: no server-side yield table available).
// The full security envelope is real and enforced regardless of stub economics.
package mysteryexchange

import (
	"context"

	appmystre "mcgame-server/internal/application/mysterytreasure"
	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type characterAccessor interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
	Save(ctx context.Context, char *domainchar.Character) error
}

type inventoryAccessor interface {
	GetInventory(ctx context.Context, charID int64) ([]*domainitem.Item, error)
	ConsumeItemByID(ctx context.Context, charID int64, itemID int64) error
}

type Handler struct {
	accountRepo domainauth.AccountRepository
	mysService  *appmystre.Service
	chars       characterAccessor
	inventory   inventoryAccessor
	logger      *zap.Logger
}

func NewHandler(
	accountRepo domainauth.AccountRepository,
	mysService *appmystre.Service,
	logger *zap.Logger,
) *Handler {
	return &Handler{
		accountRepo: accountRepo,
		mysService:  mysService,
		logger:      logger,
	}
}

func (h *Handler) SetCharacterService(svc characterAccessor) {
	h.chars = svc
}

func (h *Handler) SetInventoryService(svc inventoryAccessor) {
	h.inventory = svc
}

func (h *Handler) RegisterHandlers(dispatcher *rtmp.RPCDispatcher) {
	dispatcher.Register("MysteryExchangeItem", h.ExchangeItem)
	dispatcher.Register("MysteryExchangeScore", h.ExchangeScore)
}

func accountIDFromCtx(ctx *rtmp.RPCContext) (uuid.UUID, bool) {
	if ctx.AccountID == "" {
		return uuid.UUID{}, false
	}
	id, err := uuid.Parse(ctx.AccountID)
	if err != nil {
		return uuid.UUID{}, false
	}
	return id, true
}
