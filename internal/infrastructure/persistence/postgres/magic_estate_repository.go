// Open-sourced by BaoLT

// PostgreSQL implementation of magic estate persistence.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"time"

	domainfarm "mcgame-server/internal/domain/farm"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type MagicEstateRepository struct {
	db *Database
}

func NewMagicEstateRepository(db *Database) *MagicEstateRepository {
	return &MagicEstateRepository{db: db}
}

func (r *MagicEstateRepository) FindByCharacter(ctx context.Context, characterID int64) (*domainfarm.MagicEstateProfile, error) {
	profile := &domainfarm.MagicEstateProfile{}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_magic_estate_profile($1)", characterID).Scan(
		&profile.CharacterID,
		&profile.Exp,
		&profile.Actpoint,
		&profile.MaxActpoint,
		&profile.MovePnt,
		&profile.MaxMovePnt,
		&profile.FarmNum,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to query magic estate profile")
	}
	profile.ID = profile.CharacterID
	profile.Slots = map[int]*domainfarm.MagicEstateSlot{}
	profile.Bag = map[int]*domainfarm.MagicEstateBagSlot{}

	slotRows, err := r.db.pool.Query(ctx, "select * from player.list_magic_estate_slots($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query magic estate slots")
	}
	defer slotRows.Close()

	for slotRows.Next() {
		slot := &domainfarm.MagicEstateSlot{}
		if err := slotRows.Scan(
			&slot.SlotID,
			&slot.MineralID,
			&slot.Num,
			&slot.MaxNum,
			&slot.CooldownEndsAt,
			&slot.HavestFlag,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan magic estate slot")
		}
		profile.Slots[slot.SlotID] = slot
	}

	bagRows, err := r.db.pool.Query(ctx, "select * from player.list_magic_estate_bag($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query magic estate bag")
	}
	defer bagRows.Close()

	for bagRows.Next() {
		slot := &domainfarm.MagicEstateBagSlot{}
		if err := bagRows.Scan(
			&slot.SlotIndex,
			&slot.TemplateID,
			&slot.Num,
			&slot.ColorCode,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan magic estate bag slot")
		}
		profile.Bag[slot.SlotIndex] = slot
	}

	return profile, nil
}

func (r *MagicEstateRepository) Upsert(ctx context.Context, profile *domainfarm.MagicEstateProfile) error {
	slotsPayload := make([]map[string]any, 0, len(profile.Slots))
	for _, slot := range profile.Slots {
		if slot == nil {
			continue
		}
		slotsPayload = append(slotsPayload, map[string]any{
			"slot_id":             slot.SlotID,
			"mineral_id":          slot.MineralID,
			"num":                 slot.Num,
			"max_num":             slot.MaxNum,
			"cooldown_ends_at_ms": slot.CooldownEndsAt,
			"harvest_flag":        slot.HavestFlag,
		})
	}
	bagPayload := make([]map[string]any, 0, len(profile.Bag))
	for _, bag := range profile.Bag {
		if bag == nil {
			continue
		}
		bagPayload = append(bagPayload, map[string]any{
			"slot_index":  bag.SlotIndex,
			"template_id": bag.TemplateID,
			"num":         bag.Num,
			"color_code":  bag.ColorCode,
		})
	}

	slotsJSON, err := json.Marshal(slotsPayload)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to marshal magic estate slots")
	}
	bagJSON, err := json.Marshal(bagPayload)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to marshal magic estate bag")
	}

	if _, err := r.db.pool.Exec(ctx,
		"select player.upsert_magic_estate_full($1, $2, $3, $4, $5, $6, $7, $8::jsonb, $9::jsonb)",
		profile.CharacterID, profile.Exp, profile.Actpoint, profile.MaxActpoint,
		profile.MovePnt, profile.MaxMovePnt, profile.FarmNum,
		slotsJSON, bagJSON,
	); err != nil {
		return pkgerrors.Wrap(err, "failed to upsert magic estate")
	}

	return nil
}

func (r *MagicEstateRepository) FindLogsByCharacter(ctx context.Context, characterID int64, limit int) ([]*domainfarm.MagicEstateLog, error) {
	if limit <= 0 {
		limit = 100
	}

	rows, err := r.db.pool.Query(ctx, "select * from player.list_magic_estate_logs($1, $2)", characterID, limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query magic estate logs")
	}
	defer rows.Close()

	logs := make([]*domainfarm.MagicEstateLog, 0)
	for rows.Next() {
		log := &domainfarm.MagicEstateLog{}
		if err := rows.Scan(
			&log.ID,
			&log.CharacterID,
			&log.LogTime,
			&log.Result,
			&log.Guest,
			&log.CID,
			&log.TID,
			&log.Name,
			&log.ItemTemplateID,
			&log.Num,
			&log.NoReplay,
			&log.BattleID,
			&log.CreatedAt,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan magic estate log")
		}
		logs = append(logs, log)
	}

	return logs, nil
}

func (r *MagicEstateRepository) FindSavedReplaysByCharacter(ctx context.Context, characterID int64, limit int) ([]*domainfarm.MagicEstateReplay, error) {
	if limit <= 0 {
		limit = 50
	}

	rows, err := r.db.pool.Query(ctx, "select * from player.list_magic_estate_replays($1, $2)", characterID, limit)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to query magic estate replays")
	}
	defer rows.Close()

	replays := make([]*domainfarm.MagicEstateReplay, 0)
	for rows.Next() {
		replay := &domainfarm.MagicEstateReplay{}
		if err := rows.Scan(
			&replay.CharacterID,
			&replay.BattleID,
			&replay.Name,
			&replay.Timestamp,
			&replay.CreatedAt,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan magic estate replay")
		}
		replays = append(replays, replay)
	}

	return replays, nil
}

func (r *MagicEstateRepository) SaveReplay(ctx context.Context, replay *domainfarm.MagicEstateReplay) error {
	if replay == nil {
		return pkgerrors.ErrInvalidInput
	}
	if replay.Timestamp == "" {
		replay.Timestamp = time.Now().Format("2006-01-02 15:04:05")
	}
	if replay.Name == "" {
		replay.Name = fmt.Sprintf("Replay %d", replay.BattleID)
	}

	_, err := r.db.pool.Exec(ctx,
		"select player.save_magic_estate_replay($1, $2, $3, $4)",
		replay.CharacterID, replay.BattleID, replay.Name, replay.Timestamp,
	)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to save magic estate replay")
	}
	return nil
}

func (r *MagicEstateRepository) DeleteReplay(ctx context.Context, characterID int64, battleID int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx,
		"select player.delete_magic_estate_replay($1, $2)",
		characterID, battleID,
	).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete magic estate replay")
	}
	if !deleted {
		return pkgerrors.ErrNotFound
	}
	return nil
}

func (r *MagicEstateRepository) SaveLog(ctx context.Context, log *domainfarm.MagicEstateLog) error {
	if log == nil {
		return pkgerrors.ErrInvalidInput
	}
	err := r.db.pool.QueryRow(ctx,
		"select * from player.save_magic_estate_log($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)",
		log.CharacterID, log.LogTime, log.Result, log.Guest, log.CID, log.TID, log.Name, log.ItemTemplateID, log.Num, log.NoReplay, log.BattleID,
	).Scan(&log.ID, &log.CreatedAt)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to save magic estate log")
	}
	return nil
}
