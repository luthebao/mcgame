// Open-sourced by BaoLT

package group

import (
	"context"
	"testing"
	"time"
)

func TestHandleCharacterDisconnectDismissesTwoMemberPlainGroupWhenLeaderDrops(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	env.handler.HandleCharacterDisconnect(context.Background(), 1001)

	call, ok := findRoomCallback(*env.calls, 1002, "onGroupDismiss")
	if !ok {
		t.Fatalf("expected onGroupDismiss for remaining member")
	}
	payload := call.args[0].(map[string]interface{})
	if payload["len"] != 2 {
		t.Fatalf("expected dismiss payload len=2, got %#v", payload["len"])
	}
}

func TestHandleCharacterDisconnectDismissesTwoMemberPlainGroupWhenMemberDrops(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	env.handler.HandleCharacterDisconnect(context.Background(), 1002)

	call, ok := findRoomCallback(*env.calls, 1001, "onGroupDismiss")
	if !ok {
		t.Fatalf("expected onGroupDismiss for remaining leader")
	}
	payload := call.args[0].(map[string]interface{})
	if payload["len"] != 2 {
		t.Fatalf("expected dismiss payload len=2, got %#v", payload["len"])
	}
}

func TestHandleCharacterDisconnectTransfersPlainGroupLeadershipWhenLeaderDrops(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}
	if _, err := env.service.Join(context.Background(), 1001, 1003); err != nil {
		t.Fatalf("Join returned error: %v", err)
	}

	env.handler.HandleCharacterDisconnect(context.Background(), 1001)

	for _, recipientID := range []int64{1002, 1003} {
		call, ok := findRoomCallback(*env.calls, recipientID, "onGroupLeave")
		if !ok {
			t.Fatalf("expected onGroupLeave for %d", recipientID)
		}
		payload := call.args[0].(map[string]interface{})
		if payload["sid"] != int64(1001) {
			t.Fatalf("expected sid=1001, got %#v", payload["sid"])
		}
		if payload["name"] != "Leader" {
			t.Fatalf("expected name=Leader, got %#v", payload["name"])
		}
		mList := payload["mList"].(map[string]interface{})
		if mList["len"] != 2 {
			t.Fatalf("expected mList len=2, got %#v", mList["len"])
		}
		head := mList["head"].(map[string]interface{})
		if head["obj"] != int64(1002) {
			t.Fatalf("expected promoted leader 1002 at head, got %#v", head["obj"])
		}
	}
}

func TestHandleCharacterDisconnectTransfersRoomHostWhenLeaderDrops(t *testing.T) {
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

	env.handler.HandleCharacterDisconnect(context.Background(), 1001)

	for _, recipientID := range []int64{1002, 1003} {
		leaveCall, ok := findRoomCallback(*env.calls, recipientID, "onMemberLeave")
		if !ok {
			t.Fatalf("expected onMemberLeave for %d", recipientID)
		}
		leavePayload := leaveCall.args[0].(map[string]interface{})
		if leavePayload["cid"] != int64(1001) {
			t.Fatalf("expected leaving cid=1001, got %#v", leavePayload["cid"])
		}
		if leavePayload["leaderId"] != int64(1002) {
			t.Fatalf("expected new leaderId=1002, got %#v", leavePayload["leaderId"])
		}

		hostCall, ok := findRoomCallback(*env.calls, recipientID, "onSetRoomHost")
		if !ok {
			t.Fatalf("expected onSetRoomHost for %d", recipientID)
		}
		if hostCall.args[0] != 1002 {
			t.Fatalf("expected host change to 1002, got %#v", hostCall.args[0])
		}
	}
}
