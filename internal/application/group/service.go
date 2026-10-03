// Open-sourced by BaoLT

package group

import (
	"context"
	"errors"
	"sync"
	"time"

	"mcgame-server/internal/domain/group"
)

const MaxGroupMembers = 5

var (
	ErrNotLeader      = errors.New("not group leader")
	ErrGroupNotFound  = errors.New("group not found")
	ErrAlreadyInGroup = errors.New("already in a group")
	ErrMemberNotFound = errors.New("member not found in group")
	ErrInvalidTarget  = errors.New("invalid target")
	ErrGroupFull      = errors.New("group is full")
	ErrAlreadyPending = errors.New("already pending in a room")
	ErrRoomNotFound   = errors.New("room not found")
	ErrRoomNotOpen    = errors.New("room not open")
	ErrRoomFull       = errors.New("room is full")
	ErrRoomCooldown   = errors.New("room creation cooldown active")
	ErrInvalidRoom    = errors.New("invalid room configuration")
	ErrApplyNotFound  = errors.New("room application not found")
)

type Service struct {
	repo               group.Repository
	mutex              sync.Mutex
	lastRoomCreateByID map[int64]time.Time
	nowFn              func() time.Time
}

func NewService(repo group.Repository) *Service {
	return &Service{
		repo:               repo,
		lastRoomCreateByID: make(map[int64]time.Time),
		nowFn:              time.Now,
	}
}

func (s *Service) DisbandByLeader(ctx context.Context, leaderID int64) (*group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, leaderID)
	if g == nil {
		return nil, ErrGroupNotFound
	}
	if g.LeaderID != leaderID {
		return nil, ErrNotLeader
	}

	oldGroup := &group.Group{
		ID:           g.ID,
		LeaderID:     g.LeaderID,
		MapID:        g.MapID,
		Members:      make([]group.Member, len(g.Members)),
		RoomOpen:     g.RoomOpen,
		RoomFID:      g.RoomFID,
		RoomType:     g.RoomType,
		MinLevel:     g.MinLevel,
		MaxLevel:     g.MaxLevel,
		ScheduledAt:  g.ScheduledAt,
		Applications: make([]group.Application, len(g.Applications)),
		CreatedAt:    g.CreatedAt,
		UpdatedAt:    g.UpdatedAt,
	}
	copy(oldGroup.Members, g.Members)
	copy(oldGroup.Applications, g.Applications)

	if err := s.repo.Delete(ctx, g.ID); err != nil {
		return nil, err
	}

	return oldGroup, nil
}


func (s *Service) Invite(ctx context.Context, leaderID int64, targetID int64) (*group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, leaderID)
	if g == nil {
		g = &group.Group{
			LeaderID: leaderID,
			Members: []group.Member{
				{CharID: leaderID, IsLeader: true},
			},
		}
		var err error
		g, err = s.repo.Create(ctx, g)
		if err != nil {
			return nil, err
		}
	}
	if existing, _ := s.repo.FindByMember(ctx, targetID); existing != nil {
		return g, nil
	}
	if len(g.Members) >= MaxGroupMembers {
		return nil, ErrGroupFull
	}
	g.Members = append(g.Members, group.Member{CharID: targetID})
	if g.LeaderID == 0 {
		g.LeaderID = leaderID
	}
	s.clearApplicationsForCharacter(ctx, targetID, g.ID)
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, err
	}
	return g, nil
}

func (s *Service) Join(ctx context.Context, leaderID int64, joinerID int64) (*group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, leaderID)
	if g == nil {
		return nil, ErrGroupNotFound
	}
	// If joiner already in a group, ignore
	if existing, _ := s.repo.FindByMember(ctx, joinerID); existing != nil {
		return existing, nil
	}
	if len(g.Members) >= MaxGroupMembers {
		return nil, ErrGroupFull
	}
	g.Members = append(g.Members, group.Member{CharID: joinerID})
	s.clearApplicationsForCharacter(ctx, joinerID, g.ID)
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, err
	}
	return g, nil
}

func (s *Service) Leave(ctx context.Context, memberID int64) (*group.Group, *group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, memberID)
	if g == nil {
		return nil, nil, ErrGroupNotFound
	}

	// Save old group info for notification if disbanded
	oldGroup := &group.Group{
		ID:       g.ID,
		LeaderID: g.LeaderID,
		MapID:    g.MapID,
		Members:  make([]group.Member, len(g.Members)),
	}
	copy(oldGroup.Members, g.Members)

	newMembers := make([]group.Member, 0, len(g.Members))
	for _, m := range g.Members {
		if m.CharID != memberID {
			newMembers = append(newMembers, m)
		}
	}
	if !g.RoomOpen && len(newMembers) <= 1 {
		_ = s.repo.Delete(ctx, g.ID)
		return nil, oldGroup, nil
	}
	if g.LeaderID == memberID {
		if len(newMembers) == 0 {
			_ = s.repo.Delete(ctx, g.ID)
			return nil, oldGroup, nil
		}
		newMembers[0].IsLeader = true
		newMembers[0].AFK = false
		g.LeaderID = newMembers[0].CharID
	}
	for i := range newMembers {
		newMembers[i].IsLeader = newMembers[i].CharID == g.LeaderID
	}
	g.Members = newMembers
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, nil, err
	}
	return g, nil, nil
}

func (s *Service) Kick(ctx context.Context, leaderID int64, targetID int64) (*group.Group, *group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, leaderID)
	if g == nil {
		return nil, nil, ErrGroupNotFound
	}
	if g.LeaderID != leaderID {
		return nil, nil, ErrNotLeader
	}
	// Cannot kick yourself
	if targetID == leaderID {
		return nil, nil, ErrInvalidTarget
	}
	// Check if target is actually a member
	targetIsMember := false
	for _, m := range g.Members {
		if m.CharID == targetID {
			targetIsMember = true
			break
		}
	}
	if !targetIsMember {
		return nil, nil, ErrMemberNotFound
	}

	// Save old group info for notification if disbanded
	oldGroup := &group.Group{
		ID:       g.ID,
		LeaderID: g.LeaderID,
		MapID:    g.MapID,
		Members:  make([]group.Member, len(g.Members)),
	}
	copy(oldGroup.Members, g.Members)

	// Remove target from members
	newMembers := make([]group.Member, 0, len(g.Members))
	for _, m := range g.Members {
		if m.CharID != targetID {
			newMembers = append(newMembers, m)
		}
	}

	// If no members remain, or 1 member left in non-room group, disband the group
	if len(newMembers) == 0 || (!g.RoomOpen && len(newMembers) == 1) {
		_ = s.repo.Delete(ctx, g.ID)
		return nil, oldGroup, nil // Return old group for notification
	}

	g.Members = newMembers
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, nil, err
	}
	return g, nil, nil
}

func (s *Service) GiveLeader(ctx context.Context, leaderID int64, newLeaderID int64) (*group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, leaderID)
	if g == nil {
		return nil, ErrGroupNotFound
	}
	if g.LeaderID != leaderID {
		return nil, ErrNotLeader
	}
	// Cannot transfer leadership to yourself
	if newLeaderID == leaderID {
		return nil, ErrInvalidTarget
	}
	// Check if newLeaderID is actually a member
	found := false
	for i := range g.Members {
		// Clear old leader flag
		g.Members[i].IsLeader = false
		if g.Members[i].CharID == newLeaderID {
			g.Members[i].IsLeader = true
			// Clear AFK status for new leader (leader cannot be AFK)
			g.Members[i].AFK = false
			found = true
		}
	}
	if !found {
		return nil, ErrMemberNotFound
	}

	reorderedMembers := make([]group.Member, 0, len(g.Members))
	for _, member := range g.Members {
		if member.CharID == newLeaderID {
			reorderedMembers = append(reorderedMembers, member)
			break
		}
	}
	for _, member := range g.Members {
		if member.CharID != newLeaderID {
			reorderedMembers = append(reorderedMembers, member)
		}
	}

	g.LeaderID = newLeaderID
	for i := range reorderedMembers {
		reorderedMembers[i].IsLeader = reorderedMembers[i].CharID == newLeaderID
	}
	g.Members = reorderedMembers
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, err
	}
	return g, nil
}

func (s *Service) SetAFK(ctx context.Context, charID int64, afk bool) (*group.Group, error) {
	g, _ := s.repo.FindByMember(ctx, charID)
	if g == nil {
		return nil, ErrGroupNotFound
	}
	for i := range g.Members {
		if g.Members[i].CharID == charID {
			g.Members[i].AFK = afk
		}
	}
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, err
	}
	return g, nil
}

func (s *Service) ListByMap(ctx context.Context, mapID int) ([]*group.Group, error) {
	return s.repo.ListByMap(ctx, mapID)
}

// IsGroupLeader checks if a player is the leader of their group.
// Returns true if player is a group leader, false if not in group or not leader.
func (s *Service) IsGroupLeader(ctx context.Context, charID int64) (bool, error) {
	g, err := s.repo.FindByMember(ctx, charID)
	if err != nil || g == nil {
		return false, nil // Not in a group, not a leader
	}
	return g.LeaderID == charID, nil
}

// IsInGroup checks if a player is in any group.
// Returns true if player is in a group (leader or member), false otherwise.
func (s *Service) IsInGroup(ctx context.Context, charID int64) (bool, error) {
	g, err := s.repo.FindByMember(ctx, charID)
	if err != nil || g == nil {
		return false, nil
	}
	return true, nil
}

// IsMemberAFK checks if a player is in AFK status (tạm rời) in their group.
// Returns true if player is AFK, false if not in group, not AFK, or is leader.
func (s *Service) IsMemberAFK(ctx context.Context, charID int64) (bool, error) {
	g, err := s.repo.FindByMember(ctx, charID)
	if err != nil || g == nil {
		return false, nil // Not in a group, not AFK
	}
	// Leader cannot be AFK (they can always move)
	if g.LeaderID == charID {
		return false, nil
	}
	// Check if member is AFK
	for _, member := range g.Members {
		if member.CharID == charID {
			return member.AFK, nil
		}
	}
	return false, nil // Member not found, not AFK
}

// GetGroupByMember gets the group that a member belongs to.
// Returns the group if member is in a group, nil otherwise.
func (s *Service) GetGroupByMember(ctx context.Context, charID int64) (*group.Group, error) {
	return s.repo.FindByMember(ctx, charID)
}

func (s *Service) GetByID(ctx context.Context, id int64) (*group.Group, error) {
	return s.repo.FindByID(ctx, id)
}
