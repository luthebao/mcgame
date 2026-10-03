// Open-sourced by BaoLT

package guild

import (
	"context"
	"fmt"

	domainguild "mcgame-server/internal/domain/guild"
)

func (s *Service) UpdateGuildName(ctx context.Context, guildID, updaterID int64, name string) (*domainguild.Guild, error) {
	existing, err := s.repo.GetByName(ctx, name)
	if err != nil {
		return nil, fmt.Errorf("failed to check guild name: %w", err)
	}
	if existing != nil && existing.ID != guildID {
		return nil, ErrGuildNameTaken
	}

	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}
	if g.LeaderID != updaterID {
		return nil, ErrNotGuildLeader
	}

	g.Name = name
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, fmt.Errorf("failed to update guild name: %w", err)
	}

	return s.GetGuildForClient(ctx, guildID)
}

func (s *Service) UpdateGuildRankSettings(ctx context.Context, guildID, updaterID int64, settings []map[string]interface{}) error {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}
	if g.LeaderID != updaterID {
		return ErrNotGuildLeader
	}

	if err := s.repo.SaveRankSettings(ctx, guildID, updaterID, settings); err != nil {
		return fmt.Errorf("failed to save guild rank settings: %w", err)
	}

	return nil
}

func (s *Service) TransferLeadership(ctx context.Context, guildID, oldLeaderID, newLeaderID int64) (*domainguild.Guild, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}
	if g.LeaderID != oldLeaderID {
		return nil, ErrNotGuildLeader
	}

	members, err := s.repo.GetMembers(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild members: %w", err)
	}
	found := false
	for _, member := range members {
		if member != nil && member.CharacterID == newLeaderID {
			found = true
			break
		}
	}
	if !found {
		return nil, ErrNotInGuild
	}

	if err := s.repo.UpdateLeader(ctx, guildID, oldLeaderID, newLeaderID); err != nil {
		return nil, fmt.Errorf("failed to transfer guild leadership: %w", err)
	}

	return s.GetGuildForClient(ctx, guildID)
}

func (s *Service) UpgradeGuildLevel(ctx context.Context, guildID, actorID int64) (*domainguild.Guild, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}
	if g.LeaderID != actorID {
		return nil, ErrNotGuildLeader
	}

	g.Level++
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, fmt.Errorf("failed to level up guild: %w", err)
	}

	return s.GetGuildForClient(ctx, guildID)
}

func (s *Service) IncreaseMemberCapacity(ctx context.Context, guildID, actorID int64) (*domainguild.Guild, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}
	if g.LeaderID != actorID {
		return nil, ErrNotGuildLeader
	}

	g.MaxPopulation += 10
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, fmt.Errorf("failed to increase guild member capacity: %w", err)
	}

	return s.GetGuildForClient(ctx, guildID)
}

func (s *Service) IncreaseBankPageCount(ctx context.Context, guildID, actorID int64) (int, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return 0, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return 0, ErrGuildNotFound
	}
	if g.LeaderID != actorID {
		return 0, ErrNotGuildLeader
	}

	pageCount, err := s.repo.LoadBankPageCount(ctx, guildID)
	if err != nil {
		return 0, fmt.Errorf("failed to load guild bank page count: %w", err)
	}
	if pageCount < 1 {
		pageCount = 1
	}
	if pageCount >= 4 {
		return pageCount, nil
	}

	pageCount++
	if err := s.repo.SaveBankPageCount(ctx, guildID, actorID, pageCount); err != nil {
		return 0, fmt.Errorf("failed to save guild bank page count: %w", err)
	}

	return pageCount, nil
}
