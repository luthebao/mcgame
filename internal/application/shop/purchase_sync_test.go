// Open-sourced by BaoLT

package shop

import (
	"context"
	"encoding/json"
	"testing"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type purchaseSyncItemRepo struct {
	nextID int64
	items  map[int64]*domainitem.Item
}

func newPurchaseSyncItemRepo() *purchaseSyncItemRepo {
	return &purchaseSyncItemRepo{nextID: 1, items: make(map[int64]*domainitem.Item)}
}

func (r *purchaseSyncItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	it, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	copyItem := *it
	return &copyItem, nil
}

func (r *purchaseSyncItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID != charID {
			continue
		}
		copyItem := *it
		items = append(items, &copyItem)
	}
	return items, nil
}

func (r *purchaseSyncItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID != charID || it.SlotType != slotType {
			continue
		}
		copyItem := *it
		items = append(items, &copyItem)
	}
	return items, nil
}

func (r *purchaseSyncItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			copyItem := *it
			return &copyItem, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *purchaseSyncItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *purchaseSyncItemRepo) Create(ctx context.Context, it *domainitem.Item) error {
	copyItem := *it
	copyItem.ID = r.nextID
	r.nextID++
	r.items[copyItem.ID] = &copyItem
	it.ID = copyItem.ID
	return nil
}

func (r *purchaseSyncItemRepo) Update(ctx context.Context, it *domainitem.Item) error {
	if _, ok := r.items[it.ID]; !ok {
		return pkgerrors.ErrItemNotFound
	}
	copyItem := *it
	r.items[it.ID] = &copyItem
	return nil
}

func (r *purchaseSyncItemRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *purchaseSyncItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, it := range r.items {
		if it.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *purchaseSyncItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.SlotType = slotType
	it.SlotIndex = slotIndex
	return nil
}

func (r *purchaseSyncItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.StackCount = stackCount
	return nil
}

func (r *purchaseSyncItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	occupied := make(map[int]bool)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			occupied[it.SlotIndex] = true
		}
	}
	for i := 0; i < maxSlots; i++ {
		if !occupied[i] {
			return i, nil
		}
	}
	return -1, pkgerrors.ErrInventoryFull
}

func (r *purchaseSyncItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

func TestBuyItemReturnsTouchedBagSlotsForStackAndRemainder(t *testing.T) {
	ctx := context.Background()
	logger := zap.NewNop()
	itemRepo := newPurchaseSyncItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	manager := newPurchaseSyncTestManager(t, models.ItemTemplateTemplate{
		ID:         158,
		Name:       "Potion",
		Price:      1,
		StackMax:   99999,
		SingleFlag: 0,
		Kind:       0,
	})
	itemService.SetGameDataManager(manager)

	service := NewService()
	service.SetGameDataManager(manager)
	service.SetItemService(itemService)
	service.SetCharacterRepository(newVIPShopCharacterRepo(&character.Character{
		ID:         1,
		Name:       "buyer",
		MoneyBind:  200000,
		BagSlotNum: 1,
	}))

	existing := domainitem.NewItem(1, 158, domainitem.ItemTypeConsumable, domainitem.SlotTypeBag, 0)
	existing.StackCount = 15
	existing.IsBound = true
	if err := itemRepo.Create(ctx, existing); err != nil {
		t.Fatalf("seed existing item: %v", err)
	}

	result, err := service.BuyItem(ctx, 1, 158, 99999)
	if err != nil {
		t.Fatalf("BuyItem returned error: %v", err)
	}

	if len(result.AddedItemDTOs) != 2 {
		t.Fatalf("AddedItemDTOs len = %d, want 2", len(result.AddedItemDTOs))
	}

	if got := dtoInt(t, result.AddedItemDTOs[0], "itemId"); got != int(existing.ID) {
		t.Fatalf("first dto itemId = %d, want %d", got, existing.ID)
	}
	if got := dtoInt(t, result.AddedItemDTOs[0], "stackNum"); got != 99999 {
		t.Fatalf("first dto stackNum = %d, want 99999", got)
	}
	if got := dtoString(t, result.AddedItemDTOs[0], "binded"); got != "1" {
		t.Fatalf("first dto binded = %q, want 1", got)
	}

	if got := dtoInt(t, result.AddedItemDTOs[1], "stackNum"); got != 15 {
		t.Fatalf("second dto stackNum = %d, want 15", got)
	}
	if got := dtoString(t, result.AddedItemDTOs[1], "binded"); got != "1" {
		t.Fatalf("second dto binded = %q, want 1", got)
	}

	items, err := itemService.GetAllItems(ctx, 1)
	if err != nil {
		t.Fatalf("GetAllItems returned error: %v", err)
	}
	if len(items) != 2 {
		t.Fatalf("item count = %d, want 2", len(items))
	}
}

func TestBuyItemKeepsBoundStacksSeparateInPurchaseUpdates(t *testing.T) {
	ctx := context.Background()
	logger := zap.NewNop()
	itemRepo := newPurchaseSyncItemRepo()
	itemService := appitem.NewService(itemRepo, logger)
	manager := newPurchaseSyncTestManager(t, models.ItemTemplateTemplate{
		ID:         158,
		Name:       "Potion",
		Price:      1,
		StackMax:   99999,
		SingleFlag: 0,
		Kind:       0,
	})
	itemService.SetGameDataManager(manager)

	service := NewService()
	service.SetGameDataManager(manager)
	service.SetItemService(itemService)
	service.SetCharacterRepository(newVIPShopCharacterRepo(&character.Character{
		ID:         1,
		Name:       "buyer",
		MoneyBind:  1000,
		BagSlotNum: 1,
	}))

	existing := domainitem.NewItem(1, 158, domainitem.ItemTypeConsumable, domainitem.SlotTypeBag, 0)
	existing.StackCount = 15
	existing.IsBound = false
	if err := itemRepo.Create(ctx, existing); err != nil {
		t.Fatalf("seed existing item: %v", err)
	}

	result, err := service.BuyItem(ctx, 1, 158, 10)
	if err != nil {
		t.Fatalf("BuyItem returned error: %v", err)
	}

	if len(result.AddedItemDTOs) != 1 {
		t.Fatalf("AddedItemDTOs len = %d, want 1", len(result.AddedItemDTOs))
	}
	if got := dtoInt(t, result.AddedItemDTOs[0], "itemId"); got == int(existing.ID) {
		t.Fatalf("expected new bound stack, got existing item id %d", got)
	}
	if got := dtoInt(t, result.AddedItemDTOs[0], "stackNum"); got != 10 {
		t.Fatalf("new dto stackNum = %d, want 10", got)
	}
	if got := dtoString(t, result.AddedItemDTOs[0], "binded"); got != "1" {
		t.Fatalf("new dto binded = %q, want 1", got)
	}

	storedExisting, err := itemRepo.FindByID(ctx, existing.ID)
	if err != nil {
		t.Fatalf("FindByID returned error: %v", err)
	}
	if storedExisting.StackCount != 15 {
		t.Fatalf("existing stackCount = %d, want 15", storedExisting.StackCount)
	}
	if storedExisting.IsBound {
		t.Fatalf("existing stack unexpectedly became bound")
	}
}

func newPurchaseSyncTestManager(t *testing.T, itemTpl models.ItemTemplateTemplate) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	raw, err := json.Marshal(itemTpl)
	if err != nil {
		t.Fatalf("marshal item template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load item template: %v", err)
	}

	return manager
}

func dtoInt(t *testing.T, dto map[string]interface{}, key string) int {
	t.Helper()

	switch value := dto[key].(type) {
	case int:
		return value
	case int64:
		return int(value)
	case float64:
		return int(value)
	default:
		t.Fatalf("dto[%q] has unsupported type %T", key, dto[key])
	}

	return 0
}

func dtoString(t *testing.T, dto map[string]interface{}, key string) string {
	t.Helper()

	value, ok := dto[key].(string)
	if !ok {
		t.Fatalf("dto[%q] = %#v, want string", key, dto[key])
	}
	return value
}
