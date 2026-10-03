// Open-sourced by BaoLT

package guild

import (
	"context"
	"fmt"

	domainguild "mcgame-server/internal/domain/guild"
)

func (s *Service) GetGuildSkillData(ctx context.Context, guildID int64) (map[string]interface{}, error) {
	skillIDs, err := s.repo.GetGuildSkillIDs(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild skills: %w", err)
	}

	result := map[string]interface{}{}
	for _, skillID := range skillIDs {
		result[fmt.Sprintf("%d", skillID)] = 1
	}

	return result, nil
}

func (s *Service) LoadGuildWarehouse(ctx context.Context, guildID int64) (map[string]interface{}, error) {
	slots, err := s.repo.ListWarehouseSlots(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild warehouse slots: %w", err)
	}

	result := map[string]interface{}{}
	for _, slot := range slots {
		if slot == nil {
			continue
		}
		result[fmt.Sprintf("%d", slot.ID)] = slot.ToDTO()
	}

	return result, nil
}

func (s *Service) AddWarehouseMaterial(ctx context.Context, guildID int64, templateID int, count int) (*domainguild.GuildWarehouseSlot, error) {
	slot, err := s.repo.UpsertWarehouseMaterial(ctx, guildID, templateID, count)
	if err != nil {
		return nil, fmt.Errorf("failed to upsert guild warehouse material: %w", err)
	}
	return slot, nil
}

func (s *Service) UpdateWarehouseSlot(ctx context.Context, guildID, slotID int64, slotIndex int, stackCount int) error {
	if err := s.repo.UpdateWarehouseSlot(ctx, guildID, slotID, slotIndex, stackCount); err != nil {
		return fmt.Errorf("failed to update guild warehouse slot: %w", err)
	}
	return nil
}

func (s *Service) RemoveWarehouseSlot(ctx context.Context, guildID, slotID int64) error {
	if err := s.repo.DeleteWarehouseSlot(ctx, guildID, slotID); err != nil {
		return fmt.Errorf("failed to delete guild warehouse slot: %w", err)
	}
	return nil
}

func (s *Service) AddContribution(ctx context.Context, guildID, characterID int64, guildFunds, normalContrib, donateContrib int64) (*domainguild.Guild, error) {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return nil, ErrGuildNotFound
	}

	g.Funds += guildFunds
	if err := s.repo.Update(ctx, g); err != nil {
		return nil, fmt.Errorf("failed to update guild funds: %w", err)
	}

	totalContrib := normalContrib + donateContrib
	if err := s.repo.AddMemberContribution(ctx, guildID, characterID, normalContrib, donateContrib, totalContrib); err != nil {
		return nil, fmt.Errorf("failed to update guild member contribution: %w", err)
	}

	return s.GetGuildForClient(ctx, guildID)
}

func (s *Service) DevelopSkill(ctx context.Context, guildID, actorID int64, skillID int) error {
	g, err := s.repo.GetByID(ctx, guildID)
	if err != nil {
		return fmt.Errorf("failed to get guild: %w", err)
	}
	if g == nil {
		return ErrGuildNotFound
	}

	memberGuild, member, err := s.GetGuildByMemberForClient(ctx, actorID)
	if err != nil {
		return err
	}
	if memberGuild == nil || member == nil || memberGuild.ID != guildID {
		return ErrNotInGuild
	}

	if err := s.repo.UpsertGuildSkill(ctx, guildID, skillID); err != nil {
		return fmt.Errorf("failed to save guild skill: %w", err)
	}

	return nil
}
