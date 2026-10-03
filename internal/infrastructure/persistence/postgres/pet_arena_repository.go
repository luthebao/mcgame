// Open-sourced by BaoLT

// PostgreSQL implementation of pet arena repository.
// Handles rankings, battles, rewards, and matchmaking queries.
// Supports seasonal leaderboards and ELO-based opponent finding.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"github.com/jackc/pgx/v5"
	"mcgame-server/internal/domain/petarena"
	pkgerrors "mcgame-server/pkg/errors"
)

type PetArenaRepository struct {
	db *Database
}

func NewPetArenaRepository(db *Database) *PetArenaRepository {
	return &PetArenaRepository{db: db}
}

func (r *PetArenaRepository) GetRanking(ctx context.Context, characterID int64, season int) (*petarena.ArenaRanking, error) {
	ranking, err := scanArenaRanking(r.db.pool.QueryRow(ctx, "select * from player.get_pet_arena_ranking($1, $2)", characterID, season))

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to get arena ranking")
	}

	return ranking, nil
}

func (r *PetArenaRepository) GetOrCreateRanking(ctx context.Context, characterID int64, season int) (*petarena.ArenaRanking, error) {
	ranking, err := r.GetRanking(ctx, characterID, season)
	if err == nil {
		return ranking, nil
	}

	if !errors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}

	ranking = petarena.NewArenaRanking(characterID, season)
	if err := r.SaveRanking(ctx, ranking); err != nil {
		return nil, err
	}

	return ranking, nil
}

func (r *PetArenaRepository) SaveRanking(ctx context.Context, ranking *petarena.ArenaRanking) error {
	if ranking.ID == 0 {
		return r.createRanking(ctx, ranking)
	}
	return r.updateRanking(ctx, ranking)
}

func (r *PetArenaRepository) createRanking(ctx context.Context, ranking *petarena.ArenaRanking) error {
	err := r.db.pool.QueryRow(ctx,
		"select player.create_pet_arena_ranking($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)",
		ranking.CharacterID, ranking.PetID, ranking.Rating, ranking.Wins, ranking.Losses,
		ranking.WinStreak, ranking.MaxWinStreak, ranking.Season, ranking.Tickets,
		ranking.MaxTickets, ranking.LastTicketRefresh, ranking.LastFightAt,
		ranking.CreatedAt, ranking.UpdatedAt,
	).Scan(&ranking.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create arena ranking")
	}

	return nil
}

func (r *PetArenaRepository) updateRanking(ctx context.Context, ranking *petarena.ArenaRanking) error {
	var updated bool
	err := r.db.pool.QueryRow(ctx,
		"select player.update_pet_arena_ranking($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)",
		ranking.ID, ranking.PetID, ranking.Rating, ranking.Wins, ranking.Losses,
		ranking.WinStreak, ranking.MaxWinStreak, ranking.Tickets, ranking.LastTicketRefresh,
		ranking.LastFightAt, ranking.UpdatedAt,
	).Scan(&updated)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to update arena ranking")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *PetArenaRepository) GetTopRankings(ctx context.Context, season int, limit, offset int) ([]*petarena.ArenaRanking, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_top_pet_arena_rankings($1, $2, $3)", season, limit, offset)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get top rankings")
	}
	defer rows.Close()

	rankings, err := scanArenaRankingRows(rows)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to scan ranking")
	}

	return rankings, nil
}

func (r *PetArenaRepository) GetRank(ctx context.Context, characterID int64, season int) (int, error) {
	var rank int
	err := r.db.pool.QueryRow(ctx, "select player.get_pet_arena_rank($1, $2)", characterID, season).Scan(&rank)
	if err != nil {
		return 0, pkgerrors.Wrap(err, "failed to get rank")
	}

	return rank, nil
}

func (r *PetArenaRepository) SaveBattle(ctx context.Context, battle *petarena.ArenaBattle) error {
	battleLogJSON, err := json.Marshal(battle.BattleLog)
	if err != nil {
		battleLogJSON = []byte("[]")
	}

	err = r.db.pool.QueryRow(ctx,
		"select player.create_pet_arena_battle($1, $2, $3, $4, $5, $6, $7, $8, $9::jsonb, $10, $11)",
		battle.AttackerID, battle.DefenderID, battle.AttackerPetID, battle.DefenderPetID,
		battle.AttackerRatingBefore, battle.DefenderRatingBefore, battle.WinnerID,
		battle.RatingChange, battleLogJSON, battle.Season, battle.CreatedAt,
	).Scan(&battle.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to save battle")
	}

	return nil
}

func (r *PetArenaRepository) GetBattle(ctx context.Context, battleID int64) (*petarena.ArenaBattle, error) {
	battle, err := scanArenaBattle(r.db.pool.QueryRow(ctx, "select * from player.get_pet_arena_battle($1)", battleID))

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to get battle")
	}

	return battle, nil
}

func (r *PetArenaRepository) GetBattleHistory(ctx context.Context, characterID int64, limit int) ([]*petarena.ArenaBattle, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_pet_arena_battle_history($1, $2)", characterID, limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get battle history")
	}
	defer rows.Close()

	battles, err := scanArenaBattleRows(rows)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to scan battle")
	}

	return battles, nil
}

func (r *PetArenaRepository) GetReward(ctx context.Context, characterID int64, season int) (*petarena.ArenaReward, error) {
	reward, err := scanArenaReward(r.db.pool.QueryRow(ctx, "select * from player.get_pet_arena_reward($1, $2)", characterID, season))

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to get reward")
	}

	return reward, nil
}

func (r *PetArenaRepository) SaveReward(ctx context.Context, reward *petarena.ArenaReward) error {
	rewardsJSON, err := json.Marshal(reward.RewardsClaimed)
	if err != nil {
		rewardsJSON = []byte("{}")
	}

	err = r.db.pool.QueryRow(ctx,
		"select player.upsert_pet_arena_reward($1, $2, $3, $4, $5::jsonb, $6, $7)",
		reward.CharacterID, reward.Season, reward.Rank, reward.Rating,
		rewardsJSON, reward.ClaimedAt, reward.CreatedAt,
	).Scan(&reward.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to save reward")
	}

	return nil
}

func (r *PetArenaRepository) FindOpponents(ctx context.Context, characterID int64, rating int, season int, limit int) ([]*petarena.ArenaRanking, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.find_pet_arena_opponents($1, $2, $3, $4)", season, characterID, rating, limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find opponents")
	}
	defer rows.Close()

	rankings, err := scanArenaRankingRows(rows)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to scan opponent")
	}

	return rankings, nil
}

type arenaRankingScanner interface {
	Scan(dest ...interface{}) error
}

func scanArenaRanking(scanner arenaRankingScanner) (*petarena.ArenaRanking, error) {
	ranking := &petarena.ArenaRanking{}
	err := scanner.Scan(
		&ranking.ID, &ranking.CharacterID, &ranking.PetID, &ranking.Rating,
		&ranking.Wins, &ranking.Losses, &ranking.WinStreak, &ranking.MaxWinStreak,
		&ranking.Season, &ranking.Tickets, &ranking.MaxTickets, &ranking.LastTicketRefresh,
		&ranking.LastFightAt, &ranking.CreatedAt, &ranking.UpdatedAt,
	)
	if err != nil {
		return nil, err
	}
	return ranking, nil
}

func scanArenaRankingRows(rows pgx.Rows) ([]*petarena.ArenaRanking, error) {
	var rankings []*petarena.ArenaRanking
	for rows.Next() {
		ranking, err := scanArenaRanking(rows)
		if err != nil {
			return nil, err
		}
		rankings = append(rankings, ranking)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return rankings, nil
}

type arenaBattleScanner interface {
	Scan(dest ...interface{}) error
}

func scanArenaBattle(scanner arenaBattleScanner) (*petarena.ArenaBattle, error) {
	battle := &petarena.ArenaBattle{}
	var battleLogJSON []byte
	err := scanner.Scan(
		&battle.ID, &battle.AttackerID, &battle.DefenderID,
		&battle.AttackerPetID, &battle.DefenderPetID,
		&battle.AttackerRatingBefore, &battle.DefenderRatingBefore,
		&battle.WinnerID, &battle.RatingChange, &battleLogJSON,
		&battle.Season, &battle.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	if len(battleLogJSON) > 0 {
		if err := json.Unmarshal(battleLogJSON, &battle.BattleLog); err != nil {
			battle.BattleLog = []petarena.BattleRound{}
		}
	}
	return battle, nil
}

func scanArenaBattleRows(rows pgx.Rows) ([]*petarena.ArenaBattle, error) {
	var battles []*petarena.ArenaBattle
	for rows.Next() {
		battle, err := scanArenaBattle(rows)
		if err != nil {
			return nil, err
		}
		battles = append(battles, battle)
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return battles, nil
}

type arenaRewardScanner interface {
	Scan(dest ...interface{}) error
}

func scanArenaReward(scanner arenaRewardScanner) (*petarena.ArenaReward, error) {
	reward := &petarena.ArenaReward{}
	var rewardsJSON []byte
	err := scanner.Scan(
		&reward.ID, &reward.CharacterID, &reward.Season, &reward.Rank,
		&reward.Rating, &rewardsJSON, &reward.ClaimedAt, &reward.CreatedAt,
	)
	if err != nil {
		return nil, err
	}
	if len(rewardsJSON) > 0 {
		_ = json.Unmarshal(rewardsJSON, &reward.RewardsClaimed)
	}
	return reward, nil
}

func (r *PetArenaRepository) GetFightConfig(ctx context.Context, characterID int64, configKey string) (*petarena.FightConfig, error) {
	if configKey == "" {
		configKey = "farm"
	}

	var configJSON []byte
	config := &petarena.FightConfig{}
	err := r.db.pool.QueryRow(
		ctx,
		`
			SELECT character_id, config_key, conf_data
			FROM player.character_pet_fight_configs
			WHERE character_id = $1 AND config_key = $2
		`,
		characterID,
		configKey,
	).Scan(&config.CharacterID, &config.ConfigKey, &configJSON)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to get pet fight config")
	}

	if len(configJSON) > 0 {
		if err := json.Unmarshal(configJSON, &config.ConfData); err != nil {
			config.ConfData = map[string]interface{}{}
		}
	} else {
		config.ConfData = map[string]interface{}{}
	}

	return config, nil
}

func (r *PetArenaRepository) SaveFightConfig(ctx context.Context, config *petarena.FightConfig) error {
	if config == nil {
		return pkgerrors.ErrInvalidInput
	}
	if config.ConfigKey == "" {
		config.ConfigKey = "farm"
	}

	configJSON, err := json.Marshal(config.ConfData)
	if err != nil {
		configJSON = []byte(`{}`)
	}

	_, err = r.db.pool.Exec(
		ctx,
		`
			INSERT INTO player.character_pet_fight_configs (
				character_id, config_key, conf_data
			) VALUES ($1, $2, $3)
			ON CONFLICT (character_id, config_key)
			DO UPDATE SET
				conf_data = EXCLUDED.conf_data,
				updated_at = now()
		`,
		config.CharacterID,
		config.ConfigKey,
		configJSON,
	)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to save pet fight config")
	}

	return nil
}

func (r *PetArenaRepository) GetEntry(ctx context.Context, characterID int64, season int) (*petarena.Entry, error) {
	entry := &petarena.Entry{}
	var confJSON []byte

	err := r.db.pool.QueryRow(
		ctx,
		`
			SELECT character_id, season, team_name, conf_data, max_fights, used_fights, cooldown_ends_at_ms, last_rank, created_at, updated_at
			FROM player.character_pet_arena_entries
			WHERE character_id = $1 AND season = $2
		`,
		characterID,
		season,
	).Scan(
		&entry.CharacterID,
		&entry.Season,
		&entry.TeamName,
		&confJSON,
		&entry.MaxFights,
		&entry.UsedFights,
		&entry.CooldownEndsAtMS,
		&entry.LastRank,
		&entry.CreatedAt,
		&entry.UpdatedAt,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to get pet arena entry")
	}

	if len(confJSON) > 0 {
		if err := json.Unmarshal(confJSON, &entry.ConfData); err != nil {
			entry.ConfData = map[string]interface{}{}
		}
	} else {
		entry.ConfData = map[string]interface{}{}
	}

	return entry, nil
}

func (r *PetArenaRepository) SaveEntry(ctx context.Context, entry *petarena.Entry) error {
	if entry == nil {
		return pkgerrors.ErrInvalidInput
	}

	confJSON, err := json.Marshal(entry.ConfData)
	if err != nil {
		confJSON = []byte(`{}`)
	}

	now := time.Now()
	if entry.CreatedAt.IsZero() {
		entry.CreatedAt = now
	}
	entry.UpdatedAt = now

	_, err = r.db.pool.Exec(
		ctx,
		`
			INSERT INTO player.character_pet_arena_entries (
				character_id, season, team_name, conf_data, max_fights, used_fights, cooldown_ends_at_ms, last_rank, created_at, updated_at
			) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
			ON CONFLICT (character_id, season)
			DO UPDATE SET
				team_name = EXCLUDED.team_name,
				conf_data = EXCLUDED.conf_data,
				max_fights = EXCLUDED.max_fights,
				used_fights = EXCLUDED.used_fights,
				cooldown_ends_at_ms = EXCLUDED.cooldown_ends_at_ms,
				last_rank = EXCLUDED.last_rank,
				updated_at = EXCLUDED.updated_at
		`,
		entry.CharacterID,
		entry.Season,
		entry.TeamName,
		confJSON,
		entry.MaxFights,
		entry.UsedFights,
		entry.CooldownEndsAtMS,
		entry.LastRank,
		entry.CreatedAt,
		entry.UpdatedAt,
	)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to save pet arena entry")
	}

	return nil
}

func (r *PetArenaRepository) ListEntries(ctx context.Context, season int, limit int) ([]*petarena.Entry, error) {
	if limit <= 0 {
		limit = 200
	}

	rows, err := r.db.pool.Query(
		ctx,
		`
			SELECT character_id, season, team_name, conf_data, max_fights, used_fights, cooldown_ends_at_ms, last_rank, created_at, updated_at
			FROM player.character_pet_arena_entries
			WHERE season = $1
			ORDER BY updated_at DESC
			LIMIT $2
		`,
		season,
		limit,
	)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list pet arena entries")
	}
	defer rows.Close()

	result := make([]*petarena.Entry, 0)
	for rows.Next() {
		entry := &petarena.Entry{}
		var confJSON []byte

		if err := rows.Scan(
			&entry.CharacterID,
			&entry.Season,
			&entry.TeamName,
			&confJSON,
			&entry.MaxFights,
			&entry.UsedFights,
			&entry.CooldownEndsAtMS,
			&entry.LastRank,
			&entry.CreatedAt,
			&entry.UpdatedAt,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan pet arena entry")
		}

		if len(confJSON) > 0 {
			if err := json.Unmarshal(confJSON, &entry.ConfData); err != nil {
				entry.ConfData = map[string]interface{}{}
			}
		} else {
			entry.ConfData = map[string]interface{}{}
		}

		result = append(result, entry)
	}

	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list pet arena entries")
	}

	return result, nil
}
