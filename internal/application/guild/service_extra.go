// Open-sourced by BaoLT

// Guild service extra: public application and member operations.
// Guild management (name/rank/capacity/leadership) lives in service_guild_management.go.
// Skill/warehouse/contribution operations live in service_guild_skills.go.
// Private helpers and DefaultRankSettings live in service_guild_helpers.go.
package guild

import (
	"context"
	"fmt"

	domainguild "mcgame-server/internal/domain/guild"
	pkgerrors "mcgame-server/pkg/errors"
)

const (
	guildRestoreRateNumerator   = 9
	guildRestoreRateDenominator = 10
)

func (s *Service) GetGuildForClient(ctx context.Context, guildID int64) (*domainguild.Guild, error) {
	g, err := s.GetGuild(ctx, guildID)
	if err != nil {
		return nil, err
	}

	return s.enrichGuild(ctx, g)
}

func (s *Service) GetGuildByMemberForClient(ctx context.Context, characterID int64) (*domainguild.Guild, *domainguild.GuildMember, error) {
	g, err := s.GetGuildByMember(ctx, characterID)
	if err != nil || g == nil {
		return g, nil, err
	}

	g, err = s.enrichGuild(ctx, g)
	if err != nil {
		return nil, nil, err
	}

	for _, member := range g.Members {
		if member.CharacterID == characterID {
			return g, member, nil
		}
	}

	return g, nil, nil
}

func (s *Service) ListGuilds(ctx context.Context) ([]*domainguild.Guild, error) {
	guilds, err := s.repo.ListGuilds(ctx)
	if err != nil {
		return nil, fmt.Errorf("failed to list guilds: %w", err)
	}

	for _, guildItem := range guilds {
		if guildItem == nil {
			continue
		}
		if err := s.loadGuildSettings(ctx, guildItem); err != nil {
			return nil, err
		}
	}

	return guilds, nil
}

func (s *Service) GetMemberByID(ctx context.Context, memberID int64) (*domainguild.GuildMember, error) {
	member, err := s.repo.GetMemberByID(ctx, memberID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild member: %w", err)
	}
	return member, nil
}

func (s *Service) ApplyToGuild(ctx context.Context, guildID, characterID int64) (*domainguild.GuildApplication, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}

	existingGuild, err := s.repo.GetByMemberID(ctx, characterID)
	if err != nil {
		return nil, fmt.Errorf("failed to check existing guild: %w", err)
	}
	if existingGuild != nil {
		return nil, ErrAlreadyInGuild
	}

	existingApplication, err := s.repo.GetApplicationByCharacterID(ctx, characterID)
	if err != nil {
		return nil, fmt.Errorf("failed to check existing guild application: %w", err)
	}
	if existingApplication != nil {
		return nil, ErrAlreadyInGuild
	}

	char, err := s.charSvc.GetByID(ctx, characterID)
	if err != nil {
		return nil, fmt.Errorf("failed to get character: %w", err)
	}
	if char == nil {
		return nil, ErrGuildNotFound
	}

	application := &domainguild.GuildApplication{
		GuildID:        guildID,
		CharacterID:    characterID,
		CharacterName:  char.Name,
		CharacterClass: char.ClassID,
		CharacterLevel: char.Level,
		CharacterExp:   char.Experience,
		Message:        "",
		Status:         0,
	}

	if err := s.repo.CreateApplication(ctx, application); err != nil {
		return nil, fmt.Errorf("failed to create guild application: %w", err)
	}

	return application, nil
}

func (s *Service) GetPendingApplicationByCharacterID(ctx context.Context, characterID int64) (*domainguild.GuildApplication, *domainguild.Guild, error) {
	application, err := s.repo.GetApplicationByCharacterID(ctx, characterID)
	if err != nil || application == nil {
		return application, nil, err
	}

	guildItem, err := s.GetGuildForClient(ctx, application.GuildID)
	if err != nil {
		return nil, nil, err
	}

	return application, guildItem, nil
}

func (s *Service) ApproveApplication(ctx context.Context, applicationID, approverID int64) (*domainguild.GuildApplication, *domainguild.GuildMember, error) {
	application, guildItem, approverMember, err := s.loadApplicationAndAuthority(ctx, applicationID, approverID)
	if err != nil {
		return nil, nil, err
	}
	if approverMember == nil || !(approverMember.IsLeader() || approverMember.CanInvite) {
		return nil, nil, ErrNotGuildLeader
	}
	if guildItem.Population >= guildItem.MaxPopulation {
		return nil, nil, ErrGuildFull
	}

	if err := s.repo.AddMember(ctx, application.GuildID, application.CharacterID, domainguild.RankMember); err != nil {
		return nil, nil, fmt.Errorf("failed to approve guild application: %w", err)
	}
	if err := s.consumeContributionRestore(ctx, application.GuildID, application.CharacterID); err != nil {
		return nil, nil, err
	}

	if err := s.repo.DeleteApplication(ctx, applicationID); err != nil {
		return nil, nil, fmt.Errorf("failed to delete guild application: %w", err)
	}

	memberGuild, _, err := s.GetGuildByMemberForClient(ctx, application.CharacterID)
	if err != nil {
		return nil, nil, err
	}
	if memberGuild == nil {
		return application, nil, nil
	}
	for _, member := range memberGuild.Members {
		if member.CharacterID == application.CharacterID {
			return application, member, nil
		}
	}

	return application, nil, nil
}

func (s *Service) RefuseApplication(ctx context.Context, applicationID, approverID int64) (*domainguild.GuildApplication, error) {
	application, _, approverMember, err := s.loadApplicationAndAuthority(ctx, applicationID, approverID)
	if err != nil {
		return nil, err
	}
	if approverMember == nil || !(approverMember.IsLeader() || approverMember.CanInvite) {
		return nil, ErrNotGuildLeader
	}

	if err := s.repo.DeleteApplication(ctx, applicationID); err != nil {
		return nil, fmt.Errorf("failed to delete guild application: %w", err)
	}

	return application, nil
}

func (s *Service) CancelApplication(ctx context.Context, applicationID, characterID int64) (*domainguild.GuildApplication, error) {
	application, err := s.repo.GetApplicationByID(ctx, applicationID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild application: %w", err)
	}
	if application == nil {
		return nil, ErrGuildNotFound
	}
	if application.CharacterID != characterID {
		return nil, pkgerrors.ErrUnauthorized
	}
	if err := s.repo.DeleteApplication(ctx, applicationID); err != nil {
		return nil, fmt.Errorf("failed to delete guild application: %w", err)
	}
	return application, nil
}
