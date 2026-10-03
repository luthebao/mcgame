// Open-sourced by BaoLT

package group

import (
	"context"
	"testing"
)

func TestGroupReqDenySendsOnGroupDenyForInviteRejection(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	if _, err := env.handler.GroupReqDeny(env.ctxByChar[1002], []interface{}{float64(1001)}); err != nil {
		t.Fatalf("GroupReqDeny returned error: %v", err)
	}

	call, ok := findRoomCallback(*env.calls, 1001, "onGroupDeny")
	if !ok {
		t.Fatalf("expected onGroupDeny callback")
	}
	payload := call.args[0].(map[string]interface{})
	if payload["cid"] != int64(1002) {
		t.Fatalf("expected cid=1002, got %#v", payload["cid"])
	}
	if payload["name"] != "Member" {
		t.Fatalf("expected name=Member, got %#v", payload["name"])
	}
}

func TestGroupReqDenySendsOnGroupRequestDenyForLeaderRejection(t *testing.T) {
	env := newRoomHandlerTestEnv(t)

	if _, err := env.service.Invite(context.Background(), 1001, 1002); err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	if _, err := env.handler.GroupReqDeny(env.ctxByChar[1001], []interface{}{float64(1003)}); err != nil {
		t.Fatalf("GroupReqDeny returned error: %v", err)
	}

	call, ok := findRoomCallback(*env.calls, 1003, "onGroupRequestDeny")
	if !ok {
		t.Fatalf("expected onGroupRequestDeny callback")
	}
	payload := call.args[0].(map[string]interface{})
	if payload["cid"] != int64(1001) {
		t.Fatalf("expected cid=1001, got %#v", payload["cid"])
	}
	if payload["name"] != "Leader" {
		t.Fatalf("expected name=Leader, got %#v", payload["name"])
	}
}
