# Magic Weapon (Thần Khí / Divine Artifact) System

A parallel equipment layer at slot positions 15–20: **1 Main MW** (position 15, class-bound via template `req_class_id`) plus **5 Sub MW** (positions 16–20, class-agnostic). Player must reach level 50 to open the MWCanvas tab on the character panel (`CHARACTORPANEL_S[62]`). MW items live in the same `player.character_items` table as ordinary equipment (`item_type=2`), distinguished by template `kind=8` and `type=800` (main) or `type=801` (sub). All MW-specific runtime data is stored in the existing `properties` JSONB column — no new schema.

**Key fields stored in `properties`:** `mainProp1/2`, `mainPropNum1/2`, `prop1/2`, `propNum1/2`, `t1`–`t10` (skill IDs), `flag` (JSON: sub-MW carries `succ0/succ1/succ2`; main-MW carries `flagStr` for stage). The `star_level` column doubles as `upgradeNum`. The `is_bound` column maps to `binded` (required for upgrade, prop reset, trans).

**Stone item types:**
- `510` Thâm Lam Tinh — repair durability
- `511` Thâm Hồng Tinh — skill reset
- `514` Hoán Thần Thạch — main-MW property transfer
- `519` Tinh Hồn Thạch — main-MW prop reset (5 per roll)
- `522` Pha Lê Thần Giới — Vòng 7 → Vòng 8 stage promotion
- `3740` Đá Tẩy Luyện — sub-MW succinct refinement

**Stat formulas (`internal/application/magicweapon/formulas.go`):** main MW HP and Speed scaling come from per-level `MW_HP_GROW_MAP` (1× → 115.8× over upgradeNum 0–20) and `MW_SPEED_GROW_MAP` (1× → 54.5×). Other prop types use a flat 1× multiplier. Sub-MW succinct slots add a flat per-tier bonus from `SUB_MW_*_GROW_MAP` (0/4/12/24%). Stage tier (Vòng 1–8) is computed from `mainPropNum1 / template.mainPropNum1` against `ARTIFACT_QUALITY_ARR = [0.3..1.0]`. Vòng 7→8 promotion requires `upgrade_num >= 20`, ratio ≥ 0.9, and consumes 1 Pha Lê Thần Giới; the resulting props are clamped to `template * STAGE_EIGHT_MAX (= 2.0)`.

**Upgrade table:** `data.data_tbl_artifact` rows keyed by `(tid, level)` carry per-level `prop_num1`, `prop_num2`, `spirit_num` (the spirituality cost), `item_num`, `rate`. Spirituality lives on `Character.Spirituality` as a string; the MW service parses/serializes via `GetSpirituality` / `SetSpirituality`. Levels ≥ 16 require the player to be at character level 100.

**Skills (`useEnv = 5` on TBL_SKILL):** only the main MW (slot position 15) carries skills. Up to 10 t-slot skills (`t1`–`t10`) plus a base skill from the template's `artifact_skill` field (pipe-delimited; index 0 is the always-present base). When a main MW is equipped (`internal/presentation/rtmp/handlers/item/equip.go:EquipOn`), `MWSkillGranter.GrantOnEquip` reads the t-slots + base skill and calls `skillService.GrantSkillUnchecked` for each. On unequip / resolve / trans, `RevokeOnUnequip` removes them via `skillService.RevokeSkillBySID` (filtered by `useEnv=5` to avoid stripping unrelated skills sharing an ID). The handler then pushes `onMWeaponSkillUpdate(skillList, true)` so the Flash SkillManager rebuilds its MW tab. Skill reset (`magicWeaponResetSkill`) revokes the old slot's skill and grants the newly rolled one in-place.

**Two-phase prop reset:** `magicWeaponResetProp` consumes 5 Tinh Hồn Thạch + validates spirituality ≥ 40000 + bound + upgrade_num ≥ 5, then rolls new prop values, stores them in `Service.pendingReset[charID]` (in-process map, cleared on apply / new roll / disconnect), and pushes `onMagicWeaponResetProp` (preview). Client either accepts (calls `applyMWResetProp` — server commits, pushes `updateMWResetView`, triggers stat refresh) or starts a fresh roll (overwrites pending). `queryMWResetPropMax` returns `(template.mainPropNum1 * 2, template.mainPropNum2 * 2)` as the upper bound.

**Sub-MW succinct (tẩy luyện):** `succinctMW(equipID, lockArr[3], autoBuy)` rolls new props for unlocked slots from `ACTIVATE_MW_PRO` (per-prop value range), keeping locked slots intact. Result is held in `pendingSuccinct[charID]` (not persisted) and returned for client preview. `onSureSuccinctMW(confirm=1)` applies → writes `flag` JSON. `confirm=-1` discards. Each roll consumes 1 Đá Tẩy Luyện (item 3740). `activateMWPro(equipID, propIndex 0..2)` activates a fresh succinct slot for 20 gold; sequential gating (slot 1 requires slot 0 first).

**Trans (`MWTrans`):** copies main-prop fields from source main MW to target main MW, deletes source, locks target (`is_bound=1`), consumes 1 Hoán Thần Thạch (514). Both args must point to main MW items; target's `mainPropNum1` must be lower than source's. Requires storage password (MD5 verified via `utils.VerifySecondaryPassword`).

**Resolve (`magicWeaponResolve`):** destroys an MW. Main MW: refunds 40% of cumulative `spirit_num` to player Spirituality + adds 1 Thâm Lam Tinh material. Sub MW: 1 Thâm Lam Tinh only. Revokes equipped main-MW skills before deletion via `MWSkillGranter`. Requires storage password.

**Repair (`magicWeaponRepair`, `magicWeaponAllRepair`):** restores `Durability` to `MaxDurability` per equipped MW, consuming 1 Thâm Lam Tinh per item. All-repair pushes `onAddCharactorSlot` per repaired item but only one `SendStatRefreshUPP` after the batch.

**Push pipeline:** all MW mutations that change an equipped item run the same dual-push as the existing equipment pipeline (`change_level.go`, `jewel.go`): `onAddCharactorSlot` (item DTO) + `utils.SendStatRefreshUPP` (player stat refresh via element/maker-set/equip-bonus aggregation, emits `onUPP`). MW-specific extra pushes `onMagicWeaponResetProp` (preview), `onMWeaponSkillUpdate` (skill changes), and `updateMWResetView` (post-apply) layer on top — they never replace the standard pair.

**Code organization:**
- Domain: `internal/domain/magicweapon/` — constants, property keys, `SubFlag`/`MainFlag` JSON, accessors that operate on `*item.Item`
- Application: `internal/application/magicweapon/` — `service.go` core + per-RPC files (`upgrade.go`, `repair.go`, `skill.go`, `stage.go`, `resetprop.go`, `resolve.go`, `trans.go`, `succinct.go`, `activate.go`), `formulas.go` (grow maps, thresholds), `skill_grant.go` (MWSkillGranter wired into item handler)
- Presentation: `internal/presentation/rtmp/handlers/magicweapon/` — one file per RPC slice, plus shared `handler.go` with `pushItemUpdate`, `pushItemDelete`, `pushMWSkillUpdate`, `refreshStats`, `reloadChar` helpers
- Wiring: `cmd/gameserver/main.go` instantiates `appmagicweapon.Service` + `SkillGranter`, wires `mwHandler` into the dispatcher and `itemHandler.SetMWSkillGranter` + `SetMWSkillUpdatePusher` so the equip/unequip RPC fires the grant/revoke hook.

**Vòng tier label (`slotData.q`):** the Flash client's MW tooltip appends `[Vòng N]` (where N = 1..8) by reading `slotData.q` directly — `TipEquip.as:1174` does `vo.name += GamePredef.ARTIFACT_QUALITY_NAME_ARR[q-1]` gated on `temp.kind == ITEM_KIND_MAGICWEAPON`. The same `q` field has dual semantics (it is the 1–25 quality scale on non-MW equipment). For MW items, `applyEquipmentDTOContract` and `ApplyEquipmentDisplayContract` in `internal/application/item/display_contract.go` inject `q = clamp(StarLevel, 0, 8)` at DTO build time (purely derived — not persisted) and skip `equipmentContractPrefixType` so the 1–25 quality prefix logic doesn't corrupt the MW name. MW detection uses `domainmw.IsMWTemplate(equipTpl)` for the DTO path and `templateData["kind"] == 8` for the recordData path. Vòng 8 unlock requires `upgradeNum >= 20` (`STAGE_EIGHT_LEVEL`, confirmed at `EquiptFuncPanel.as:8502`).

References:
- Research: `docs/research/2026-04-27_01_MW_DIVINE_ARTIFACT_RESEARCH.md`, `docs/research/2026-04-27_03_MW_VONG_FIELD_RESEARCH.md`
- Plan: `docs/plans/2026-04-27_01_MW_DIVINE_ARTIFACT_PLAN.md`
