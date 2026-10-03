// Open-sourced by BaoLT

package guild

import (
	"context"
	"fmt"

	domainguild "mcgame-server/internal/domain/guild"
)

func (s *Service) applyGuildExitState(ctx context.Context, characterID int64) error {
	char, err := s.charSvc.GetByID(ctx, characterID)
	if err != nil {
		return fmt.Errorf("failed to get character: %w", err)
	}
	if char == nil {
		return nil
	}

	char.GuildRestoreContrib = char.GuildContrib * guildRestoreRateNumerator / guildRestoreRateDenominator
	char.GuildRestoreDonate = char.DonateContrib * guildRestoreRateNumerator / guildRestoreRateDenominator
	char.GuildContrib = 0
	char.DonateContrib = 0

	if err := s.charSvc.Update(ctx, char); err != nil {
		return fmt.Errorf("failed to persist guild exit state: %w", err)
	}

	if s.questSvc != nil {
		if _, err := s.questSvc.AbandonGuildQuests(ctx, characterID); err != nil {
			return fmt.Errorf("failed to abandon guild quests: %w", err)
		}
	}

	return nil
}

func (s *Service) consumeContributionRestore(ctx context.Context, guildID, characterID int64) error {
	char, err := s.charSvc.GetByID(ctx, characterID)
	if err != nil {
		return fmt.Errorf("failed to get character: %w", err)
	}
	if char == nil {
		return nil
	}

	restoreContrib := char.GuildRestoreContrib
	restoreDonate := char.GuildRestoreDonate
	if restoreContrib == 0 && restoreDonate == 0 {
		return nil
	}

	char.GuildContrib += restoreContrib
	char.DonateContrib += restoreDonate
	char.GuildRestoreContrib = 0
	char.GuildRestoreDonate = 0

	if err := s.charSvc.Update(ctx, char); err != nil {
		return fmt.Errorf("failed to persist guild restore state: %w", err)
	}

	if err := s.repo.SetMemberContribution(ctx, guildID, characterID, int64(char.GuildContrib), int64(char.DonateContrib), int64(char.GuildContrib+char.DonateContrib)); err != nil {
		return fmt.Errorf("failed to apply restored guild contribution: %w", err)
	}

	return nil
}

func (s *Service) enrichGuild(ctx context.Context, guildItem *domainguild.Guild) (*domainguild.Guild, error) {
	if guildItem == nil {
		return nil, nil
	}

	if err := s.loadGuildSettings(ctx, guildItem); err != nil {
		return nil, err
	}

	applications, err := s.repo.ListApplications(ctx, guildItem.ID)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild applications: %w", err)
	}
	guildItem.Applications = applications

	skillData, err := s.GetGuildSkillData(ctx, guildItem.ID)
	if err != nil {
		return nil, err
	}
	guildItem.SkillDevData = skillData

	skillLevels, err := s.repo.GetGuildSkillLevels(ctx, guildItem.ID)
	if err != nil {
		return nil, fmt.Errorf("failed to load guild skill levels: %w", err)
	}
	guildItem.SkillLevels = skillLevels

	warehouse, err := s.LoadGuildWarehouse(ctx, guildItem.ID)
	if err != nil {
		return nil, err
	}
	guildItem.Warehouse = warehouse

	return guildItem, nil
}

func (s *Service) loadGuildSettings(ctx context.Context, guildItem *domainguild.Guild) error {
	rankSettings, err := s.repo.LoadRankSettings(ctx, guildItem.ID)
	if err != nil {
		return fmt.Errorf("failed to load guild rank settings: %w", err)
	}
	if len(rankSettings) == 0 {
		rankSettings = DefaultRankSettings()
	}
	guildItem.RankSettings = rankSettings

	pageCount, err := s.repo.LoadBankPageCount(ctx, guildItem.ID)
	if err != nil {
		return fmt.Errorf("failed to load guild bank page count: %w", err)
	}
	if pageCount < 1 {
		pageCount = 1
	}
	guildItem.BankPageCount = pageCount

	return nil
}

func (s *Service) loadApplicationAndAuthority(ctx context.Context, applicationID, actorID int64) (*domainguild.GuildApplication, *domainguild.Guild, *domainguild.GuildMember, error) {
	application, err := s.repo.GetApplicationByID(ctx, applicationID)
	if err != nil {
		return nil, nil, nil, fmt.Errorf("failed to get guild application: %w", err)
	}
	if application == nil {
		return nil, nil, nil, ErrGuildNotFound
	}

	guildItem, err := s.repo.GetByID(ctx, application.GuildID)
	if err != nil {
		return nil, nil, nil, fmt.Errorf("failed to get guild: %w", err)
	}
	if guildItem == nil {
		return nil, nil, nil, ErrGuildNotFound
	}

	members, err := s.repo.GetMembers(ctx, guildItem.ID)
	if err != nil {
		return nil, nil, nil, fmt.Errorf("failed to get guild members: %w", err)
	}
	var approverMember *domainguild.GuildMember
	for _, member := range members {
		if member != nil && member.CharacterID == actorID {
			approverMember = member
			break
		}
	}

	return application, guildItem, approverMember, nil
}

func DefaultRankSettings() []map[string]interface{} {
	return []map[string]interface{}{
		{"rank": domainguild.RankLeader, "name": "Bang chủ", "canAdd": 1, "canQuest": 1, "canSlot": 1, "canInfo": 1, "canDel": 1, "canDuty": 1},
		{"rank": domainguild.RankViceLeader, "name": "Phó bang", "canAdd": 1, "canQuest": 1, "canSlot": 1, "canInfo": 1, "canDel": 1, "canDuty": 1},
		{"rank": domainguild.RankOfficer, "name": "Trưởng lão", "canAdd": 1, "canQuest": 1, "canSlot": 1, "canInfo": 1, "canDel": 0, "canDuty": 0},
		{"rank": domainguild.RankElite, "name": "Tinh anh", "canAdd": 1, "canQuest": 1, "canSlot": 0, "canInfo": 1, "canDel": 0, "canDuty": 0},
		{"rank": domainguild.RankVeteran, "name": "Thành viên cũ", "canAdd": 0, "canQuest": 1, "canSlot": 0, "canInfo": 0, "canDel": 0, "canDuty": 0},
		{"rank": domainguild.RankMember, "name": "Thành viên", "canAdd": 0, "canQuest": 0, "canSlot": 0, "canInfo": 0, "canDel": 0, "canDuty": 0},
	}
}
