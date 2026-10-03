# Farm & Life Skill (Trồng Trọt)

## Farm & Harvest Domain

Domain entity in `internal/domain/farm/plot.go`. Represents planted crop plots with fields: CharacterID, PlotNPCID, CropNPCID, HarvestItemTemplateID, harvest count, and timestamps.

Repository interface in `internal/domain/farm/repository.go` defines: `FindByCharacter`, `FindByCharacterAndPlot`, `Upsert`, `Delete`.

Current status: Fully implemented — domain model, repository (Supabase persistence), application service (`internal/application/farm/service.go`), RTMP handlers (`internal/presentation/rtmp/handlers/farm/` and `handlers/npc/farm.go`), visual stage overlays, and migration (`20260403182718_add_character_farm_plots.sql`).

Farm-facing Vietnamese strings sent by the Go server should remain accented UTF-8, not ASCII transliteration. `internal/presentation/rtmp/handlers/npc/farm.go` sends menu text, notices, gather hints, and the planting guide directly to the Flash client, while `internal/application/farm/service.go` provides fallback crop and item names. AMF0 string transport is UTF-8, so only the displayed text should change; callback names and payload keys must stay unchanged.

Farm planting now uses the same vigor model as other gathering actions: planting requires at least `25` `CurrentSP`, and a successful plant should persist the reduced vigor, send `onSystemSay` for the loss, and refresh the client with `onUPP{"vigor": ...}`.

Farm crop visuals have three server-driven checkpoints: initial `onNpcOn`, intermediate `onNpcReload` at `1/3` of total grow duration with `GrowingResCode`, and ripe `onNpcReload` at `ReadyAt` with `ReadyResCode`. The wither deadline remains `ReadyAt + 2/3 * growDuration`.

Farm tooltip timing semantics must match the Flash client: before ripening, return `state = 2` with countdown to `ReadyAt`; after ripening, return `state = 3` with countdown to `GetPlotWitherAt(plot)`. Otherwise the client will show `Cách thời gian héo úa: 0 giây` immediately on ripening.

Exported client data confirms that planting is part of the life-skill system: `SKILL_TYPE_PLANT = 15`, the stat key is `plantDex`, and `Trồng Trọt` skill templates carry `reqLevel`, `expSkill`, and `dexSkill` upgrade thresholds. The Go farm server now enforces these thresholds (see skill level enforcement below).

Farm planting is now limited to one active plot per character. Before opening a new planting flow or accepting a new plant action, the server checks for another active plot and sends `onSystemSay` in the format `Tại kênh X - vị trí Nông Trường Số Y [x,y], bạn có một vườn <crop>`, using the blocking plot's `TBL_NPC` map and coordinates.

Money tree planting continues to consume seed item template `2909`. If the character does not have that seed, the farm handler sends the exact requested `onNpcMsg`: `Ngươi không có Hạt Giống Cây Kim Tiền`.

Farm planting now enforces crop skill level by comparing the target crop `TBL_NPC.lv` against the character's derived `Trồng Trọt` level. The current level is inferred from `TBL_SKILL` type `15` by taking the highest entry whose `reqLevel` and `dexSkill` thresholds are satisfied by `Character.Level` and `Character.PlantDex`. If the requirement is not met, planting is rejected with `onSystemSay` `Cấp độ kỹ năng không đủ`.

## Farm Handler Package Structure

Farm system handlers split across two packages:

- `internal/presentation/rtmp/handlers/farm/` — dedicated farm domain handlers (`handler.go`, `helpers.go`, `visual.go`) for farm-specific RPCs and visual stage overlays
- `internal/presentation/rtmp/handlers/npc/farm.go` — NPC-triggered farm interactions (planting flow, crop menus, gather hints, blocking-plot notices)

Visual stage overlay system in `visual.go`:

- Initial plant: `onNpcOn` callback
- Growing stage: `onNpcReload` at 1/3 of total grow duration with `GrowingResCode`
- Ripe stage: `onNpcReload` at `ReadyAt` with `ReadyResCode`
- Wither deadline: `ReadyAt + 2/3 * growDuration`

Farm maps: 57 and 58. Plot locations from `TBL_NPC` (`pos_map_id`, `pos_x`, `pos_y`).

## Life Skill System (Trồng Trọt)

Life skill service in `internal/application/skill/` with constants `PlantSkillBookTemplateID = 2409` and `PlantSkillType = 15`.

### Skill Book Learning Flow

Client uses `useItem` with skill book item template 2409. Item handler checks `it.TemplateID == appskill.PlantSkillBookTemplateID`, calls `skillService.LearnPlantSkillByBook(ctx, charID)`. On success, consumes item and sends `SendLifeSkillLearnedUpdate()`. If player already has the skill (`ErrAlreadyExists`), silently succeeds.

### Skill Upgrade Flow

`skillLearnByClient` RPC in combat handler intercepts type 15 skills via `tryUpgradeLifeSkill()` in `internal/presentation/rtmp/handlers/combat/life_skill.go`. Calls `skillService.UpgradePlantSkill(ctx, charID, skillID)` which validates upgrade conditions from `TBL_SKILL`: `reqLevel`, `dexSkill` (PlantDex), `expSkill`, gold cost, and `costGuildContrib`. On success, sends `SendLifeSkillStateUpdate()`.

### PlantDex ↔ CharacterSkill.Exp Sync

`Character.PlantDex` is the authoritative mastery counter. It syncs into `player.character_skills.exp` at four points:

- `LearnPlantSkillByBook`: initial PlantDex copied to skill Exp
- `UpgradePlantSkill`: PlantDex synced after resource deduction
- `AddPlantMastery`: increases PlantDex by amount (e.g. +20 on harvest), then syncs
- `syncLifeSkillEntries`: called in `GetSkillsForCallback()` before sending to client

### SendLifeSkillStateUpdate Helper

`internal/presentation/rtmp/utils/life_skill_state.go` sends four callbacks:

1. `onSkillUpdate` — updated skill list with exp/level
2. `onMWeaponSkillUpdate` — weapon skill update (same payload, flag=true)
3. `onUpdateLifeDex` — `{prop: "plantDex", value: char.PlantDex}`
4. `onUPP` — unified property payload with `plantDex`, `money`, `guildContrib`, `donateContrib`

`SendLifeSkillLearnedUpdate()` wraps the above and additionally sends `onUpdateLearnedSkill` with skill template ID.

### Domain Model

`player.character_skills` table: `id`, `character_id`, `skill_id`, `level` (default 1), `exp` (synced with PlantDex), `slot_position`, `is_auto`, `cooldown_end`, `created_at`.

Domain entity `CharacterSkill` in `internal/domain/skill/skill.go` with `ToDTO()` producing camelCase aliases (`id`, `sid`, `skillId`).
