# Pet System

## Overview

Properties: petList, activePetObject, contractPet, evolutionPetObject, petMaxNum. Auto-battle settings: bs2/4/6/8/10 (skill/item assignments), p6/7/8/9 (HP/MP thresholds). Auto-battle logic checks thresholds before choosing heal, defense, or attack.

## Pet Leveling

Pet leveling now follows the Flash client `GamePredef.PET_LEVEL_EXP` table instead of the old quadratic formula. Server-side pet `Experience` remains the in-level remainder, while client-facing pet `exp` callbacks/DTOs add the cumulative base from `PetLogic.lvToExp(level)` so Flash progress and level-up thresholds stay aligned.

## Pet Attribute Points

Pet attribute-point flow now mirrors the character path: each pet level grants `5` distributable points, `Pet.RecalculateStats()` mirrors the remaining pool into `property.lastPoint`, and `changePetProperty(petId, {addStrength, addAgility, addStamina, addIntelligence, addEnergy})` spends those points into `Apt*Ex` plus `onUpdatePet`/`onRefreshPetProp` callbacks for the Flash pet panel.

## Pet Life Meter

Pet `life` is now a persisted battle-condition meter on `player.character_pets.life`, not an HP-derived display field. New pets start at `10000`, battles drain `10` from each owner-side pet participant on battle end, zero-life pets cannot enter battle or be swapped in, rest/follow states still work at zero life, and pet functional items restore this stored meter back up to the `10000` cap via `onUpdatePet(..., "life", ...)`.

## Pet Cache Read Order

`internal/infrastructure/cache/cached_pet_repo.go` must prefer `activeSessions` over `coldLoader` for pet reads (`FindByCharacterID`, `FindFollowingPet`, `Count`) and for `ClearFollowing`.

Reason: pet cold cache can be stale relative to the active session. If cold data is checked first, two visible bugs appear:

- `getFinalPraDefPet` / `finalPraMagDefPet` can fail with `following pet not found` even right after `onRefreshPetProp` shows `state:1`
- `initViewPetMngP` can return an old or empty pet list after relogin or after in-session pet changes

`CachedPetRepository.Save` and `Delete` should also keep cold pet cache in sync when possible so Redis cold data does not lag behind hot session state.

`initViewPetMngP` must return wrapped pet DTOs from `Pet.ToDTO()` and the top-level payload must be keyed by pet ID, not a positional slice. The Flash `PetManagerPanel.onInitViewPetMngP()` expects `pet.data`, flattens it client-side, then stores the result in `_core.player.petList` and later indexes that structure by `petId` in callbacks like `onUpdatePet` and `onRefreshPetProp`. Returning flattened `petDTOData()` breaks `_local_2.data.tid`, and returning a slice breaks `_core.player.petList[petId]`, so list display may work while pet callbacks silently miss.

## Pet Client State Contract

Flash pet UI does not treat `state` as the same thing as server-side `is_following`.

- `PetManagerPanel` and `MAIN_PET` read root `pet.state`, not just `pet.property.state`
- `state=1` is the active/battle pet shown in `MAIN_PET`
- `state=2` is the follow icon path in the pet list
- `state=3` is resting

Because of that, server DTOs must emit `state` at the root level and also keep `property.state` populated for refresh flows like `onRefreshPetProp`.

`PetPanel` also reads `pet.property.aptStrength`, `aptAgility`, `aptStamina`, `aptIntelligence`, and `aptEnergy` when building tooltip/final aptitude displays. Those aptitude keys need to be present in the property block, not only at the root DTO level.

`changePetState` only controls the active battle pet (`state=1`). It must not change `is_following` or send scene follow callbacks. Visible follow pets still belong to `startPetFollow` / `cancelPetFollow`, while combat setup and pet EXP rewards must resolve the battle pet from the pet list entry with `state=1`.

`initViewPetMngP` and `changePetState` should both refresh `creatureData` through `onUpdatePet(petId, "creatureData", data)` for every pet that needs panel rendering. `PetManagerPanel.updateView()` only sets `_core.battlePet` when both `state == 1` and `creatureData` are present.

## Pet Slot Opening Contract

`petOpenSlot` is a bag/pet-panel flow, not a responder-driven panel RPC. The Flash client calls `_core.remote.petOpenSlot()` directly and expects state changes through callbacks.

- Slot price is sourced client-side from `getTemplateData(29, 326).gold`, which is currently `20`
- Currency behavior is `goldBind` first, then `gold`
- `BagPanel` only blocks the call when `gold` would be needed but `gold` is still locked
- The required callbacks are `onMinusMoney(playerId, moneyType, cost, currentNum)` and `onUPP({petMaxNum: newSlotCount})`
- `CallBack.onUPP` already refreshes both the pet manager panel and the bag pet tab when `petMaxNum` changes
- The supported UI cap is `180` pet slots because `GamePredef.MAX_PET_PER_PAGE = 18` and the bag exposes 10 pet pages

## Pet Follow Scene Contract

Visible follow-pet rendering is scene-driven, not responder-driven.

- `startPetFollow` responder only updates `_core.showPetId` in `PetManagerPanel`
- the actual pet sprite in the map is controlled by scene callbacks
- `cancelPetFollow` must send `onCancelPet(ownerCid)`
- `startPetFollow` must send `onCancelPet(ownerCid)` first, then `onCreatePet({cid: ownerCid, petData})`

The key for `onCancelPet` is the character id of the pet owner, because `ViewManager.addP()` stores pets by `_arg_1.cid`.

`petData` for `onCreatePet` must be a flat scene object compatible with `Core.createPet()`, not the wrapped panel DTO from `Pet.ToDTO()`. A dedicated scene DTO should include at minimum:

- pet identity: `id`, `cid`, `tid`, `name`, `level`
- combat bars: `currentHp`, `currentMp`, `hpMax`, `mpMax`, `life`
- appearance: `resCode`, `iconCode`, `colorCode`, `element`
- follow stats: `property`

Login and scene-enter payloads also need `showPetObj` when `showPetId > 0`; sending only `showPetId` is not enough for client rendering after relogin or when another player enters the room.

## Pet Skill Slot Opening Contract

`petOpenSkill` is a direct pet-panel RPC. The Flash client calls `_core.remote.petOpenSkill(petId, index)` and expects callback-driven updates instead of a responder payload.

- only `skill6..skill15` are paid unlock slots
- `skill1..skill5` are the default open slots and should normalize to `0`
- slot state meanings are `-1` = locked, `0` = open but empty, `>0` = learned skill template id
- base open costs by slot are `10, 20, 40, 70, 110, 160, 220, 290, 370, 460`
- the client multiplies those base costs by pet quality through `GamePredef.GOLD_PET_SKILLOPEN_Q`, which is `1x`, `3x`, or `10x` for `qLevel` `1`, `2`, or `3`
- the required success callbacks are `onMinusMoney(playerId, moneyType, cost, currentNum)` and `onUpdatePet(petId, "skillN", 0)`
- after `onUpdatePet`, the pet panel itself triggers `getFinalPraDefPet` and `finalPraMagDefPet`, so `petOpenSkill` does not need to push an extra pet property refresh callback

## Pet Guard Contract

`getPetGuardData`, `putDownPet`, and `movePetToPetGuardSid` are panel-driven pet guard RPCs. The shared refresh callback is `onUpdatePetGuardData(payload)`.

- `getPetGuardData` should both return the payload and emit `onUpdatePetGuardData`, because one guard panel uses a responder and the other calls it with `null`
- payload shape is `{lvData, petData}`
- `lvData` keys are `0..4`
- `petData` keys are `0..4`, `11..15`, `21..25`, `31..35`, `41..45`
- outer level key `0` is the shared outer guard level
- inside level keys `1..4` correspond to the four inner guard groups
- valid guard pets must satisfy creature `classIds == 10` and `useLv >= 50`
- one pet cannot appear in multiple guard slots at the same time
- current persistence is `player.characters.pet_guard_data jsonb`

`petguardout` and `petguardin` are separate client-visible currencies/items for the guard-upgrade UI, not placement-state fields. Their acquisition/spend flow is still unimplemented in the current Go server.

## Pet Skill Book Contract

`petBook` is a responder-driven pet panel RPC. The Flash client calls `_core.remote.call("petBook", new Responder(onBook), petId, bookItemId)`.

- the second argument is the dragged pet skill book item instance id from inventory, not a skill template id
- responder success is `f = 1`, `rf = true`, with `n` as the remaining stack count
- learn failure is `f = 1`, `rf = false`
- invalid or unusable skill book is `f = 2`
- invalid pet id, invalid drag source, or other bad input is `f = 3`
- usable pet skill books come from `data.data_tbl_item_template` with `type = 506` and `use_type = 2`
- the server can resolve the learned skill by exact item name match against `data.data_tbl_skill`, choosing the lowest skill level in that name family
- `petBook` learns into the first pet skill slot whose value is `0`; it must not write into locked slots with value `-1`
- duplicate and conflict checks need to compare the learned skill family, not only the exact skill id; the current server matches by shared `Name`, `CodeName`, or `ScriptReqL`
- after a successful learn, the server must emit `onUpdatePet(petId, "skillN", skillTemplateId)` and refresh pet derived properties so the panel updates final stats immediately
- passive pet skill bonuses are derived from `TBL_SKILL.buff_id` into `TBL_BUFF.prop*` and `prop_num*`, then merged into pet `final*` combat stats
- example mapping:
  - item template `3216` = `Thụ Bì Ngoại Sáo Siêu Cấp`
  - learned skill template `5527`
  - buff template `2113`
  - effect: `hpMax` and `finalHp` increase by `22%`

## Pet Skill Eligibility Rule

`TBL_SKILL.cre_kind` is not only a quality flag for pet skill books. For class-bound pet skills it encodes `classIds|qLevel`.

- the first segment matches `TBL_CREATURE.class_ids`
- the second segment is the minimum pet `qLevel`
- `petBook` should reject the book with responder failure `f = 2` when the pet class or quality does not match
- runtime validation should read from `pet.CreatureData` first, because `enrichPet()` refreshes that block from `TBL_CREATURE` before the learn flow continues
- example: `Thụ Bì Ngoại Sáo Siêu Cấp` uses `cre_kind = 3|3`, so only pets with `classIds = 3` and `qLevel >= 3` can learn it
- skills with `cre_kind = 0` are treated as unrestricted by pet class; this is an inference from live data where common books like `Man Lực`, `Ma Tâm`, and `Trì Độn` use `0`

## Pet Equipment Contract

`petEquipOn` and `petEquipOff` are callback-driven pet panel RPCs. They use dedicated pet-equip item slots, not the normal character equipment range.

- `petEquipOn(petId, itemId)` takes the pet id and the dragged pet equipment item instance id from the bag
- `petEquipOff(petId, itemId)` takes the pet id and the equipped pet item instance id currently attached to that pet
- valid pet equipment templates come from `TBL_EQUIPT_TEMPLATE` with `kind = 9` and `position = 50..57`
- pet gear validation should check `req_level`, `req_class`, and `req_class_id`
- the client uses `GamePredef.SLOT_SID_PET_EQUIP = [1000, 1200]`, so pet-equipped item instances must move into real SIDs `1001..1200`
- server persistence now uses:
  - item `slot_type = 6` for pet-equipped items
  - pet `property.equ1..equ8` for slot ownership
  - pet `property.equipGroup` for a stable pet-equip SID group
- `Pet.ToDTO()` and `Pet.ToSceneDTO()` must both expose root `equ1..equ8`, because the pet manager panel and battle HUD read those fields directly
- callback order matters:
  - `petEquipOn`: `onUpdatePet`, then `onMoveItem`, then `onRefreshPetProp`, then `onPetEquipOn`
  - `petEquipOff`: `onMoveItem`, then `onUpdatePet`, then `onRefreshPetProp`, then `onPetEquipOff`
- `onPetEquipOn` payload shape is `{pid, pos, oldSid, newSid}`
- `onPetEquipOff` payload shape is `{pid, pos, sid}`
- in those pet-specific payloads, `oldSid`, `newSid`, and `sid` are item instance ids, not slot ids
- `player.character_items` has a unique constraint on `(character_id, slot_type, slot_index)`, so replace-equip flows need a temporary slot hop before moving the new item into the pet slot
- deleting a pet should move equipped pet items back into the bag before deleting the pet row, otherwise those items become unreachable

## Pet Bind And Skill Delete Contract

`bindedPetByPlayer` and `petDelSkill` are linked pet-panel RPCs.

- pet DTO `binded` must no longer be hardcoded; the server now resolves it from:
  - persisted `pet.property.binded`
  - fallback creature template `is_bind`
  - default `0`
- `bindedPetByPlayer(petId)` persists the lock state and emits `onUpdatePet(petId, "binded", 1)`
- `petDelSkill(petId, slotIndex, passwordHash)` uses the real skill slot index `1..15`
- `petDelSkill` requires the pet to be bound; when not bound, the server emits `onSystemSay("Phải khóa pet mới xóa được")`
- the delete cost item is `ItemConfig.ITEM_PET_SKILL_DEL = 1364`
- successful delete consumes one stack of that item and emits:
  - `onUpChaSlotStackNum(itemInstanceId, remainingStack, sid)` when the stack remains
  - `onDelCharactorSlot(itemInstanceId, sid)` when the stack is exhausted
  - `onUpdatePet(petId, "skillN", 0)`
  - `onRefreshPetProp`
- `petDelSkill` reuses the secondary password flow already used by protected pet RPCs and should cache the accepted hash with `setClientDP`
- clearing a pet skill must recompute passive pet skill bonuses immediately, because pet skill buffs are merged into final pet `final*` combat stats

## Pet Bag Item Summon Contract

Pet bag summon items are part of the normal item RPC flow, not a separate pet RPC.

- supported server entry point is `useItem(targetType, targetId, slotId)`
- supported pet-summon bag templates currently come from `data.data_tbl_item_template` with:
  - `use_type = 1`
  - `type = 508` or `550`
- the server resolves the summoned pet from normalized `item name + description`, not from `i1/i2`
- supported description patterns:
  - single pet: `Chứa pet <name>`
  - random one-of-many: descriptions containing `hoặc`
  - fixed-count multi-pet: `N pet <name>`
- unsupported for now:
  - choose-one descriptions such as `Có thể chọn nhận 1 trong 3`, `Chọn nhận 1 pet`, `Mở chọn nhận`
  - ambiguous generic bags like `pet hệ rồng`
  - direct `type = 509` pet keys
- successful item use now:
  - consumes the bag item stack as normal
  - emits the usual bag callback `onDelCharactorSlot` or `onAddCharactorSlot`
  - emits `onAddPet(petDto)` once for each contracted pet
- pet creation must go through batch contract logic with slot-capacity precheck so one bag cannot partially summon pets when the pet list is full
- the new pet batch path lives in `pet.Service.ContractPets`

## Pet Stat Bonus Channels (parity with character)

Pet `EquipmentStatBonuses` mirrors the character struct: `Flat`, `Percent`, `Float`. The aggregation pipeline routes raw equipment-template prop ids the same way characters do:

- raw 24 → `Percent[1]` (HP %) and raw 25 → `Percent[2]` (MP %), matching `character.EquipmentPropUsesPercent`
- raw 14, 26-32 → `Float` bonuses for special pet stats (Defy, ResiCritical, ResiDefy, EnhPhyHurt, EnhMagicHurt, BreakReborn, CriticalDamage, DebuffSuccRate)
- everything else → `Flat`, keyed by raw prop id (1=HP, 2=MP, 4=Atk, 5=MAtk, 6=Def, 7=MDef, 8=Hit, 9=Dodge, 11=Speed, 12=Combo, 13=Crit, 14=PraDef, 15-16=ReduceHurt1/2, 17-19=Resi*, 34=Reborn)

Application order inside `applyEquipmentBonuses`: flat → float → percent (percent applied LAST so it scales the flat additions, mirroring character's `applyPct`). Percent is supported only for HP/MP/Atk/MAtk/Def/MDef/Speed - the same canonical seven from `character.applyPercentBonus`.

Skill bonuses (`SkillStatBonuses`) still apply AFTER `applyEquipmentBonuses` via a separate pass. This means equipment % and skill % currently compound multiplicatively across the two passes (within each pass, multiple sources sum first per character formula). If/when full additive aggregation between equipment and skills is required, fold skill bonuses into the equipment accumulator before applying.

### Pet attribute key fix (2026-05-06)

Raw equipment-template attribute prop ids match the character canonical mapping in `character.EquipmentPropToStat`:

- `20 = Strength` (was correct)
- `21 = Stamina` (was incorrectly read as Agility)
- `22 = Intelligence` (was correct)
- `23 = Spirit/Energy` (was correct)
- there is **no raw template key for Agility from main equipment** - characters get Agility only from gems

`pet.RecalculateStats` now reads `attrBonus[21]` into the Stamina line; the Agility line takes only `AptAgilityEx` with no equipment contribution.

## Pet PVE Tower (PPVE) Contract

`challengeNextFloor` is a new inbound RPC (M8 Batch 2). It is fully registered and wired.

- Request body: `[null]`
- Server immediately pushes `changePPLoadingState(charId)` then returns empty `_result`.
- After bookkeeping, pushes `onSendReplayPPVEPanel(result, floorNum, replayId, rankList, myRank)`.
- Live wire shape from catalog_in.md: arg1=-1 (result), arg2=140 (floor), arg3="ts_cid" (replayId), arg4=rankList array, arg5=-1 (myRank).
- PPVE state is persisted via `FeaturePetPVE` (domain/statfeature constant added in M8) into the generic character feature state store.
- `PPVEService` lives at `internal/application/pet/ppve_service.go`.
- Handler lives at `internal/presentation/rtmp/handlers/activity/ppve.go`.
- State fields: `ppvefloor`, `todayFloor`, `kp`, `freeTime`, `goldTime`, `goldClgTime`, `awardTime`, `gold4awardTimeDaily`, `mlv`, `lastResetDay`.
- Daily reset: `freeTime` resets to 3, `todayFloor` resets to -1 on first challenge of a new calendar day.
- Max floor cap: `PPVEMaxFloor = 150`; no advance beyond that.

Open questions (combat-resolution stub):
- Full PPVE combat simulation against defending pets is NOT modeled. `challengeNextFloor` auto-advances floor by 1 on every challenge (always succeeds while free challenges remain).
- Live capture shows result arg1=-1 which client routes into `addPPLog`. The exact meaning of -1 (win/loss/replay code) is not confirmed.
- No kp reward on floor advance is implemented yet; kp management is deferred.
- `onUpdatePPVEPanel` and `GetPPVERank` still return partial/empty data — fixing those is a separate task.
