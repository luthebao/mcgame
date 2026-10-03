# Title System

## Overview

Two RPC handlers (`SetTitle`, `SetActTitle`) live in `internal/presentation/rtmp/handlers/title/activation.go`. They route to `application/title.Service.SetActiveTitle` / `SetActiveSpecialTitle`. Persistence is via `player.character_titles` (ownership + `is_active` flag); the catalog is `data.data_tbl_title`.

## Title→buff plumbing (2026-05-05)

- `data.data_tbl_title` now has a nullable `buff_id INTEGER` column. Migration: `supabase/migrations/20260505071402_add_title_buff_id.sql`. Seed re-exported to `supabase/seeds/data_tbl_title.sql`; existing rows are all `NULL`.
- `models.TitleTemplate.BuffID *int64` (json `buff_id,omitempty`, db `buff_id`).
- `application/title.Service` gained a `GameDataProvider` dependency, wired via `SetGameDataProvider(gameDataManager)` in `cmd/gameserver/main.go`. The provider exposes `GetTitle(id)` and `GetBuff(id)`, both already on `gamedata.Manager`.
- `Service.buildTitleBuffPayload(titleID)` looks up the title catalog row; if `BuffID != nil`, resolves the matching `BuffTemplate` and returns a map with `id`, `bid`, `type`, `kind`, `icon_code`, `effect_num`, `percent_flag`, and `prop1..6` / `prop_num1..6`. Both `SetActiveTitle` and `SetActiveSpecialTitle` now emit this in their `bd` field.

## What is NOT yet wired

- Setting a title does **not** insert a row into `player.character_buffs`. The buff payload is informational for the equip UI only; the actual stat bonus from a title-bound buff is not applied to the runtime stat cache through this path.
- Catalog rows still need real `buff_id` values populated. Backfill is out-of-scope here — a separate ticket should pick titles and assign buffs.

## File pointers

- `internal/application/title/service.go` — `SetActiveTitle`, `SetActiveSpecialTitle`, `buildTitleBuffPayload`.
- `internal/gamedata/models/title.go` — `TitleTemplate.BuffID`.
- `internal/presentation/rtmp/handlers/title/{handler.go,list.go,activation.go}` — RPC dispatch.
- `cmd/gameserver/main.go` — `titleService.SetGameDataProvider(gameDataManager)` (two call sites: dev path ~L201, prod path ~L741).
- `supabase/migrations/20260505071402_add_title_buff_id.sql`.
- `supabase/seeds/data_tbl_title.sql`.
