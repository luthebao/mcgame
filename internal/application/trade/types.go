// Open-sourced by BaoLT

// Trade service models and dependency interfaces.
package trade

import (
	"context"
	"sync"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"

	"go.uber.org/zap"
)

const (
	ActionStateNormal = 1
	ActionStateTrade  = 4
	maxTradeItems     = 5
	maxTradePets      = 5
)

type CharacterRepository interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
	Update(ctx context.Context, char *domainchar.Character) error
}

type ItemRepository interface {
	FindByID(ctx context.Context, id int64) (*domainitem.Item, error)
	Create(ctx context.Context, item *domainitem.Item) error
	Delete(ctx context.Context, id int64) error
	CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error)
	FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error)
}

type PetRepository interface {
	FindByID(ctx context.Context, id int64) (*domainpet.Pet, error)
	Count(ctx context.Context, characterID int64) (int, error)
}

type LockInput struct {
	Money   int64
	Gold    int64
	PetIDs  []int64
	ItemIDs map[int]int64
}

type TradeItemSlot struct {
	ItemID int64
	SID    int
}

type TradeCurrency struct {
	Money int64
	Gold  int64
}

type StartResult struct {
	TradeID     int64
	InitiatorID int64
	TargetID    int64
}

type StopResult struct {
	TradeID             int64
	InitiatorID         int64
	TargetID            int64
	StoppedBy           int64
	RestoredByCharacter map[int64][]TradeItemSlot
}

type LockResult struct {
	TradeID       int64
	LockerID      int64
	TargetID      int64
	OfferCallback map[string]interface{}
	HiddenItems   []TradeItemSlot
}

type ConfirmResult struct {
	TradeID             int64
	SelfID              int64
	TargetID            int64
	Completed           bool
	Failed              bool
	Info                string
	Received            []interface{}
	AddedByCharacter    map[int64][]map[string]interface{}
	RestoredByCharacter map[int64][]TradeItemSlot
	CurrencyByCharacter map[int64]TradeCurrency
}

type Service struct {
	charRepo CharacterRepository
	itemRepo ItemRepository
	petRepo  PetRepository
	logger   *zap.Logger

	mu          sync.Mutex
	nextTradeID int64
	sessions    map[int64]*tradeSession
	byCharacter map[int64]int64
}

type tradeSession struct {
	ID          int64
	InitiatorID int64
	TargetID    int64
	CreatedAt   time.Time
	Offers      map[int64]*tradeOffer
	Executing   bool
}

type tradeOffer struct {
	Money     int64
	Gold      int64
	PetIDs    []int64
	Items     map[int]*offeredItem
	Locked    bool
	Confirmed bool
}

type offeredItem struct {
	Slot     int
	ItemID   int64
	SID      int
	Snapshot map[string]interface{}
}
