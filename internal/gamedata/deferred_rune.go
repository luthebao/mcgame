// Open-sourced by BaoLT

// Deferred accessor for the rune feature (login-snapshot parity batch).
// Adds a RuneChip lookup over the already-loaded runeChips cache table so the
// rune application service can resolve chip -> rune (rid) and chips-per-rune (num)
// for exchangeRune. Mirrors the existing GetDecoRune / GetDecoHole accessor and
// cache-lock pattern. GetDecoRune already exists on Manager and is reused as-is.
package gamedata

import "mcgame-server/internal/gamedata/models"

func (c *Cache) GetRuneChipDeferred(id int) *models.RuneChipTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.runeChips[id]
}

func (m *Manager) GetRuneChip(id int) *models.RuneChipTemplate {
	return m.cache.GetRuneChipDeferred(id)
}
