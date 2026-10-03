// Open-sourced by BaoLT

// Deferred gamedata accessors for the Mystery Treasure (Bi Bao) craft write-paths.
// Added in a feature-prefixed file to avoid clashing with sibling-agent edits to the
// shared gamedata accessor files. All three tables (TBL_MYSTRE_RECIPE=122, TBL_MYSTRE=123,
// TBL_RUNE_CHIP=124) are already loaded into the cache by LoadAll; these methods only read.
//
// MysGetRecipe / MysGetMystre / MysGetRuneChip return a single template by id.
// MysListMystreByKindLevel returns every output row of a given kind+level (used to resolve
// the recipe's result-spec "st" group to a concrete mystery-item id; the lowest id is the
// deterministic pick — see the handler's documented assumption).
package gamedata

import "mcgame-server/internal/gamedata/models"

func (m *Manager) MysGetRecipe(id int) *models.MystreRecipeTemplate {
	return m.cache.MysGetRecipe(id)
}

func (m *Manager) MysGetMystre(id int) *models.MystreTemplate {
	return m.cache.MysGetMystre(id)
}

func (m *Manager) MysGetRuneChip(id int) *models.RuneChipTemplate {
	return m.cache.MysGetRuneChip(id)
}

func (m *Manager) MysListMystreByKindLevel(kind, level int) []*models.MystreTemplate {
	return m.cache.MysListMystreByKindLevel(kind, level)
}

func (c *Cache) MysGetRecipe(id int) *models.MystreRecipeTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.mystreRecipes[id]
}

func (c *Cache) MysGetMystre(id int) *models.MystreTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.mystres[id]
}

func (c *Cache) MysGetRuneChip(id int) *models.RuneChipTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.runeChips[id]
}

func (c *Cache) MysListMystreByKindLevel(kind, level int) []*models.MystreTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.MystreTemplate, 0)
	for _, t := range c.mystres {
		if t == nil {
			continue
		}
		if int(t.Kind) == kind && int(t.Level) == level {
			out = append(out, t)
		}
	}
	return out
}
