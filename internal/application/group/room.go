// Open-sourced by BaoLT

package group

import (
	"context"
	"sort"
	"time"

	domaingroup "mcgame-server/internal/domain/group"
	pkgerrors "mcgame-server/pkg/errors"
)

const (
	roomMemberLimit       = 5
	roomMinScheduleWindow = 5 * time.Minute
	roomMaxScheduleWindow = 2 * time.Hour
)

type CreateRoomRequest struct {
	MinLevel   int
	MaxLevel   int
	FID        int
	Type       int
	Hour       int
	Minute     int
	ActorLevel int
}

type SetRoomConfigRequest struct {
	MinLevel   int
	MaxLevel   int
	FID        *int
	Type       *int
	Hour       *int
	Minute     *int
	ActorLevel int
}

type AcceptRoomApplyResult struct {
	Group       *domaingroup.Group
	Accepted    bool
	RemovedOnly bool
}

func (s *Service) ListRooms(ctx context.Context, requesterID int64) ([]*domaingroup.Group, bool, error) {
	groups, err := s.repo.ListByMap(ctx, 0)
	if err != nil {
		return nil, false, err
	}

	rooms := make([]*domaingroup.Group, 0, len(groups))
	pending := false
	inRoom := false

	for _, current := range groups {
		if current == nil {
			continue
		}
		if current.RoomOpen {
			rooms = append(rooms, current)
		}
		if isMember(current, requesterID) && current.RoomOpen {
			inRoom = true
		}
		if hasApplication(current, requesterID) {
			pending = true
		}
	}

	sort.Slice(rooms, func(i, j int) bool {
		if rooms[i].ScheduledAt.Equal(rooms[j].ScheduledAt) {
			return rooms[i].ID < rooms[j].ID
		}
		return rooms[i].ScheduledAt.Before(rooms[j].ScheduledAt)
	})

	return rooms, inRoom || pending, nil
}

func (s *Service) GetMyRoom(ctx context.Context, characterID int64) (*domaingroup.Group, bool, error) {
	current, err := s.repo.FindByMember(ctx, characterID)
	if err != nil {
		return nil, false, err
	}
	if current == nil || !current.RoomOpen {
		return nil, false, nil
	}
	return current, true, nil
}

func (s *Service) CreateRoom(ctx context.Context, leaderID int64, req CreateRoomRequest) (*domaingroup.Group, error) {
	s.mutex.Lock()
	now := s.nowFn()
	lastCreate := s.lastRoomCreateByID[leaderID]
	if !lastCreate.IsZero() && now.Sub(lastCreate) < roomMinScheduleWindow {
		s.mutex.Unlock()
		return nil, ErrRoomCooldown
	}
	s.mutex.Unlock()

	scheduledAt, err := validateCreateRoomRequest(now, req)
	if err != nil {
		return nil, err
	}

	current, err := s.repo.FindByMember(ctx, leaderID)
	if err != nil {
		return nil, err
	}

	if current == nil {
		current = &domaingroup.Group{
			LeaderID: leaderID,
			Members: []domaingroup.Member{
				{CharID: leaderID, IsLeader: true},
			},
		}
		current, err = s.repo.Create(ctx, current)
		if err != nil {
			return nil, err
		}
	} else if current.LeaderID != leaderID {
		return nil, ErrNotLeader
	} else if current.RoomOpen {
		return nil, ErrInvalidRoom
	}

	current.RoomOpen = true
	current.RoomFID = req.FID
	current.RoomType = req.Type
	current.MinLevel = req.MinLevel
	current.MaxLevel = req.MaxLevel
	current.ScheduledAt = scheduledAt
	current.Applications = nil
	s.clearApplicationsForCharacter(ctx, leaderID, current.ID)

	if err := s.repo.Update(ctx, current); err != nil {
		return nil, err
	}

	s.mutex.Lock()
	s.lastRoomCreateByID[leaderID] = now
	s.mutex.Unlock()

	return current, nil
}

func (s *Service) ApplyToRoom(ctx context.Context, applicantID int64, applicantLevel int, roomID int64) (*domaingroup.Group, *domaingroup.Application, error) {
	room, err := s.repo.FindByID(ctx, roomID)
	if err != nil {
		return nil, nil, err
	}
	if room == nil || !room.RoomOpen {
		return nil, nil, ErrRoomNotFound
	}
	if _, err := s.ensureApplicantEligible(ctx, applicantID, applicantLevel, room); err != nil {
		return nil, nil, err
	}

	application := domaingroup.Application{
		CharacterID: applicantID,
		CreatedAt:   s.nowFn(),
	}
	room.Applications = append(room.Applications, application)

	if err := s.repo.Update(ctx, room); err != nil {
		return nil, nil, err
	}

	return room, &application, nil
}

func (s *Service) AcceptRoomApply(ctx context.Context, leaderID int64, applicantID int64) (*AcceptRoomApplyResult, error) {
	room, err := s.repo.FindByMember(ctx, leaderID)
	if err != nil {
		return nil, err
	}
	if room == nil || !room.RoomOpen {
		return nil, ErrRoomNotFound
	}
	if room.LeaderID != leaderID {
		return nil, ErrNotLeader
	}

	index := applicationIndex(room, applicantID)
	if index < 0 {
		return nil, ErrApplyNotFound
	}

	if existing, err := s.repo.FindByMember(ctx, applicantID); err != nil {
		return nil, err
	} else if existing != nil {
		room.Applications = removeApplicationAt(room.Applications, index)
		if err := s.repo.Update(ctx, room); err != nil {
			return nil, err
		}
		return &AcceptRoomApplyResult{
			Group:       room,
			Accepted:    false,
			RemovedOnly: true,
		}, nil
	}

	if len(room.Members) >= roomMemberLimit {
		return nil, ErrRoomFull
	}

	room.Members = append(room.Members, domaingroup.Member{CharID: applicantID})
	room.Applications = removeApplicationAt(room.Applications, index)
	s.clearApplicationsForCharacter(ctx, applicantID, room.ID)

	if err := s.repo.Update(ctx, room); err != nil {
		return nil, err
	}

	return &AcceptRoomApplyResult{
		Group:       room,
		Accepted:    true,
		RemovedOnly: false,
	}, nil
}

func (s *Service) LeaveRoom(ctx context.Context, memberID int64) (*domaingroup.Group, *domaingroup.Group, error) {
	current, err := s.repo.FindByMember(ctx, memberID)
	if err != nil {
		return nil, nil, err
	}
	if current == nil || !current.RoomOpen {
		return nil, nil, ErrRoomNotFound
	}
	return s.Leave(ctx, memberID)
}

func (s *Service) KickRoomMember(ctx context.Context, leaderID int64, targetID int64) (*domaingroup.Group, *domaingroup.Group, error) {
	current, err := s.repo.FindByMember(ctx, leaderID)
	if err != nil {
		return nil, nil, err
	}
	if current == nil || !current.RoomOpen {
		return nil, nil, ErrRoomNotFound
	}
	return s.Kick(ctx, leaderID, targetID)
}

func (s *Service) SetRoomHost(ctx context.Context, leaderID int64, newLeaderID int64) (*domaingroup.Group, error) {
	current, err := s.repo.FindByMember(ctx, leaderID)
	if err != nil {
		return nil, err
	}
	if current == nil || !current.RoomOpen {
		return nil, ErrRoomNotFound
	}
	return s.GiveLeader(ctx, leaderID, newLeaderID)
}

func (s *Service) SetRoomConfig(ctx context.Context, leaderID int64, req SetRoomConfigRequest) (*domaingroup.Group, map[string]interface{}, error) {
	current, err := s.repo.FindByMember(ctx, leaderID)
	if err != nil {
		return nil, nil, err
	}
	if current == nil || !current.RoomOpen {
		return nil, nil, ErrRoomNotFound
	}
	if current.LeaderID != leaderID {
		return nil, nil, ErrNotLeader
	}

	newMinLevel := current.MinLevel
	newMaxLevel := current.MaxLevel
	if req.MinLevel > 0 {
		newMinLevel = req.MinLevel
	}
	if req.MaxLevel > 0 {
		newMaxLevel = req.MaxLevel
	}
	if newMaxLevel < newMinLevel {
		return nil, nil, ErrInvalidRoom
	}

	payload := make(map[string]interface{})

	newFID := current.RoomFID
	newType := current.RoomType
	if req.FID != nil {
		newFID = *req.FID
	}
	if req.Type != nil {
		newType = *req.Type
	}
	if req.FID != nil || req.Type != nil {
		if err := validateRecruitWill(newFID, newType, newMinLevel, req.ActorLevel); err != nil {
			return nil, nil, err
		}
		current.RoomFID = newFID
		current.RoomType = newType
		current.MinLevel = newMinLevel
		current.MaxLevel = newMaxLevel
		payload["fid"] = newFID
	}

	if req.Hour != nil || req.Minute != nil {
		if req.Hour == nil || req.Minute == nil {
			return nil, nil, ErrInvalidRoom
		}
		scheduledAt, err := nextScheduledAt(s.nowFn(), *req.Hour, *req.Minute)
		if err != nil {
			return nil, nil, err
		}
		current.ScheduledAt = scheduledAt
		current.MinLevel = newMinLevel
		current.MaxLevel = newMaxLevel
		payload["time"] = scheduledAt.UnixMilli()
	}

	if len(payload) == 0 {
		return nil, nil, ErrInvalidRoom
	}

	if err := s.repo.Update(ctx, current); err != nil {
		return nil, nil, err
	}

	return current, payload, nil
}

func (s *Service) SendRoomChat(ctx context.Context, characterID int64, message string) (*domaingroup.Group, error) {
	current, err := s.repo.FindByMember(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if current == nil || !current.RoomOpen {
		return nil, ErrRoomNotFound
	}
	return current, nil
}

func validateCreateRoomRequest(now time.Time, req CreateRoomRequest) (time.Time, error) {
	if req.MinLevel <= 0 || req.MaxLevel <= 0 || req.ActorLevel <= 0 {
		return time.Time{}, ErrInvalidRoom
	}
	if req.MaxLevel < req.MinLevel {
		return time.Time{}, ErrInvalidRoom
	}
	if err := validateRecruitWill(req.FID, req.Type, req.MinLevel, req.ActorLevel); err != nil {
		return time.Time{}, err
	}
	return nextScheduledAt(now, req.Hour, req.Minute)
}

func validateRecruitWill(fid int, roomType int, minLevel int, actorLevel int) error {
	recruitWill, ok := recruitCatalogByID[fid]
	if !ok {
		return ErrInvalidRoom
	}
	if recruitWill.Type != roomType {
		return ErrInvalidRoom
	}
	if minLevel < recruitWill.MinLevel {
		return ErrInvalidRoom
	}
	if actorLevel < minLevel {
		return pkgerrors.ErrInsufficientLevel
	}
	return nil
}

func nextScheduledAt(now time.Time, hour int, minute int) (time.Time, error) {
	if hour < 0 || hour > 23 || minute < 0 || minute > 59 {
		return time.Time{}, ErrInvalidRoom
	}

	scheduledAt := time.Date(now.Year(), now.Month(), now.Day(), hour, minute, 0, 0, now.Location())
	if !scheduledAt.After(now) {
		scheduledAt = scheduledAt.Add(24 * time.Hour)
	}

	window := scheduledAt.Sub(now)
	if window < roomMinScheduleWindow || window > roomMaxScheduleWindow {
		return time.Time{}, ErrInvalidRoom
	}

	return scheduledAt, nil
}

func (s *Service) ensureApplicantEligible(ctx context.Context, applicantID int64, applicantLevel int, room *domaingroup.Group) (*domaingroup.Group, error) {
	if room == nil || !room.RoomOpen {
		return nil, ErrRoomNotFound
	}
	if len(room.Members) >= roomMemberLimit {
		return nil, ErrRoomFull
	}
	if applicantLevel < room.MinLevel {
		return nil, pkgerrors.ErrInsufficientLevel
	}
	if existing, err := s.repo.FindByMember(ctx, applicantID); err != nil {
		return nil, err
	} else if existing != nil {
		return nil, ErrAlreadyInGroup
	}
	if hasApplication(room, applicantID) {
		return nil, ErrAlreadyPending
	}

	groups, err := s.repo.ListByMap(ctx, 0)
	if err != nil {
		return nil, err
	}
	for _, current := range groups {
		if current != nil && current.ID != room.ID && hasApplication(current, applicantID) {
			return nil, ErrAlreadyPending
		}
	}

	return room, nil
}

func (s *Service) clearApplicationsForCharacter(ctx context.Context, characterID int64, exceptGroupID int64) {
	groups, err := s.repo.ListByMap(ctx, 0)
	if err != nil {
		return
	}
	for _, current := range groups {
		if current == nil || current.ID == exceptGroupID {
			continue
		}
		index := applicationIndex(current, characterID)
		if index < 0 {
			continue
		}
		current.Applications = removeApplicationAt(current.Applications, index)
		_ = s.repo.Update(ctx, current)
	}
}

func applicationIndex(current *domaingroup.Group, characterID int64) int {
	if current == nil {
		return -1
	}
	for idx, application := range current.Applications {
		if application.CharacterID == characterID {
			return idx
		}
	}
	return -1
}

func hasApplication(current *domaingroup.Group, characterID int64) bool {
	return applicationIndex(current, characterID) >= 0
}

func removeApplicationAt(applications []domaingroup.Application, index int) []domaingroup.Application {
	if index < 0 || index >= len(applications) {
		return applications
	}
	return append(applications[:index], applications[index+1:]...)
}

func isMember(current *domaingroup.Group, characterID int64) bool {
	if current == nil {
		return false
	}
	for _, member := range current.Members {
		if member.CharID == characterID {
			return true
		}
	}
	return false
}
