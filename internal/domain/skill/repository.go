// Open-sourced by BaoLT

// Repository interface for skill persistence operations.
// Handles character skill CRUD, slot management, and cooldowns.
// Supports checking skill ownership and slot-based queries.
package skill

import (
	"context"
)

type Repository interface {
	FindByID(ctx context.Context, id int64) (*CharacterSkill, error)
	FindByCharacterID(ctx context.Context, charID int64) ([]*CharacterSkill, error)
	FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*CharacterSkill, error)
	FindBySlot(ctx context.Context, charID int64, slot int) (*CharacterSkill, error)
	Create(ctx context.Context, skill *CharacterSkill) error
	Update(ctx context.Context, skill *CharacterSkill) error
	Delete(ctx context.Context, id int64) error
	UpdateSlot(ctx context.Context, id int64, slot *int) error
	UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error
	HasSkill(ctx context.Context, charID int64, skillID int) (bool, error)
}
