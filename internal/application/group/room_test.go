// Open-sourced by BaoLT

package group

import (
	"context"
	"testing"
	"time"

	domaingroup "mcgame-server/internal/domain/group"
	"mcgame-server/internal/infrastructure/persistence/memory"
)

func newRoomTestService(now time.Time) *Service {
	service := NewService(memory.NewGroupRepository())
	service.nowFn = func() time.Time {
		return now
	}
	return service
}

func roomRequest(now time.Time, actorLevel int) CreateRoomRequest {
	target := now.Add(30 * time.Minute)
	return CreateRoomRequest{
		MinLevel:   30,
		MaxLevel:   80,
		FID:        13,
		Type:       2,
		Hour:       target.Hour(),
		Minute:     target.Minute(),
		ActorLevel: actorLevel,
	}
}

func TestCreateRoomSoloCreatesOpenRoom(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	room, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 60))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	if room == nil {
		t.Fatalf("expected room")
	}
	if !room.RoomOpen {
		t.Fatalf("expected RoomOpen=true")
	}
	if room.LeaderID != 1001 {
		t.Fatalf("LeaderID = %d, want 1001", room.LeaderID)
	}
	if len(room.Members) != 1 {
		t.Fatalf("member count = %d, want 1", len(room.Members))
	}
}

func TestCreateRoomExistingLeaderGroupUsesSameGroup(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	groupData, err := service.Invite(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	room, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 60))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	if room.ID != groupData.ID {
		t.Fatalf("room id = %d, want %d", room.ID, groupData.ID)
	}
	if !room.RoomOpen {
		t.Fatalf("expected RoomOpen=true")
	}
	if len(room.Members) != 2 {
		t.Fatalf("member count = %d, want 2", len(room.Members))
	}
}

func TestPlainGroupLeaveDisbandsTwoMemberGroup(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	groupData, err := service.Invite(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	room, oldGroup, err := service.Leave(context.Background(), 1002)
	if err != nil {
		t.Fatalf("Leave returned error: %v", err)
	}
	if room != nil {
		t.Fatalf("expected group=nil after disband, got %#v", room)
	}
	if oldGroup == nil {
		t.Fatalf("expected oldGroup on disband")
	}
	if oldGroup.ID != groupData.ID {
		t.Fatalf("oldGroup.ID = %d, want %d", oldGroup.ID, groupData.ID)
	}
}

func TestPlainGroupKickDisbandsTwoMemberGroup(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	groupData, err := service.Invite(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	room, oldGroup, err := service.Kick(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("Kick returned error: %v", err)
	}
	if room != nil {
		t.Fatalf("expected group=nil after disband, got %#v", room)
	}
	if oldGroup == nil {
		t.Fatalf("expected oldGroup on disband")
	}
	if oldGroup.ID != groupData.ID {
		t.Fatalf("oldGroup.ID = %d, want %d", oldGroup.ID, groupData.ID)
	}
}

func TestDisbandByLeaderRemovesPlainGroup(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	groupData, err := service.Invite(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	oldGroup, err := service.DisbandByLeader(context.Background(), 1001)
	if err != nil {
		t.Fatalf("DisbandByLeader returned error: %v", err)
	}
	if oldGroup == nil {
		t.Fatalf("expected oldGroup")
	}
	if oldGroup.ID != groupData.ID {
		t.Fatalf("oldGroup.ID = %d, want %d", oldGroup.ID, groupData.ID)
	}
	currentGroup, err := service.GetGroupByMember(context.Background(), 1002)
	if err != nil {
		t.Fatalf("GetGroupByMember returned error: %v", err)
	}
	if currentGroup != nil {
		t.Fatalf("expected group to be removed")
	}
}

func TestCreateRoomRejectsNonLeader(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	if _, err := service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	if _, err := service.CreateRoom(context.Background(), 1002, roomRequest(now, 60)); err != ErrNotLeader {
		t.Fatalf("CreateRoom error = %v, want %v", err, ErrNotLeader)
	}
}

func TestListRoomsReturnsOnlyOpenRooms(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	if _, err := service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 60)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := service.Invite(context.Background(), 2001, 2002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	rooms, blocked, err := service.ListRooms(context.Background(), 3001)
	if err != nil {
		t.Fatalf("ListRooms returned error: %v", err)
	}

	if blocked {
		t.Fatalf("blocked = true, want false")
	}
	if len(rooms) != 1 {
		t.Fatalf("room count = %d, want 1", len(rooms))
	}
	if rooms[0].LeaderID != 1001 {
		t.Fatalf("leader id = %d, want 1001", rooms[0].LeaderID)
	}
}

func TestApplyToRoomSucceeds(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	room, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 60))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	updatedRoom, application, err := service.ApplyToRoom(context.Background(), 1002, 35, room.ID)
	if err != nil {
		t.Fatalf("ApplyToRoom returned error: %v", err)
	}

	if updatedRoom == nil || application == nil {
		t.Fatalf("expected room and application")
	}
	if len(updatedRoom.Applications) != 1 {
		t.Fatalf("application count = %d, want 1", len(updatedRoom.Applications))
	}
	if updatedRoom.Applications[0].CharacterID != 1002 {
		t.Fatalf("application cid = %d, want 1002", updatedRoom.Applications[0].CharacterID)
	}
}

func TestApplyToRoomRejectsWhenAlreadyGrouped(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	room, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 60))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := service.Invite(context.Background(), 2001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	if _, _, err := service.ApplyToRoom(context.Background(), 1002, 35, room.ID); err != ErrAlreadyInGroup {
		t.Fatalf("ApplyToRoom error = %v, want %v", err, ErrAlreadyInGroup)
	}
}

func TestApplyToRoomRejectsWhenAlreadyPendingElsewhere(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	roomOne, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 60))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	service.lastRoomCreateByID[2001] = time.Time{}
	reqTwo := roomRequest(now, 60)
	reqTwo.Hour = now.Add(45 * time.Minute).Hour()
	reqTwo.Minute = now.Add(45 * time.Minute).Minute()
	roomTwo, err := service.CreateRoom(context.Background(), 2001, reqTwo)
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	if _, _, err := service.ApplyToRoom(context.Background(), 1002, 35, roomOne.ID); err != nil {
		t.Fatalf("first ApplyToRoom returned error: %v", err)
	}
	if _, _, err := service.ApplyToRoom(context.Background(), 1002, 35, roomTwo.ID); err != ErrAlreadyPending {
		t.Fatalf("second ApplyToRoom error = %v, want %v", err, ErrAlreadyPending)
	}
}

func TestAcceptRoomApplyAndMemberCap(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	room, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 80))
	if err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	for _, memberID := range []int64{1002, 1003, 1004} {
		if _, err := service.Join(context.Background(), 1001, memberID); err != nil {
			t.Fatalf("Join returned error: %v", err)
		}
	}
	if _, _, err := service.ApplyToRoom(context.Background(), 1005, 35, room.ID); err != nil {
		t.Fatalf("ApplyToRoom returned error: %v", err)
	}

	result, err := service.AcceptRoomApply(context.Background(), 1001, 1005)
	if err != nil {
		t.Fatalf("AcceptRoomApply returned error: %v", err)
	}
	if !result.Accepted {
		t.Fatalf("expected Accepted=true")
	}
	if len(result.Group.Members) != 5 {
		t.Fatalf("member count = %d, want 5", len(result.Group.Members))
	}

	fullRoom, err := service.GetGroupByMember(context.Background(), 1001)
	if err != nil {
		t.Fatalf("GetGroupByMember returned error: %v", err)
	}
	fullRoom.Applications = append(fullRoom.Applications, domaingroup.Application{
		CharacterID: 1006,
		CreatedAt:   now,
	})
	if err := service.repo.Update(context.Background(), fullRoom); err != nil {
		t.Fatalf("repo.Update returned error: %v", err)
	}

	if _, err := service.AcceptRoomApply(context.Background(), 1001, 1006); err != ErrRoomFull {
		t.Fatalf("AcceptRoomApply error = %v, want %v", err, ErrRoomFull)
	}
}

func TestLeaderLeavePromotesNextMember(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	if _, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 80)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}
	if _, err := service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	room, oldGroup, err := service.LeaveRoom(context.Background(), 1001)
	if err != nil {
		t.Fatalf("LeaveRoom returned error: %v", err)
	}

	if oldGroup != nil {
		t.Fatalf("expected oldGroup=nil on promotion")
	}
	if room.LeaderID != 1002 {
		t.Fatalf("leader id = %d, want 1002", room.LeaderID)
	}
	if !room.RoomOpen {
		t.Fatalf("expected RoomOpen=true")
	}
}

func TestKickRoomMemberKeepsSoloLeaderRoom(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	if _, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 80)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	room, oldGroup, err := service.KickRoomMember(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("KickRoomMember returned error: %v", err)
	}

	if oldGroup != nil {
		t.Fatalf("expected oldGroup=nil when leader remains")
	}
	if room == nil {
		t.Fatalf("expected room")
	}
	if len(room.Members) != 1 {
		t.Fatalf("member count = %d, want 1", len(room.Members))
	}
	if room.LeaderID != 1001 {
		t.Fatalf("leader id = %d, want 1001", room.LeaderID)
	}
}

func TestGiveLeaderMovesNewLeaderToFront(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	if _, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 80)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}
	if _, err := service.Join(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	room, err := service.GiveLeader(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("GiveLeader returned error: %v", err)
	}

	if room.LeaderID != 1002 {
		t.Fatalf("leader id = %d, want 1002", room.LeaderID)
	}
	if len(room.Members) != 2 {
		t.Fatalf("member count = %d, want 2", len(room.Members))
	}
	if room.Members[0].CharID != 1002 {
		t.Fatalf("first member = %d, want 1002", room.Members[0].CharID)
	}
	if !room.Members[0].IsLeader {
		t.Fatalf("expected first member to be leader")
	}
}

func TestSetRoomConfigValidation(t *testing.T) {
	now := time.Date(2026, 4, 12, 10, 0, 0, 0, time.UTC)
	service := newRoomTestService(now)

	if _, err := service.CreateRoom(context.Background(), 1001, roomRequest(now, 80)); err != nil {
		t.Fatalf("CreateRoom returned error: %v", err)
	}

	badFID := 999
	badType := 99
	if _, _, err := service.SetRoomConfig(context.Background(), 1001, SetRoomConfigRequest{
		MinLevel:   30,
		MaxLevel:   80,
		FID:        &badFID,
		Type:       &badType,
		ActorLevel: 80,
	}); err != ErrInvalidRoom {
		t.Fatalf("SetRoomConfig invalid fid/type error = %v, want %v", err, ErrInvalidRoom)
	}

	if _, _, err := service.SetRoomConfig(context.Background(), 1001, SetRoomConfigRequest{
		MinLevel:   90,
		MaxLevel:   80,
		ActorLevel: 80,
		FID:        intPtr(13),
		Type:       intPtr(2),
	}); err != ErrInvalidRoom {
		t.Fatalf("SetRoomConfig invalid level range error = %v, want %v", err, ErrInvalidRoom)
	}

	tooSoonHour := now.Add(4 * time.Minute).Hour()
	tooSoonMinute := now.Add(4 * time.Minute).Minute()
	if _, _, err := service.SetRoomConfig(context.Background(), 1001, SetRoomConfigRequest{
		MinLevel:   30,
		MaxLevel:   80,
		ActorLevel: 80,
		Hour:       &tooSoonHour,
		Minute:     &tooSoonMinute,
	}); err != ErrInvalidRoom {
		t.Fatalf("SetRoomConfig invalid schedule error = %v, want %v", err, ErrInvalidRoom)
	}
}

func intPtr(value int) *int {
	return &value
}
