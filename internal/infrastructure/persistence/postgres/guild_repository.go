// Open-sourced by BaoLT

// Guild repository for PostgreSQL database operations
package postgres

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/guild"

	"github.com/jackc/pgx/v5"
)

type GuildRepository struct {
	db *Database
}

func NewGuildRepository(db *Database) *GuildRepository {
	return &GuildRepository{db: db}
}

// Create creates a new guild
func (r *GuildRepository) Create(ctx context.Context, g *guild.Guild) error {
	return r.db.pool.QueryRow(ctx, "select * from player.create_guild($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)",
		g.Name, g.LeaderID, g.Level, g.Experience, g.Population, g.MaxPopulation,
		g.Icon, g.Funds, g.ContributionTotal, g.Announcement, g.Description,
		g.JoinLevelReq, g.JoinApprovalRequired, g.ActivityPoints,
	).Scan(&g.ID, &g.CreatedAt, &g.UpdatedAt)
}

// GetByID retrieves a guild by ID
func (r *GuildRepository) GetByID(ctx context.Context, guildID int64) (*guild.Guild, error) {
	g, err := scanGuild(r.db.pool.QueryRow(ctx, "select * from player.get_guild_by_id($1)", guildID))

	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to get guild by ID: %w", err)
	}

	return g, nil
}

// GetByName retrieves a guild by name
func (r *GuildRepository) GetByName(ctx context.Context, name string) (*guild.Guild, error) {
	g, err := scanGuild(r.db.pool.QueryRow(ctx, "select * from player.get_guild_by_name($1)", name))

	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to get guild by name: %w", err)
	}

	return g, nil
}

// GetByMemberID retrieves the guild that a character belongs to
func (r *GuildRepository) GetByMemberID(ctx context.Context, characterID int64) (*guild.Guild, error) {
	g, err := scanGuild(r.db.pool.QueryRow(ctx, "select * from player.get_guild_by_member_id($1)", characterID))

	if err == pgx.ErrNoRows {
		return nil, nil
	}
	if err != nil {
		return nil, fmt.Errorf("failed to get guild by member ID: %w", err)
	}

	return g, nil
}

// GetMembers retrieves all members of a guild
func (r *GuildRepository) GetMembers(ctx context.Context, guildID int64) ([]*guild.GuildMember, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_guild_members_detailed($1)", guildID)
	if err != nil {
		return nil, fmt.Errorf("failed to get guild members: %w", err)
	}
	defer rows.Close()

	var members []*guild.GuildMember
	for rows.Next() {
		m := &guild.GuildMember{}
		err := rows.Scan(
			&m.ID, &m.GuildID, &m.CharacterID, &m.CharacterName, &m.CharacterLevel, &m.CharacterClass, &m.CharacterExp,
			&m.Rank, &m.Duty, &m.ContributionNormal, &m.ContributionDonate,
			&m.ContributionTotal, &m.ContributionWeekly,
			&m.CanInvite, &m.CanKick, &m.CanEditAnnouncement,
			&m.CanAccessWarehouse, &m.CanManageWarehouse,
			&m.JoinedAt, &m.LastOnline,
		)
		if err != nil {
			return nil, fmt.Errorf("failed to scan guild member: %w", err)
		}
		members = append(members, m)
	}

	return members, rows.Err()
}

// AddMember adds a character to a guild
func (r *GuildRepository) AddMember(ctx context.Context, guildID, characterID int64, rank int) error {
	var added bool
	err := r.db.pool.QueryRow(ctx, "select player.add_guild_member($1, $2, $3)", guildID, characterID, rank).Scan(&added)
	if err != nil {
		return fmt.Errorf("failed to add guild member: %w", err)
	}
	return nil
}

// RemoveMember removes a character from a guild
func (r *GuildRepository) RemoveMember(ctx context.Context, guildID, characterID int64) error {
	var removed bool
	err := r.db.pool.QueryRow(ctx, "select player.remove_guild_member($1, $2)", guildID, characterID).Scan(&removed)
	if err != nil {
		return fmt.Errorf("failed to remove guild member: %w", err)
	}
	return nil
}

// UpdateMemberRank updates a member's rank
func (r *GuildRepository) UpdateMemberRank(ctx context.Context, guildID, characterID int64, rank int) error {
	_, err := r.db.pool.Exec(ctx, "select player.update_guild_member_rank($1, $2, $3)", guildID, characterID, rank)
	if err != nil {
		return fmt.Errorf("failed to update member rank: %w", err)
	}
	return nil
}

// Update updates guild information
func (r *GuildRepository) Update(ctx context.Context, g *guild.Guild) error {
	var updated bool
	err := r.db.pool.QueryRow(ctx, "select player.update_guild($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)",
		g.Name, g.Level, g.Experience, g.MaxPopulation,
		g.Icon, g.Funds, g.Announcement, g.Description,
		g.JoinLevelReq, g.JoinApprovalRequired, g.ID,
	).Scan(&updated)

	if err != nil {
		return fmt.Errorf("failed to update guild: %w", err)
	}

	return nil
}

// Delete deletes a guild
func (r *GuildRepository) Delete(ctx context.Context, guildID int64) error {
	var deleted bool
	err := r.db.pool.QueryRow(ctx, "select player.delete_guild($1)", guildID).Scan(&deleted)
	if err != nil {
		return fmt.Errorf("failed to delete guild: %w", err)
	}
	return nil
}

type guildScanner interface {
	Scan(dest ...interface{}) error
}

func scanGuild(scanner guildScanner) (*guild.Guild, error) {
	g := &guild.Guild{}
	err := scanner.Scan(
		&g.ID, &g.Name, &g.LeaderID, &g.Level, &g.Experience, &g.Population, &g.MaxPopulation,
		&g.Icon, &g.Funds, &g.ContributionTotal, &g.Announcement, &g.Description,
		&g.JoinLevelReq, &g.JoinApprovalRequired, &g.ActivityPoints,
		&g.LastActivityReset, &g.CreatedAt, &g.UpdatedAt,
	)
	if err != nil {
		return nil, err
	}
	return g, nil
}
