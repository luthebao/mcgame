// Open-sourced by BaoLT

// Guild application service with business logic
package guild

import (
	"context"
	"errors"
	"fmt"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/guild"

	"go.uber.org/zap"
)

var (
	ErrGuildNotFound     = errors.New("guild not found")
	ErrGuildNameTaken    = errors.New("guild name already taken")
	ErrAlreadyInGuild    = errors.New("character already in a guild")
	ErrNotInGuild        = errors.New("character not in a guild")
	ErrNotGuildLeader    = errors.New("not the guild leader")
	ErrCannotKickLeader  = errors.New("cannot kick the guild leader")
	ErrGuildFull         = errors.New("guild is full")
	ErrInsufficientFunds = errors.New("insufficient guild funds")
)

type Repository interface {
	Create(ctx context.Context, g *guild.Guild) error
	GetByID(ctx context.Context, guildID int64) (*guild.Guild, error)
	GetByName(ctx context.Context, name string) (*guild.Guild, error)
	GetByMemberID(ctx context.Context, characterID int64) (*guild.Guild, error)
	ListGuilds(ctx context.Context) ([]*guild.Guild, error)
	GetMembers(ctx context.Context, guildID int64) ([]*guild.GuildMember, error)
	GetMemberByID(ctx context.Context, memberID int64) (*guild.GuildMember, error)
	AddMember(ctx context.Context, guildID, characterID int64, rank int) error
	RemoveMember(ctx context.Context, guildID, characterID int64) error
	UpdateMemberRank(ctx context.Context, guildID, characterID int64, rank int) error
	AddMemberContribution(ctx context.Context, guildID, characterID int64, normal, donate, total int64) error
	SetMemberContribution(ctx context.Context, guildID, characterID int64, normal, donate, total int64) error
	UpdateLeader(ctx context.Context, guildID, oldLeaderID, newLeaderID int64) error
	CreateApplication(ctx context.Context, application *guild.GuildApplication) error
	GetApplicationByID(ctx context.Context, applicationID int64) (*guild.GuildApplication, error)
	GetApplicationByCharacterID(ctx context.Context, characterID int64) (*guild.GuildApplication, error)
	ListApplications(ctx context.Context, guildID int64) ([]*guild.GuildApplication, error)
	DeleteApplication(ctx context.Context, applicationID int64) error
	SaveRankSettings(ctx context.Context, guildID, actorID int64, settings []map[string]interface{}) error
	LoadRankSettings(ctx context.Context, guildID int64) ([]map[string]interface{}, error)
	SaveBankPageCount(ctx context.Context, guildID, actorID int64, pageCount int) error
	LoadBankPageCount(ctx context.Context, guildID int64) (int, error)
	ListWarehouseSlots(ctx context.Context, guildID int64) ([]*guild.GuildWarehouseSlot, error)
	UpsertWarehouseMaterial(ctx context.Context, guildID int64, templateID int, count int) (*guild.GuildWarehouseSlot, error)
	UpdateWarehouseSlot(ctx context.Context, guildID, slotID int64, slotIndex int, stackCount int) error
	DeleteWarehouseSlot(ctx context.Context, guildID int64, slotID int64) error
	GetGuildSkillIDs(ctx context.Context, guildID int64) ([]int, error)
	GetGuildSkillLevels(ctx context.Context, guildID int64) (map[int]int, error)
	UpsertGuildSkill(ctx context.Context, guildID int64, skillID int) error
	Update(ctx context.Context, g *guild.Guild) error
	Delete(ctx context.Context, guildID int64) error
}

type CharacterService interface {
	GetByID(ctx context.Context, characterID int64) (*character.Character, error)
	Update(ctx context.Context, char *character.Character) error
}

type QuestService interface {
	AbandonGuildQuests(ctx context.Context, charID int64) ([]int, error)
}

type Service struct {
	repo     Repository
	charSvc  CharacterService
	questSvc QuestService
	logger   *zap.Logger
}

func NewService(repo Repository, charSvc CharacterService, logger *zap.Logger) *Service {
	return &Service{
		repo:    repo,
		charSvc: charSvc,
		logger:  logger,
	}
}

func (s *Service) SetQuestService(questSvc QuestService) {
	s.questSvc = questSvc
}

// CreateGuild creates a new guild with the character as leader
func (s *Service) CreateGuild(ctx context.Context, leaderID int64, name string) (*guild.Guild, error) {
	// Check if name is taken
	existing, err := s.repo.GetByName(ctx, name)
	if err != nil {
		return nil, fmt.Errorf("failed to check guild name: %w", err)
	}
	if existing != nil {
		return nil, ErrGuildNameTaken
	}

	// Check if character is already in a guild
	existingGuild, err := s.repo.GetByMemberID(ctx, leaderID)
	if err != nil {
		return nil, fmt.Errorf("failed to check existing guild: %w", err)
	}
	if existingGuild != nil {
		return nil, ErrAlreadyInGuild
	}

	// Create guild
	g := &guild.Guild{
		Name:                 name,
		LeaderID:             leaderID,
		Level:                1,
		Experience:           0,
		Population:           0,
		MaxPopulation:        50,
		Icon:                 0,
		Funds:                0,
		ContributionTotal:    0,
		Announcement:         "",
		Description:          "",
		JoinLevelReq:         1,
		JoinApprovalRequired: true,
		ActivityPoints:       0,
	}

	err = s.repo.Create(ctx, g)
	if err != nil {
		return nil, fmt.Errorf("failed to create guild: %w", err)
	}

	// Add leader as member
	err = s.repo.AddMember(ctx, g.ID, leaderID, guild.RankLeader)
	if err != nil {
		return nil, fmt.Errorf("failed to add leader as member: %w", err)
	}
	if err := s.consumeContributionRestore(ctx, g.ID, leaderID); err != nil {
		return nil, err
	}

	s.logger.Info("Guild created",
		zap.Int64("guild_id", g.ID),
		zap.String("name", name),
		zap.Int64("leader_id", leaderID))

	return g, nil
}

// GetGuild retrieves a guild by ID with members
func (s *Service) GetGuild(ctx context.Context, guildID int64) (*guild.Guild, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}

	// Load members
	members, err := s.repo.GetMembers(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get members: %w", err)
	}
	g.Members = members

	return g, nil
}

// GetGuildByMember retrieves the guild that a character belongs to
func (s *Service) GetGuildByMember(ctx context.Context, characterID int64) (*guild.Guild, error) {
	g, err := s.repo.GetByMemberID(ctx, characterID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild by member: %w", err)
	}
	if g == nil {
		return nil, nil // Not in a guild
	}

	// Load members
	members, err := s.repo.GetMembers(ctx, g.ID)
	if err != nil {
		return nil, fmt.Errorf("failed to get members: %w", err)
	}
	g.Members = members

	return g, nil
}

// InviteMember adds a character to the guild
func (s *Service) InviteMember(ctx context.Context, guildID, inviterID, inviteeID int64) error {
	// Get guild
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	// Check if guild is full
	if g.Population >= g.MaxPopulation {
		return ErrGuildFull
	}

	// Check if invitee is already in a guild
	existingGuild, err := s.repo.GetByMemberID(ctx, inviteeID)
	if err != nil {
		return fmt.Errorf("failed to check existing guild: %w", err)
	}
	if existingGuild != nil {
		return ErrAlreadyInGuild
	}

	// Add member
	err = s.repo.AddMember(ctx, guildID, inviteeID, guild.RankMember)
	if err != nil {
		return fmt.Errorf("failed to add member: %w", err)
	}

	s.logger.Info("Member added to guild",
		zap.Int64("guild_id", guildID),
		zap.Int64("inviter_id", inviterID),
		zap.Int64("invitee_id", inviteeID))

	return nil
}

// KickMember removes a character from the guild
func (s *Service) KickMember(ctx context.Context, guildID, kickerID, targetID int64) error {
	// Get guild
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	members, err := s.repo.GetMembers(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild members: %w", err)
	}
	var kicker *guild.GuildMember
	for _, member := range members {
		if member != nil && member.CharacterID == kickerID {
			kicker = member
			break
		}
	}
	if kicker == nil || !(kicker.IsLeader() || kicker.CanKick) {
		return ErrNotGuildLeader
	}

	// Cannot kick the leader
	if targetID == g.LeaderID {
		return ErrCannotKickLeader
	}

	// Remove member
	if err := s.applyGuildExitState(ctx, targetID); err != nil {
		return err
	}
	err = s.repo.RemoveMember(ctx, guildID, targetID)
	if err != nil {
		return fmt.Errorf("failed to remove member: %w", err)
	}

	s.logger.Info("Member kicked from guild",
		zap.Int64("guild_id", guildID),
		zap.Int64("kicker_id", kickerID),
		zap.Int64("target_id", targetID))

	return nil
}

// LeaveMember allows a member to leave the guild
func (s *Service) LeaveMember(ctx context.Context, guildID, characterID int64) error {
	// Get guild
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	// Leader cannot leave (must disband or transfer leadership first)
	if characterID == g.LeaderID {
		return errors.New("leader must disband guild or transfer leadership before leaving")
	}

	// Remove member
	if err := s.applyGuildExitState(ctx, characterID); err != nil {
		return err
	}
	err = s.repo.RemoveMember(ctx, guildID, characterID)
	if err != nil {
		return fmt.Errorf("failed to remove member: %w", err)
	}

	s.logger.Info("Member left guild",
		zap.Int64("guild_id", guildID),
		zap.Int64("character_id", characterID))

	return nil
}

// PromoteMember promotes a member to a higher rank
func (s *Service) PromoteMember(ctx context.Context, guildID, promoterID, targetID int64, newRank int) error {
	// Get guild
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	// Only leader can promote
	if promoterID != g.LeaderID {
		return ErrNotGuildLeader
	}
	if newRank < guild.RankViceLeader || newRank > guild.RankMember {
		return fmt.Errorf("invalid guild rank: %d", newRank)
	}

	// Update rank
	err = s.repo.UpdateMemberRank(ctx, guildID, targetID, newRank)
	if err != nil {
		return fmt.Errorf("failed to update rank: %w", err)
	}

	s.logger.Info("Member promoted",
		zap.Int64("guild_id", guildID),
		zap.Int64("promoter_id", promoterID),
		zap.Int64("target_id", targetID),
		zap.Int("new_rank", newRank))

	return nil
}

// DisbandGuild deletes the guild
func (s *Service) DisbandGuild(ctx context.Context, guildID, characterID int64) error {
	// Get guild
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	// Only leader can disband
	if characterID != g.LeaderID {
		return ErrNotGuildLeader
	}

	// Delete guild
	members, err := s.repo.GetMembers(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild members: %w", err)
	}
	for _, member := range members {
		if member == nil {
			continue
		}
		if err := s.applyGuildExitState(ctx, member.CharacterID); err != nil {
			return err
		}
	}
	err = s.repo.Delete(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to delete guild: %w", err)
	}

	s.logger.Info("Guild disbanded",
		zap.Int64("guild_id", guildID),
		zap.Int64("leader_id", characterID))

	return nil
}

// UpdateGuildInfo updates guild information
func (s *Service) UpdateGuildInfo(ctx context.Context, guildID, updaterID int64, announcement, description string) error {
	// Get guild
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	members, err := s.repo.GetMembers(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild members: %w", err)
	}
	var updater *guild.GuildMember
	for _, member := range members {
		if member != nil && member.CharacterID == updaterID {
			updater = member
			break
		}
	}
	if updater == nil || !(updater.IsLeader() || updater.CanEditAnnouncement) {
		return ErrNotGuildLeader
	}

	// Update fields
	g.Announcement = announcement
	if description != "" {
		g.Description = description
	} else if announcement != "" {
		g.Description = announcement
	}

	// Save
	err = s.repo.Update(ctx, g)
	if err != nil {
		return fmt.Errorf("failed to update guild: %w", err)
	}

	s.logger.Info("Guild info updated",
		zap.Int64("guild_id", guildID),
		zap.Int64("updater_id", updaterID))

	return nil
}
