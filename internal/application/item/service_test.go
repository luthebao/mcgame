// Open-sourced by BaoLT

package item

import (
	"context"
	"encoding/json"
	"fmt"
	"testing"

	domainchar "mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type itemServiceTestRepo struct {
	nextID int64
	items  map[int64]*domainitem.Item
}

func newItemServiceTestRepo() *itemServiceTestRepo {
	return &itemServiceTestRepo{nextID: 1, items: make(map[int64]*domainitem.Item)}
}

func (r *itemServiceTestRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	it, ok := r.items[id]
	if !ok {
		return nil, pkgerrors.ErrItemNotFound
	}
	copy := *it
	return &copy, nil
}

func (r *itemServiceTestRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID {
			copy := *it
			items = append(items, &copy)
		}
	}
	return items, nil
}

func (r *itemServiceTestRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	items := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			copy := *it
			items = append(items, &copy)
		}
	}
	return items, nil
}

func (r *itemServiceTestRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			copy := *it
			return &copy, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (r *itemServiceTestRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *itemServiceTestRepo) Create(ctx context.Context, it *domainitem.Item) error {
	copy := *it
	copy.ID = r.nextID
	r.nextID++
	r.items[copy.ID] = &copy
	it.ID = copy.ID
	return nil
}

func (r *itemServiceTestRepo) Update(ctx context.Context, it *domainitem.Item) error {
	if _, ok := r.items[it.ID]; !ok {
		return pkgerrors.ErrItemNotFound
	}
	copy := *it
	r.items[it.ID] = &copy
	return nil
}

func (r *itemServiceTestRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *itemServiceTestRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, it := range r.items {
		if it.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *itemServiceTestRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.SlotType = slotType
	it.SlotIndex = slotIndex
	return nil
}

func (r *itemServiceTestRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	it, ok := r.items[id]
	if !ok {
		return pkgerrors.ErrItemNotFound
	}
	it.StackCount = stackCount
	return nil
}

func (r *itemServiceTestRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
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

func (r *itemServiceTestRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

func TestAddItemWithBindAndColor_EquipmentSetsDurabilityAndEndureLeft(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3001, EndureMax: 88}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBindAndColor(context.Background(), 1, 3001, domainitem.ItemTypeEquipment, 1, false, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if added.Durability == nil {
		t.Fatal("expected durability to be set")
	}
	if *added.Durability != 88 {
		t.Fatalf("expected durability 88, got %d", *added.Durability)
	}

	if added.MaxDurability == nil {
		t.Fatal("expected maxDurability to be set")
	}
	if *added.MaxDurability != 88 {
		t.Fatalf("expected maxDurability 88, got %d", *added.MaxDurability)
	}

	endureLeft, ok := added.Properties["endureLeft"].(string)
	if !ok {
		t.Fatalf("expected endureLeft to be string, got %T", added.Properties["endureLeft"])
	}
	if endureLeft != "88" {
		t.Fatalf("expected endureLeft 88, got %q", endureLeft)
	}

	endureMax, ok := added.Properties["endureMax"].(string)
	if !ok {
		t.Fatalf("expected endureMax to be string, got %T", added.Properties["endureMax"])
	}
	if endureMax != "88" {
		t.Fatalf("expected endureMax 88, got %q", endureMax)
	}

	preNameType, ok := added.Properties["preNameType"].(int)
	if !ok {
		t.Fatalf("expected preNameType to be int, got %T", added.Properties["preNameType"])
	}
	if preNameType != 0 {
		t.Fatalf("expected preNameType 0 for colorless equipment, got %d", preNameType)
	}
}

func TestAddItemWithBindAndColor_EquipmentUsesTemplateColorForPrefix(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3002, EndureMax: 55, ColorCode: 3}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBind(context.Background(), 1, 3002, domainitem.ItemTypeEquipment, 1, false)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if added.ColorCode != 3 {
		t.Fatalf("expected colorCode 3, got %d", added.ColorCode)
	}

	preNameType, ok := added.Properties["preNameType"].(int)
	if !ok {
		t.Fatalf("expected preNameType to be int, got %T", added.Properties["preNameType"])
	}
	if preNameType != 3 {
		t.Fatalf("expected preNameType 3, got %d", preNameType)
	}
}

func TestApplyDressStateToAppearance_UsesFakeDressTemplateAndHideToggle(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustItemJSON(t, models.EquiptTemplateTemplate{ID: 4001, Position: 21, ResCodeMale: 9101}),
		mustItemJSON(t, models.EquiptTemplateTemplate{ID: 4002, Position: 21, ResCodeMale: 9201}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustItemJSON(t, models.DressTemplate{ID: 7001, EquiptID: 4002}),
	}); err != nil {
		t.Fatalf("load dress templates: %v", err)
	}
	svc.SetGameDataManager(manager)

	appearance := CharacterAppearance{DressResCode: 9101, DressEquipped: true}
	info := domaindress.NewInfo()
	info.FakeDressID = 7001
	dressInfo, err := info.EncodeClient()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}

	resolved := svc.ApplyDressStateToAppearance(appearance, 0, dressInfo, false)
	if resolved.DressResCode != 9201 {
		t.Fatalf("DressResCode = %d, want 9201", resolved.DressResCode)
	}

	hidden := svc.ApplyDressStateToAppearance(appearance, 0, dressInfo, true)
	if hidden.DressResCode != 0 {
		t.Fatalf("hidden DressResCode = %d, want 0", hidden.DressResCode)
	}

	unequipped := svc.ApplyDressStateToAppearance(CharacterAppearance{}, 0, dressInfo, false)
	if unequipped.DressResCode != 0 {
		t.Fatalf("unequipped DressResCode = %d, want 0", unequipped.DressResCode)
	}
}

func TestResolveCharacterResCode_UsesTransformThenCostumeRules(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	repo.items[1] = &domainitem.Item{
		ID:          1,
		CharacterID: 77,
		TemplateID:  4001,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeEquipped,
		SlotIndex:   21,
	}
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	if err := manager.GetCache().LoadTable(models.TableClass, []json.RawMessage{
		mustItemJSON(t, models.ClassTemplate{ID: 1, ResCodeMale: 5101, ResCodeFemale: 5201}),
	}); err != nil {
		t.Fatalf("load class templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustItemJSON(t, models.EquiptTemplateTemplate{ID: 4001, Position: 21, ResCodeMale: 9101}),
		mustItemJSON(t, models.EquiptTemplateTemplate{ID: 4002, Position: 21, ResCodeMale: 9201}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustItemJSON(t, models.DressTemplate{ID: 7001, EquiptID: 4002}),
	}); err != nil {
		t.Fatalf("load dress templates: %v", err)
	}
	svc.SetGameDataManager(manager)

	char := &domainchar.Character{
		ID:      77,
		ClassID: 1,
		Gender:  0,
	}

	if got := svc.ResolveCharacterResCode(context.Background(), char); got != 9101 {
		t.Fatalf("ResolveCharacterResCode() = %d, want costume 9101", got)
	}

	info := domaindress.NewInfo()
	info.FakeDressID = 7001
	dressInfo, err := info.EncodeClient()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}
	char.DressInfo = dressInfo
	if got := svc.ResolveCharacterResCode(context.Background(), char); got != 9201 {
		t.Fatalf("ResolveCharacterResCode() with fake = %d, want 9201", got)
	}

	char.PMProcessData = map[string]interface{}{
		"interfaceData": map[string]interface{}{"dressHide": 1},
	}
	if got := svc.ResolveCharacterResCode(context.Background(), char); got != 5101 {
		t.Fatalf("ResolveCharacterResCode() hidden = %d, want class 5101", got)
	}

	char.PMProcessData["pm13Transform"] = map[string]interface{}{"resCode": 7777}
	if got := svc.ResolveCharacterResCode(context.Background(), char); got != 7777 {
		t.Fatalf("ResolveCharacterResCode() transformed = %d, want 7777", got)
	}
}

func TestResolveCharacterFlyerAppearance_UsesFakeFlyerOverEquippedFlyer(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	repo.items[1] = &domainitem.Item{
		ID:          1,
		CharacterID: 88,
		TemplateID:  5001,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeEquipped,
		SlotIndex:   14,
	}
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustItemJSON(t, models.EquiptTemplateTemplate{ID: 5001, Position: 14, ResCode: 9301, WavCode: 9302}),
		mustItemJSON(t, models.EquiptTemplateTemplate{ID: 5002, Position: 14, ResCode: 9401, WavCode: 9402}),
	}); err != nil {
		t.Fatalf("load equipment templates: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustItemJSON(t, models.DressTemplate{ID: 7002, EquiptID: 5002}),
	}); err != nil {
		t.Fatalf("load dress templates: %v", err)
	}
	svc.SetGameDataManager(manager)

	char := &domainchar.Character{
		ID:     88,
		Gender: 0,
	}

	resCode, wavCode, ok := svc.ResolveCharacterFlyerAppearance(context.Background(), char)
	if !ok {
		t.Fatal("ResolveCharacterFlyerAppearance() = not ok, want equipped flyer")
	}
	if resCode != 9301 || wavCode != 9302 {
		t.Fatalf("ResolveCharacterFlyerAppearance() = (%d,%d), want (9301,9302)", resCode, wavCode)
	}

	info := domaindress.NewInfo()
	info.FakeFlyDressID = 7002
	dressInfo, err := info.EncodeClient()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}
	char.DressInfo = dressInfo

	resCode, wavCode, ok = svc.ResolveCharacterFlyerAppearance(context.Background(), char)
	if !ok {
		t.Fatal("ResolveCharacterFlyerAppearance() fake = not ok, want fake flyer")
	}
	if resCode != 9401 || wavCode != 9402 {
		t.Fatalf("ResolveCharacterFlyerAppearance() fake = (%d,%d), want (9401,9402)", resCode, wavCode)
	}

	repo.items = map[int64]*domainitem.Item{}
	if _, _, ok = svc.ResolveCharacterFlyerAppearance(context.Background(), char); ok {
		t.Fatal("ResolveCharacterFlyerAppearance() without equipped flyer = ok, want false")
	}
}

func TestAggregateEquipmentStats_IncludesDressSlotBindBonuses(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	repo.items[1] = &domainitem.Item{
		ID:          1,
		CharacterID: 99,
		TemplateID:  5001,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeEquipped,
		SlotIndex:   20,
		IsBound:     true,
		Properties: map[string]interface{}{
			"mainProp1":        20,
			"mainPropNum1":     30,
			"bindMainPropNum1": 7,
			"prop1":            8,
			"propNum1":         12,
		},
	}
	svc := NewService(repo, logger)

	bonuses := svc.AggregateEquipmentStats(context.Background(), 99)
	if got := bonuses.Flat[domainchar.PropStrength]; got != 37 {
		t.Fatalf("strength bonus = %d, want 37", got)
	}
	if got := bonuses.Flat[domainchar.PropHit]; got != 12 {
		t.Fatalf("hit bonus = %d, want 12", got)
	}
}

func mustItemJSON(t *testing.T, value interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(value)
	if err != nil {
		t.Fatalf("marshal json: %v", err)
	}
	return data
}

func TestBuildClientItemDTO_EquipmentAppliesDisplayContract(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{
		ID:             3101,
		ColorCode:      4,
		EndureMax:      66,
		MainProp1:      11,
		MainPropNum1:   120,
		BindPropNum:    15,
		HoleNum:        3,
		ActivePropType: 8,
		ActivePropNum:  5,
	}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	durability := 21
	maxDurability := 66
	it := &domainitem.Item{
		ID:            501,
		CharacterID:   1,
		TemplateID:    3101,
		ItemType:      domainitem.ItemTypeEquipment,
		SlotType:      domainitem.SlotTypeBag,
		SlotIndex:     0,
		IsBound:       true,
		ColorCode:     0,
		Durability:    &durability,
		MaxDurability: &maxDurability,
		Properties:    map[string]interface{}{},
	}

	dto := svc.BuildClientItemDTO(it)

	if got := dto["binded"]; got != "1" {
		t.Fatalf("expected binded=1, got %#v", got)
	}
	if got := dto["colorCode"]; got != 4 {
		t.Fatalf("expected colorCode 4, got %#v", got)
	}
	if got := dto["color"]; got != 3 {
		t.Fatalf("expected display color 3, got %#v", got)
	}
	if got := dto["preNameType"]; got != 4 {
		t.Fatalf("expected preNameType 4, got %#v", got)
	}
	if got := dto["mainProp1"]; got != 11 {
		t.Fatalf("expected mainProp1 11, got %#v", got)
	}
	if got := dto["bindMainPropNum1"]; got != 15 {
		t.Fatalf("expected bindMainPropNum1 15, got %#v", got)
	}
	if got := dto["activeProp"]; got != 8 {
		t.Fatalf("expected activeProp 8, got %#v", got)
	}
	if got := dto["holeNum"]; got != 0 {
		t.Fatalf("expected holeNum 0, got %#v", got)
	}
	if got := dto["endureLeft"]; got != "21" {
		t.Fatalf("expected endureLeft 21, got %#v", got)
	}
	if got := dto["endureMax"]; got != "66" {
		t.Fatalf("expected endureMax 66, got %#v", got)
	}
	if got := dto["flag"]; got != "" {
		t.Fatalf("expected empty flag, got %#v", got)
	}
	if got := dto["t1"]; got != -1 {
		t.Fatalf("expected t1 -1, got %#v", got)
	}
	if got := dto["t10"]; got != -1 {
		t.Fatalf("expected t10 -1, got %#v", got)
	}
}

func TestApplyEquipmentDisplayContract_UsesQualityFallbacks(t *testing.T) {
	recordData := map[string]interface{}{
		"quality": 14,
		"binded":  true,
		"t1":      99,
	}
	templateData := map[string]interface{}{
		"mainProp1":      7,
		"mainPropNum1":   77,
		"bindPropNum":    9,
		"activePropType": 8,
		"activePropNum":  3,
		"holeNum":        2,
		"endureMax":      55,
	}

	ApplyEquipmentDisplayContract(recordData, templateData)

	if got := recordData["colorCode"]; got != 3 {
		t.Fatalf("expected colorCode 3, got %#v", got)
	}
	if got := recordData["color"]; got != 2 {
		t.Fatalf("expected display color 2, got %#v", got)
	}
	if got := recordData["preNameType"]; got != 4 {
		t.Fatalf("expected preNameType 4, got %#v", got)
	}
	if got := recordData["binded"]; got != "1" {
		t.Fatalf("expected binded 1, got %#v", got)
	}
	if got := recordData["mainProp1"]; got != 7 {
		t.Fatalf("expected mainProp1 7, got %#v", got)
	}
	if got := recordData["bindMainPropNum1"]; got != 9 {
		t.Fatalf("expected bindMainPropNum1 9, got %#v", got)
	}
	if got := recordData["activeProp"]; got != 8 {
		t.Fatalf("expected activeProp 8, got %#v", got)
	}
	if got := recordData["holeNum"]; got != 1 {
		t.Fatalf("expected holeNum 1, got %#v", got)
	}
	if got := recordData["endureMax"]; got != 55 {
		t.Fatalf("expected endureMax 55, got %#v", got)
	}
	if got := recordData["flag"]; got != "" {
		t.Fatalf("expected empty flag, got %#v", got)
	}
	if got := recordData["t1"]; got != 99 {
		t.Fatalf("expected t1 to stay 99, got %#v", got)
	}
	if got := recordData["t2"]; got != -1 {
		t.Fatalf("expected t2 -1, got %#v", got)
	}
	if got := recordData["t10"]; got != -1 {
		t.Fatalf("expected t10 -1, got %#v", got)
	}
}

func TestApplyCharacterElementState_UsesDominantEquippedElementCount(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	repo.items[1] = &domainitem.Item{ID: 1, CharacterID: 9, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 0, Properties: map[string]interface{}{"element": 5}}
	repo.items[2] = &domainitem.Item{ID: 2, CharacterID: 9, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 1, Properties: map[string]interface{}{"element": "5"}}
	repo.items[3] = &domainitem.Item{ID: 3, CharacterID: 9, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, Properties: map[string]interface{}{"element": float64(2)}}

	char := &domainchar.Character{ID: 9, Ee: "0", En: 0, Ef: false}
	svc.ApplyCharacterElementState(context.Background(), char)

	if char.Ee != "5" {
		t.Fatalf("Ee = %q, want 5", char.Ee)
	}
	if char.En != 2 {
		t.Fatalf("En = %d, want 2", char.En)
	}
	if char.Ef {
		t.Fatalf("Ef = %v, want false", char.Ef)
	}
}

func TestApplyCharacterElementState_UsesLowerElementIDWhenDominantElementIsTied(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	repo.items[1] = &domainitem.Item{ID: 1, CharacterID: 10, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 0, Properties: map[string]interface{}{"element": 5}}
	repo.items[2] = &domainitem.Item{ID: 2, CharacterID: 10, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 1, Properties: map[string]interface{}{"element": 2}}

	char := &domainchar.Character{ID: 10, Ee: "6", En: 9, Ef: true}
	svc.ApplyCharacterElementState(context.Background(), char)

	if char.Ee != "2" {
		t.Fatalf("Ee = %q, want 2", char.Ee)
	}
	if char.En != 1 {
		t.Fatalf("En = %d, want 1", char.En)
	}
	if char.Ef {
		t.Fatalf("Ef = %v, want false", char.Ef)
	}
}

func TestUpdateEquipmentQuality_UsesRawQualityForPrefixAndColor(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3003, EndureMax: 40}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBind(context.Background(), 1, 3003, domainitem.ItemTypeEquipment, 1, false)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	updated, err := svc.UpdateEquipmentQuality(context.Background(), added.ID, 10)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if updated.ColorCode != 2 {
		t.Fatalf("expected colorCode 2, got %d", updated.ColorCode)
	}

	preNameType, ok := updated.Properties["preNameType"].(int)
	if !ok {
		t.Fatalf("expected preNameType to be int, got %T", updated.Properties["preNameType"])
	}
	if preNameType != 5 {
		t.Fatalf("expected preNameType 5, got %d", preNameType)
	}
	color, ok := updated.Properties["color"].(string)
	if !ok {
		t.Fatalf("expected color to be string, got %T", updated.Properties["color"])
	}
	if color != "1" {
		t.Fatalf("expected display color 1, got %q", color)
	}
	quality, ok := updated.Properties["q"].(int)
	if !ok {
		t.Fatalf("expected q to be int, got %T", updated.Properties["q"])
	}
	if quality != 10 {
		t.Fatalf("expected q 10, got %d", quality)
	}
}

func TestUpdateCraftedEquipmentQuality_RandomizesCraftedProps(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3008, EndureMax: 50, MainProp1: 11, MainProp2: 20, Prop1: 8, Prop2: 13, MainPropNum1: 100, MainPropNum2: 40, PropNum1: 60, PropNum2: 30, BindPropNum: 10}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBind(context.Background(), 1, 3008, domainitem.ItemTypeEquipment, 1, false)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	updated, err := svc.UpdateCraftedEquipmentQuality(context.Background(), added.ID, 10)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if updated.ColorCode != 2 {
		t.Fatalf("expected colorCode 2, got %d", updated.ColorCode)
	}
	assertQuestRewardPropPermutation(t, updated.Properties, []int{11, 20, 8, 13})
	assertQuestRewardPropValues(t, updated.Properties, map[int][2]int{
		11: {145, 150},
		20: {58, 60},
		8:  {87, 90},
		13: {43, 45},
	})
	assertRange := func(name string, got interface{}, min int, max int) {
		value := questRewardTestInt(got)
		if value < min || value > max {
			t.Fatalf("expected %s in [%d,%d], got %#v", name, min, max, got)
		}
	}
	assertRange("bindMainPropNum1", updated.Properties["bindMainPropNum1"], 0, 15)
	assertRange("bindMainPropNum2", updated.Properties["bindMainPropNum2"], 0, 15)
}

func TestBindItem_UpdatesPersistedBindedProperty(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	it := &domainitem.Item{
		ID:          10,
		CharacterID: 1,
		TemplateID:  3005,
		ItemType:    domainitem.ItemTypeEquipment,
		SlotType:    domainitem.SlotTypeEquipped,
		SlotIndex:   0,
		StackCount:  1,
		IsBound:     false,
		Properties: map[string]interface{}{
			"binded": "0",
		},
	}
	repo.items[it.ID] = it

	if err := svc.BindItem(context.Background(), 1, it.ID); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	updated, err := repo.FindByID(context.Background(), it.ID)
	if err != nil {
		t.Fatalf("expected updated item, got %v", err)
	}
	if !updated.IsBound {
		t.Fatal("expected item to be bound")
	}
	binded, ok := updated.Properties["binded"].(string)
	if !ok {
		t.Fatalf("expected persisted binded string, got %#v", updated.Properties["binded"])
	}
	if binded != "1" {
		t.Fatalf("expected persisted binded=1, got %q", binded)
	}
}

func TestAssignRandomEquipmentElement_UsesNonNeutralClientRange(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3004, EndureMax: 50}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBind(context.Background(), 1, 3004, domainitem.ItemTypeEquipment, 1, false)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	updated, err := svc.AssignRandomEquipmentElement(context.Background(), added.ID)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	elementValue, ok := updated.Properties["element"].(int)
	if !ok {
		t.Fatalf("expected element to be int, got %T", updated.Properties["element"])
	}
	if elementValue < 1 || elementValue > 6 {
		t.Fatalf("expected element in [1,6], got %d", elementValue)
	}
}

func TestSortBag_MergesMatchingStacks(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	repo.items[1] = &domainitem.Item{ID: 1, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 0, StackCount: 13, IsBound: true}
	repo.items[2] = &domainitem.Item{ID: 2, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 5, StackCount: 1, IsBound: true}
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	itemTpl := models.ItemTemplateTemplate{ID: 1001, Type: 1, StackMax: 99}
	raw, err := json.Marshal(itemTpl)
	if err != nil {
		t.Fatalf("marshal item template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load item template: %v", err)
	}
	svc.SetGameDataManager(manager)

	items, err := svc.SortBag(context.Background(), 1)
	if err != nil {
		t.Fatalf("SortBag() error = %v", err)
	}
	if len(items) != 1 {
		t.Fatalf("SortBag() item count = %d, want 1", len(items))
	}
	if items[0].ID != 1 {
		t.Fatalf("SortBag() surviving item id = %d, want 1", items[0].ID)
	}
	if items[0].StackCount != 14 {
		t.Fatalf("SortBag() surviving stack = %d, want 14", items[0].StackCount)
	}
	if items[0].SlotIndex != 0 {
		t.Fatalf("SortBag() surviving slot = %d, want 0", items[0].SlotIndex)
	}
	if _, ok := repo.items[2]; ok {
		t.Fatalf("expected merged item to be deleted")
	}
}

func TestSortBag_DoesNotMergeDifferentBindState(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	repo.items[1] = &domainitem.Item{ID: 1, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 4, StackCount: 2, IsBound: false}
	repo.items[2] = &domainitem.Item{ID: 2, CharacterID: 1, TemplateID: 1001, ItemType: domainitem.ItemTypeConsumable, SlotType: domainitem.SlotTypeBag, SlotIndex: 1, StackCount: 3, IsBound: true}
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	itemTpl := models.ItemTemplateTemplate{ID: 1001, Type: 1, StackMax: 99}
	raw, err := json.Marshal(itemTpl)
	if err != nil {
		t.Fatalf("marshal item template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableItemTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load item template: %v", err)
	}
	svc.SetGameDataManager(manager)

	items, err := svc.SortBag(context.Background(), 1)
	if err != nil {
		t.Fatalf("SortBag() error = %v", err)
	}
	if len(items) != 2 {
		t.Fatalf("SortBag() item count = %d, want 2", len(items))
	}

	item1, err := repo.FindByID(context.Background(), 1)
	if err != nil {
		t.Fatalf("FindByID(1) error = %v", err)
	}
	if item1.StackCount != 2 {
		t.Fatalf("item 1 stack = %d, want 2", item1.StackCount)
	}

	item2, err := repo.FindByID(context.Background(), 2)
	if err != nil {
		t.Fatalf("FindByID(2) error = %v", err)
	}
	if item2.StackCount != 3 {
		t.Fatalf("item 2 stack = %d, want 3", item2.StackCount)
	}
}

func TestUpdateQuestRewardEquipmentQuality_RandomizesQuestRewardProps(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3006, EndureMax: 50, MainProp1: 11, MainProp2: 20, Prop1: 8, Prop2: 13, MainPropNum1: 100, MainPropNum2: 40, PropNum1: 60, PropNum2: 30, BindPropNum: 10, ActivePropType: 8, ActivePropNum: 5}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBind(context.Background(), 1, 3006, domainitem.ItemTypeEquipment, 1, false)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	updated, err := svc.UpdateQuestRewardEquipmentQuality(context.Background(), added.ID, 10)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	assertRange := func(name string, got interface{}, min int, max int) {
		value := questRewardTestInt(got)
		if value < min || value > max {
			t.Fatalf("expected %s in [%d,%d], got %#v", name, min, max, got)
		}
	}

	assertRange("bindMainPropNum1", updated.Properties["bindMainPropNum1"], 0, 15)
	assertRange("bindMainPropNum2", updated.Properties["bindMainPropNum2"], 0, 15)
	assertQuestRewardPropPermutation(t, updated.Properties, []int{11, 20, 8, 13})
	assertQuestRewardPropValues(t, updated.Properties, map[int][2]int{
		11: {145, 150},
		20: {58, 60},
		8:  {87, 90},
		13: {43, 45},
	})

	if activeProp := questRewardTestInt(updated.Properties["activeProp"]); activeProp != 8 {
		t.Fatalf("expected activeProp 8, got %#v", updated.Properties["activeProp"])
	}
	if activePropNum := questRewardTestInt(updated.Properties["activePropNum"]); activePropNum != 5 {
		t.Fatalf("expected activePropNum 5, got %#v", updated.Properties["activePropNum"])
	}
	if quality := questRewardTestInt(updated.Properties["q"]); quality != 10 {
		t.Fatalf("expected q 10, got %#v", updated.Properties["q"])
	}
}

func TestUpdateQuestRewardEquipmentQuality_RandomizesPropAssignmentFromTemplatePool(t *testing.T) {
	logger := zap.NewNop()
	repo := newItemServiceTestRepo()
	svc := NewService(repo, logger)

	manager := gamedata.NewManager(nil, logger)
	equipTpl := models.EquiptTemplateTemplate{ID: 3007, EndureMax: 50, MainProp1: 11, MainProp2: 20, Prop1: 8, Prop2: 13, MainPropNum1: 100, MainPropNum2: 40, PropNum1: 60, PropNum2: 30}
	raw, err := json.Marshal(equipTpl)
	if err != nil {
		t.Fatalf("marshal equipment template: %v", err)
	}
	if err := manager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{raw}); err != nil {
		t.Fatalf("load equipment template: %v", err)
	}
	svc.SetGameDataManager(manager)

	added, err := svc.AddItemWithBind(context.Background(), 1, 3007, domainitem.ItemTypeEquipment, 1, false)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	layouts := make(map[string]struct{})
	for attempt := 0; attempt < 20; attempt++ {
		updated, err := svc.UpdateQuestRewardEquipmentQuality(context.Background(), added.ID, 10)
		if err != nil {
			t.Fatalf("expected no error, got %v", err)
		}
		assertQuestRewardPropPermutation(t, updated.Properties, []int{11, 20, 8, 13})
		layout := fmt.Sprintf("%d:%d:%d:%d",
			questRewardTestInt(updated.Properties["mainProp1"]),
			questRewardTestInt(updated.Properties["mainProp2"]),
			questRewardTestInt(updated.Properties["prop1"]),
			questRewardTestInt(updated.Properties["prop2"]),
		)
		layouts[layout] = struct{}{}
	}

	if len(layouts) < 2 {
		t.Fatalf("expected at least two distinct prop layouts, got %v", layouts)
	}
}

func assertQuestRewardPropPermutation(t *testing.T, properties map[string]interface{}, expected []int) {
	t.Helper()
	seen := make(map[int]int, len(expected))
	for _, key := range []string{"mainProp1", "mainProp2", "prop1", "prop2"} {
		seen[questRewardTestInt(properties[key])]++
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

func assertQuestRewardPropValues(t *testing.T, properties map[string]interface{}, expected map[int][2]int) {
	t.Helper()
	for _, pair := range [][2]string{{"mainProp1", "mainPropNum1"}, {"mainProp2", "mainPropNum2"}, {"prop1", "propNum1"}, {"prop2", "propNum2"}} {
		propType := questRewardTestInt(properties[pair[0]])
		bounds, ok := expected[propType]
		if !ok {
			t.Fatalf("unexpected prop type %d in properties %#v", propType, properties)
		}
		value := questRewardTestInt(properties[pair[1]])
		if value < bounds[0] || value > bounds[1] {
			t.Fatalf("expected %s for prop type %d in [%d,%d], got %#v", pair[1], propType, bounds[0], bounds[1], properties[pair[1]])
		}
	}
}

func questRewardTestInt(value interface{}) int {
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
	case float32:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return 0
	}
}
