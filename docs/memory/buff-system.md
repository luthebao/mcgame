# Buff System (`player.character_buffs`)

Persistent character buffs live in baseline table `player.character_buffs` (id, character_id, buff_id, buff_type, source, duration_total, expires_at, rounds_left, battles_left, stack_count, created_at) with `UNIQUE(character_id, buff_id)` enabling clean ON CONFLICT upserts.

- Domain: `internal/domain/buff/` (entity + repository interface). `buff_type`: 1=battle, 2=timed, 3=permanent (10=no-timer alias).
- Repository: `internal/infrastructure/persistence/postgres/buff_repository.go`.
- Service: `internal/application/buff/service.go` exposes `AddOrRefresh`, `ListActive` (purges expired), `RemoveByClient`, `IsRemovable` (gates on `BuffTemplate.Buff != 0` matching client `LongBuffCanvas.buffClick` which blocks removal when `vo.buff == 0`), and `AggregateCharacterStatBonuses` (implements `item.Service.CharacterBonusProvider`).
- Bonus pipeline: `item.Service` now supports `AddCharacterBonusProvider(p)` and aggregates from a primary provider plus extras; buff service is wired as an extra. This automatically scales heal caps because `computeEffectiveMax` flows through `AggregateEquipmentStats`.
- Stat translation: buff service delegates to `statfeature.ApplyBuffTemplateBonus` (exported wrapper around the existing `applyCharacterBuffTemplate`) so prop/percent semantics stay in one place.
- Client RPCs:
  - Server -> client `initLongBuff(map)` at `chooseCharactor` (sent by `auth/login.go::sendInitLongBuffCallback`). Map keyed by buff `id`.
  - Server -> client `upLongBuff(payload)` and `delBuff(id)` for individual updates.
  - Client -> server `delBuffClient(id)` handled in `internal/presentation/rtmp/handlers/buff/handler.go` which calls `RemoveByClient`, sends `delBuff(id)` and refreshes stats via `onUPP`.
- Payload schema (`BuildLongBuffPayload`): `{id, bid, type, ...}` plus `battleLeft` (type 1) or `addTime` (Unix seconds), `timeAll`, `timeLeft`, `ineffectiveTime` (Unix ms) for type 2.
- PM right 3 (daily VIP buff) now uses this system: `pm_operation.go` calls `buffService.AddOrRefresh` with `BuffType=TypePermanent, Source="pm_daily"` and emits `upLongBuff` + `onUPP`. The old `statfeature.FeaturePMDailyBuff` path is removed.

References:

- Research: `docs/research/2026-04-19_08_BUFF_SYSTEM_RESEARCH.md`
- Plan: `docs/plans/2026-04-19_07_BUFF_SYSTEM_AND_PM_RIGHT_3_PLAN.md`
