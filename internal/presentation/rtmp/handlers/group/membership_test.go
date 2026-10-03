// Open-sourced by BaoLT

package group

import (
	"context"
	"testing"
)

func newMembershipHandlerTestEnv(t *testing.T) *roomHandlerTestEnv {
	t.Helper()
	return newRoomHandlerTestEnv(t)
}

func TestGroupKickRemainingGroupUsesOnGroupLeave(t *testing.T) {
	env := newMembershipHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	if _, err := env.handler.GroupKick(env.ctxByChar[1001], []interface{}{float64(1003)}); err != nil {
		t.Fatalf("GroupKick returned error: %v", err)
	}

	for _, recipientID := range []int64{1001, 1002, 1003} {
		call, ok := findRoomCallback(*env.calls, recipientID, "onGroupLeave")
		if !ok {
			t.Fatalf("expected onGroupLeave for %d", recipientID)
		}
		payload := call.args[0].(map[string]interface{})
		if payload["sid"] != int64(1003) {
			t.Fatalf("expected sid=1003, got %#v", payload["sid"])
		}
		if payload["name"] != "Applicant" {
			t.Fatalf("expected removed name Applicant, got %#v", payload["name"])
		}
		mList := payload["mList"].(map[string]interface{})
		if mList["len"] != 2 {
			t.Fatalf("expected mList len=2, got %#v", mList["len"])
		}
	}
}

func TestGroupLeaveRemainingGroupUsesOnGroupLeave(t *testing.T) {
	env := newMembershipHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	if _, err := env.handler.GroupLeave(env.ctxByChar[1003], nil); err != nil {
		t.Fatalf("GroupLeave returned error: %v", err)
	}

	for _, recipientID := range []int64{1001, 1002, 1003} {
		call, ok := findRoomCallback(*env.calls, recipientID, "onGroupLeave")
		if !ok {
			t.Fatalf("expected onGroupLeave for %d", recipientID)
		}
		payload := call.args[0].(map[string]interface{})
		if payload["sid"] != int64(1003) {
			t.Fatalf("expected sid=1003, got %#v", payload["sid"])
		}
		if payload["name"] != "Applicant" {
			t.Fatalf("expected departed name Applicant, got %#v", payload["name"])
		}
	}
}

func TestGroupAFKUsesClientCallbackNames(t *testing.T) {
	env := newMembershipHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	if _, err := env.handler.GroupAFK(env.ctxByChar[1003], []interface{}{map[string]interface{}{}}); err != nil {
		t.Fatalf("GroupAFK returned error: %v", err)
	}

	for _, recipientID := range []int64{1001, 1002, 1003} {
		call, ok := findRoomCallback(*env.calls, recipientID, "setCharactorAfk")
		if !ok {
			t.Fatalf("expected setCharactorAfk for %d", recipientID)
		}
		payload := call.args[0].(map[string]interface{})
		if payload["cid"] != int64(1003) {
			t.Fatalf("expected cid=1003, got %#v", payload["cid"])
		}
	}

	if _, err := env.handler.UnGroupAFK(env.ctxByChar[1003], []interface{}{true}); err != nil {
		t.Fatalf("UnGroupAFK returned error: %v", err)
	}

	for _, recipientID := range []int64{1001, 1002, 1003} {
		call, ok := findRoomCallback(*env.calls, recipientID, "unSetCharactorAfk")
		if !ok {
			t.Fatalf("expected unSetCharactorAfk for %d", recipientID)
		}
		payload := call.args[0].(map[string]interface{})
		if payload["cid"] != int64(1003) {
			t.Fatalf("expected cid=1003, got %#v", payload["cid"])
		}
	}
}

func TestUnGroupAFKRemoteConsumesItemAndTeleports(t *testing.T) {
	env := newMembershipHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}
	if _, err := env.handler.GroupAFK(env.ctxByChar[1003], []interface{}{map[string]interface{}{}}); err != nil {
		t.Fatalf("GroupAFK returned error: %v", err)
	}

	if _, err := env.handler.UnGroupAFK(env.ctxByChar[1003], []interface{}{map[string]interface{}{}}); err != nil {
		t.Fatalf("UnGroupAFK returned error: %v", err)
	}

	if item, ok := env.itemRepo.items[60767481]; !ok || item.StackCount != 1 {
		t.Fatalf("expected return-team item stack to drop to 1, got %#v", item)
	}

	stackIndex := roomCallbackIndex(*env.calls, 1003, "onUpChaSlotStackNum")
	sceneEnterIndex := roomCallbackIndex(*env.calls, 1003, "onSceneEnter")
	unsetIndex := roomCallbackIndex(*env.calls, 1003, "unSetCharactorAfk")
	if stackIndex < 0 || sceneEnterIndex < 0 || unsetIndex < 0 {
		t.Fatalf("expected onUpChaSlotStackNum, onSceneEnter and unSetCharactorAfk callbacks for character 1003")
	}
	if !(stackIndex < sceneEnterIndex && sceneEnterIndex < unsetIndex) {
		t.Fatalf("expected callback order stack < sceneEnter < unSet, got %d %d %d", stackIndex, sceneEnterIndex, unsetIndex)
	}

	sceneCall, ok := findRoomCallback(*env.calls, 1003, "onSceneEnter")
	if !ok {
		t.Fatalf("expected onSceneEnter callback")
	}
	if sceneCall.args[0] != 25 || sceneCall.args[1] != 672 || sceneCall.args[2] != 1126 {
		t.Fatalf("expected scene enter to map 25 at 672/1126, got %#v", sceneCall.args)
	}

	unsetCall, ok := findRoomCallback(*env.calls, 1003, "unSetCharactorAfk")
	if !ok {
		t.Fatalf("expected unSetCharactorAfk callback")
	}
	unsetPayload := unsetCall.args[0].(map[string]interface{})
	if unsetPayload["cid"] != int64(1003) {
		t.Fatalf("expected cid=1003, got %#v", unsetPayload["cid"])
	}
	if unsetPayload["line"] != 1 {
		t.Fatalf("expected line=1, got %#v", unsetPayload["line"])
	}
	if unsetPayload["posMapId"] != "25" {
		t.Fatalf("expected posMapId=25, got %#v", unsetPayload["posMapId"])
	}

	updatedChar := env.charRepo.chars[1003]
	if updatedChar.MapID != 25 || updatedChar.PosX != 672 || updatedChar.PosY != 1126 {
		t.Fatalf("expected updated char position to match leader, got map=%d x=%d y=%d", updatedChar.MapID, updatedChar.PosX, updatedChar.PosY)
	}
}

func TestUnGroupAFKRemoteMissingItemShowsNotice(t *testing.T) {
	env := newMembershipHandlerTestEnv(t)
	delete(env.itemRepo.items, 60767481)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}
	if _, err := env.handler.GroupAFK(env.ctxByChar[1003], []interface{}{map[string]interface{}{}}); err != nil {
		t.Fatalf("GroupAFK returned error: %v", err)
	}

	if _, err := env.handler.UnGroupAFK(env.ctxByChar[1003], []interface{}{map[string]interface{}{}}); err != nil {
		t.Fatalf("UnGroupAFK returned error: %v", err)
	}

	noteCall, ok := findRoomCallback(*env.calls, 1003, "onMidNote")
	if !ok {
		t.Fatalf("expected onMidNote callback")
	}
	if noteCall.args[0] != "Cần Sách Hồi Nhóm mới có thể hồi nhóm" {
		t.Fatalf("unexpected note %#v", noteCall.args[0])
	}

	if _, ok := findRoomCallback(*env.calls, 1003, "unSetCharactorAfk"); ok {
		t.Fatalf("did not expect unSetCharactorAfk without item")
	}
}
