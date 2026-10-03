// Open-sourced by BaoLT

package trade

import (
	"context"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type tradeCharacterRepo struct {
	chars map[int64]*domainchar.Character
}

func newTradeCharacterRepo(chars ...*domainchar.Character) *tradeCharacterRepo {
	store := make(map[int64]*domainchar.Character, len(chars))
	for _, char := range chars {
		copy := *char
		store[char.ID] = &copy
	}
	return &tradeCharacterRepo{chars: store}
}

func (r *tradeCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	char, ok := r.chars[id]
	if !ok {
		return nil, pkgerrors.ErrCharacterNotFound
	}
	copy := *char
	return &copy, nil
}

func (r *tradeCharacterRepo) Update(ctx context.Context, char *domainchar.Character) error {
	if _, ok := r.chars[char.ID]; !ok {
		return pkgerrors.ErrCharacterNotFound
	}
	copy := *char
	r.chars[char.ID] = &copy
	return nil
}

type tradeItemRepo struct {
	nextID int64
	items  map[int64]*domainitem.Item
}

func newTradeItemRepo(items ...*domainitem.Item) *tradeItemRepo {
	store := make(map[int64]*domainitem.Item, len(items))
	var nextID int64 = 1
	for _, item := range items {
		copy := *item
		store[item.ID] = &copy
		if item.ID >= nextID {
			nextID = item.ID + 1
		}
	}
	return &tradeItemRepo{
		nextID: nextID,
		items:  store,
	}
}

func (r *tradeItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	item, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	copy := *item
	if item.Properties != nil {
		copy.Properties = make(map[string]interface{}, len(item.Properties))
		for key, value := range item.Properties {
			copy.Properties[key] = value
		}
	}
	return &copy, nil
}

func (r *tradeItemRepo) Create(ctx context.Context, item *domainitem.Item) error {
	copy := *item
	copy.ID = r.nextID
	r.nextID++
	if item.Properties != nil {
		copy.Properties = make(map[string]interface{}, len(item.Properties))
		for key, value := range item.Properties {
			copy.Properties[key] = value
		}
	}
	r.items[copy.ID] = &copy
	item.ID = copy.ID
	return nil
}

func (r *tradeItemRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *tradeItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

func (r *tradeItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	occupied := make(map[int]bool)
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType {
			occupied[item.SlotIndex] = true
		}
	}
	for slot := 0; slot < maxSlots; slot++ {
		if !occupied[slot] {
			return slot, nil
		}
	}
	return -1, pkgerrors.ErrInventoryFull
}

type tradePetRepo struct{}

func (r *tradePetRepo) FindByID(ctx context.Context, id int64) (*domainpet.Pet, error) {
	return nil, pkgerrors.ErrNotFound
}

func (r *tradePetRepo) Count(ctx context.Context, characterID int64) (int, error) {
	return 0, nil
}

func TestStartTradeReservesParticipants(t *testing.T) {
	charRepo := newTradeCharacterRepo(
		&domainchar.Character{ID: 1, Name: "Alpha", BagSlotNum: 1},
		&domainchar.Character{ID: 2, Name: "Beta", BagSlotNum: 1},
		&domainchar.Character{ID: 3, Name: "Gamma", BagSlotNum: 1},
	)
	service := NewService(charRepo, newTradeItemRepo(), &tradePetRepo{}, zap.NewNop())

	result, err := service.StartTrade(context.Background(), 1, 2)
	if err != nil {
		t.Fatalf("StartTrade returned error: %v", err)
	}
	if result.InitiatorID != 1 || result.TargetID != 2 {
		t.Fatalf("unexpected trade participants: %+v", result)
	}

	if _, err := service.StartTrade(context.Background(), 1, 3); err == nil {
		t.Fatal("expected initiator already in trade error")
	}
	if _, err := service.StartTrade(context.Background(), 3, 2); err == nil {
		t.Fatal("expected target already in trade error")
	}

	stopResult, err := service.StopTrade(context.Background(), 1)
	if err != nil {
		t.Fatalf("StopTrade returned error: %v", err)
	}
	if stopResult == nil || stopResult.TradeID != result.TradeID {
		t.Fatalf("unexpected stop result: %+v", stopResult)
	}
}

func TestConfirmTradeExchangesItemsAndCurrency(t *testing.T) {
	charRepo := newTradeCharacterRepo(
		&domainchar.Character{ID: 1, Name: "Alpha", Money: 100, Gold: 5, BagSlotNum: 1},
		&domainchar.Character{ID: 2, Name: "Beta", Money: 40, Gold: 2, BagSlotNum: 1},
	)
	itemRepo := newTradeItemRepo(
		&domainitem.Item{ID: 10, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, Properties: map[string]interface{}{"bonus": "a"}},
		&domainitem.Item{ID: 20, CharacterID: 2, TemplateID: 2002, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 3, Properties: map[string]interface{}{"bonus": "b"}},
	)
	service := NewService(charRepo, itemRepo, &tradePetRepo{}, zap.NewNop())

	if _, err := service.StartTrade(context.Background(), 1, 2); err != nil {
		t.Fatalf("StartTrade returned error: %v", err)
	}
	if _, err := service.LockTrade(context.Background(), 1, &LockInput{Money: 50, Gold: 3, ItemIDs: map[int]int64{1: 10}}); err != nil {
		t.Fatalf("LockTrade initiator returned error: %v", err)
	}
	if _, err := service.LockTrade(context.Background(), 2, &LockInput{Money: 10, Gold: 1, ItemIDs: map[int]int64{1: 20}}); err != nil {
		t.Fatalf("LockTrade target returned error: %v", err)
	}

	firstConfirm, err := service.ConfirmTrade(context.Background(), 1)
	if err != nil {
		t.Fatalf("first ConfirmTrade returned error: %v", err)
	}
	if firstConfirm.Completed {
		t.Fatal("expected first confirm to wait for target")
	}

	secondConfirm, err := service.ConfirmTrade(context.Background(), 2)
	if err != nil {
		t.Fatalf("second ConfirmTrade returned error: %v", err)
	}
	if !secondConfirm.Completed {
		t.Fatalf("expected completed trade, got %+v", secondConfirm)
	}
	if secondConfirm.Failed {
		t.Fatalf("expected successful trade, got failure %+v", secondConfirm)
	}
	if len(secondConfirm.Received) != 1 {
		t.Fatalf("expected receiver payload for one item, got %d", len(secondConfirm.Received))
	}

	initiator, _ := charRepo.FindByID(context.Background(), 1)
	target, _ := charRepo.FindByID(context.Background(), 2)
	if initiator.Money != 60 || initiator.Gold != 3 {
		t.Fatalf("unexpected initiator currency: money=%d gold=%d", initiator.Money, initiator.Gold)
	}
	if target.Money != 80 || target.Gold != 4 {
		t.Fatalf("unexpected target currency: money=%d gold=%d", target.Money, target.Gold)
	}

	if _, err := itemRepo.FindByID(context.Background(), 10); err == nil {
		t.Fatal("expected original initiator item to be deleted")
	}
	if _, err := itemRepo.FindByID(context.Background(), 20); err == nil {
		t.Fatal("expected original target item to be deleted")
	}

	var initiatorReceived *domainitem.Item
	var targetReceived *domainitem.Item
	for _, item := range itemRepo.items {
		if item.CharacterID == 1 && item.TemplateID == 2002 {
			initiatorReceived = item
		}
		if item.CharacterID == 2 && item.TemplateID == 1001 {
			targetReceived = item
		}
	}
	if initiatorReceived == nil || initiatorReceived.StackCount != 3 {
		t.Fatalf("expected initiator to receive target item, got %+v", initiatorReceived)
	}
	if targetReceived == nil || targetReceived.StackCount != 1 {
		t.Fatalf("expected target to receive initiator item, got %+v", targetReceived)
	}

	stopResult, err := service.StopTrade(context.Background(), 1)
	if err != nil {
		t.Fatalf("StopTrade after completion returned error: %v", err)
	}
	if stopResult != nil {
		t.Fatalf("expected completed trade to remove session, got %+v", stopResult)
	}
}

func TestLockTradeRejectsBoundItem(t *testing.T) {
	charRepo := newTradeCharacterRepo(
		&domainchar.Character{ID: 1, Name: "Alpha", BagSlotNum: 1},
		&domainchar.Character{ID: 2, Name: "Beta", BagSlotNum: 1},
	)
	itemRepo := newTradeItemRepo(
		&domainitem.Item{ID: 10, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, IsBound: true},
	)
	service := NewService(charRepo, itemRepo, &tradePetRepo{}, zap.NewNop())

	if _, err := service.StartTrade(context.Background(), 1, 2); err != nil {
		t.Fatalf("StartTrade returned error: %v", err)
	}
	if _, err := service.LockTrade(context.Background(), 1, &LockInput{ItemIDs: map[int]int64{1: 10}}); err == nil {
		t.Fatal("expected bound item rejection")
	}
}

func TestConfirmTradeReturnsFailureWhenExchangeFails(t *testing.T) {
	charRepo := newTradeCharacterRepo(
		&domainchar.Character{ID: 1, Name: "Alpha", Money: 0, Gold: 0, BagSlotNum: 1},
		&domainchar.Character{ID: 2, Name: "Beta", Money: 0, Gold: 0, BagSlotNum: 1},
	)
	items := []*domainitem.Item{
		{ID: 10, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1},
	}
	for i := 0; i < domainchar.SlotsPerBag; i++ {
		items = append(items, &domainitem.Item{ID: int64(20 + i), CharacterID: 2, TemplateID: 2002, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: i, StackCount: 1})
	}
	itemRepo := newTradeItemRepo(items...)
	service := NewService(charRepo, itemRepo, &tradePetRepo{}, zap.NewNop())

	if _, err := service.StartTrade(context.Background(), 1, 2); err != nil {
		t.Fatalf("StartTrade returned error: %v", err)
	}
	if _, err := service.LockTrade(context.Background(), 1, &LockInput{ItemIDs: map[int]int64{1: 10}}); err != nil {
		t.Fatalf("LockTrade initiator returned error: %v", err)
	}
	if _, err := service.LockTrade(context.Background(), 2, &LockInput{ItemIDs: map[int]int64{1: 20}}); err != nil {
		t.Fatalf("LockTrade target returned error: %v", err)
	}
	if _, err := service.ConfirmTrade(context.Background(), 1); err != nil {
		t.Fatalf("first ConfirmTrade returned error: %v", err)
	}

	result, err := service.ConfirmTrade(context.Background(), 2)
	if err != nil {
		t.Fatalf("second ConfirmTrade returned error: %v", err)
	}
	if !result.Failed {
		t.Fatalf("expected exchange failure, got %+v", result)
	}
	if result.Info == "" {
		t.Fatal("expected failure info")
	}
}
