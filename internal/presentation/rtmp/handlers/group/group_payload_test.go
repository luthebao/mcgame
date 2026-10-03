// Open-sourced by BaoLT

package group

import (
	"context"
	"testing"

	appgroup "mcgame-server/internal/application/group"
	"mcgame-server/internal/infrastructure/persistence/memory"

	"go.uber.org/zap/zaptest"
)

func TestFormatGroupForClient_UsesKeyedCharacterMapAndLinkedMemberList(t *testing.T) {
	logger := zaptest.NewLogger(t)
	service := appgroup.NewService(memory.NewGroupRepository())
	handler := NewHandler(logger, service)
	handler.SetCharService(newRoomPayloadCharacterService(t))

	groupInfo, err := service.Invite(context.Background(), 1001, 1002)
	if err != nil {
		t.Fatalf("Invite returned error: %v", err)
	}

	groupCharactorList, groupAKFCidList, mListRaw := handler.formatGroupForClient(context.Background(), groupInfo)
	if len(groupAKFCidList) != 0 {
		t.Fatalf("expected no AFK ids, got %#v", groupAKFCidList)
	}

	memberOne, ok := groupCharactorList["1001"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected keyed member payload for 1001, got %#v", groupCharactorList["1001"])
	}
	if memberOne["id"] != int64(1001) {
		t.Fatalf("expected id=1001, got %#v", memberOne["id"])
	}
	if memberOne["cid"] != int64(1001) {
		t.Fatalf("expected cid=1001, got %#v", memberOne["cid"])
	}
	if memberOne["inGroup"] != true || memberOne["inGroupWithTotal"] != true {
		t.Fatalf("expected inGroup flags true, got %#v", memberOne)
	}

	mList, ok := mListRaw.(map[string]interface{})
	if !ok {
		t.Fatalf("expected member list payload map, got %T", mListRaw)
	}
	if mList["len"] != 2 {
		t.Fatalf("expected mList len=2, got %#v", mList["len"])
	}

	head, ok := mList["head"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected head node map, got %T", mList["head"])
	}
	if head["obj"] != int64(1001) {
		t.Fatalf("expected head obj=1001, got %#v", head["obj"])
	}

	next, ok := head["next"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected next node map, got %T", head["next"])
	}
	if next["obj"] != int64(1002) {
		t.Fatalf("expected next obj=1002, got %#v", next["obj"])
	}
}
