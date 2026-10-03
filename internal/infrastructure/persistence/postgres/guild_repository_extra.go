// Open-sourced by BaoLT

package postgres

import (
	"context"
	"encoding/json"
	"fmt"

	"mcgame-server/internal/domain/guild"

	"github.com/jackc/pgx/v5"
)

const (
	guildRankSettingsAction = 9001
	guildBankPageAction     = 9002
)

func (r *GuildRepository) ListGuilds(ctx context.Context) ([]*guild.Guild, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_guilds_full()")
	if err != nil {
		return nil, fmt.Errorf("failed to list guilds: %w", err)
	}
	defer rows.Close()

	var guilds []*guild.Guild
	for rows.Next() {
		item := &guild.Guild{}
		if err := rows.Scan(
			&item.ID, &item.Name, &item.LeaderID, &item.Level, &item.Experience, &item.Population, &item.MaxPopulation,
			&item.Icon, &item.Funds, &item.ContributionTotal, &item.Announcement, &item.Description,
			&item.JoinLevelReq, &item.JoinApprovalRequired, &item.ActivityPoints,
			&item.LastActivityReset, &item.CreatedAt, &item.UpdatedAt,
		); err != nil {
			return nil, fmt.Errorf("failed to scan guild: %w", err)
		}
		guilds = append(guilds, item)
	}

	return guilds, rows.Err()
}

func (r *GuildRepository) GetMemberByID(ctx context.Context, memberID int64) (*guild.GuildMember, error) {
	member := &guild.GuildMember{}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_guild_member_detailed($1)", memberID).Scan(
		&member.ID, &member.GuildID, &member.CharacterID, &member.CharacterName, &member.CharacterLevel, &member.CharacterClass, &member.CharacterExp,
		&member.Rank, &member.Duty, &member.ContributionNormal, &member.ContributionDonate,
		&member.ContributionTotal, &member.ContributionWeekly,
		&member.CanInvite, &member.CanKick, &member.CanEditAnnouncement,
		&member.CanAccessWarehouse, &member.CanManageWarehouse,
		&member.JoinedAt, &member.LastOnline,
	)

	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to get guild member: %w", err)
	}

	return member, nil
}

func (r *GuildRepository) AddMemberContribution(ctx context.Context, guildID, characterID int64, normal, donate, total int64) error {
	if _, err := r.db.pool.Exec(ctx, "select player.add_guild_member_contribution($1, $2, $3, $4, $5)", guildID, characterID, normal, donate, total); err != nil {
		return fmt.Errorf("failed to update guild member contribution: %w", err)
	}
	return nil
}

func (r *GuildRepository) SetMemberContribution(ctx context.Context, guildID, characterID int64, normal, donate, total int64) error {
	if _, err := r.db.pool.Exec(ctx, "select player.set_guild_member_contribution($1, $2, $3, $4, $5)", guildID, characterID, normal, donate, total); err != nil {
		return fmt.Errorf("failed to set guild member contribution: %w", err)
	}
	return nil
}

func (r *GuildRepository) UpdateLeader(ctx context.Context, guildID, oldLeaderID, newLeaderID int64) error {
	if _, err := r.db.pool.Exec(ctx, "select player.update_guild_leader($1, $2, $3, $4, $5)", guildID, oldLeaderID, newLeaderID, guild.RankLeader, guild.RankMember); err != nil {
		return fmt.Errorf("failed to update guild leader: %w", err)
	}
	return nil
}

func (r *GuildRepository) CreateApplication(ctx context.Context, application *guild.GuildApplication) error {
	return r.db.pool.QueryRow(ctx,
		"select * from player.create_guild_application($1, $2, $3, $4)",
		application.GuildID, application.CharacterID, application.Message, application.Status,
	).Scan(&application.ID, &application.CreatedAt)
}

func (r *GuildRepository) GetApplicationByID(ctx context.Context, applicationID int64) (*guild.GuildApplication, error) {
	application := &guild.GuildApplication{}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_guild_application_detailed($1)", applicationID).Scan(
		&application.ID, &application.GuildID, &application.CharacterID, &application.CharacterName, &application.CharacterClass, &application.CharacterLevel, &application.CharacterExp,
		&application.Message, &application.Status, &application.CreatedAt, &application.ProcessedAt, &application.ProcessedBy,
	)

	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to get guild application: %w", err)
	}

	return application, nil
}

func (r *GuildRepository) GetApplicationByCharacterID(ctx context.Context, characterID int64) (*guild.GuildApplication, error) {
	application := &guild.GuildApplication{}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_guild_application_by_character($1)", characterID).Scan(
		&application.ID, &application.GuildID, &application.CharacterID, &application.CharacterName, &application.CharacterClass, &application.CharacterLevel, &application.CharacterExp,
		&application.Message, &application.Status, &application.CreatedAt, &application.ProcessedAt, &application.ProcessedBy,
	)

	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to get guild application by character: %w", err)
	}

	return application, nil
}

func (r *GuildRepository) ListApplications(ctx context.Context, guildID int64) ([]*guild.GuildApplication, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_guild_applications_detailed($1)", guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild applications: %w", err)
	}
	defer rows.Close()

	var applications []*guild.GuildApplication
	for rows.Next() {
		application := &guild.GuildApplication{}
		if err := rows.Scan(
			&application.ID, &application.GuildID, &application.CharacterID, &application.CharacterName, &application.CharacterClass, &application.CharacterLevel, &application.CharacterExp,
			&application.Message, &application.Status, &application.CreatedAt, &application.ProcessedAt, &application.ProcessedBy,
		); err != nil {
			return nil, fmt.Errorf("failed to scan guild application: %w", err)
		}
		applications = append(applications, application)
	}

	return applications, rows.Err()
}

func (r *GuildRepository) DeleteApplication(ctx context.Context, applicationID int64) error {
	if _, err := r.db.pool.Exec(ctx, "select player.delete_guild_application($1)", applicationID); err != nil {
		return fmt.Errorf("failed to delete guild application: %w", err)
	}
	return nil
}

func (r *GuildRepository) SaveRankSettings(ctx context.Context, guildID, actorID int64, settings []map[string]interface{}) error {
	return r.insertGuildLog(ctx, guildID, guildRankSettingsAction, actorID, 0, settings)
}

func (r *GuildRepository) LoadRankSettings(ctx context.Context, guildID int64) ([]map[string]interface{}, error) {
	raw, err := r.loadGuildLogDetails(ctx, guildID, guildRankSettingsAction)
	if err != nil || len(raw) == 0 {
		return nil, err
	}

	var settings []map[string]interface{}
	if err := json.Unmarshal(raw, &settings); err != nil {
		return nil, fmt.Errorf("failed to decode guild rank settings: %w", err)
	}

	return settings, nil
}

func (r *GuildRepository) SaveBankPageCount(ctx context.Context, guildID, actorID int64, pageCount int) error {
	payload := map[string]int{"pageCount": pageCount}
	return r.insertGuildLog(ctx, guildID, guildBankPageAction, actorID, 0, payload)
}

func (r *GuildRepository) LoadBankPageCount(ctx context.Context, guildID int64) (int, error) {
	raw, err := r.loadGuildLogDetails(ctx, guildID, guildBankPageAction)
	if err != nil || len(raw) == 0 {
		return 0, err
	}

	var payload struct {
		PageCount int `json:"pageCount"`
	}
	if err := json.Unmarshal(raw, &payload); err != nil {
		return 0, fmt.Errorf("failed to decode guild bank page count: %w", err)
	}

	return payload.PageCount, nil
}

func (r *GuildRepository) ListWarehouseSlots(ctx context.Context, guildID int64) ([]*guild.GuildWarehouseSlot, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_guild_warehouse_slots($1)", guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild warehouse slots: %w", err)
	}
	defer rows.Close()

	var slots []*guild.GuildWarehouseSlot
	for rows.Next() {
		slot := &guild.GuildWarehouseSlot{}
		if err := rows.Scan(&slot.ID, &slot.GuildID, &slot.SlotIndex, &slot.TemplateID, &slot.StackCount); err != nil {
			return nil, fmt.Errorf("failed to scan guild warehouse slot: %w", err)
		}
		slots = append(slots, slot)
	}

	return slots, rows.Err()
}

func (r *GuildRepository) UpsertWarehouseMaterial(ctx context.Context, guildID int64, templateID int, count int) (*guild.GuildWarehouseSlot, error) {
	if count <= 0 {
		return nil, fmt.Errorf("invalid warehouse material count: %d", count)
	}

	slot := &guild.GuildWarehouseSlot{}
	if err := r.db.pool.QueryRow(ctx, "select * from player.upsert_guild_warehouse_material($1, $2, $3)", guildID, templateID, count).Scan(
		&slot.ID, &slot.GuildID, &slot.SlotIndex, &slot.TemplateID, &slot.StackCount,
	); err != nil {
		return nil, fmt.Errorf("failed to upsert guild warehouse material: %w", err)
	}
	return slot, nil
}

func (r *GuildRepository) UpdateWarehouseSlot(ctx context.Context, guildID, slotID int64, slotIndex int, stackCount int) error {
	var updated bool
	if err := r.db.pool.QueryRow(ctx,
		"select player.update_guild_warehouse_slot($1, $2, $3, $4)",
		guildID, slotID, slotIndex, stackCount,
	).Scan(&updated); err != nil {
		return fmt.Errorf("failed to update guild warehouse slot: %w", err)
	}
	if !updated {
		return pgx.ErrNoRows
	}
	return nil
}

func (r *GuildRepository) DeleteWarehouseSlot(ctx context.Context, guildID int64, slotID int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx,
		"select player.delete_guild_warehouse_slot($1, $2)",
		guildID, slotID,
	).Scan(&deleted); err != nil {
		return fmt.Errorf("failed to delete guild warehouse slot: %w", err)
	}
	if !deleted {
		return pgx.ErrNoRows
	}
	return nil
}

func (r *GuildRepository) GetGuildSkillIDs(ctx context.Context, guildID int64) ([]int, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_guild_skill_ids($1)", guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild skills: %w", err)
	}
	defer rows.Close()

	var skillIDs []int
	for rows.Next() {
		var skillID int
		if err := rows.Scan(&skillID); err != nil {
			return nil, fmt.Errorf("failed to scan guild skill id: %w", err)
		}
		skillIDs = append(skillIDs, skillID)
	}

	return skillIDs, rows.Err()
}

func (r *GuildRepository) GetGuildSkillLevels(ctx context.Context, guildID int64) (map[int]int, error) {
	rows, err := r.db.pool.Query(ctx,
		"select * from player.list_guild_skill_levels($1)",
		guildID,
	)
	if err != nil {
		return nil, fmt.Errorf("failed to list guild skill levels: %w", err)
	}
	defer rows.Close()

	result := make(map[int]int)
	for rows.Next() {
		var skillID, level int
		if err := rows.Scan(&skillID, &level); err != nil {
			return nil, fmt.Errorf("failed to scan guild skill level: %w", err)
		}
		result[skillID] = level
	}

	return result, rows.Err()
}

func (r *GuildRepository) UpsertGuildSkill(ctx context.Context, guildID int64, skillID int) error {
	if _, err := r.db.pool.Exec(ctx, "select player.upsert_guild_skill($1, $2)", guildID, skillID); err != nil {
		return fmt.Errorf("failed to upsert guild skill: %w", err)
	}
	return nil
}

func (r *GuildRepository) insertGuildLog(ctx context.Context, guildID int64, actionType int, actorID int64, targetID int64, payload any) error {
	raw, err := json.Marshal(payload)
	if err != nil {
		return fmt.Errorf("failed to encode guild log payload: %w", err)
	}
	if _, err := r.db.pool.Exec(ctx, "select player.insert_guild_log($1, $2, $3, $4, $5::jsonb)", guildID, actionType, actorID, targetID, raw); err != nil {
		return fmt.Errorf("failed to insert guild log: %w", err)
	}
	return nil
}

func (r *GuildRepository) loadGuildLogDetails(ctx context.Context, guildID int64, actionType int) ([]byte, error) {
	var raw []byte
	err := r.db.pool.QueryRow(ctx, "select player.load_latest_guild_log_details($1, $2)", guildID, actionType).Scan(&raw)
	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to load guild log details: %w", err)
	}
	return raw, nil
}
