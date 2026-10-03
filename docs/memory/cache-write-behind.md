# Cache Write-Behind Contract (2026-04-27)

All `Cached*Repository.Update` methods follow strict write-behind: when the player is in `PlayerCache.activeSessions`, mark the entity dirty in the in-memory `PlayerData` and return without touching the DB. The DB flush happens only via `PlayerCache.SaveAllDirty` (driven by `appcenter.Service` on a 60s tick) or `SaveAndEvict` on disconnect. Both flush paths call the **raw delegate repo** (`c.charRepo.Update`, `c.itemRepo.Update`, etc.) — never the cached wrapper, so there is no recursion.

The `delegate.Update` fallback inside a cached repo is reserved for the offline-character case (player not in `activeSessions`, e.g., admin tooling, batch jobs).

**Why this matters at scale:** the previous `CachedCharacterRepository.Update` did `data.SetCharacter(char)` *and* `delegate.Update(...)` on every call. With ~55 handler call sites (battle end, equip, item use, level-up, guild contrib, farming, etc.), this caused 500–2000 extra full-row UPDATEs per second at 5000 players. Aligning it with the `CachedItemRepository.Update` pattern dropped expected steady-state DB query volume from ~800–3000/s to ~100–400/s, allowing the DB pool to stay at 50 instead of 200+.

**Quest repo wiring:** `cmd/gameserver/main.go` (both monolith and line modes) now wraps `questRepoBase` in `cache.NewCachedQuestRepository(playerCache, questRepoBase)`. Quest reads (`FindByCharacterAndQuest`, `FindActiveByCharacter`, etc.) hit the cache; `Update` follows the same write-behind contract. New quests (`Save` with `ID == 0`) still write through to get a DB-generated ID.

**Debug player-data dump flag:** `PlayerCache.debugLoggerLoop` (which marshals every cached player to `/app/player_cache_debug.txt` every 15s) is no longer started from `NewPlayerCache`. It is opt-in via `MCGAME_PERFORMANCE_DEBUG_LOG_PLAYER_DATA=true` (compose: `GAME_DEBUG_LOG_PLAYER_DATA`) → `cfg.Performance.DebugLogPlayerData` → explicit `playerCache.StartDebugLogger()` call in main. Default is `false` so production never pays the multi-hundred-MB serialization cost at 5000 players.

References:
- Plan: `docs/plans/2026-04-27_1_CACHE_WRITE_BEHIND_FIX.md`
- Capacity design: `PRODUCTION_DESIGN.md` §5.1, §5.2, §5.5
