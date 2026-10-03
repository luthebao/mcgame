// Open-sourced by BaoLT

package group

import (
	"context"
	"errors"
	"net"
	"strconv"
	"testing"
	"time"

	appchar "mcgame-server/internal/application/character"
	appgroup "mcgame-server/internal/application/group"
	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/infrastructure/persistence/memory"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type roomStubNetConn struct{}

func (s *roomStubNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *roomStubNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *roomStubNetConn) Close() error                      { return nil }
func (s *roomStubNetConn) LocalAddr() net.Addr               { return nil }
func (s *roomStubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *roomStubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *roomStubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *roomStubNetConn) SetWriteDeadline(t time.Time) error { return nil }

type roomTestCharacterRepo struct {
	chars map[int64]*domainchar.Character
}

func (r *roomTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	char, ok := r.chars[id]
	if !ok {
		return nil, errors.New("character not found")
	}
	return char, nil
}

func (r *roomTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *roomTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *roomTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *roomTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	r.chars[character.ID] = character
	return nil
}

func (r *roomTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.chars[character.ID] = character
	return nil
}

func (r *roomTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	delete(r.chars, id)
	return nil
}

func (r *roomTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *roomTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	char, ok := r.chars[id]
	if !ok {
		return errors.New("character not found")
	}
	char.MapID = pos.MapID
	char.PosX = pos.X
	char.PosY = pos.Y
	char.Direction = pos.Direction
	return nil
}

func (r *roomTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type roomCallbackCall struct {
	characterID int64
	method      string
	args        []interface{}
}

type roomTestItemRepo struct {
	items map[int64]*domainitem.Item
}

func newRoomTestItemRepo(items ...*domainitem.Item) *roomTestItemRepo {
	repo := &roomTestItemRepo{items: make(map[int64]*domainitem.Item)}
	for _, it := range items {
		copy := *it
		repo.items[it.ID] = &copy
	}
	return repo
}

func (r *roomTestItemRepo) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	if it, ok := r.items[id]; ok {
		copy := *it
		return &copy, nil
	}
	return nil, errors.New("item not found")
}

func (r *roomTestItemRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID {
			copy := *it
			result = append(result, &copy)
		}
	}
	return result, nil
}

func (r *roomTestItemRepo) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType {
			copy := *it
			result = append(result, &copy)
		}
	}
	return result, nil
}

func (r *roomTestItemRepo) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, it := range r.items {
		if it.CharacterID == charID && it.SlotType == slotType && it.SlotIndex == slotIndex {
			copy := *it
			return &copy, nil
		}
	}
	return nil, errors.New("item not found")
}

func (r *roomTestItemRepo) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return r.FindByCharacterAndSlotType(ctx, charID, domainitem.SlotTypeEquipped)
}

func (r *roomTestItemRepo) Create(ctx context.Context, item *domainitem.Item) error {
	copy := *item
	r.items[item.ID] = &copy
	return nil
}

func (r *roomTestItemRepo) Update(ctx context.Context, item *domainitem.Item) error {
	copy := *item
	r.items[item.ID] = &copy
	return nil
}

func (r *roomTestItemRepo) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *roomTestItemRepo) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, item := range r.items {
		if item.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *roomTestItemRepo) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	item, ok := r.items[id]
	if !ok {
		return errors.New("item not found")
	}
	item.SlotType = slotType
	item.SlotIndex = slotIndex
	return nil
}

func (r *roomTestItemRepo) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	item, ok := r.items[id]
	if !ok {
		return errors.New("item not found")
	}
	item.StackCount = stackCount
	return nil
}

func (r *roomTestItemRepo) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	occupied := make(map[int]bool)
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType {
			occupied[item.SlotIndex] = true
		}
	}
	for index := 0; index < maxSlots; index++ {
		if !occupied[index] {
			return index, nil
		}
	}
	return -1, errors.New("inventory full")
}

func (r *roomTestItemRepo) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, item := range r.items {
		if item.CharacterID == charID && item.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

type roomHandlerTestEnv struct {
	handler   *Handler
	service   *appgroup.Service
	ctxByChar map[int64]*infrartmp.RPCContext
	calls     *[]roomCallbackCall
	charRepo  *roomTestCharacterRepo
	itemRepo  *roomTestItemRepo
}

func newRoomHandlerTestEnv(t *testing.T) *roomHandlerTestEnv {
	t.Helper()

	logger := zaptest.NewLogger(t)
	charRepo := &roomTestCharacterRepo{
		chars: map[int64]*domainchar.Character{
			1001: {ID: 1001, Name: "Leader", Level: 80, ClassID: 1, MapID: 25, PosX: 672, PosY: 1126},
			1002: {ID: 1002, Name: "Member", Level: 70, ClassID: 2, MapID: 25, PosX: 640, PosY: 1110},
			1003: {ID: 1003, Name: "Applicant", Level: 65, ClassID: 3, MapID: 1, PosX: 100, PosY: 120},
			1004: {ID: 1004, Name: "MemberTwo", Level: 75, ClassID: 4, MapID: 25, PosX: 700, PosY: 1130},
			1005: {ID: 1005, Name: "Viewer", Level: 68, ClassID: 5, MapID: 1, PosX: 80, PosY: 80},
		},
	}
	charService := appchar.NewService(charRepo, logger)
	itemRepo := newRoomTestItemRepo(
		&domainitem.Item{
			ID:          60767481,
			CharacterID: 1003,
			TemplateID:  returnTeamTemplateID,
			ItemType:    domainitem.ItemTypeConsumable,
			SlotType:    domainitem.SlotTypeBag,
			SlotIndex:   260,
			StackCount:  2,
		},
	)
	itemService := appitem.NewService(itemRepo, logger)
	groupService := appgroup.NewService(memory.NewGroupRepository())
	sceneManager := infrartmp.NewSceneManager()
	handler := NewHandler(logger, groupService)
	handler.SetCharService(charService)
	handler.SetItemService(itemService)
	handler.SetSceneManager(sceneManager)

	connectionByKey := make(map[string]*infrartmp.Connection)
	charIDByConnID := make(map[uint32]int64)
	ctxByChar := make(map[int64]*infrartmp.RPCContext)

	for index, charID := range []int64{1001, 1002, 1003, 1004, 1005} {
		conn := infrartmp.NewConnection(uint32(index+1), &roomStubNetConn{}, nil, logger)
		conn.SetCharacter(strconv.FormatInt(charID, 10))
		conn.SetSceneInfo(charRepo.chars[charID].MapID, charID)
		conn.SetChannelID(1)
		sceneManager.AddToScene(1, charRepo.chars[charID].MapID, conn)
		connectionByKey[strconv.FormatInt(charID, 10)] = conn
		charIDByConnID[conn.ID] = charID
		ctxByChar[charID] = &infrartmp.RPCContext{
			Context:     context.Background(),
			ConnID:      conn.ID,
			CharacterID: strconv.FormatInt(charID, 10),
			Connection:  conn,
		}
	}

	calls := make([]roomCallbackCall, 0, 32)
	handler.lookupConnFn = func(characterID string) *infrartmp.Connection {
		return connectionByKey[characterID]
	}
	handler.sendCallbackFn = func(conn *infrartmp.Connection, method string, args ...interface{}) error {
		copied := append([]interface{}(nil), args...)
		calls = append(calls, roomCallbackCall{
			characterID: charIDByConnID[conn.ID],
			method:      method,
			args:        copied,
		})
		return nil
	}

	return &roomHandlerTestEnv{
		handler:   handler,
		service:   groupService,
		ctxByChar: ctxByChar,
		calls:     &calls,
		charRepo:  charRepo,
		itemRepo:  itemRepo,
	}
}

func roomCreateRequest(actorLevel int, offset time.Duration) appgroup.CreateRoomRequest {
	target := time.Now().Add(offset)
	return appgroup.CreateRoomRequest{
		MinLevel:   30,
		MaxLevel:   80,
		FID:        13,
		Type:       2,
		Hour:       target.Hour(),
		Minute:     target.Minute(),
		ActorLevel: actorLevel,
	}
}

func roomCreateArgs(offset time.Duration) map[string]interface{} {
	target := time.Now().Add(offset)
	return map[string]interface{}{
		"minLevel": float64(30),
		"maxLevel": float64(80),
		"fid":      float64(13),
		"type":     float64(2),
		"hour":     float64(target.Hour()),
		"minute":   float64(target.Minute()),
	}
}

func roomTimeUpdateArgs(offset time.Duration) map[string]interface{} {
	target := time.Now().Add(offset)
	return map[string]interface{}{
		"time": map[string]interface{}{
			"hour":   float64(target.Hour()),
			"minute": float64(target.Minute()),
		},
	}
}

func findRoomCallback(calls []roomCallbackCall, characterID int64, method string) (roomCallbackCall, bool) {
	for _, call := range calls {
		if call.characterID == characterID && call.method == method {
			return call, true
		}
	}
	return roomCallbackCall{}, false
}

func countRoomCallbacks(calls []roomCallbackCall, characterID int64, method string) int {
	count := 0
	for _, call := range calls {
		if call.characterID == characterID && call.method == method {
			count++
		}
	}
	return count
}

func roomCallbackIndex(calls []roomCallbackCall, characterID int64, method string) int {
	for index, call := range calls {
		if call.characterID == characterID && call.method == method {
			return index
		}
	}
	return -1
}

func TestCreateRoomSendsOnCreateRoom(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.handler.CreateRoom(env.ctxByChar[1001], []interface{}{roomCreateArgs(30 * time.Minute)}); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	call, ok := findRoomCallback(*env.calls, 1001, "onCreateRoom")
	if !ok {
		t.Fatalf("expected onCreateRoom callback")
	}
	if len(call.args) != 1 {
		t.Fatalf("expected one callback arg, got %d", len(call.args))
	}
	if _, ok := call.args[0].(int); !ok {
		t.Fatalf("expected room id int payload, got %T", call.args[0])
	}
}

func TestGetRoomListPayloadShape(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	if _, err := env.handler.GetRoomList(env.ctxByChar[1005], nil); err != nil {
		t.Fatalf("GetRoomList returned error: %v", err)
	}

	call, ok := findRoomCallback(*env.calls, 1005, "onGetRoomList")
	if !ok {
		t.Fatalf("expected onGetRoomList callback")
	}

	payload, ok := call.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("expected payload map, got %T", call.args[0])
	}
	if payload["st"] != false {
		t.Fatalf("expected st=false, got %#v", payload["st"])
	}
	items, ok := payload["d"].([]interface{})
	if !ok {
		t.Fatalf("expected room list array, got %T", payload["d"])
	}
	if len(items) != 1 {
		t.Fatalf("expected one room, got %d", len(items))
	}
	roomItem, ok := items[0].(map[string]interface{})
	if !ok {
		t.Fatalf("expected room item map, got %T", items[0])
	}
	if roomItem["cid"] != int64(1001) {
		t.Fatalf("expected leader cid=1001, got %#v", roomItem["cid"])
	}
	if roomItem["leaderName"] != "Leader" {
		t.Fatalf("expected leaderName=Leader, got %#v", roomItem["leaderName"])
	}
	if roomItem["fid"] != 13 {
		t.Fatalf("expected fid=13, got %#v", roomItem["fid"])
	}
	if roomItem["type"] != 2 {
		t.Fatalf("expected type=2, got %#v", roomItem["type"])
	}
	if roomItem["memberNum"] != 1 {
		t.Fatalf("expected memberNum=1, got %#v", roomItem["memberNum"])
	}
	if _, ok := roomItem["time"].(int64); !ok {
		t.Fatalf("expected epoch millis time, got %T", roomItem["time"])
	}
}

func TestGetMyRoomPayloadShape(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	room, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}
	if _, _, err := env.service.ApplyToRoom(context.Background(), 1003, 65, room.ID); err != nil {
		t.Fatalf("ApplyToRoom returned error: %v", err)
	}

	if _, err := env.handler.GetMyRoom(env.ctxByChar[1001], nil); err != nil {
		t.Fatalf("GetMyRoom returned error: %v", err)
	}

	call, ok := findRoomCallback(*env.calls, 1001, "onGetMyRoom")
	if !ok {
		t.Fatalf("expected onGetMyRoom callback")
	}

	payload := call.args[0].(map[string]interface{})
	if payload["f"] != true {
		t.Fatalf("expected f=true, got %#v", payload["f"])
	}
	roomData, ok := payload["d"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected room data map, got %T", payload["d"])
	}
	if roomData["cid"] != int64(1001) {
		t.Fatalf("expected leader cid=1001, got %#v", roomData["cid"])
	}
	if roomData["fid"] != 13 {
		t.Fatalf("expected fid=13, got %#v", roomData["fid"])
	}
	members, ok := roomData["members"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected members array, got %T", roomData["members"])
	}
	if len(members) != 2 {
		t.Fatalf("expected two members, got %d", len(members))
	}
	applyList, ok := roomData["applyList"].([]map[string]interface{})
	if !ok {
		t.Fatalf("expected applyList array, got %T", roomData["applyList"])
	}
	if len(applyList) != 1 {
		t.Fatalf("expected one applicant, got %d", len(applyList))
	}
	if applyList[0]["cid"] != int64(1003) {
		t.Fatalf("expected applicant cid=1003, got %#v", applyList[0]["cid"])
	}
}

func TestApplyToRoomCallbackFanOut(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	room, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	if _, err := env.handler.ApplyToRoom(env.ctxByChar[1002], []interface{}{float64(room.ID)}); err != nil {
		t.Fatalf("ApplyToRoom returned error: %v", err)
	}

	if _, ok := findRoomCallback(*env.calls, 1002, "onApplyToRoom"); !ok {
		t.Fatalf("expected applicant callback onApplyToRoom")
	}

	call, ok := findRoomCallback(*env.calls, 1001, "onApplyListChange")
	if !ok {
		t.Fatalf("expected leader callback onApplyListChange")
	}
	payload := call.args[0].(map[string]interface{})
	if payload["f"] != true {
		t.Fatalf("expected apply list change f=true, got %#v", payload["f"])
	}
	if payload["leaderId"] != int64(1001) {
		t.Fatalf("expected leaderId=1001, got %#v", payload["leaderId"])
	}
	applicant := payload["d"].(map[string]interface{})
	if applicant["cid"] != int64(1002) {
		t.Fatalf("expected applicant cid=1002, got %#v", applicant["cid"])
	}
}

func TestAcceptRoomApplyCallbackFanOut(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	room, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1004); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}
	if _, _, err := env.service.ApplyToRoom(context.Background(), 1002, 70, room.ID); err != nil {
		t.Fatalf("ApplyToRoom returned error: %v", err)
	}

	if _, err := env.handler.AcceptRoomApply(env.ctxByChar[1001], []interface{}{float64(1002)}); err != nil {
		t.Fatalf("AcceptRoomApply returned error: %v", err)
	}

	for _, charID := range []int64{1001, 1002, 1004} {
		call, ok := findRoomCallback(*env.calls, charID, "onAcceptRoomApply")
		if !ok {
			t.Fatalf("expected onAcceptRoomApply for %d", charID)
		}
		if call.args[0] != 1002 {
			t.Fatalf("expected accepted applicant id 1002, got %#v", call.args[0])
		}
	}
}

func TestLeaveAndKickRoomCallbackShapes(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	if _, err := env.handler.LeaveRoom(env.ctxByChar[1001], nil); err != nil {
		t.Fatalf("LeaveRoom returned error: %v", err)
	}

	leaveCall, ok := findRoomCallback(*env.calls, 1002, "onMemberLeave")
	if !ok {
		t.Fatalf("expected onMemberLeave callback")
	}
	leavePayload := leaveCall.args[0].(map[string]interface{})
	if leavePayload["cid"] != int64(1001) {
		t.Fatalf("expected leaving cid=1001, got %#v", leavePayload["cid"])
	}
	if leavePayload["name"] != "Leader" {
		t.Fatalf("expected leaving name Leader, got %#v", leavePayload["name"])
	}
	if leavePayload["leaderId"] != int64(1002) {
		t.Fatalf("expected promoted leaderId=1002, got %#v", leavePayload["leaderId"])
	}

	if _, err := env.handler.KickRoomMember(env.ctxByChar[1002], []interface{}{float64(1003)}); err != nil {
		t.Fatalf("KickRoomMember returned error: %v", err)
	}

	kickCall, ok := findRoomCallback(*env.calls, 1002, "onKickRoomMember")
	if !ok {
		t.Fatalf("expected onKickRoomMember callback")
	}
	kickPayload := kickCall.args[0].(map[string]interface{})
	if kickPayload["cid"] != int64(1003) {
		t.Fatalf("expected kicked cid=1003, got %#v", kickPayload["cid"])
	}
	if kickPayload["name"] != "Applicant" {
		t.Fatalf("expected kicked name Applicant, got %#v", kickPayload["name"])
	}
}

func TestSetRoomHostAndConfigCallbacks(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	if _, err := env.handler.SetRoomHost(env.ctxByChar[1001], []interface{}{float64(1002)}); err != nil {
		t.Fatalf("SetRoomHost returned error: %v", err)
	}

	for _, charID := range []int64{1001, 1002} {
		call, ok := findRoomCallback(*env.calls, charID, "onSetRoomHost")
		if !ok {
			t.Fatalf("expected onSetRoomHost for %d", charID)
		}
		if call.args[0] != 1002 {
			t.Fatalf("expected new leader 1002, got %#v", call.args[0])
		}
	}

	if _, err := env.handler.SetRoomConfig(env.ctxByChar[1002], []interface{}{roomTimeUpdateArgs(45 * time.Minute)}); err != nil {
		t.Fatalf("SetRoomConfig returned error: %v", err)
	}

	configCall, ok := findRoomCallback(*env.calls, 1001, "onSetRoomConfig")
	if !ok {
		t.Fatalf("expected onSetRoomConfig callback")
	}
	configPayload := configCall.args[0].(map[string]interface{})
	if _, ok := configPayload["time"].(int64); !ok {
		t.Fatalf("expected time-only config payload, got %#v", configPayload)
	}
}

func TestRoomChatBroadcastPayload(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.CreateRoom(context.Background(), 1001, roomCreateRequest(80, 30*time.Minute)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	if _, err := env.handler.RoomChat(env.ctxByChar[1001], []interface{}{"  hello room  "}); err != nil {
		t.Fatalf("RoomChat returned error: %v", err)
	}

	for _, charID := range []int64{1001, 1002} {
		call, ok := findRoomCallback(*env.calls, charID, "onRoomSay")
		if !ok {
			t.Fatalf("expected onRoomSay for %d", charID)
		}
		payload, ok := call.args[0].([]interface{})
		if !ok {
			t.Fatalf("expected room chat payload array, got %T", call.args[0])
		}
		if payload[0] != int64(1001) {
			t.Fatalf("expected speaker id 1001, got %#v", payload[0])
		}
		if payload[1] != "Leader" {
			t.Fatalf("expected speaker name Leader, got %#v", payload[1])
		}
		if payload[2] != "hello room" {
			t.Fatalf("expected trimmed message, got %#v", payload[2])
		}
	}

	if got := countRoomCallbacks(*env.calls, 1001, "onRoomSay"); got != 1 {
		t.Fatalf("expected one chat callback for leader, got %d", got)
	}
}

func TestGetCharLeaderClientReturnsLeaderPositionPayload(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	resp, err := env.handler.GetCharLeaderClient(env.ctxByChar[1002], []interface{}{float64(1001)})
	if err != nil {
		t.Fatalf("GetCharLeaderClient returned error: %v", err)
	}

	payload, ok := resp.(map[string]interface{})
	if !ok {
		t.Fatalf("expected payload map, got %T", resp)
	}
	if payload["cid"] != int64(1001) {
		t.Fatalf("expected cid=1001, got %#v", payload["cid"])
	}
	if payload["leaderId"] != int64(1001) {
		t.Fatalf("expected leaderId=1001, got %#v", payload["leaderId"])
	}
	if payload["name"] != "Leader" {
		t.Fatalf("expected leader name, got %#v", payload["name"])
	}
	if payload["map"] != 25 {
		t.Fatalf("expected map=25, got %#v", payload["map"])
	}
	if payload["mid"] != "25" || payload["posMapId"] != "25" {
		t.Fatalf("expected string map identifiers, got mid=%#v posMapId=%#v", payload["mid"], payload["posMapId"])
	}
	if payload["x"] != 672 || payload["y"] != 1126 {
		t.Fatalf("expected leader position 672/1126, got %#v/%#v", payload["x"], payload["y"])
	}
	if payload["line"] != 1 {
		t.Fatalf("expected line=1, got %#v", payload["line"])
	}

	memberResp, err := env.handler.GetCharLeaderClient(env.ctxByChar[1001], []interface{}{float64(1002)})
	if err != nil {
		t.Fatalf("GetCharLeaderClient for follower returned error: %v", err)
	}
	if memberResp != false {
		t.Fatalf("expected false for non-leader query, got %#v", memberResp)
	}
}
