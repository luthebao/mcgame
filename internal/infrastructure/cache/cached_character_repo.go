// Open-sourced by BaoLT

// CachedCharacterRepository wraps character.Repository with caching.
// Read methods check cache first, write methods update cache and mark dirty.
// Implements decorator pattern for transparent caching.
package cache

import (
	"context"

	"mcgame-server/internal/domain/character"

	"github.com/google/uuid"
)

type CachedCharacterRepository struct {
	cache    *PlayerCache
	delegate character.Repository
}

func NewCachedCharacterRepository(cache *PlayerCache, delegate character.Repository) *CachedCharacterRepository {
	return &CachedCharacterRepository{cache: cache, delegate: delegate}
}

func (r *CachedCharacterRepository) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	if data := r.cache.GetPlayer(id); data != nil {
		return data.GetCharacter(), nil
	}
	return r.delegate.FindByID(ctx, id)
}

func (r *CachedCharacterRepository) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	return r.delegate.FindByAccountID(ctx, accountID)
}

func (r *CachedCharacterRepository) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	return r.delegate.FindByMapID(ctx, mapID)
}

func (r *CachedCharacterRepository) FindByName(ctx context.Context, name string) (*character.Character, error) {
	return r.delegate.FindByName(ctx, name)
}

func (r *CachedCharacterRepository) Create(ctx context.Context, char *character.Character) error {
	if err := r.delegate.Create(ctx, char); err != nil {
		return err
	}
	if char != nil && char.ID > 0 {
		_ = r.cache.InvalidateCharacter(ctx, char.ID)
	}
	return nil
}

func (r *CachedCharacterRepository) Update(ctx context.Context, char *character.Character) error {
	if data := r.cache.GetPlayer(char.ID); data != nil {
		data.SetCharacter(char)
		return nil
	}
	return r.delegate.Update(ctx, char)
}

func (r *CachedCharacterRepository) Delete(ctx context.Context, id int64) error {
	if err := r.delegate.Delete(ctx, id); err != nil {
		return err
	}
	_ = r.cache.InvalidateCharacter(ctx, id)
	return nil
}

func (r *CachedCharacterRepository) ExistsByName(ctx context.Context, name string) (bool, error) {
	return r.delegate.ExistsByName(ctx, name)
}

func (r *CachedCharacterRepository) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	if data := r.cache.GetPlayer(id); data != nil {
		char := data.GetCharacter()
		if char != nil {
			char.MoveTo(pos)
			data.MarkCharacterDirty()
		}
		return nil
	}
	return r.delegate.UpdatePosition(ctx, id, pos)
}

func (r *CachedCharacterRepository) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	if data := r.cache.GetPlayer(id); data != nil {
		char := data.GetCharacter()
		if char != nil {
			char.CurrentHP = hp
			char.CurrentMP = mp
			char.CurrentSP = sp
			data.MarkCharacterDirty()
		}
		return nil
	}
	return r.delegate.UpdateStats(ctx, id, hp, mp, sp)
}
