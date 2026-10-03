// Open-sourced by BaoLT

// PostgreSQL implementation of NPC repository.
// Handles NPC CRUD with map and template queries.
// Supports active state management for respawn mechanics.
package postgres

import (
	"context"
	"errors"

	"github.com/jackc/pgx/v5"
	"mcgame-server/internal/domain/npc"
	pkgerrors "mcgame-server/pkg/errors"
)

type NPCRepository struct {
	db *Database
}

func NewNPCRepository(db *Database) *NPCRepository {
	return &NPCRepository{db: db}
}

func (r *NPCRepository) FindByID(ctx context.Context, id int) (*npc.NPC, error) {
	n := &npc.NPC{}
	var dialogID *int
	err := r.db.pool.QueryRow(ctx, "select * from player.get_npc_by_id($1)", id).Scan(
		&n.ID, &n.TemplateID, &n.Name, &n.MapID, &n.PosX, &n.PosY, &n.Direction,
		&n.NPCType, &dialogID, &n.RespawnTime, &n.IsActive,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNPCNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find NPC by ID")
	}

	if dialogID != nil {
		n.DialogID = *dialogID
	}

	return n, nil
}

func (r *NPCRepository) FindByMapID(ctx context.Context, mapID int) ([]*npc.NPC, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_npcs_by_map($1)", mapID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find NPCs by map ID")
	}
	defer rows.Close()

	var npcs []*npc.NPC
	for rows.Next() {
		n := &npc.NPC{}
		var dialogID *int
		err := rows.Scan(
			&n.ID, &n.TemplateID, &n.Name, &n.MapID, &n.PosX, &n.PosY, &n.Direction,
			&n.NPCType, &dialogID, &n.RespawnTime, &n.IsActive,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan NPC row")
		}
		if dialogID != nil {
			n.DialogID = *dialogID
		}
		npcs = append(npcs, n)
	}

	return npcs, nil
}

func (r *NPCRepository) FindByTemplateID(ctx context.Context, templateID int) ([]*npc.NPC, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_npcs_by_template_id($1)", templateID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find NPCs by template ID")
	}
	defer rows.Close()

	var npcs []*npc.NPC
	for rows.Next() {
		n := &npc.NPC{}
		var dialogID *int
		err := rows.Scan(
			&n.ID, &n.TemplateID, &n.Name, &n.MapID, &n.PosX, &n.PosY, &n.Direction,
			&n.NPCType, &dialogID, &n.RespawnTime, &n.IsActive,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan NPC row")
		}
		if dialogID != nil {
			n.DialogID = *dialogID
		}
		npcs = append(npcs, n)
	}

	return npcs, nil
}

func (r *NPCRepository) Create(ctx context.Context, n *npc.NPC) error {
	var dialogID *int
	if n.DialogID != 0 {
		dialogID = &n.DialogID
	}

	err := r.db.pool.QueryRow(ctx, "select player.create_npc($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)",
		n.TemplateID, n.Name, n.MapID, n.PosX, n.PosY, n.Direction,
		n.NPCType, dialogID, n.RespawnTime, n.IsActive,
	).Scan(&n.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create NPC")
	}

	return nil
}

func (r *NPCRepository) Update(ctx context.Context, n *npc.NPC) error {
	var dialogID *int
	if n.DialogID != 0 {
		dialogID = &n.DialogID
	}

	var updated bool
	err := r.db.pool.QueryRow(ctx, "select player.update_npc($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11)",
		n.ID,
		n.TemplateID, n.Name, n.MapID, n.PosX, n.PosY,
		n.Direction, n.NPCType, dialogID, n.RespawnTime, n.IsActive,
	).Scan(&updated)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to update NPC")
	}

	if !updated {
		return pkgerrors.ErrNPCNotFound
	}

	return nil
}

func (r *NPCRepository) Delete(ctx context.Context, id int) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_npc($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete NPC")
	}

	if !deleted {
		return pkgerrors.ErrNPCNotFound
	}

	return nil
}

func (r *NPCRepository) SetActive(ctx context.Context, id int, active bool) error {
	var updated bool
	if err := r.db.pool.QueryRow(ctx, "select player.set_npc_active($1, $2)", id, active).Scan(&updated); err != nil {
		return pkgerrors.Wrap(err, "failed to set NPC active status")
	}

	if !updated {
		return pkgerrors.ErrNPCNotFound
	}

	return nil
}
