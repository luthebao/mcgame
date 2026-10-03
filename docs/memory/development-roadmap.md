# Development Status & Roadmap

Recommended Stack: Golang, DMA-GORTMP + go-amf, PostgreSQL 15+, Redis, env-only config (`MCGAME_*`).

## details.md audit — 2026-05-05

Cross-checked the Partial table (`docs/details.md` lines 55-73) against actual code. Corrections applied:

- Item-effect type stubs count is **15**, not 14 (added type 524 *Sách Hợp Đồng Thú* visibility, plus 510, 511, 514, 515, 517, 518, 519, 521, 522, 523, 525, 527, 551, 552).
- Pet bag summon row was stale: choose-one bags (`selMultiItemByIdx`, `pendingGiftBoxes`) are shipped, and type 509 is mapped to `questItem` in `application/item/service.go:140-180`. Real residual gap is the contract-pet (type 524) pet-entity grant path.
- Quest accept-time handoff arrow direction is `questID → itemTemplate`: quest 160 grants item 335, quest 162 grants item 515, quest 164 grants item 517 (the previous `335→160` form was reversed).
- Stat-feature foundation row no longer claims Active Pet (catalog id 12) and Contract Pet (id 13) are state-ready for client flow — neither has any client RPCs in the Flash dispatcher; they are internal catalog entries only.

Companion docs: `docs/research/2026-05-05_01_PARTIAL_FEATURES_RESEARCH.md`, `docs/plans/2026-05-05_01_PARTIAL_FEATURES_FIXES.md`.

12-Phase Roadmap (updated 2026-04-04):

- Phase 1 (Core Foundation): COMPLETE — RTMP/AMF0, config, logging, metrics, Docker/Supabase infra.
- Phase 2 (Auth & Characters): COMPLETE — Login, char creation/selection, force login, secondary password, line channels, aptitude stats.
- Phase 3 (Scene & Movement): COMPLETE — Scene login, map movement, NPC spawns, channel switching, position sync.
- Phase 4 (Items & Equipment): COMPLETE — Full inventory (bag/equip/bank/tempbag/questbag/petbag), equip/unequip with appearance sync, crafting, material mixing, jewel sockets, change prefix/soul/element/bind, equipment display contract, maker signature, quality/color tier system, equipment disassemble, star upgrade, gem inlay.
- Phase 5 (Combat): COMPLETE — Turn-based PVE battles, encounter balance, skill effects, battle timeout/cleanup, revive system.
- Phase 6 (Pets): MOSTLY COMPLETE — Pet management, enhancement, fusion, refresh, auto-battle, pet arena, pet equipment equip/unequip, pet skill books, pet skill delete, pet guard, pet slot/skill slot opening, pet bag item summon. Pet element normalization done.
- Phase 7 (Quests): COMPLETE — Main/daily/class/callboard quests, objectives, dynamic rewards, quest NPC interaction.
- Phase 8 (Social): IN PROGRESS — Relationships, teacher-student, chat (say/whisper/panel), group/party system, trade.
- Phase 9 (Guild): IN PROGRESS — Guild panel, membership, updates. Core structure in place.
- Phase 10 (Shops): IN PROGRESS — Shop config, purchase flow, NPC shop interaction. VIP shop with daily rotating inventory and premium membership (PM) system implemented.
- Phase 11 (Daily/World Boss): IN PROGRESS — Activity panel, onboarding rewards, daily award stubs.
- Phase 12+ (Extended): IN PROGRESS — Titles (list/activation), magic crystal, marriage, PK, farm/harvest fully implemented. Life skill system (Trồng Trọt) with book learning, upgrade, and mastery. Wings/mounts/cross-server partially stubbed. Equipment tier upgrade (`changeLevel`) researched but not yet implemented.

RPC Category Breakdown: Auth/Session (14), Character (3), Scene/Movement (15), Items/Equipment (29+), Combat (10+), Pets (20+), Quests (10+), Skills (5+), Daily Activities (10+), Social (10+), Guilds (10+), Shops (10+), NPC (4), Stubs (misc).
