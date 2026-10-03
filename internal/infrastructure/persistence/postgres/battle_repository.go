// Open-sourced by BaoLT

// In-memory battle repository for active combat and PostgreSQL battle logs.
// InMemoryBattleRepository stores ongoing battles in memory.
// BattleLogRepository persists completed battles with JSON serialization.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"sync"

	"github.com/jackc/pgx/v5"
	"mcgame-server/internal/domain/combat"
	pkgerrors "mcgame-server/pkg/errors"
)

type InMemoryBattleRepository struct {
	battles map[string]*combat.Battle
	mu      sync.RWMutex
}

func NewInMemoryBattleRepository() *InMemoryBattleRepository {
	return &InMemoryBattleRepository{
		battles: make(map[string]*combat.Battle),
	}
}

func (r *InMemoryBattleRepository) GetByID(battleID string) (*combat.Battle, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()

	battle, ok := r.battles[battleID]
	if !ok {
		return nil, pkgerrors.ErrNotFound
	}
	return battle, nil
}

func (r *InMemoryBattleRepository) GetByParticipant(participantID string) (*combat.Battle, error) {
	r.mu.RLock()
	defer r.mu.RUnlock()

	for _, battle := range r.battles {
		for _, p := range battle.Participants {
			if p.ID == participantID {
				return battle, nil
			}
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *InMemoryBattleRepository) Store(battle *combat.Battle) error {
	r.mu.Lock()
	defer r.mu.Unlock()

	r.battles[battle.ID] = battle
	return nil
}

func (r *InMemoryBattleRepository) Remove(battleID string) error {
	r.mu.Lock()
	defer r.mu.Unlock()

	delete(r.battles, battleID)
	return nil
}

func (r *InMemoryBattleRepository) GetAllActive() []*combat.Battle {
	r.mu.RLock()
	defer r.mu.RUnlock()

	result := make([]*combat.Battle, 0, len(r.battles))
	for _, battle := range r.battles {
		if battle.IsActive() {
			result = append(result, battle)
		}
	}
	return result
}

type BattleLogRepository struct {
	db *Database
}

func NewBattleLogRepository(db *Database) *BattleLogRepository {
	return &BattleLogRepository{db: db}
}

func (r *BattleLogRepository) CreateInitial(ctx context.Context, battle *combat.Battle) (int64, error) {
	participants := make([]combat.ParticipantLog, len(battle.Participants))
	for i, p := range battle.Participants {
		participants[i] = combat.ParticipantLog{
			ID:      p.ID,
			Name:    p.Name,
			Side:    int(p.Side),
			IsNPC:   p.IsNPC,
			Level:   p.Level,
			MaxHP:   p.MaxHP,
			FinalHP: p.CurrentHP,
		}
	}
	participantsJSON, _ := json.Marshal(participants)

	var logID int64
	err := r.db.pool.QueryRow(ctx,
		"select player.create_initial_battle_log($1, $2::jsonb, $3)",
		int(battle.BattleType), participantsJSON, battle.CreatedAt,
	).Scan(&logID)
	if err != nil {
		return 0, pkgerrors.Wrap(err, "failed to create initial battle log")
	}

	return logID, nil
}

func (r *BattleLogRepository) Save(ctx context.Context, battle *combat.Battle) error {
	participants := make([]combat.ParticipantLog, len(battle.Participants))
	for i, p := range battle.Participants {
		participants[i] = combat.ParticipantLog{
			ID:      p.ID,
			Name:    p.Name,
			Side:    int(p.Side),
			IsNPC:   p.IsNPC,
			Level:   p.Level,
			MaxHP:   p.MaxHP,
			FinalHP: p.CurrentHP,
		}
	}
	participantsJSON, _ := json.Marshal(participants)

	actions := make([]combat.ActionLog, len(battle.Actions))
	for i, a := range battle.Actions {
		actions[i] = combat.ActionLog{
			Round:      a.Round,
			ActorID:    a.ActorID,
			ActionType: int(a.ActionType),
			SkillID:    a.SkillID,
			TargetID:   a.TargetID,
			Damage:     a.Damage,
			IsCritical: a.IsCritical,
			IsMiss:     a.IsMiss,
		}
	}
	actionsJSON, _ := json.Marshal(actions)

	var resultLog combat.ResultLog
	if battle.Result != nil {
		resultLog = combat.ResultLog{
			WinnerSide:  int(battle.Result.WinnerSide),
			ExpReward:   battle.Result.ExpReward,
			MoneyReward: battle.Result.MoneyReward,
			ItemRewards: battle.Result.ItemRewards,
			PetRewards:  battle.Result.PetRewards,
			BattleTime:  battle.Result.BattleTime,
		}
	}
	resultJSON, _ := json.Marshal(resultLog)

	if battle.LogID > 0 {
		var updated bool
		err := r.db.pool.QueryRow(ctx,
			"select player.update_battle_log($1, $2::jsonb, $3::jsonb, $4::jsonb)",
			battle.LogID, participantsJSON, actionsJSON, resultJSON,
		).Scan(&updated)
		if err != nil {
			return pkgerrors.Wrap(err, "failed to update battle log")
		}
		return nil
	}

	var logID int64
	err := r.db.pool.QueryRow(ctx,
		"select player.save_battle_log($1, $2::jsonb, $3::jsonb, $4::jsonb, $5)",
		int(battle.BattleType), participantsJSON, actionsJSON, resultJSON, battle.CreatedAt,
	).Scan(&logID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to save battle log")
	}

	return nil
}

func (r *BattleLogRepository) FindByID(ctx context.Context, id int64) (*combat.BattleLog, error) {
	log := &combat.BattleLog{}
	var participantsJSON, actionsJSON, resultJSON []byte
	err := r.db.pool.QueryRow(ctx, "select * from player.get_battle_log_by_id($1)", id).Scan(
		&log.ID, &log.BattleType, &participantsJSON, &actionsJSON, &resultJSON, &log.CreatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find battle log")
	}

	json.Unmarshal(participantsJSON, &log.Participants)
	json.Unmarshal(actionsJSON, &log.Actions)
	json.Unmarshal(resultJSON, &log.Result)

	return log, nil
}

func (r *BattleLogRepository) FindByParticipant(ctx context.Context, characterID string, limit int) ([]*combat.BattleLog, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_battle_logs_by_participant($1, $2)", characterID, limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find battle logs")
	}
	defer rows.Close()

	return r.scanBattleLogs(rows)
}

func (r *BattleLogRepository) FindRecent(ctx context.Context, limit int) ([]*combat.BattleLog, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_recent_battle_logs($1)", limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find recent battle logs")
	}
	defer rows.Close()

	return r.scanBattleLogs(rows)
}

func (r *BattleLogRepository) scanBattleLogs(rows pgx.Rows) ([]*combat.BattleLog, error) {
	var logs []*combat.BattleLog
	for rows.Next() {
		log := &combat.BattleLog{}
		var participantsJSON, actionsJSON, resultJSON []byte
		err := rows.Scan(
			&log.ID, &log.BattleType, &participantsJSON, &actionsJSON, &resultJSON, &log.CreatedAt,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan battle log")
		}

		json.Unmarshal(participantsJSON, &log.Participants)
		json.Unmarshal(actionsJSON, &log.Actions)
		json.Unmarshal(resultJSON, &log.Result)

		logs = append(logs, log)
	}

	return logs, nil
}
