// Open-sourced by BaoLT

// Repository interface for NPC persistence.
// Handles NPC queries by map, template, and active state.
// Supports setting active status for respawn mechanics.
package npc

import (
	"context"
)

type Repository interface {
	FindByID(ctx context.Context, id int) (*NPC, error)
	FindByMapID(ctx context.Context, mapID int) ([]*NPC, error)
	FindByTemplateID(ctx context.Context, templateID int) ([]*NPC, error)
	Create(ctx context.Context, npc *NPC) error
	Update(ctx context.Context, npc *NPC) error
	Delete(ctx context.Context, id int) error
	SetActive(ctx context.Context, id int, active bool) error
}
