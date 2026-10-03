// Open-sourced by BaoLT

// Deferred Soul (Mệnh Hồn) accessor over the already-loaded TBL_PET_SOUL table.
// Added in a feature-prefixed file to avoid clashing with sibling deferred work; the
// shared cache.go loader already populates c.petSouls. SoulAllPetSouls returns every
// loaded row so the soul service can group exchangeable rows (type=1) and build the
// preySoul crystal-tier drop pool (grouped by color). Kept read-only and snapshotting
// under the cache RLock, mirroring GetAllPetTalents.
package gamedata

import "mcgame-server/internal/gamedata/models"

func (c *Cache) SoulAllPetSouls() []*models.PetSoulTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.PetSoulTemplate, 0, len(c.petSouls))
	for _, t := range c.petSouls {
		if t != nil {
			out = append(out, t)
		}
	}
	return out
}

func (m *Manager) SoulAllPetSouls() []*models.PetSoulTemplate {
	return m.cache.SoulAllPetSouls()
}
