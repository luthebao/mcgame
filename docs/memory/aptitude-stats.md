# Character Aptitude Stats System

Research: `docs/research/2026-04-02_01_CHARACTER_APTITUDE_STATS_RESEARCH.md`

Characters have two layers of stats:

- **Base attributes** (`attStrength`, `attAgility`, `attStamina`, `attIntelligence`, `attEnergy`) — player-allocated using free points
- **Aptitude stats** (`aptStrength`, `aptAgility`, `aptStamina`, `aptIntelligence`, `aptEnergy`) — class-based talent ratings, sent as strings (e.g. `"1600"`)
- **Evolution bonuses** (`aptStrengthEvolution`, etc.) — integer values for progression upgrades
- **Final stats** (`finalStrength`, etc.) — calculated from both layers, displayed in CharactorPanel

Source: `data_tbl_class` template provides initial aptitude values per class. Stored per-character in `player.characters` (10 columns added via migration `20260401174236_add_character_aptitude_columns.sql`).

`changeProperty` RPC handles player stat point allocation. Client panel supports 1-point or 10-point increments via `AddPropCheck` toggle.
