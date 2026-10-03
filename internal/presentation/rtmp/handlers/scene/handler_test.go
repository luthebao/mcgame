// Open-sourced by BaoLT

package scene

import (
	"context"
	"encoding/json"
	"errors"
	"net"
	"testing"
	"time"

	appchar "mcgame-server/internal/application/character"
	appfarm "mcgame-server/internal/application/farm"
	appgroup "mcgame-server/internal/application/group"
	appitem "mcgame-server/internal/application/item"
	appscene "mcgame-server/internal/application/scene"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/creature"
	domaindress "mcgame-server/internal/domain/dress"
	domainfarm "mcgame-server/internal/domain/farm"
	domaingroup "mcgame-server/internal/domain/group"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/domain/npc"
	"mcgame-server/internal/domain/sceneitem"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
	"go.uber.org/zap/zaptest"
	"go.uber.org/zap/zaptest/observer"
)

type stubNetConn struct{}

func (s *stubNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *stubNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *stubNetConn) Close() error                      { return nil }
func (s *stubNetConn) LocalAddr() net.Addr               { return nil }
func (s *stubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *stubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *stubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *stubNetConn) SetWriteDeadline(t time.Time) error { return nil }

func TestSendSceneResetCallbacks_SendsEmptyNpcAndBossLists(t *testing.T) {
	logger := zaptest.NewLogger(t)
	h := NewHandler(nil, nil, nil, logger)
	conn := infrartmp.NewConnection(1, &stubNetConn{}, nil, logger)

	calledMethods := make([]string, 0, 2)
	calledArgs := make([][]interface{}, 0, 2)
	h.sendCallbackFn = func(_ *infrartmp.Connection, method string, args ...interface{}) error {
		calledMethods = append(calledMethods, method)
		calledArgs = append(calledArgs, args)
		return nil
	}

	if err := h.sendSceneResetCallbacks(conn); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if len(calledMethods) != 2 {
		t.Fatalf("expected 2 callbacks, got %d", len(calledMethods))
	}
	if calledMethods[0] != "onCreateNpcs" {
		t.Fatalf("expected first callback onCreateNpcs, got %s", calledMethods[0])
	}
	if calledMethods[1] != "onCreateBoss" {
		t.Fatalf("expected second callback onCreateBoss, got %s", calledMethods[1])
	}

	if len(calledArgs[0]) != 1 {
		t.Fatalf("expected 1 arg for onCreateNpcs, got %d", len(calledArgs[0]))
	}
	if _, ok := calledArgs[0][0].(map[string]interface{}); !ok {
		t.Fatalf("expected map payload for onCreateNpcs, got %T", calledArgs[0][0])
	}

	if len(calledArgs[1]) != 1 {
		t.Fatalf("expected 1 arg for onCreateBoss, got %d", len(calledArgs[1]))
	}
	if _, ok := calledArgs[1][0].(map[string]interface{}); !ok {
		t.Fatalf("expected map payload for onCreateBoss, got %T", calledArgs[1][0])
	}
}

func TestSceneLogin_EmitsSceneLoginCallbackChain(t *testing.T) {
	h, _, _ := createTestSceneHandler(t, 1, 1)
	h.sceneManager = infrartmp.NewSceneManager()

	char := &domainchar.Character{
		ID:         1,
		Name:       "newbie",
		MapID:      1,
		PosX:       1000,
		PosY:       1000,
		Level:      1,
		Experience: 0,
	}
	h.charService = appchar.NewService(&fakeCharacterRepo{char: char}, zap.NewNop())

	calledMethods := make([]string, 0)
	conn := infrartmp.NewConnection(1, &stubNetConn{}, nil, zaptest.NewLogger(t))
	h.sendCallbackFn = func(_ *infrartmp.Connection, method string, args ...interface{}) error {
		calledMethods = append(calledMethods, method)
		return nil
	}

	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn, ConnID: 1}
	if _, err := h.SceneLogin(ctx, nil); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	wantMethods := []string{"onSceneLogin", "onMountOff", "onClearWbView", "onCreateCharactor"}
	for i, want := range wantMethods {
		if i >= len(calledMethods) {
			t.Fatalf("expected callback %q at index %d, but only %d callbacks sent: %v", want, i, len(calledMethods), calledMethods)
		}
		if calledMethods[i] != want {
			t.Fatalf("callback[%d] = %q, want %q", i, calledMethods[i], want)
		}
	}
}

type fakeCharacterRepo struct {
	char *domainchar.Character
}

func (f *fakeCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if f.char == nil {
		return nil, errors.New("character not found")
	}
	if f.char.ID != id {
		return nil, errors.New("character not found")
	}
	return f.char, nil
}

func (f *fakeCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (f *fakeCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (f *fakeCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (f *fakeCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (f *fakeCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (f *fakeCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (f *fakeCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (f *fakeCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	if f.char != nil && f.char.ID == id {
		f.char.MapID = pos.MapID
		f.char.PosX = pos.X
		f.char.PosY = pos.Y
		f.char.Direction = pos.Direction
	}
	return nil
}

func (f *fakeCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type fakeNPCRepo struct{}

func (f *fakeNPCRepo) FindByID(ctx context.Context, id int) (*npc.NPC, error) {
	return nil, nil
}

func (f *fakeNPCRepo) FindByMapID(ctx context.Context, mapID int) ([]*npc.NPC, error) {
	return nil, nil
}

func (f *fakeNPCRepo) FindByTemplateID(ctx context.Context, templateID int) ([]*npc.NPC, error) {
	return nil, nil
}

func (f *fakeNPCRepo) Create(ctx context.Context, n *npc.NPC) error {
	return nil
}

func (f *fakeNPCRepo) Update(ctx context.Context, n *npc.NPC) error {
	return nil
}

func (f *fakeNPCRepo) Delete(ctx context.Context, id int) error {
	return nil
}

func (f *fakeNPCRepo) SetActive(ctx context.Context, id int, active bool) error {
	return nil
}

type fakeSceneItemRepo struct{}

func (f *fakeSceneItemRepo) FindByID(ctx context.Context, id int64) (*sceneitem.SceneItem, error) {
	return nil, nil
}

func (f *fakeSceneItemRepo) FindByMapID(ctx context.Context, mapID int) ([]*sceneitem.SceneItem, error) {
	return nil, nil
}

func (f *fakeSceneItemRepo) FindByOwner(ctx context.Context, ownerID int64) ([]*sceneitem.SceneItem, error) {
	return nil, nil
}

func (f *fakeSceneItemRepo) Create(ctx context.Context, item *sceneitem.SceneItem) error {
	return nil
}

func (f *fakeSceneItemRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (f *fakeSceneItemRepo) DeleteExpired(ctx context.Context) (int64, error) {
	return 0, nil
}

func (f *fakeSceneItemRepo) DeleteByMapID(ctx context.Context, mapID int) (int64, error) {
	return 0, nil
}

type fakeFarmRepo struct {
	plots []*domainfarm.Plot
}

func (f *fakeFarmRepo) FindByCharacter(ctx context.Context, characterID int64) ([]*domainfarm.Plot, error) {
	result := make([]*domainfarm.Plot, 0, len(f.plots))
	for _, plot := range f.plots {
		if plot != nil && plot.CharacterID == characterID {
			result = append(result, plot)
		}
	}
	return result, nil
}

func (f *fakeFarmRepo) FindByCharacterAndPlot(ctx context.Context, characterID int64, plotNPCID int) (*domainfarm.Plot, error) {
	for _, plot := range f.plots {
		if plot != nil && plot.CharacterID == characterID && plot.PlotNPCID == plotNPCID {
			return plot, nil
		}
	}
	return nil, nil
}

func (f *fakeFarmRepo) FindByPlot(ctx context.Context, plotNPCID int) (*domainfarm.Plot, error) {
	for _, plot := range f.plots {
		if plot != nil && plot.PlotNPCID == plotNPCID {
			return plot, nil
		}
	}
	return nil, nil
}

func (f *fakeFarmRepo) FindByPlots(ctx context.Context, plotNPCIDs []int) ([]*domainfarm.Plot, error) {
	result := make([]*domainfarm.Plot, 0, len(plotNPCIDs))
	for _, plotNPCID := range plotNPCIDs {
		for _, plot := range f.plots {
			if plot != nil && plot.PlotNPCID == plotNPCID {
				result = append(result, plot)
				break
			}
		}
	}
	return result, nil
}

func (f *fakeFarmRepo) Upsert(ctx context.Context, plot *domainfarm.Plot) error {
	for i, existing := range f.plots {
		if existing != nil && existing.CharacterID == plot.CharacterID && existing.PlotNPCID == plot.PlotNPCID {
			f.plots[i] = plot
			return nil
		}
	}
	f.plots = append(f.plots, plot)
	return nil
}

func (f *fakeFarmRepo) Delete(ctx context.Context, characterID int64, plotNPCID int) error {
	next := make([]*domainfarm.Plot, 0, len(f.plots))
	for _, plot := range f.plots {
		if plot != nil && plot.CharacterID == characterID && plot.PlotNPCID == plotNPCID {
			continue
		}
		next = append(next, plot)
	}
	f.plots = next
	return nil
}

type fakeItemRepo struct {
	slotItems []*domainitem.Item
}

func (f *fakeItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	return nil, pkgerrors.ErrItemNotFound
}

func (f *fakeItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return nil, nil
}

func (f *fakeItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	return nil, nil
}

func (f *fakeItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, item := range f.slotItems {
		if item != nil && item.CharacterID == charID && item.SlotType == slotType && item.SlotIndex == slotIndex {
			return item, nil
		}
	}
	return nil, pkgerrors.ErrItemNotFound
}

func (f *fakeItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	var equipped []*domainitem.Item
	for _, item := range f.slotItems {
		if item != nil && item.CharacterID == charID && item.SlotType == domainitem.SlotTypeEquipped {
			equipped = append(equipped, item)
		}
	}
	if len(equipped) > 0 {
		return equipped, nil
	}
	return nil, nil
}

func (f *fakeItemRepo) Create(ctx context.Context, item *domainitem.Item) error {
	return nil
}

func (f *fakeItemRepo) Update(ctx context.Context, item *domainitem.Item) error {
	return nil
}

func (f *fakeItemRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (f *fakeItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	return nil
}

func (f *fakeItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	return nil
}

func (f *fakeItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	return nil
}

func (f *fakeItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	return 0, nil
}

func (f *fakeItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	return 0, nil
}

type fakeGameDataRepo struct{}

func (f *fakeGameDataRepo) GetByTableAndID(ctx context.Context, tableName string, recordID int) (json.RawMessage, error) {
	return nil, nil
}

func (f *fakeGameDataRepo) GetAllByTable(ctx context.Context, tableName string) ([]json.RawMessage, error) {
	return nil, nil
}

func (f *fakeGameDataRepo) Upsert(ctx context.Context, tableName string, recordID int, data json.RawMessage) error {
	return nil
}

func (f *fakeGameDataRepo) UpsertBatch(ctx context.Context, tableName string, records []gamedata.Record) error {
	return nil
}

func (f *fakeGameDataRepo) DeleteByTableAndID(ctx context.Context, tableName string, recordID int) error {
	return nil
}

func (f *fakeGameDataRepo) DeleteAllByTable(ctx context.Context, tableName string) error {
	return nil
}

func (f *fakeGameDataRepo) CountByTable(ctx context.Context, tableName string) (int, error) {
	return 0, nil
}

func (f *fakeGameDataRepo) GetTableNames(ctx context.Context) ([]string, error) {
	return nil, nil
}

type fakeGroupRepo struct {
	groups map[int64]*domaingroup.Group
}

func (f *fakeGroupRepo) FindByID(ctx context.Context, id int64) (*domaingroup.Group, error) {
	if f == nil {
		return nil, nil
	}
	return f.groups[id], nil
}

func (f *fakeGroupRepo) FindByMember(ctx context.Context, charID int64) (*domaingroup.Group, error) {
	if f == nil {
		return nil, nil
	}
	for _, groupInfo := range f.groups {
		for _, member := range groupInfo.Members {
			if member.CharID == charID {
				return groupInfo, nil
			}
		}
	}
	return nil, nil
}

func (f *fakeGroupRepo) Create(ctx context.Context, g *domaingroup.Group) (*domaingroup.Group, error) {
	if f.groups == nil {
		f.groups = make(map[int64]*domaingroup.Group)
	}
	f.groups[g.ID] = g
	return g, nil
}

func (f *fakeGroupRepo) Update(ctx context.Context, g *domaingroup.Group) error {
	if f.groups == nil {
		f.groups = make(map[int64]*domaingroup.Group)
	}
	f.groups[g.ID] = g
	return nil
}

func (f *fakeGroupRepo) Delete(ctx context.Context, id int64) error {
	delete(f.groups, id)
	return nil
}

func (f *fakeGroupRepo) ListByMap(ctx context.Context, mapID int) ([]*domaingroup.Group, error) {
	return nil, nil
}

func createTestSceneHandler(t *testing.T, charMapID int, npcMapID int) (*Handler, *infrartmp.Connection, *observer.ObservedLogs) {
	t.Helper()

	core, observed := observer.New(zap.DebugLevel)
	logger := zap.New(core)
	charEntity := &domainchar.Character{ID: 1, MapID: charMapID, Name: "tester"}

	charRepo := &fakeCharacterRepo{char: charEntity}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)

	gameDataManager := gamedata.NewManager(&fakeGameDataRepo{}, logger)
	npcTemplate := models.NpcTemplate{
		ID:       int64(npcMapID*100 + 1),
		Name:     "npc",
		PosMapID: float64(npcMapID),
		PosX:     10,
		PosY:     20,
		ResCode:  1001,
		Type:     float64(creature.NPCTypeHeal),
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{mustJSON(t, npcTemplate)}); err != nil {
		t.Fatalf("failed to load npc template: %v", err)
	}
	sceneService.SetGameDataManager(gameDataManager)

	h := NewHandler(charService, sceneService, nil, logger)
	h.SetGameDataManager(gameDataManager)
	conn := infrartmp.NewConnection(1, &stubNetConn{}, nil, logger)

	return h, conn, observed
}

func mustJSON(t *testing.T, v interface{}) json.RawMessage {
	t.Helper()
	data, err := json.Marshal(v)
	if err != nil {
		t.Fatalf("failed to marshal json: %v", err)
	}
	return data
}

func TestCreateNpcs_UsesConnectionSceneMapBeforeCharacterMap(t *testing.T) {
	h, conn, _ := createTestSceneHandler(t, 100, 200)
	conn.SetSceneInfo(200, 1)

	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn}
	if _, err := h.CreateNpcs(ctx, nil); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
}

func TestCreateNpcs_FallsBackToCharacterMapWhenConnectionSceneMapIsZero(t *testing.T) {
	h, conn, _ := createTestSceneHandler(t, 100, 100)
	conn.SetSceneInfo(0, 1)

	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn}
	if _, err := h.CreateNpcs(ctx, nil); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
}

func TestBuildScenePlayerData_EnrichesGroupAndBattleState(t *testing.T) {
	h, conn, _ := createTestSceneHandler(t, 1, 1)
	conn.SetCharacter("1")
	conn.SetSceneInfo(1, 1)
	conn.SetBattleID("battle-1")

	h.SetGroupService(appgroup.NewService(&fakeGroupRepo{
		groups: map[int64]*domaingroup.Group{
			1: {
				ID:       1,
				LeaderID: 1,
				Members: []domaingroup.Member{
					{CharID: 1, IsLeader: true},
					{CharID: 2},
				},
			},
		},
	}))

	char := &domainchar.Character{ID: 1, Name: "tester", MapID: 1}
	playerData := h.buildScenePlayerData(context.Background(), conn, char)

	if got := playerData["inBattle"]; got != true {
		t.Fatalf("inBattle = %#v, want true", got)
	}
	if got := playerData["state"]; got != clientCharStateBattle {
		t.Fatalf("state = %#v, want %d", got, clientCharStateBattle)
	}
	if got := playerData["inGroup"]; got != true {
		t.Fatalf("inGroup = %#v, want true", got)
	}
	if got := playerData["isLeader"]; got != true {
		t.Fatalf("isLeader = %#v, want true", got)
	}
	if _, ok := playerData["mList"].(map[string]interface{}); !ok {
		t.Fatalf("mList = %#v, want map[string]interface{}", playerData["mList"])
	}
}

func TestGetCharStateClient_ReturnsBattleStateForCurrentConnection(t *testing.T) {
	h, conn, _ := createTestSceneHandler(t, 1, 1)
	conn.SetCharacter("1")
	conn.SetSceneInfo(1, 1)
	conn.SetBattleID("battle-1")

	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn, ConnID: 1}
	got, err := h.GetCharStateClient(ctx, nil)
	if err != nil {
		t.Fatalf("GetCharStateClient() error = %v", err)
	}
	if got != clientCharStateBattle {
		t.Fatalf("GetCharStateClient() = %#v, want %d", got, clientCharStateBattle)
	}
}

func TestBuildNPCList_AddsFarmOverlayOnFarmMap(t *testing.T) {
	logger := zaptest.NewLogger(t)
	charRepo := &fakeCharacterRepo{char: &domainchar.Character{ID: 1, Name: "tester", MapID: 57}}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	gameDataManager := gamedata.NewManager(&fakeGameDataRepo{}, logger)

	if err := gameDataManager.GetCache().LoadTable(models.TableNpc, []json.RawMessage{
		mustJSON(t, models.NpcTemplate{ID: 1707, Name: "Scarecrow", PosMapID: 57, PosX: 100, PosY: 200, ResCode: 5001, Type: 0}),
		mustJSON(t, models.NpcTemplate{ID: 1229, Name: "Crop", PosMapID: 57, PosX: 100, PosY: 200, ResCode: 7001, Type: 0}),
	}); err != nil {
		t.Fatalf("failed to load npc templates: %v", err)
	}
	sceneService.SetGameDataManager(gameDataManager)

	farmRepo := &fakeFarmRepo{plots: []*domainfarm.Plot{{
		CharacterID: 2,
		PlotNPCID:   1707,
		CropNPCID:   1229,
		PlantedAt:   time.Now().Add(-2 * time.Minute),
		ReadyAt:     time.Now().Add(2 * time.Minute),
	}}}
	farmService := appfarm.NewService(farmRepo, charRepo, nil, logger)
	farmService.SetGameDataManager(gameDataManager)

	h := NewHandler(charService, sceneService, nil, logger)
	h.SetGameDataManager(gameDataManager)
	h.SetFarmService(farmService)

	npcList, err := h.buildNPCList(context.Background(), 1, 57, 0)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	base, ok := npcList["1707"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected base farm npc entry, got %#v", npcList["1707"])
	}
	if got := base["nid"]; got != 1707 {
		t.Fatalf("base nid = %v, want 1707", got)
	}

	overlay, ok := npcList["101707"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected farm overlay entry, got %#v", npcList["101707"])
	}
	if got := overlay["nid"]; got != 1229 {
		t.Fatalf("overlay nid = %v, want 1229", got)
	}
	if got := overlay["x"]; got != 250 {
		t.Fatalf("overlay x = %v, want 250", got)
	}
	if got := overlay["y"]; got != 125 {
		t.Fatalf("overlay y = %v, want 125", got)
	}
}

func TestCreateBoss_UsesConnectionSceneMapBeforeCharacterMap(t *testing.T) {
	h, conn, _ := createTestSceneHandler(t, 100, 200)
	conn.SetSceneInfo(200, 1)

	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn}
	if _, err := h.CreateBoss(ctx, nil); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
}

func TestGetMapNPCsForClient_IncludesNPCType(t *testing.T) {
	h, _, _ := createTestSceneHandler(t, 200, 200)

	npcs, err := h.sceneService.GetMapNPCsForClient(context.Background(), 200)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
	if len(npcs) != 1 {
		t.Fatalf("expected 1 npc, got %d", len(npcs))
	}
	if npcs[0].Type != int(creature.NPCTypeHeal) {
		t.Fatalf("expected npc type %d, got %d", creature.NPCTypeHeal, npcs[0].Type)
	}
}

func TestCreateBoss_FallsBackToCharacterMapWhenConnectionSceneMapIsZero(t *testing.T) {
	h, conn, _ := createTestSceneHandler(t, 100, 100)
	conn.SetSceneInfo(0, 1)

	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn}
	if _, err := h.CreateBoss(ctx, nil); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
}

func TestValidateBeginFlying_RequiresLevel50(t *testing.T) {
	logger := zaptest.NewLogger(t)
	charRepo := &fakeCharacterRepo{char: &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 49}}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{{ID: 1, CharacterID: 1, TemplateID: 9001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: flyingEquipSlot}}}, logger)

	h := NewHandler(charService, sceneService, nil, logger)
	h.SetItemService(itemService)

	err := h.validateBeginFlying(context.Background(), 1)
	if !pkgerrors.Is(err, pkgerrors.ErrInsufficientLevel) {
		t.Fatalf("expected ErrInsufficientLevel, got %v", err)
	}
}

func TestValidateBeginFlying_RequiresWingEquipped(t *testing.T) {
	logger := zaptest.NewLogger(t)
	charRepo := &fakeCharacterRepo{char: &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50}}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: nil}, logger)

	h := NewHandler(charService, sceneService, nil, logger)
	h.SetItemService(itemService)

	err := h.validateBeginFlying(context.Background(), 1)
	if !pkgerrors.Is(err, pkgerrors.ErrItemNotFound) {
		t.Fatalf("expected ErrItemNotFound, got %v", err)
	}
}

func TestValidateBeginFlying_AllowsLevel50WithWingEquipped(t *testing.T) {
	logger := zaptest.NewLogger(t)
	charRepo := &fakeCharacterRepo{char: &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50}}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{{ID: 1, CharacterID: 1, TemplateID: 9001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: flyingEquipSlot}}}, logger)

	h := NewHandler(charService, sceneService, nil, logger)
	h.SetItemService(itemService)

	if err := h.validateBeginFlying(context.Background(), 1); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
}

func TestValidateBeginFlying_AllowsTemplatePosition14EvenIfSlotDiffers(t *testing.T) {
	logger := zaptest.NewLogger(t)
	charRepo := &fakeCharacterRepo{char: &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50}}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{{ID: 1, CharacterID: 1, TemplateID: 1345, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 99}}}, logger)
	gameDataManager := gamedata.NewManager(&fakeGameDataRepo{}, logger)
	template := models.EquiptTemplateTemplate{ID: 1345, Name: "Choi Ma Phap", Position: flyingEquipPosition, ReqLevel: minimumFlyingLevel}
	if err := gameDataManager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{mustJSON(t, template)}); err != nil {
		t.Fatalf("failed to load equipment template: %v", err)
	}
	itemService.SetGameDataManager(gameDataManager)

	h := NewHandler(charService, sceneService, nil, logger)
	h.SetItemService(itemService)

	if err := h.validateBeginFlying(context.Background(), 1); err != nil {
		t.Fatalf("expected no error, got %v", err)
	}
}

func TestGetCharacterForClient_IncludesEquippedAppearanceData(t *testing.T) {
	logger := zaptest.NewLogger(t)
	char := &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50, Gender: 0, Ee: "2", Ef: true, En: 1}
	charRepo := &fakeCharacterRepo{char: char}
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{
		{ID: 1, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, StarLevel: 5},
		{ID: 2, CharacterID: 1, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 13},
	}}, logger)
	gameDataManager := gamedata.NewManager(&fakeGameDataRepo{}, logger)
	if err := gameDataManager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustJSON(t, models.EquiptTemplateTemplate{ID: 2001, Position: 3, ResCodeMale: 8101, ResCodeFemale: 8201}),
		mustJSON(t, models.EquiptTemplateTemplate{ID: 2002, Position: 14, ResCode: 8301, WavCode: 8302}),
	}); err != nil {
		t.Fatalf("failed to load equipment templates: %v", err)
	}
	itemService.SetGameDataManager(gameDataManager)
	sceneService.SetAppearanceProvider(itemService)

	data := sceneService.GetCharacterForClient(char)

	if got := data["wp"]; got != "8101" {
		t.Fatalf("wp = %v, want \"8101\"", got)
	}
	if got := data["flyerResCode"]; got != "8301" {
		t.Fatalf("flyerResCode = %v, want \"8301\"", got)
	}
	if got := data["flyerFrontResCode"]; got != "8302" {
		t.Fatalf("flyerFrontResCode = %v, want \"8302\"", got)
	}
	if got := data["star"]; got != 5 {
		t.Fatalf("star = %v, want 5", got)
	}
	equiptList, ok := data["equiptList"].(map[string]interface{})
	if !ok {
		t.Fatalf("equiptList type = %T, want map[string]interface{}", data["equiptList"])
	}
	if _, ok := equiptList["3"]; !ok {
		t.Fatalf("equiptList missing weapon slot: %#v", equiptList)
	}
	if _, ok := equiptList["14"]; !ok {
		t.Fatalf("equiptList missing flyer slot: %#v", equiptList)
	}
}

func TestGetCharacterForClient_UsesFakeFlyerAppearance(t *testing.T) {
	logger := zaptest.NewLogger(t)
	char := &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50, Gender: 0}
	info := domaindress.NewInfo()
	info.FakeFlyDressID = 7002
	encodedDressInfo, err := info.Encode()
	if err != nil {
		t.Fatalf("encode dress info: %v", err)
	}
	char.DressInfo = encodedDressInfo

	charRepo := &fakeCharacterRepo{char: char}
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{
		{ID: 2, CharacterID: 1, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 13},
	}}, logger)
	gameDataManager := gamedata.NewManager(&fakeGameDataRepo{}, logger)
	if err := gameDataManager.GetCache().LoadTable(models.TableEquiptTemplate, []json.RawMessage{
		mustJSON(t, models.EquiptTemplateTemplate{ID: 2002, Position: 14, ResCode: 8301, WavCode: 8302}),
		mustJSON(t, models.EquiptTemplateTemplate{ID: 2003, Position: 14, ResCode: 8401, WavCode: 8402}),
	}); err != nil {
		t.Fatalf("failed to load equipment templates: %v", err)
	}
	if err := gameDataManager.GetCache().LoadTable(models.TableDress, []json.RawMessage{
		mustJSON(t, models.DressTemplate{ID: 7002, EquiptID: 2003}),
	}); err != nil {
		t.Fatalf("failed to load dress templates: %v", err)
	}
	itemService.SetGameDataManager(gameDataManager)
	sceneService.SetAppearanceProvider(itemService)

	data := sceneService.GetCharacterForClient(char)

	if got := data["flyerResCode"]; got != "8401" {
		t.Fatalf("flyerResCode = %v, want \"8401\"", got)
	}
	if got := data["flyerFrontResCode"]; got != "8402" {
		t.Fatalf("flyerFrontResCode = %v, want \"8402\"", got)
	}
}

func TestGetCharacterForClient_DerivesCharacterElementFromEquippedItems(t *testing.T) {
	logger := zaptest.NewLogger(t)
	char := &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50, Gender: 0, Ee: "0", Ef: false, En: 0}
	charRepo := &fakeCharacterRepo{char: char}
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{
		{ID: 1, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, Properties: map[string]interface{}{"element": 5}},
		{ID: 2, CharacterID: 1, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 13, Properties: map[string]interface{}{"element": float64(5)}},
		{ID: 3, CharacterID: 1, TemplateID: 2003, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 4, Properties: map[string]interface{}{"element": 2}},
	}}, logger)
	sceneService.SetAppearanceProvider(itemService)

	data := sceneService.GetCharacterForClient(char)

	if got := data["ee"]; got != "5" {
		t.Fatalf("ee = %v, want 5", got)
	}
	if got := data["en"]; got != 2 {
		t.Fatalf("en = %v, want 2", got)
	}
	if got := data["ef"]; got != false {
		t.Fatalf("ef = %v, want false", got)
	}
}

func TestGetCharacterForClient_UsesLowerElementIDWhenCountsTie(t *testing.T) {
	logger := zaptest.NewLogger(t)
	char := &domainchar.Character{ID: 1, Name: "tester", MapID: 1, Level: 50, Gender: 0}
	charRepo := &fakeCharacterRepo{char: char}
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	itemService := appitem.NewService(&fakeItemRepo{slotItems: []*domainitem.Item{
		{ID: 1, CharacterID: 1, TemplateID: 2001, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 2, Properties: map[string]interface{}{"element": 5}},
		{ID: 2, CharacterID: 1, TemplateID: 2002, ItemType: domainitem.ItemTypeEquipment, SlotType: domainitem.SlotTypeEquipped, SlotIndex: 13, Properties: map[string]interface{}{"element": 2}},
	}}, logger)
	sceneService.SetAppearanceProvider(itemService)

	data := sceneService.GetCharacterForClient(char)

	if got := data["ee"]; got != "2" {
		t.Fatalf("ee = %v, want 2", got)
	}
	if got := data["en"]; got != 1 {
		t.Fatalf("en = %v, want 1", got)
	}
}

func TestToMovable_NoArgsTeleportsToCurrentMapSafePoint(t *testing.T) {
	logger := zaptest.NewLogger(t)
	char := &domainchar.Character{ID: 1, Name: "tester", MapID: 1, PosX: 345, PosY: 678}
	charRepo := &fakeCharacterRepo{char: char}
	charService := appchar.NewService(charRepo, logger)
	sceneService := appscene.NewService(charRepo, &fakeNPCRepo{}, &fakeSceneItemRepo{}, nil, logger)
	h := NewHandler(charService, sceneService, infrartmp.NewSceneManager(), logger)
	conn := infrartmp.NewConnection(1, &stubNetConn{}, nil, logger)
	conn.SetSceneInfo(1, 1)
	ctx := &infrartmp.RPCContext{Context: context.Background(), CharacterID: "1", Connection: conn, ConnID: 1}

	resp, err := h.ToMovable(ctx, nil)
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	result, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected map response, got %T", resp)
	}
	if got := result["mapId"]; got != 1 {
		t.Fatalf("mapId = %v, want 1", got)
	}
	if got := result["posX"]; got != 100 {
		t.Fatalf("posX = %v, want 100", got)
	}
	if got := result["posY"]; got != 100 {
		t.Fatalf("posY = %v, want 100", got)
	}
	if char.PosX != 100 || char.PosY != 100 {
		t.Fatalf("character position = (%d,%d), want (100,100)", char.PosX, char.PosY)
	}
}
