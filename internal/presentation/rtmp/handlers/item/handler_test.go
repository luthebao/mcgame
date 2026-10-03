// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"errors"
	"net"
	"strconv"
	"strings"
	"testing"
	"time"

	appchar "mcgame-server/internal/application/character"
	appitem "mcgame-server/internal/application/item"
	domainauth "mcgame-server/internal/domain/auth"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type itemStubNetConn struct{}

func (s *itemStubNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *itemStubNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *itemStubNetConn) Close() error                      { return nil }
func (s *itemStubNetConn) LocalAddr() net.Addr               { return nil }
func (s *itemStubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *itemStubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *itemStubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *itemStubNetConn) SetWriteDeadline(t time.Time) error { return nil }

type itemTestCharacterRepo struct {
	char *domainchar.Character
}

func (f *itemTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if f.char == nil || f.char.ID != id {
		return nil, errors.New("character not found")
	}
	return f.char, nil
}

func (f *itemTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (f *itemTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (f *itemTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (f *itemTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (f *itemTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	f.char = character
	return nil
}

func (f *itemTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (f *itemTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (f *itemTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (f *itemTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type itemTestRepo struct {
	items map[int64]*domainitem.Item
}

type itemTestAccountRepo struct {
	account *domainauth.Account
	byIDErr error
}

func (r *itemTestAccountRepo) FindByID(ctx context.Context, id uuid.UUID) (*domainauth.Account, error) {
	if r.byIDErr != nil {
		return nil, r.byIDErr
	}
	if r.account == nil || r.account.ID != id {
		return nil, pkgerrors.ErrAccountNotFound
	}
	copy := *r.account
	return &copy, nil
}

func (r *itemTestAccountRepo) FindByUsername(ctx context.Context, username string) (*domainauth.Account, error) {
	return nil, pkgerrors.ErrAccountNotFound
}

func (r *itemTestAccountRepo) Create(ctx context.Context, account *domainauth.Account) error {
	r.account = account
	return nil
}

func (r *itemTestAccountRepo) Update(ctx context.Context, account *domainauth.Account) error {
	r.account = account
	return nil
}

func (r *itemTestAccountRepo) ExistsByUsername(ctx context.Context, username string) (bool, error) {
	return false, nil
}

func (r *itemTestAccountRepo) UpdateLastLogin(ctx context.Context, id uuid.UUID) error {
	return nil
}

func newItemTestRepo(items ...*domainitem.Item) *itemTestRepo {
	repo := &itemTestRepo{items: make(map[int64]*domainitem.Item)}
	for _, it := range items {
		copy := *it
		repo.items[it.ID] = &copy
	}
	return repo
}

func (r *itemTestRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	if it, ok := r.items[id]; ok {
		copy := *it
		return &copy, nil
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *itemTestRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID {
			copy := *it
			result = append(result, &copy)
		}
	}
	return result, nil
}

func (r *itemTestRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			copy := *it
			result = append(result, &copy)
		}
	}
	return result, nil
}

func (r *itemTestRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			copy := *it
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *itemTestRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *itemTestRepo) Create(ctx context.Context, it *domainitem.Item) error {
	if it.ID == 0 {
		var maxID int64
		for id := range r.items {
			if id > maxID {
				maxID = id
			}
		}
		it.ID = maxID + 1
	}
	copy := *it
	r.items[it.ID] = &copy
	return nil
}

func (r *itemTestRepo) Update(ctx context.Context, it *domainitem.Item) error {
	copy := *it
	r.items[it.ID] = &copy
	return nil
}

func (r *itemTestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *itemTestRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, it := range r.items {
		if it.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *itemTestRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.SlotType = slotType
	it.SlotIndex = slotIndex
	return nil
}

func (r *itemTestRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.StackCount = stackCount
	return nil
}

func (r *itemTestRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
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

func (r *itemTestRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

func buildItemTestHandler(t *testing.T, char *domainchar.Character, items ...*domainitem.Item) (*Handler, *infrartmp.RPCContext) {
	t.Helper()
	return buildItemTestHandlerWithRepo(t, char, newItemTestRepo(items...))
}

func buildItemTestHandlerWithRepo(t *testing.T, char *domainchar.Character, itemRepo domainitem.Repository) (*Handler, *infrartmp.RPCContext) {
	t.Helper()

	logger := zaptest.NewLogger(t)
	itemService := appitem.NewService(itemRepo, logger)

	manager := gamedata.NewManager(nil, logger)
	consumableTpl := models.ItemTemplateTemplate{ID: 1001, Kind: 1, Type: 1, UseType: 3, I1: 0, I2: 0}
	consumableRaw, err := json.Marshal(consumableTpl)
	if err != nil {
		t.Fatalf("marshal item template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{consumableRaw}); err != nil {
		t.Fatalf("load item template: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 2001, Position: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	itemService.SetGameDataManager(manager)

	charRepo := &itemTestCharacterRepo{char: char}
	itemService.SetCharacterRepository(charRepo)
	charService := appchar.NewService(charRepo, logger)
	accountID := uuid.New()
	accountRepo := &itemTestAccountRepo{account: &domainauth.Account{ID: accountID, SecondaryPassword: domainauth.DefaultSecondaryPasswordMD5}}

	handler := NewHandler(itemService, nil, charService, nil, manager, logger)
	handler.SetAccountRepository(accountRepo)

	conn := infrartmp.NewConnection(1, &itemStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		AccountID:   accountID.String(),
		CharacterID: strconv.FormatInt(char.ID, 10),
		Connection:  conn,
	}

	return handler, ctx
}

func TestItemHandler_CheckEquipEdit_AcceptsModeProbe(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	handler, ctx := buildItemTestHandler(t, char)

	resp, err := handler.CheckEquipEdit(ctx, []interface{}{"3"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	if resp != nil {
		t.Fatalf("expected nil response, got %#v", resp)
	}
}

func TestItemHandler_UseItem_AcceptsNumericStringSlotID(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, CurrentHP: 10, CurrentMP: 10, MaxHP: 100, MaxMP: 100}
	it := &domainitem.Item{ID: 100, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 2}
	handler, ctx := buildItemTestHandler(t, char, it)

	resp, err := handler.UseItem(ctx, []interface{}{float64(1), float64(-1), "100"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["success"].(bool); !ok || !success {
		t.Fatalf("expected success=true, got %#v", result["success"])
	}
}

func TestItemHandler_UseItem_InvalidSlotIDType_IsIgnored(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, CurrentHP: 10, CurrentMP: 10, MaxHP: 100, MaxMP: 100}
	it := &domainitem.Item{ID: 100, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 2}
	handler, ctx := buildItemTestHandler(t, char, it)

	resp, err := handler.UseItem(ctx, []interface{}{float64(1), float64(-1), nil})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	if resp != nil {
		t.Fatalf("expected nil response, got %#v", resp)
	}
}

func TestItemHandler_DropItem_AcceptsNumericStringItemID(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	it := &domainitem.Item{ID: 101, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, it)

	resp, err := handler.DropItem(ctx, []interface{}{"101", domainauth.DefaultSecondaryPasswordMD5})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["success"].(bool); !ok || !success {
		t.Fatalf("expected success=true, got %#v", result["success"])
	}
}

func TestItemHandler_DropItem_InvalidType_ReturnsInvalidArgs(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	it := &domainitem.Item{ID: 101, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, it)

	_, err := handler.DropItem(ctx, []interface{}{nil})
	if !pkgerrors.Is(err, pkgerrors.ErrInvalidArgs) {
		t.Fatalf("expected ErrInvalidArgs, got %v", err)
	}
}

func TestItemHandler_EquipOn_AcceptsNumericStringItemID(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	it := &domainitem.Item{ID: 200, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, it)

	resp, err := handler.EquipOn(ctx, []interface{}{"200"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["success"].(bool); !ok || !success {
		t.Fatalf("expected success=true, got %#v", result["success"])
	}
}

func TestItemHandler_EquipOn_InvalidItemIDType_ReturnsInvalidArgs(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	it := &domainitem.Item{ID: 200, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, it)

	_, err := handler.EquipOn(ctx, []interface{}{nil})
	if !pkgerrors.Is(err, pkgerrors.ErrInvalidArgs) {
		t.Fatalf("expected ErrInvalidArgs, got %v", err)
	}
}

func TestItemHandler_BindItem_AcceptsNumericStringAndBindsEquippedItem(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	it := &domainitem.Item{
		ID:          201,
		CharacterID: 1,
		TemplateID:  2001,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeEquipped,
		SlotIndex:   0,
		StackCount:  1,
		Properties: map[string]interface{}{
			"binded": "0",
		},
	}
	handler, ctx := buildItemTestHandler(t, char, it)

	resp, err := handler.BindItem(ctx, []interface{}{"201"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["success"].(bool); !ok || !success {
		t.Fatalf("expected success=true, got %#v", result["success"])
	}

	updated, err := handler.itemService.GetItemByID(ctx.Context, 1, 201)
	if err != nil {
		t.Fatalf("expected updated item, got %v", err)
	}
	if !updated.IsBound {
		t.Fatal("expected equipped item to be bound")
	}
	binded, ok := updated.Properties["binded"].(string)
	if !ok {
		t.Fatalf("expected persisted binded string, got %#v", updated.Properties["binded"])
	}
	if binded != "1" {
		t.Fatalf("expected persisted binded=1, got %q", binded)
	}
}

func TestItemHandler_EquipOff_AcceptsItemIDArgument(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	equipped := &domainitem.Item{ID: 6, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 5, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, equipped)

	_, err := handler.EquipOff(ctx, []interface{}{float64(6), float64(-1)})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	moved, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 6)
	if err != nil {
		t.Fatalf("expected item to exist after unequip, got %v", err)
	}
	if moved.SlotType != domainitem.SlotTypeBag {
		t.Fatalf("expected item in bag, got slotType=%d", moved.SlotType)
	}
}

func TestItemHandler_EquipOff_AcceptsNumericStringItemIDArgument(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	equipped := &domainitem.Item{ID: 7, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 6, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, equipped)

	_, err := handler.EquipOff(ctx, []interface{}{"7", float64(-1)})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	moved, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 7)
	if err != nil {
		t.Fatalf("expected item to exist after unequip, got %v", err)
	}
	if moved.SlotType != domainitem.SlotTypeBag {
		t.Fatalf("expected item in bag, got slotType=%d", moved.SlotType)
	}
}

func TestItemHandler_getCharacterViewProps_UsesCharacterServiceAttributes(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 10, Strength: 30, Agility: 18, Stamina: 20, Intelligence: 15, Spirit: 12, AttrPoints: 4}
	handler, ctx := buildItemTestHandler(t, char)

	props := handler.getCharacterViewProps(ctx.Context, char)
	if got := props["finalHp"]; got != 156 {
		t.Fatalf("expected finalHp=156 from character service attributes, got %v", got)
	}
	if got := props["finalAttack"]; got != 52 {
		t.Fatalf("expected finalAttack=52 from character service attributes, got %v", got)
	}
	if got := props["lastPoint"]; got != "4" {
		t.Fatalf("expected lastPoint=4 from character service attributes, got %v", got)
	}
	if got := char.ToDTO()["finalHp"]; got == props["finalHp"] {
		t.Fatalf("expected helper output to differ from char.ToDTO for finalHp in this fixture")
	}
}

func TestItemHandler_EquipOff_PrefersItemIDOverSlotWhenAmbiguous(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	clickedItem := &domainitem.Item{ID: 7, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 4, StackCount: 1}
	otherItem := &domainitem.Item{ID: 99, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 6, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, clickedItem, otherItem)

	_, err := handler.EquipOff(ctx, []interface{}{float64(7), float64(-1)})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	clickedAfter, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 7)
	if err != nil {
		t.Fatalf("expected clicked item to exist, got %v", err)
	}
	if clickedAfter.SlotType != domainitem.SlotTypeBag {
		t.Fatalf("expected clicked item moved to bag, got slotType=%d", clickedAfter.SlotType)
	}

	otherAfter, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 99)
	if err != nil {
		t.Fatalf("expected other item to exist, got %v", err)
	}
	if otherAfter.SlotType != domainitem.SlotTypeEquipped {
		t.Fatalf("expected other item to remain equipped, got slotType=%d", otherAfter.SlotType)
	}
}

func TestItemHandler_BuildEquipActiveList_UsesCurrentlyEquippedItems(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	activeItem := &domainitem.Item{ID: 10, CharacterID: 1, TemplateID: 3001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 0, StackCount: 1,
		Properties: map[string]interface{}{"element": 3}}
	requiredItem := &domainitem.Item{ID: 11, CharacterID: 1, TemplateID: 3002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 6, StackCount: 1,
		Properties: map[string]interface{}{"element": 3}}
	missingPairItem := &domainitem.Item{ID: 12, CharacterID: 1, TemplateID: 3003, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 3, StackCount: 1,
		Properties: map[string]interface{}{"element": 2}}
	mismatchItem := &domainitem.Item{ID: 13, CharacterID: 1, TemplateID: 3004, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 8, StackCount: 1,
		Properties: map[string]interface{}{"element": 1}}
	mismatchPartner := &domainitem.Item{ID: 14, CharacterID: 1, TemplateID: 3005, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 1, StackCount: 1,
		Properties: map[string]interface{}{"element": 4}}
	handler, ctx := buildItemTestHandler(t, char, activeItem, requiredItem, missingPairItem, mismatchItem, mismatchPartner)

	templates := []models.EquiptTemplateTemplate{
		{ID: 3001, Position: 1, ActiveEquipID: 3002, ActivePropType: 1, ActivePropNum: 10},
		{ID: 3002, Position: 7},
		{ID: 3003, Position: 4, ActiveEquipID: 3999, ActivePropType: 1, ActivePropNum: 5},
		{ID: 3004, Position: 9, ActiveEquipID: 3005, ActivePropType: 2, ActivePropNum: 8},
		{ID: 3005, Position: 2},
	}

	rawTemplates := make([]json.RawMessage, 0, len(templates))
	for _, tpl := range templates {
		raw, err := json.Marshal(tpl)
		if err != nil {
			t.Fatalf("marshal equipment template: %v", err)
		}
		rawTemplates = append(rawTemplates, raw)
	}

	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, rawTemplates); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}

	activeList := handler.itemService.BuildEquipActiveList(ctx.Context, char.ID)
	if got := activeList["1"]; got != true {
		t.Fatalf("expected slot 1 to be active (same element pair), got %v", got)
	}
	if got := activeList["7"]; got != false {
		t.Fatalf("expected slot 7 to stay inactive without activeEquipId, got %v", got)
	}
	if got := activeList["4"]; got != false {
		t.Fatalf("expected slot 4 to stay inactive when pair is missing, got %v", got)
	}
	if got := activeList["9"]; got != false {
		t.Fatalf("expected slot 9 to stay inactive when elements differ (1 vs 4), got %v", got)
	}
	if got := activeList["12"]; got != false {
		t.Fatalf("expected untouched slot 12 to default false, got %v", got)
	}
}

func TestItemHandler_getFlyerOnPayload_ReturnsPayloadForFlyerEquipment(t *testing.T) {
	char := &domainchar.Character{ID: 35644, Name: "tester", Level: 1}
	handler, _ := buildItemTestHandler(t, char)

	flyerTpl := models.EquiptTemplateTemplate{
		ID:       1999,
		Position: 14,
		ResCode:  2070380000021,
		WavCode:  0,
	}
	flyerRaw, err := json.Marshal(flyerTpl)
	if err != nil {
		t.Fatalf("marshal flyer equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{flyerRaw}); err != nil {
		t.Fatalf("load flyer equipment template: %v", err)
	}

	payload := handler.getFlyerOnPayload(1999, char.ID)
	if payload == nil {
		t.Fatal("expected flyer payload, got nil")
	}
	if got := payload["cid"]; got != char.ID {
		t.Fatalf("expected cid=%d, got %v", char.ID, got)
	}
	if got := payload["resCode"]; got != "2070380000021" {
		t.Fatalf("expected resCode=2070380000021, got %v", got)
	}
	if got := payload["wavCode"]; got != "0" {
		t.Fatalf("expected wavCode=0, got %v", got)
	}
}

func TestItemHandler_getFlyerOnPayload_IgnoresNonFlyerEquipment(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	handler, _ := buildItemTestHandler(t, char)

	payload := handler.getFlyerOnPayload(2001, char.ID)
	if payload != nil {
		t.Fatalf("expected nil payload for non-flyer equipment, got %#v", payload)
	}
}

func TestSelectCraftResultTier_UsesFailureWeightWhenRatesTotalBelow100(t *testing.T) {
	plans := []interface {
		GetRate() float64
		GetTier() int
	}{
		recipePlanRollAdapter{rate: 10, tier: 2},
		recipePlanRollAdapter{rate: 15, tier: 3},
		recipePlanRollAdapter{rate: 8, tier: 4},
	}

	tier, success, hasPlans := selectCraftResultTier(plans, 0.50)
	if !hasPlans {
		t.Fatal("expected recipe plans to be detected")
	}
	if success {
		t.Fatalf("expected roll in failure region to fail, got tier=%d", tier)
	}
	if tier != 0 {
		t.Fatalf("expected failed roll tier 0, got %d", tier)
	}

	tier, success, hasPlans = selectCraftResultTier(plans, 0.80)
	if !hasPlans {
		t.Fatal("expected recipe plans to be detected")
	}
	if !success {
		t.Fatal("expected successful craft tier selection")
	}
	if tier != 3 {
		t.Fatalf("expected tier 3, got %d", tier)
	}
}

func TestSelectCraftResultTier_NormalizesRatesWhenTotalExceeds100(t *testing.T) {
	plans := []interface {
		GetRate() float64
		GetTier() int
	}{
		recipePlanRollAdapter{rate: 4, tier: 2},
		recipePlanRollAdapter{rate: 140, tier: 3},
	}

	tier, success, hasPlans := selectCraftResultTier(plans, 0.01)
	if !hasPlans {
		t.Fatal("expected recipe plans to be detected")
	}
	if !success {
		t.Fatal("expected successful craft tier selection")
	}
	if tier != 2 {
		t.Fatalf("expected tier 2, got %d", tier)
	}

	tier, success, hasPlans = selectCraftResultTier(plans, 0.50)
	if !hasPlans {
		t.Fatal("expected recipe plans to be detected")
	}
	if !success {
		t.Fatal("expected successful craft tier selection")
	}
	if tier != 3 {
		t.Fatalf("expected tier 3, got %d", tier)
	}
}

func TestSelectCraftResultTier_AllowsPlanlessRecipeFallback(t *testing.T) {
	tier, success, hasPlans := selectCraftResultTier(nil, 0.25)
	if hasPlans {
		t.Fatal("expected no recipe plans")
	}
	if !success {
		t.Fatal("expected planless recipe to succeed with default quality")
	}
	if tier != 0 {
		t.Fatalf("expected default tier 0, got %d", tier)
	}
}

func TestCraftQualityFromPreviewSelection_LocksLowerBucketToTracViet(t *testing.T) {
	rates := craftPreviewRates{95, 5, 0, 0}

	quality := craftQualityFromPreviewSelection(1, rates, 0.0)
	if quality != 10 {
		t.Fatalf("expected lower green bucket to resolve to q=10, got %d", quality)
	}

	prefixType := craftPrefixTypeForPreviewSelection(1, rates, 0.75)
	if prefixType != 5 {
		t.Fatalf("expected lower bucket prefix type 5, got %d", prefixType)
	}
}

func TestCraftQualityFromPreviewSelection_UsesRandomPrefixForHighestBucket(t *testing.T) {
	rates := craftPreviewRates{95, 5, 0, 0}

	qualityLow := craftQualityFromPreviewSelection(2, rates, 0.0)
	if qualityLow != 11 {
		t.Fatalf("expected highest blue bucket low roll q=11, got %d", qualityLow)
	}

	qualityHigh := craftQualityFromPreviewSelection(2, rates, 0.999999)
	if qualityHigh != 15 {
		t.Fatalf("expected highest blue bucket high roll q=15, got %d", qualityHigh)
	}
}

func TestCraftQualityFromPreviewSelection_UsesRandomPrefixWhenOnlyOneBucketExists(t *testing.T) {
	rates := craftPreviewRates{0, 0, 100, 0}

	qualityLow := craftQualityFromPreviewSelection(3, rates, 0.0)
	if qualityLow != 16 {
		t.Fatalf("expected single purple bucket low roll q=16, got %d", qualityLow)
	}

	qualityHigh := craftQualityFromPreviewSelection(3, rates, 0.999999)
	if qualityHigh != 20 {
		t.Fatalf("expected single purple bucket high roll q=20, got %d", qualityHigh)
	}
}

func TestItemHandler_NewMake_AppliesSelectedCraftTierToResultItem(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 501, CharacterID: 1, TemplateID: 4001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3001, Position: 1, RequireItem1: 4001, RequireNum1: 1, StackMax: 1, MainProp1: 11, MainProp2: 20, Prop1: 8, Prop2: 13, MainPropNum1: 100, MainPropNum2: 40, PropNum1: 60, PropNum2: 30, BindPropNum: 10}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	recipePlan := models.RecipePlanTemplate{ID: 9001, RecipeID: 3001, St: 2, Rate: 100}
	recipePlanRaw, err := json.Marshal(recipePlan)
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{recipePlanRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{
				"idx":         float64(501),
				"tempBagFlag": false,
			},
		},
		float64(3001),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}

	if _, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 501); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected material to be consumed, got err=%v", err)
	}

	items, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var crafted *domainitem.Item
	for _, it := range items {
		if it.TemplateID == 3001 {
			crafted = it
			break
		}
	}
	if crafted == nil {
		t.Fatal("expected crafted item to be created")
	}
	if crafted.ColorCode != 2 {
		t.Fatalf("expected crafted colorCode 2, got %d", crafted.ColorCode)
	}
	quality, ok := crafted.Properties["q"].(int)
	if !ok {
		t.Fatalf("expected crafted q int, got %T", crafted.Properties["q"])
	}
	if quality < 6 || quality > 10 {
		t.Fatalf("expected crafted q in 6..10, got %d", quality)
	}
	storedQuality, ok := crafted.Properties["quality"].(int)
	if !ok {
		t.Fatalf("expected crafted quality int, got %T", crafted.Properties["quality"])
	}
	if storedQuality != quality {
		t.Fatalf("expected crafted quality %d, got %d", quality, storedQuality)
	}
	preNameType, ok := crafted.Properties["preNameType"].(int)
	if !ok {
		t.Fatalf("expected crafted preNameType int, got %T", crafted.Properties["preNameType"])
	}
	if preNameType != domainitem.EquipmentPrefixTypeFromQuality(quality) {
		t.Fatalf("expected crafted preNameType %d, got %d", domainitem.EquipmentPrefixTypeFromQuality(quality), preNameType)
	}
	maker, ok := crafted.Properties["maker"].(string)
	if !ok || maker != char.Name {
		t.Fatalf("expected crafted maker %q, got %#v", char.Name, crafted.Properties["maker"])
	}
	elementValue, ok := crafted.Properties["element"].(int)
	if !ok {
		t.Fatalf("expected crafted element int, got %T", crafted.Properties["element"])
	}
	if elementValue < 1 || elementValue > 6 {
		t.Fatalf("expected crafted element in 1..6, got %d", elementValue)
	}
	assertCraftedPropPermutation(t, crafted.Properties, []int{11, 20, 8, 13})
	assertCraftedPropValuesForQuality(t, crafted.Properties, quality, map[int]int{
		11: 100,
		20: 40,
		8:  60,
		13: 30,
	})
	craftBindMax := craftedPropScaledBounds(10, quality)[1]
	assertCraftedRange(t, "bindMainPropNum1", crafted.Properties["bindMainPropNum1"], 0, craftBindMax)
	assertCraftedRange(t, "bindMainPropNum2", crafted.Properties["bindMainPropNum2"], 0, craftBindMax)
}

func assertCraftedPropPermutation(t *testing.T, properties map[string]interface{}, expected []int) {
	t.Helper()
	seen := make(map[int]int, len(expected))
	for _, key := range []string{"mainProp1", "mainProp2", "prop1", "prop2"} {
		seen[craftedTestInt(properties[key])]++
	}
	for _, expectedType := range expected {
		if seen[expectedType] != 1 {
			t.Fatalf("expected prop type %d to appear exactly once, got properties %#v", expectedType, properties)
		}
		delete(seen, expectedType)
	}
	for propType, count := range seen {
		if propType != 0 || count != 0 {
			t.Fatalf("unexpected prop type distribution %#v in properties %#v", seen, properties)
		}
	}
}

func assertCraftedPropValuesForQuality(t *testing.T, properties map[string]interface{}, quality int, baseValues map[int]int) {
	t.Helper()
	for _, pair := range [][2]string{{"mainProp1", "mainPropNum1"}, {"mainProp2", "mainPropNum2"}, {"prop1", "propNum1"}, {"prop2", "propNum2"}} {
		propType := craftedTestInt(properties[pair[0]])
		baseValue, ok := baseValues[propType]
		if !ok {
			t.Fatalf("unexpected prop type %d in properties %#v", propType, properties)
		}
		bounds := craftedPropScaledBounds(baseValue, quality)
		assertCraftedRange(t, pair[1], properties[pair[1]], bounds[0], bounds[1])
	}
}

func craftedPropScaledBounds(baseValue int, quality int) [2]int {
	minMultiplier, maxMultiplier := domainitem.EquipmentQualityMultiplierRange(quality)
	minValue := int(float64(baseValue) * minMultiplier)
	maxValue := int(float64(baseValue) * maxMultiplier)
	if maxValue < minValue {
		maxValue = minValue
	}
	return [2]int{minValue, maxValue}
}

func assertCraftedRange(t *testing.T, name string, got interface{}, min int, max int) {
	t.Helper()
	value := craftedTestInt(got)
	if value < min || value > max {
		t.Fatalf("expected %s in [%d,%d], got %#v", name, min, max, got)
	}
}

func craftedTestInt(value interface{}) int {
	switch typed := value.(type) {
	case int:
		return typed
	case int8:
		return int(typed)
	case int16:
		return int(typed)
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return 0
	}
}

func TestItemHandler_NewMake_AcceptsStringRecipeID(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 551, CharacterID: 1, TemplateID: 4011, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3011, Position: 1, RequireItem1: 4011, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	planRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9051, RecipeID: 3011, St: 2, Rate: 100})
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{planRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{
				"idx":         float64(551),
				"tempBagFlag": false,
			},
		},
		"3011",
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}
}

func TestItemHandler_NewMake_ConsumesRequiredStackFromTempBag(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 601, CharacterID: 1, TemplateID: 4002, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeTempBag, SlotIndex: 3, StackCount: 5}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3002, Position: 1, RequireItem1: 4002, RequireNum1: 3, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	recipePlan := models.RecipePlanTemplate{ID: 9002, RecipeID: 3002, St: 2, Rate: 100}
	recipePlanRaw, err := json.Marshal(recipePlan)
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{recipePlanRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{
				"idx":         float64(3),
				"tempBagFlag": true,
			},
		},
		float64(3002),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}

	remaining, err := handler.itemService.GetItemInSlot(ctx.Context, char.ID, domainitem.SlotTypeTempBag, 3)
	if err != nil {
		t.Fatalf("expected temp bag material to remain, got %v", err)
	}
	if remaining.StackCount != 2 {
		t.Fatalf("expected remaining temp bag stack 2, got %d", remaining.StackCount)
	}
}

func TestItemHandler_GetMakeColor_RejectsWrongMaterialSlotAssignment(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	materialOne := &domainitem.Item{ID: 701, CharacterID: 1, TemplateID: 4101, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	materialTwo := &domainitem.Item{ID: 702, CharacterID: 1, TemplateID: 4102, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, materialOne, materialTwo)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3003, Position: 1, RequireItem1: 4101, RequireNum1: 1, RequireItem2: 4102, RequireNum2: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(702), "tempBagFlag": false},
			"2": map[string]interface{}{"idx": float64(701), "tempBagFlag": false},
		},
		float64(3003),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || canMake {
		t.Fatalf("expected canMake=false, got %#v", result["canMake"])
	}
	if flag, ok := result["flag"].(int); !ok || flag != 1 {
		t.Fatalf("expected flag=1, got %#v", result["flag"])
	}
}

func TestItemHandler_GetMakeColor_AggregatesDuplicateTierRates(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 801, CharacterID: 1, TemplateID: 4201, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3004, Position: 1, RequireItem1: 4201, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	planOneRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9101, RecipeID: 3004, St: 2, Rate: 40})
	if err != nil {
		t.Fatalf("marshal recipe plan one: %v", err)
	}
	planTwoRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9102, RecipeID: 3004, St: 2, Rate: 60})
	if err != nil {
		t.Fatalf("marshal recipe plan two: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{planOneRaw, planTwoRaw}); err != nil {
		t.Fatalf("load recipe plans: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(801), "tempBagFlag": false},
		},
		float64(3004),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || !canMake {
		t.Fatalf("expected canMake=true, got %#v", result["canMake"])
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer1, ok := colorPerList["makePer1"].(int); !ok || makePer1 != 100 {
		t.Fatalf("expected makePer1=100, got %#v", colorPerList["makePer1"])
	}
}

func TestItemHandler_GetMakeColor_UsesVisibleFallbackForPlanlessRecipe(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 851, CharacterID: 1, TemplateID: 4251, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3005, Position: 1, RequireItem1: 4251, RequireNum1: 1, StackMax: 1, Color: -1, ColorCode: 0}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(851), "tempBagFlag": false},
		},
		float64(3005),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || !canMake {
		t.Fatalf("expected canMake=true, got %#v", result["canMake"])
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer1, ok := colorPerList["makePer1"].(int); !ok || makePer1 != 100 {
		t.Fatalf("expected makePer1=100, got %#v", colorPerList["makePer1"])
	}
	if makePer2, ok := colorPerList["makePer2"].(int); !ok || makePer2 != 0 {
		t.Fatalf("expected makePer2=0, got %#v", colorPerList["makePer2"])
	}
	if makePer3, ok := colorPerList["makePer3"].(int); !ok || makePer3 != 0 {
		t.Fatalf("expected makePer3=0, got %#v", colorPerList["makePer3"])
	}
	if makePer4, ok := colorPerList["makePer4"].(int); !ok || makePer4 != 0 {
		t.Fatalf("expected makePer4=0, got %#v", colorPerList["makePer4"])
	}
}

func TestItemHandler_GetMakeColor_UsesMaterialTierFallbackForPlanlessRecipe(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 871, CharacterID: 1, TemplateID: 4271, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, ColorCode: 3}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3006, Position: 1, RequireItem1: 4271, RequireNum1: 1, StackMax: 1, Color: -1, ColorCode: 0}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(871), "tempBagFlag": false},
		},
		float64(3006),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || !canMake {
		t.Fatalf("expected canMake=true, got %#v", result["canMake"])
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer3, ok := colorPerList["makePer3"].(int); !ok || makePer3 != 100 {
		t.Fatalf("expected makePer3=100, got %#v", colorPerList["makePer3"])
	}
	if makePer1, ok := colorPerList["makePer1"].(int); !ok || makePer1 != 0 {
		t.Fatalf("expected makePer1=0, got %#v", colorPerList["makePer1"])
	}
	if makePer2, ok := colorPerList["makePer2"].(int); !ok || makePer2 != 0 {
		t.Fatalf("expected makePer2=0, got %#v", colorPerList["makePer2"])
	}
	if makePer4, ok := colorPerList["makePer4"].(int); !ok || makePer4 != 0 {
		t.Fatalf("expected makePer4=0, got %#v", colorPerList["makePer4"])
	}
}

func TestItemHandler_GetMakeColor_UsesCustomMixedMaterialLevelRates(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	materialOne := &domainitem.Item{ID: 881, CharacterID: 1, TemplateID: 4281, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	materialTwo := &domainitem.Item{ID: 882, CharacterID: 1, TemplateID: 4282, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, materialOne, materialTwo)

	materialOneRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4281, Level: 2, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material level 2 template: %v", err)
	}
	materialTwoRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4282, Level: 5, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material level 5 template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialOneRaw, materialTwoRaw}); err != nil {
		t.Fatalf("load material templates: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3007, Position: 1, ReqLevel: 50, RequireItem1: 4281, RequireNum1: 1, RequireItem2: 4282, RequireNum2: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(881), "tempBagFlag": false},
			"2": map[string]interface{}{"idx": float64(882), "tempBagFlag": false},
		},
		float64(3007),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer1, ok := colorPerList["makePer1"].(int); !ok || makePer1 != 100 {
		t.Fatalf("expected makePer1=100, got %#v", colorPerList["makePer1"])
	}
	if makePer2, ok := colorPerList["makePer2"].(int); !ok || makePer2 != 0 {
		t.Fatalf("expected makePer2=0, got %#v", colorPerList["makePer2"])
	}
	if makePer3, ok := colorPerList["makePer3"].(int); !ok || makePer3 != 0 {
		t.Fatalf("expected makePer3=0, got %#v", colorPerList["makePer3"])
	}
	if makePer4, ok := colorPerList["makePer4"].(int); !ok || makePer4 != 0 {
		t.Fatalf("expected makePer4=0, got %#v", colorPerList["makePer4"])
	}
}

func TestItemHandler_GetMakeColor_UsesLowestMixedMaterialLevelProfile(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	materialOne := &domainitem.Item{ID: 911, CharacterID: 1, TemplateID: 4311, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	materialTwo := &domainitem.Item{ID: 912, CharacterID: 1, TemplateID: 4312, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, materialOne, materialTwo)

	materialOneRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4311, Level: 4, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material level 4 template: %v", err)
	}
	materialTwoRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4312, Level: 5, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material level 5 template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialOneRaw, materialTwoRaw}); err != nil {
		t.Fatalf("load material templates: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3010, Position: 1, ReqLevel: 50, RequireItem1: 4311, RequireNum1: 1, RequireItem2: 4312, RequireNum2: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(911), "tempBagFlag": false},
			"2": map[string]interface{}{"idx": float64(912), "tempBagFlag": false},
		},
		float64(3010),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer1, ok := colorPerList["makePer1"].(int); !ok || makePer1 != 0 {
		t.Fatalf("expected makePer1=0, got %#v", colorPerList["makePer1"])
	}
	if makePer2, ok := colorPerList["makePer2"].(int); !ok || makePer2 != 0 {
		t.Fatalf("expected makePer2=0, got %#v", colorPerList["makePer2"])
	}
	if makePer3, ok := colorPerList["makePer3"].(int); !ok || makePer3 != 100 {
		t.Fatalf("expected makePer3=100, got %#v", colorPerList["makePer3"])
	}
	if makePer4, ok := colorPerList["makePer4"].(int); !ok || makePer4 != 0 {
		t.Fatalf("expected makePer4=0, got %#v", colorPerList["makePer4"])
	}
}

func TestItemHandler_GetMakeColor_RejectsLevelSixMaterialsForLowLevelEquipment(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 891, CharacterID: 1, TemplateID: 4291, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	materialRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4291, Level: 6, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material level 6 template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialRaw}); err != nil {
		t.Fatalf("load material template: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3008, Position: 1, ReqLevel: 50, RequireItem1: 4291, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(891), "tempBagFlag": false},
		},
		float64(3008),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || canMake {
		t.Fatalf("expected canMake=false, got %#v", result["canMake"])
	}
	if flag, ok := result["flag"].(int); !ok || flag != 1 {
		t.Fatalf("expected flag=1, got %#v", result["flag"])
	}
}

func TestItemHandler_GetMakeColor_UsesColorCodeDerivedMaterialLevels(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	materials := []*domainitem.Item{
		{ID: 901, CharacterID: 1, TemplateID: 4301, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, ColorCode: 4},
		{ID: 902, CharacterID: 1, TemplateID: 4302, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, ColorCode: 4},
		{ID: 903, CharacterID: 1, TemplateID: 4303, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 2, StackCount: 1, ColorCode: 4},
	}
	handler, ctx := buildItemTestHandler(t, char, materials[0], materials[1], materials[2])

	templates := []json.RawMessage{}
	for _, templateID := range []int{4301, 4302, 4303} {
		raw, err := json.Marshal(models.ItemTemplateTemplate{ID: int64(templateID), Kind: 1, Type: 1, UseType: 3})
		if err != nil {
			t.Fatalf("marshal material template %d: %v", templateID, err)
		}
		templates = append(templates, raw)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, templates); err != nil {
		t.Fatalf("load material templates: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3009, Position: 1, ReqLevel: 50, RequireItem1: 4301, RequireNum1: 1, RequireItem2: 4302, RequireNum2: 1, RequireItem3: 4303, RequireNum3: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(901), "tempBagFlag": false},
			"2": map[string]interface{}{"idx": float64(902), "tempBagFlag": false},
			"3": map[string]interface{}{"idx": float64(903), "tempBagFlag": false},
		},
		float64(3009),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer3, ok := colorPerList["makePer3"].(int); !ok || makePer3 != 95 {
		t.Fatalf("expected makePer3=95, got %#v", colorPerList["makePer3"])
	}
	if makePer4, ok := colorPerList["makePer4"].(int); !ok || makePer4 != 5 {
		t.Fatalf("expected makePer4=5, got %#v", colorPerList["makePer4"])
	}
}

func TestItemHandler_GetMakeColor_PrefersExplicitMaterialLevelOverColorFallback(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{
		ID:          904,
		CharacterID: 1,
		TemplateID:  4304,
		ItemType:    domainitem.ItemTypeConsumable,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		ColorCode:   5,
		Properties: map[string]interface{}{
			"itemLevel": 5,
		},
	}
	handler, ctx := buildItemTestHandler(t, char, material)

	templateRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4304, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{templateRaw}); err != nil {
		t.Fatalf("load material template: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3011, Position: 1, ReqLevel: 50, RequireItem1: 4304, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(904), "tempBagFlag": false},
		},
		float64(3011),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || !canMake {
		t.Fatalf("expected canMake=true, got %#v", result["canMake"])
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer3, ok := colorPerList["makePer3"].(int); !ok || makePer3 != 95 {
		t.Fatalf("expected makePer3=95, got %#v", colorPerList["makePer3"])
	}
	if makePer4, ok := colorPerList["makePer4"].(int); !ok || makePer4 != 5 {
		t.Fatalf("expected makePer4=5, got %#v", colorPerList["makePer4"])
	}
}

func TestItemHandler_NewMake_UsesMaterialTierFallbackForPlanlessRecipe(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 951, CharacterID: 1, TemplateID: 4401, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, ColorCode: 3}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3015, Position: 1, RequireItem1: 4401, RequireNum1: 1, StackMax: 1, Color: -1, ColorCode: 0}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(951), "tempBagFlag": false},
		},
		float64(3015),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}

	items, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var crafted *domainitem.Item
	for _, it := range items {
		if it.TemplateID == 3015 {
			crafted = it
			break
		}
	}
	if crafted == nil {
		t.Fatal("expected crafted item to be created")
	}
	if crafted.ColorCode != 4 {
		t.Fatalf("expected crafted colorCode 4, got %d", crafted.ColorCode)
	}
	quality, ok := crafted.Properties["q"].(int)
	if !ok {
		t.Fatalf("expected crafted q int, got %T", crafted.Properties["q"])
	}
	if quality < 16 || quality > 20 {
		t.Fatalf("expected crafted q in 16..20, got %d", quality)
	}
	color, ok := crafted.Properties["color"].(string)
	if !ok {
		t.Fatalf("expected crafted color string, got %T", crafted.Properties["color"])
	}
	if color != "3" {
		t.Fatalf("expected crafted display color 3 for purple result, got %q", color)
	}
	storedQuality, ok := crafted.Properties["quality"].(int)
	if !ok {
		t.Fatalf("expected crafted quality int, got %T", crafted.Properties["quality"])
	}
	if storedQuality != quality {
		t.Fatalf("expected crafted quality %d, got %d", quality, storedQuality)
	}
	preNameType, ok := crafted.Properties["preNameType"].(int)
	if !ok {
		t.Fatalf("expected crafted preNameType int, got %T", crafted.Properties["preNameType"])
	}
	if preNameType != domainitem.EquipmentPrefixTypeFromQuality(quality) {
		t.Fatalf("expected crafted preNameType %d, got %d", domainitem.EquipmentPrefixTypeFromQuality(quality), preNameType)
	}
	maker, ok := crafted.Properties["maker"].(string)
	if !ok || maker != char.Name {
		t.Fatalf("expected crafted maker %q, got %#v", char.Name, crafted.Properties["maker"])
	}
}

func TestItemHandler_NewMake_UsesCustomLevelTwoMaterialRates(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 961, CharacterID: 1, TemplateID: 4411, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	materialRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4411, Level: 2, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal material level 2 template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialRaw}); err != nil {
		t.Fatalf("load material template: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3018, Position: 1, ReqLevel: 20, RequireItem1: 4411, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(961), "tempBagFlag": false},
		},
		float64(3018),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}

	items, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var crafted *domainitem.Item
	for _, it := range items {
		if it.TemplateID == 3018 {
			crafted = it
			break
		}
	}
	if crafted == nil {
		t.Fatal("expected crafted item to be created")
	}
	if crafted.ColorCode != 2 {
		t.Fatalf("expected crafted colorCode 2, got %d", crafted.ColorCode)
	}
	quality, ok := crafted.Properties["q"].(int)
	if !ok {
		t.Fatalf("expected crafted q int, got %T", crafted.Properties["q"])
	}
	if quality < 6 || quality > 10 {
		t.Fatalf("expected crafted q in 6..10, got %d", quality)
	}
}

func TestItemHandler_NewMake_BindsResultWhenAnyMaterialIsBound(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	boundMaterial := &domainitem.Item{ID: 971, CharacterID: 1, TemplateID: 4421, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, IsBound: true}
	unboundMaterial := &domainitem.Item{ID: 972, CharacterID: 1, TemplateID: 4422, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, boundMaterial, unboundMaterial)

	materialOneRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4421, Level: 4, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal bound material template: %v", err)
	}
	materialTwoRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 4422, Level: 4, Kind: 1, Type: 1, UseType: 3})
	if err != nil {
		t.Fatalf("marshal unbound material template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialOneRaw, materialTwoRaw}); err != nil {
		t.Fatalf("load material templates: %v", err)
	}

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3019, Position: 1, ReqLevel: 40, RequireItem1: 4421, RequireNum1: 1, RequireItem2: 4422, RequireNum2: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(971), "tempBagFlag": false},
			"2": map[string]interface{}{"idx": float64(972), "tempBagFlag": false},
		},
		float64(3019),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}

	items, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var crafted *domainitem.Item
	for _, it := range items {
		if it.TemplateID == 3019 {
			crafted = it
			break
		}
	}
	if crafted == nil {
		t.Fatal("expected crafted item to be created")
	}
	if !crafted.IsBound {
		t.Fatal("expected crafted equipment to be bound when any source material is bound")
	}
	if binded, ok := crafted.Properties["binded"].(string); !ok || binded != "1" {
		t.Fatalf("expected crafted binded property \"1\", got %#v", crafted.Properties["binded"])
	}
}

func TestItemHandler_MaterialMixOne_BindsResultFromBoundSource(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	source := &domainitem.Item{ID: 1801, CharacterID: 1, TemplateID: 5601, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 5, IsBound: true}
	existingUnbound := &domainitem.Item{ID: 1802, CharacterID: 1, TemplateID: 5601, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, ColorCode: 1}
	handler, ctx := buildItemTestHandler(t, char, source, existingUnbound)

	materialRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 5601, Name: "Tinh Thach", Kind: 6, Type: 1, UseType: 3, StackMax: 99, Color: 0})
	if err != nil {
		t.Fatalf("marshal material template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialRaw}); err != nil {
		t.Fatalf("load material template: %v", err)
	}

	resp, err := handler.MaterialMixOne(ctx, []interface{}{float64(5), float64(source.ID), false})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}
	if finalNum, ok := result["finalNum"].(float64); !ok || finalNum != 1 {
		t.Fatalf("expected finalNum=1, got %#v", result["finalNum"])
	}

	items, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var mixed *domainitem.Item
	var unboundStack *domainitem.Item
	for _, it := range items {
		if it.TemplateID != 5601 || it.ColorCode != 1 {
			continue
		}
		if it.IsBound {
			mixed = it
			continue
		}
		unboundStack = it
	}

	if mixed == nil {
		t.Fatal("expected bound mixed material to be created")
	}
	if mixed.StackCount != 1 {
		t.Fatalf("expected bound mixed stackCount=1, got %d", mixed.StackCount)
	}
	if unboundStack == nil {
		t.Fatal("expected existing unbound stack to remain")
	}
	if unboundStack.StackCount != 1 {
		t.Fatalf("expected existing unbound stackCount=1, got %d", unboundStack.StackCount)
	}
	if _, err := handler.itemService.GetItemByID(ctx.Context, char.ID, source.ID); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected source stack to be consumed, got %v", err)
	}
}

func TestItemHandler_MaterialMixAll_BindsProducedStackFromBoundSource(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	source := &domainitem.Item{ID: 1811, CharacterID: 1, TemplateID: 5602, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 10, IsBound: true}
	existingUnbound := &domainitem.Item{ID: 1812, CharacterID: 1, TemplateID: 5602, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 3, ColorCode: 1}
	handler, ctx := buildItemTestHandler(t, char, source, existingUnbound)

	materialRaw, err := json.Marshal(models.ItemTemplateTemplate{ID: 5602, Name: "Tinh Thach", Kind: 6, Type: 1, UseType: 3, StackMax: 99, Color: 0})
	if err != nil {
		t.Fatalf("marshal material template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{materialRaw}); err != nil {
		t.Fatalf("load material template: %v", err)
	}

	resp, err := handler.MaterialMixAll(ctx, []interface{}{float64(5), float64(source.ID), false})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}
	if finalNum, ok := result["finalNum"].(float64); !ok || finalNum != 2 {
		t.Fatalf("expected finalNum=2, got %#v", result["finalNum"])
	}

	items, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var mixed *domainitem.Item
	var unboundStack *domainitem.Item
	for _, it := range items {
		if it.TemplateID != 5602 || it.ColorCode != 1 {
			continue
		}
		if it.IsBound {
			mixed = it
			continue
		}
		unboundStack = it
	}

	if mixed == nil {
		t.Fatal("expected bound mixed material stack to be created")
	}
	if mixed.StackCount != 2 {
		t.Fatalf("expected bound mixed stackCount=2, got %d", mixed.StackCount)
	}
	if unboundStack == nil {
		t.Fatal("expected existing unbound stack to remain")
	}
	if unboundStack.StackCount != 3 {
		t.Fatalf("expected existing unbound stackCount=3, got %d", unboundStack.StackCount)
	}
	if _, err := handler.itemService.GetItemByID(ctx.Context, char.ID, source.ID); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected source stack to be consumed, got %v", err)
	}
}

func TestItemHandler_NewMake_BroadcastsOrangeEquipmentNotice(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 1751, CharacterID: 1, TemplateID: 4751, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3751, Name: "Kiem Cam", Position: 1, RequireItem1: 4751, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	planRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9751, RecipeID: 3751, St: 5, Rate: 100})
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{planRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	var broadcastMethod string
	var broadcastPayload interface{}
	handler.broadcastToAllFn = func(method string, data interface{}) {
		broadcastMethod = method
		broadcastPayload = data
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{
				"idx":         float64(1751),
				"tempBagFlag": false,
			},
		},
		float64(3751),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}
	if broadcastMethod != "onSystemSay" {
		t.Fatalf("expected onSystemSay broadcast, got %q", broadcastMethod)
	}
	msg, ok := broadcastPayload.(string)
	if !ok {
		t.Fatalf("expected string broadcast payload, got %T", broadcastPayload)
	}
	if !strings.Contains(msg, "tester") || !strings.Contains(msg, "Kiem Cam") {
		t.Fatalf("unexpected orange notice message: %q", msg)
	}
}

func TestItemHandler_NewMake_DoesNotConsumeMaterialsWhenBagHasNoResultSlot(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	items := make([]*domainitem.Item, 0, domainitem.DefaultBagSlots+1)
	for slotIndex := 0; slotIndex < domainitem.DefaultBagSlots; slotIndex++ {
		items = append(items, &domainitem.Item{
			ID:          int64(1000 + slotIndex),
			CharacterID: char.ID,
			TemplateID:  5000 + slotIndex,
			ItemType:    domainitem.ItemTypeConsumable,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   slotIndex,
			StackCount:  1,
		})
	}
	material := &domainitem.Item{ID: 2001, CharacterID: char.ID, TemplateID: 4601, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeTempBag, SlotIndex: 0, StackCount: 5}
	items = append(items, material)
	handler, ctx := buildItemTestHandler(t, char, items...)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3016, Position: 1, RequireItem1: 4601, RequireNum1: 3, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	planRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9301, RecipeID: 3016, St: 2, Rate: 100})
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{planRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(0), "tempBagFlag": true},
		},
		float64(3016),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || flag {
		t.Fatalf("expected flag=false, got %#v", result["flag"])
	}

	remaining, err := handler.itemService.GetItemInSlot(ctx.Context, char.ID, domainitem.SlotTypeTempBag, 0)
	if err != nil {
		t.Fatalf("expected temp bag material to remain, got %v", err)
	}
	if remaining.StackCount != 5 {
		t.Fatalf("expected material stack to remain 5, got %d", remaining.StackCount)
	}

	itemsAfter, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}
	for _, it := range itemsAfter {
		if it.TemplateID == 3016 {
			t.Fatal("expected no crafted item to be created")
		}
	}
}

func TestItemHandler_NewMake_AllowsResultWhenConsumedBagMaterialFreesSlot(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	items := make([]*domainitem.Item, 0, domainitem.DefaultBagSlots)
	for slotIndex := 0; slotIndex < domainitem.DefaultBagSlots; slotIndex++ {
		items = append(items, &domainitem.Item{
			ID:          int64(3000 + slotIndex),
			CharacterID: char.ID,
			TemplateID:  6000 + slotIndex,
			ItemType:    domainitem.ItemTypeConsumable,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   slotIndex,
			StackCount:  1,
		})
	}
	items[17] = &domainitem.Item{ID: 4017, CharacterID: char.ID, TemplateID: 4701, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 17, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, items...)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3017, Position: 1, RequireItem1: 4701, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	planRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9302, RecipeID: 3017, St: 2, Rate: 100})
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{planRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	resp, err := handler.NewMake(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(4017), "tempBagFlag": false},
		},
		float64(3017),
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if flag, ok := result["flag"].(bool); !ok || !flag {
		t.Fatalf("expected flag=true, got %#v", result["flag"])
	}

	if _, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 4017); !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected consumed material to be deleted, got %v", err)
	}

	itemsAfter, err := handler.itemService.GetAllItems(ctx.Context, char.ID)
	if err != nil {
		t.Fatalf("get all items: %v", err)
	}

	var crafted *domainitem.Item
	for _, it := range itemsAfter {
		if it.TemplateID == 3017 {
			crafted = it
			break
		}
	}
	if crafted == nil {
		t.Fatal("expected crafted item to be created")
	}
	if crafted.SlotType != domainitem.SlotTypeBag {
		t.Fatalf("expected crafted item in bag, got slotType=%d", crafted.SlotType)
	}
}

func TestItemHandler_GetMakeColor_AcceptsStringRecipeID(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1}
	material := &domainitem.Item{ID: 901, CharacterID: 1, TemplateID: 4301, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3014, Position: 1, RequireItem1: 4301, RequireNum1: 1, StackMax: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal crafted equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load crafted equipment template: %v", err)
	}

	planRaw, err := json.Marshal(models.RecipePlanTemplate{ID: 9201, RecipeID: 3014, St: 2, Rate: 75})
	if err != nil {
		t.Fatalf("marshal recipe plan: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableRecipePlan, []json.RawMessage{planRaw}); err != nil {
		t.Fatalf("load recipe plan: %v", err)
	}

	resp, err := handler.GetMakeColor(ctx, []interface{}{
		map[string]interface{}{
			"1": map[string]interface{}{"idx": float64(901), "tempBagFlag": false},
		},
		"3014",
	})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if canMake, ok := result["canMake"].(bool); !ok || !canMake {
		t.Fatalf("expected canMake=true, got %#v", result["canMake"])
	}
	colorPerList, ok := result["colorPerList"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected colorPerList map, got %T", result["colorPerList"])
	}
	if makePer1, ok := colorPerList["makePer1"].(int); !ok || makePer1 != 75 {
		t.Fatalf("expected makePer1=75, got %#v", colorPerList["makePer1"])
	}
}

func TestItemHandler_ChangeName_StoresMakerOnEquipment(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Money: 20000}
	equipment := &domainitem.Item{
		ID:          1201,
		CharacterID: 1,
		TemplateID:  3201,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		IsBound:     true,
		ColorCode:   4,
		Properties: map[string]interface{}{
			"maker": "",
		},
	}
	material := &domainitem.Item{ID: 1202, CharacterID: 1, TemplateID: 4201, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 2}
	handler, ctx := buildItemTestHandler(t, char, equipment, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3201, Position: 1, RequireItem3: 4201}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	resp, err := handler.ChangeName(ctx, []interface{}{float64(1201), float64(1202), false})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["f"].(bool); !ok || !success {
		t.Fatalf("expected f=true, got %#v", result["f"])
	}
	if remaining, ok := result["n"].(float64); !ok || remaining != 1 {
		t.Fatalf("expected n=1, got %#v", result["n"])
	}

	updatedEquipment, err := handler.itemService.GetItemByID(ctx.Context, 1, 1201)
	if err != nil {
		t.Fatalf("expected updated equipment, got %v", err)
	}
	maker, ok := updatedEquipment.Properties["maker"].(string)
	if !ok || maker != "tester" {
		t.Fatalf("expected maker tester, got %#v", updatedEquipment.Properties["maker"])
	}
	updatedMaterial, err := handler.itemService.GetItemByID(ctx.Context, 1, 1202)
	if err != nil {
		t.Fatalf("expected remaining material, got %v", err)
	}
	if updatedMaterial.StackCount != 1 {
		t.Fatalf("expected remaining stack 1, got %d", updatedMaterial.StackCount)
	}
	if char.Money != 10000 {
		t.Fatalf("expected remaining money 10000, got %d", char.Money)
	}
}

func TestItemHandler_ChangeName_AcceptsTempBagMaterial(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Money: 20000}
	equipment := &domainitem.Item{
		ID:          1301,
		CharacterID: 1,
		TemplateID:  3301,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		IsBound:     true,
		ColorCode:   4,
		Properties:  map[string]interface{}{"maker": ""},
	}
	material := &domainitem.Item{ID: 1302, CharacterID: 1, TemplateID: 4301, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeTempBag, SlotIndex: 5, StackCount: 1}
	handler, ctx := buildItemTestHandler(t, char, equipment, material)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3301, Position: 1, RequireItem3: 4301}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	resp, err := handler.ChangeName(ctx, []interface{}{float64(1301), float64(5), true})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["f"].(bool); !ok || !success {
		t.Fatalf("expected f=true, got %#v", result["f"])
	}
	if itemRef, ok := result["ii"].(float64); !ok || itemRef != 5 {
		t.Fatalf("expected ii=5, got %#v", result["ii"])
	}
	if remaining, ok := result["n"].(float64); !ok || remaining != 0 {
		t.Fatalf("expected n=0, got %#v", result["n"])
	}

	updatedEquipment, err := handler.itemService.GetItemByID(ctx.Context, 1, 1301)
	if err != nil {
		t.Fatalf("expected updated equipment, got %v", err)
	}
	maker, ok := updatedEquipment.Properties["maker"].(string)
	if !ok || maker != "tester" {
		t.Fatalf("expected maker tester, got %#v", updatedEquipment.Properties["maker"])
	}
	if _, err := handler.itemService.GetItemByID(ctx.Context, 1, 1302); !errors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected temp bag material to be deleted, got %v", err)
	}
	if char.Money != 10000 {
		t.Fatalf("expected remaining money 10000, got %d", char.Money)
	}
}

func TestItemHandler_ChangePrefix_Level4TurnsPurpleAndDropsStar(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, MoneyBind: 2000}
	equipment := &domainitem.Item{
		ID:          1401,
		CharacterID: char.ID,
		TemplateID:  3401,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		ColorCode:   4,
		StarLevel:   3,
		Properties: map[string]interface{}{
			"q":           18,
			"quality":     18,
			"preNameType": 3,
			"upgradeNum":  3,
		},
	}
	materialOne := &domainitem.Item{ID: 1402, CharacterID: char.ID, TemplateID: 4401, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, Properties: map[string]interface{}{"level": 4}}
	materialTwo := &domainitem.Item{ID: 1403, CharacterID: char.ID, TemplateID: 4402, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 2, StackCount: 1, Properties: map[string]interface{}{"level": 4}}
	materialThree := &domainitem.Item{ID: 1404, CharacterID: char.ID, TemplateID: 4403, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 3, StackCount: 1, Properties: map[string]interface{}{"level": 4}}
	handler, ctx := buildItemTestHandler(t, char, equipment, materialOne, materialTwo, materialThree)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3401, Position: 1, ReqLevel: 1, RequireItem1: 4401, RequireNum1: 1, RequireItem2: 4402, RequireNum2: 1, RequireItem3: 4403, RequireNum3: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	resp, err := handler.ChangePrefix(ctx, []interface{}{map[string]interface{}{
		"e":  float64(1401),
		"i1": map[string]interface{}{"idx": float64(1402), "flag": false},
		"i2": map[string]interface{}{"idx": float64(1403), "flag": false},
		"i3": map[string]interface{}{"idx": float64(1404), "flag": false},
	}})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if success, ok := result["f"].(bool); !ok || !success {
		t.Fatalf("expected f=true, got %#v", result["f"])
	}
	preview, ok := result["equIns"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected equIns map, got %T", result["equIns"])
	}
	previewQuality := craftDisplayInt(preview["q"])
	if previewQuality < 16 || previewQuality > 20 {
		t.Fatalf("expected purple quality band 16..20, got %d", previewQuality)
	}
	if starLv := craftDisplayInt(preview["starLv"]); starLv != 2 {
		t.Fatalf("expected preview starLv=2, got %d", starLv)
	}

	confirmResp, err := handler.SureChangePrefix(ctx, []interface{}{float64(1)})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	confirm, ok := confirmResp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", confirmResp)
	}
	if success, ok := confirm["f"].(bool); !ok || !success {
		t.Fatalf("expected f=true, got %#v", confirm["f"])
	}

	updated, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 1401)
	if err != nil {
		t.Fatalf("expected updated equipment, got %v", err)
	}
	if updated.StarLevel != 2 {
		t.Fatalf("expected star level 2, got %d", updated.StarLevel)
	}
	quality := craftDisplayInt(updated.Properties["q"])
	if quality < 16 || quality > 20 {
		t.Fatalf("expected persisted purple quality band 16..20, got %d", quality)
	}
	if char.MoneyBind != 1990 {
		t.Fatalf("expected remaining moneyBind 1990, got %d", char.MoneyBind)
	}
}

func TestItemHandler_ChangePrefix_Level5PreservesOrangeQuality(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, MoneyBind: 2000}
	equipment := &domainitem.Item{
		ID:          1501,
		CharacterID: char.ID,
		TemplateID:  3501,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		ColorCode:   5,
		StarLevel:   4,
		Properties: map[string]interface{}{
			"q":           22,
			"quality":     22,
			"preNameType": 2,
			"upgradeNum":  4,
		},
	}
	materialOne := &domainitem.Item{ID: 1502, CharacterID: char.ID, TemplateID: 4501, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, Properties: map[string]interface{}{"level": 5}}
	materialTwo := &domainitem.Item{ID: 1503, CharacterID: char.ID, TemplateID: 4502, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 2, StackCount: 1, Properties: map[string]interface{}{"level": 5}}
	materialThree := &domainitem.Item{ID: 1504, CharacterID: char.ID, TemplateID: 4503, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 3, StackCount: 1, Properties: map[string]interface{}{"level": 5}}
	handler, ctx := buildItemTestHandler(t, char, equipment, materialOne, materialTwo, materialThree)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3501, Position: 1, ReqLevel: 1, RequireItem1: 4501, RequireNum1: 1, RequireItem2: 4502, RequireNum2: 1, RequireItem3: 4503, RequireNum3: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	resp, err := handler.ChangePrefix(ctx, []interface{}{map[string]interface{}{
		"e":  float64(1501),
		"i1": map[string]interface{}{"idx": float64(1502), "flag": false},
		"i2": map[string]interface{}{"idx": float64(1503), "flag": false},
		"i3": map[string]interface{}{"idx": float64(1504), "flag": false},
	}})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result := resp.(map[string]interface{})
	preview := result["equIns"].(map[string]interface{})
	if quality := craftDisplayInt(preview["q"]); quality != 22 {
		t.Fatalf("expected preview quality 22, got %d", quality)
	}
	if starLv := craftDisplayInt(preview["starLv"]); starLv != 4 {
		t.Fatalf("expected preview starLv=4, got %d", starLv)
	}
}

func TestItemHandler_ChangePrefix_BindsPreviewAndConfirmedOrangeResult(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, MoneyBind: 2000}
	equipment := &domainitem.Item{
		ID:          1551,
		CharacterID: char.ID,
		TemplateID:  3551,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		ColorCode:   5,
		StarLevel:   4,
		Properties: map[string]interface{}{
			"q":           22,
			"quality":     22,
			"preNameType": 2,
			"upgradeNum":  4,
			"binded":      "0",
		},
	}
	materialOne := &domainitem.Item{ID: 1552, CharacterID: char.ID, TemplateID: 4551, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, Properties: map[string]interface{}{"level": 5}}
	materialTwo := &domainitem.Item{ID: 1553, CharacterID: char.ID, TemplateID: 4552, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 2, StackCount: 1, Properties: map[string]interface{}{"level": 5}}
	materialThree := &domainitem.Item{ID: 1554, CharacterID: char.ID, TemplateID: 4553, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 3, StackCount: 1, Properties: map[string]interface{}{"level": 5}}
	handler, ctx := buildItemTestHandler(t, char, equipment, materialOne, materialTwo, materialThree)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3551, Name: "Kiem Cam", Position: 1, ReqLevel: 1, RequireItem1: 4551, RequireNum1: 1, RequireItem2: 4552, RequireNum2: 1, RequireItem3: 4553, RequireNum3: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	var broadcastMethod string
	var broadcastPayload interface{}
	handler.broadcastToAllFn = func(method string, data interface{}) {
		broadcastMethod = method
		broadcastPayload = data
	}

	resp, err := handler.ChangePrefix(ctx, []interface{}{map[string]interface{}{
		"e":  float64(1551),
		"i1": map[string]interface{}{"idx": float64(1552), "flag": false},
		"i2": map[string]interface{}{"idx": float64(1553), "flag": false},
		"i3": map[string]interface{}{"idx": float64(1554), "flag": false},
	}})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	previewResult, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	preview := previewResult["equIns"].(map[string]interface{})
	if binded, ok := preview["binded"].(string); !ok || binded != "1" {
		t.Fatalf("expected preview binded=1, got %#v", preview["binded"])
	}

	confirmResp, err := handler.SureChangePrefix(ctx, []interface{}{float64(1)})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	confirm, ok := confirmResp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", confirmResp)
	}
	if success, ok := confirm["f"].(bool); !ok || !success {
		t.Fatalf("expected f=true, got %#v", confirm["f"])
	}

	updated, err := handler.itemService.GetItemByID(ctx.Context, char.ID, 1551)
	if err != nil {
		t.Fatalf("expected updated equipment, got %v", err)
	}
	if !updated.IsBound {
		t.Fatal("expected change-prefix result to be bound")
	}
	if binded, ok := updated.Properties["binded"].(string); !ok || binded != "1" {
		t.Fatalf("expected persisted binded=1, got %#v", updated.Properties["binded"])
	}
	if broadcastMethod != "onSystemSay" {
		t.Fatalf("expected onSystemSay broadcast, got %q", broadcastMethod)
	}
	msg, ok := broadcastPayload.(string)
	if !ok {
		t.Fatalf("expected string broadcast payload, got %T", broadcastPayload)
	}
	if msg != "Chúc mừng tester đã nhận được Cường Hóa Kiem Cam!" {
		t.Fatalf("unexpected orange notice message: %q", msg)
	}
}

func TestItemHandler_ChangePrefix_Level6KeepsTracVietOrange(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, MoneyBind: 2000}
	equipment := &domainitem.Item{
		ID:          1601,
		CharacterID: char.ID,
		TemplateID:  3601,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeBag,
		SlotIndex:   0,
		StackCount:  1,
		ColorCode:   5,
		StarLevel:   5,
		Properties: map[string]interface{}{
			"q":           25,
			"quality":     25,
			"preNameType": 5,
			"upgradeNum":  5,
		},
	}
	materialOne := &domainitem.Item{ID: 1602, CharacterID: char.ID, TemplateID: 4601, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, Properties: map[string]interface{}{"level": 6}}
	materialTwo := &domainitem.Item{ID: 1603, CharacterID: char.ID, TemplateID: 4602, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 2, StackCount: 1, Properties: map[string]interface{}{"level": 6}}
	materialThree := &domainitem.Item{ID: 1604, CharacterID: char.ID, TemplateID: 4603, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 3, StackCount: 1, Properties: map[string]interface{}{"level": 6}}
	handler, ctx := buildItemTestHandler(t, char, equipment, materialOne, materialTwo, materialThree)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3601, Position: 1, ReqLevel: 1, RequireItem1: 4601, RequireNum1: 1, RequireItem2: 4602, RequireNum2: 1, RequireItem3: 4603, RequireNum3: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	resp, err := handler.ChangePrefix(ctx, []interface{}{map[string]interface{}{
		"e":  float64(1601),
		"i1": map[string]interface{}{"idx": float64(1602), "flag": false},
		"i2": map[string]interface{}{"idx": float64(1603), "flag": false},
		"i3": map[string]interface{}{"idx": float64(1604), "flag": false},
	}})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result := resp.(map[string]interface{})
	preview := result["equIns"].(map[string]interface{})
	if quality := craftDisplayInt(preview["q"]); quality != 25 {
		t.Fatalf("expected preview quality 25, got %d", quality)
	}
	if starLv := craftDisplayInt(preview["starLv"]); starLv != 5 {
		t.Fatalf("expected preview starLv=5, got %d", starLv)
	}
}

func TestItemHandler_ChangePrefix_RejectsOrangeWithLevel4Materials(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, MoneyBind: 2000}
	equipment := &domainitem.Item{ID: 1701, CharacterID: char.ID, TemplateID: 3701, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 1, ColorCode: 5, Properties: map[string]interface{}{"q": 22, "quality": 22, "preNameType": 2}}
	materialOne := &domainitem.Item{ID: 1702, CharacterID: char.ID, TemplateID: 4701, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 1, Properties: map[string]interface{}{"level": 4}}
	materialTwo := &domainitem.Item{ID: 1703, CharacterID: char.ID, TemplateID: 4702, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 2, StackCount: 1, Properties: map[string]interface{}{"level": 4}}
	materialThree := &domainitem.Item{ID: 1704, CharacterID: char.ID, TemplateID: 4703, ItemType: domainitem.ItemTypeMaterial, SlotType: domainitem.SlotTypeBag, SlotIndex: 3, StackCount: 1, Properties: map[string]interface{}{"level": 4}}
	handler, ctx := buildItemTestHandler(t, char, equipment, materialOne, materialTwo, materialThree)

	equipmentTpl := models.EquiptTemplateTemplate{ID: 3701, Position: 1, ReqLevel: 1, RequireItem1: 4701, RequireNum1: 1, RequireItem2: 4702, RequireNum2: 1, RequireItem3: 4703, RequireNum3: 1}
	equipmentRaw, err := json.Marshal(equipmentTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := handler.gameData.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{equipmentRaw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}

	resp, err := handler.ChangePrefix(ctx, []interface{}{map[string]interface{}{
		"e":  float64(1701),
		"i1": map[string]interface{}{"idx": float64(1702), "flag": false},
		"i2": map[string]interface{}{"idx": float64(1703), "flag": false},
		"i3": map[string]interface{}{"idx": float64(1704), "flag": false},
	}})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result := resp.(map[string]interface{})
	if success, ok := result["f"].(bool); !ok || success {
		t.Fatalf("expected f=false, got %#v", result["f"])
	}
}
