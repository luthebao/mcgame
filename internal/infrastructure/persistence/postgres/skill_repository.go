// Open-sourced by BaoLT

// PostgreSQL implementation of skill repository.
// Handles character skill CRUD with slot and cooldown management.
// Supports queries by character, skill ID, and slot position.
package postgres

import (
	"context"
	"errors"
	"time"

	"github.com/jackc/pgx/v5"
	"mcgame-server/internal/domain/skill"
	pkgerrors "mcgame-server/pkg/errors"
)

type SkillRepository struct {
	db *Database
}

func NewSkillRepository(db *Database) *SkillRepository {
	return &SkillRepository{db: db}
}

func (r *SkillRepository) FindByID(ctx context.Context, id int64) (*skill.CharacterSkill, error) {
	s := &skill.CharacterSkill{}
	var cooldownEnd *time.Time
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_skill_by_id($1)", id).Scan(
		&s.ID, &s.CharacterID, &s.SkillID, &s.Level, &s.Exp, &s.SlotPosition,
		&s.IsAuto, &cooldownEnd, &s.CreatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find skill by ID")
	}

	s.CooldownEnd = cooldownEnd
	return s, nil
}

func (r *SkillRepository) FindByCharacterID(ctx context.Context, charID int64) ([]*skill.CharacterSkill, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_skills_by_character($1)", charID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find skills by character ID")
	}
	defer rows.Close()

	return r.scanSkills(rows)
}

func (r *SkillRepository) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*skill.CharacterSkill, error) {
	s := &skill.CharacterSkill{}
	var cooldownEnd *time.Time
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_skill_by_skill_id($1, $2)", charID, skillID).Scan(
		&s.ID, &s.CharacterID, &s.SkillID, &s.Level, &s.Exp, &s.SlotPosition,
		&s.IsAuto, &cooldownEnd, &s.CreatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find skill")
	}

	s.CooldownEnd = cooldownEnd
	return s, nil
}

func (r *SkillRepository) FindBySlot(ctx context.Context, charID int64, slot int) (*skill.CharacterSkill, error) {
	s := &skill.CharacterSkill{}
	var cooldownEnd *time.Time
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_skill_by_slot($1, $2)", charID, slot).Scan(
		&s.ID, &s.CharacterID, &s.SkillID, &s.Level, &s.Exp, &s.SlotPosition,
		&s.IsAuto, &cooldownEnd, &s.CreatedAt,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find skill by slot")
	}

	s.CooldownEnd = cooldownEnd
	return s, nil
}

func (r *SkillRepository) Create(ctx context.Context, s *skill.CharacterSkill) error {
	s.CreatedAt = time.Now()

	err := r.db.pool.QueryRow(ctx, "select player.create_character_skill($1, $2, $3, $4, $5, $6, $7, $8)",
		s.CharacterID, s.SkillID, s.Level, s.Exp, s.SlotPosition,
		s.IsAuto, s.CooldownEnd, s.CreatedAt,
	).Scan(&s.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create skill")
	}

	return nil
}

func (r *SkillRepository) Update(ctx context.Context, s *skill.CharacterSkill) error {
	var updated bool
	err := r.db.pool.QueryRow(ctx, "select player.update_character_skill($1, $2, $3, $4, $5, $6, $7)",
		s.ID, s.SkillID, s.Level, s.Exp, s.SlotPosition, s.IsAuto, s.CooldownEnd,
	).Scan(&updated)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to update skill")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *SkillRepository) Delete(ctx context.Context, id int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_character_skill($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete skill")
	}

	if !deleted {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *SkillRepository) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	var updated bool
	if err := r.db.pool.QueryRow(ctx, "select player.update_character_skill_slot($1, $2)", id, slot).Scan(&updated); err != nil {
		return pkgerrors.Wrap(err, "failed to update skill slot")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *SkillRepository) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	var cooldown *time.Time
	if cooldownEnd != nil {
		t, err := time.Parse(time.RFC3339, *cooldownEnd)
		if err == nil {
			cooldown = &t
		}
	}

	var updated bool
	if err := r.db.pool.QueryRow(ctx, "select player.update_character_skill_cooldown($1, $2)", id, cooldown).Scan(&updated); err != nil {
		return pkgerrors.Wrap(err, "failed to update skill cooldown")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *SkillRepository) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	var exists bool
	err := r.db.pool.QueryRow(ctx, "select player.has_character_skill($1, $2)", charID, skillID).Scan(&exists)
	if err != nil {
		return false, pkgerrors.Wrap(err, "failed to check skill")
	}

	return exists, nil
}

func (r *SkillRepository) scanSkills(rows pgx.Rows) ([]*skill.CharacterSkill, error) {
	var skills []*skill.CharacterSkill
	for rows.Next() {
		s := &skill.CharacterSkill{}
		var cooldownEnd *time.Time
		err := rows.Scan(
			&s.ID, &s.CharacterID, &s.SkillID, &s.Level, &s.Exp, &s.SlotPosition,
			&s.IsAuto, &cooldownEnd, &s.CreatedAt,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan skill row")
		}
		s.CooldownEnd = cooldownEnd
		skills = append(skills, s)
	}

	return skills, nil
}
