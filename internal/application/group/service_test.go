// Open-sourced by BaoLT

package group

import (
	"context"
	"testing"

	domaingroup "mcgame-server/internal/domain/group"
	memorygroup "mcgame-server/internal/infrastructure/persistence/memory"
)

func TestLeave_DisbandsTwoMemberGroup(t *testing.T) {
	repo := memorygroup.NewGroupRepository()
	service := NewService(repo)

	created, err := repo.Create(context.Background(), &domaingroup.Group{
		LeaderID: 1,
		Members: []domaingroup.Member{
			{CharID: 1, IsLeader: true},
			{CharID: 2},
		},
	})
	if err != nil {
		t.Fatalf("Create() error = %v", err)
	}

	groupInfo, oldGroup, err := service.Leave(context.Background(), 1)
	if err != nil {
		t.Fatalf("Leave() error = %v", err)
	}
	if groupInfo != nil {
		t.Fatalf("Leave() group = %#v, want nil disbanded group", groupInfo)
	}
	if oldGroup == nil || len(oldGroup.Members) != 2 {
		t.Fatalf("Leave() oldGroup = %#v, want previous two-member group", oldGroup)
	}

	remaining, err := repo.FindByMember(context.Background(), 2)
	if err != nil {
		t.Fatalf("FindByMember() error = %v", err)
	}
	if remaining != nil {
		t.Fatalf("remaining member group = %#v, want nil after disband", remaining)
	}

	found, err := repo.FindByID(context.Background(), created.ID)
	if err != nil {
		t.Fatalf("FindByID() error = %v", err)
	}
	if found != nil {
		t.Fatalf("FindByID() = %#v, want nil deleted group", found)
	}
}

func TestLeave_PromotesLeaderAndClearsAFK(t *testing.T) {
	repo := memorygroup.NewGroupRepository()
	service := NewService(repo)

	created, err := repo.Create(context.Background(), &domaingroup.Group{
		LeaderID: 1,
		Members: []domaingroup.Member{
			{CharID: 1, IsLeader: true},
			{CharID: 2, AFK: true},
			{CharID: 3},
		},
	})
	if err != nil {
		t.Fatalf("Create() error = %v", err)
	}

	groupInfo, oldGroup, err := service.Leave(context.Background(), 1)
	if err != nil {
		t.Fatalf("Leave() error = %v", err)
	}
	if oldGroup != nil {
		t.Fatalf("Leave() oldGroup = %#v, want nil on leader promotion", oldGroup)
	}
	if groupInfo == nil {
		t.Fatal("Leave() group = nil, want promoted group")
	}
	if groupInfo.ID != created.ID {
		t.Fatalf("Leave() group.ID = %d, want %d", groupInfo.ID, created.ID)
	}
	if groupInfo.LeaderID != 2 {
		t.Fatalf("Leave() LeaderID = %d, want 2", groupInfo.LeaderID)
	}
	if len(groupInfo.Members) != 2 {
		t.Fatalf("Leave() members = %d, want 2", len(groupInfo.Members))
	}
	if !groupInfo.Members[0].IsLeader {
		t.Fatalf("Leave() promoted member leader flag = false, want true")
	}
	if groupInfo.Members[0].AFK {
		t.Fatalf("Leave() promoted leader AFK = true, want false")
	}
}

func TestInvite_AddsTargetToGroup(t *testing.T) {
	repo := memorygroup.NewGroupRepository()
	service := NewService(repo)

	groupInfo, err := service.Invite(context.Background(), 1, 2)
	if err != nil {
		t.Fatalf("Invite() error = %v", err)
	}
	if groupInfo == nil {
		t.Fatal("Invite() group = nil, want group with leader + target")
	}
	if len(groupInfo.Members) != 2 {
		t.Fatalf("Invite() members = %d, want 2", len(groupInfo.Members))
	}
	if groupInfo.Members[0].CharID != 1 || !groupInfo.Members[0].IsLeader {
		t.Fatalf("Invite() leader member = %#v, want solo leader", groupInfo.Members[0])
	}
	if groupInfo.Members[1].CharID != 2 {
		t.Fatalf("Invite() target member = %#v, want cid=2", groupInfo.Members[1])
	}

	targetGroup, err := repo.FindByMember(context.Background(), 2)
	if err != nil {
		t.Fatalf("FindByMember(target) error = %v", err)
	}
	if targetGroup == nil {
		t.Fatalf("targetGroup = nil, want group containing target after invite")
	}
}
