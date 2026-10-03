# TBL_CHARACTOR_INTERFACE

| Property | Value |
|---|---|
| Table ID | 4 |
| Record count | 0 (runtime/instance table) |
| JSON | `docs/database/game_data/TBL_CHARACTOR_INTERFACE.json` |
| Client constant | `GamePredef.TBL_CHARACTOR_INTERFACE = 4` |

## Purpose

Persisted UI and interface settings for a character — chat channel filter states, graphics/performance toggles, and other per-character client preferences. On login the server sends this as `_arg_1.interfaceData`, which is written directly to `GamePredef.GLOBAL_SETTING` via `GamePredef.interfaceSetting = _arg_1.interfaceData` (`CallBack.as:234`). No static rows exist in the JSON export. Indexed by `cid` (`TBL_INDEX_ARRAY[TBL_CHARACTOR_INTERFACE] = "cid"`).

Classification: **runtime / character-scoped UI-settings instance data**.

## Key reference

Fields confirmed from `GamePredef.as:interfaceSetting` setter and `CallBack.as`:

| Key | Type | Function |
|---|---|---|
| `cid` | int | Character ID this settings record belongs to. Secondary index key (`GamePredef.as:8320`). |
| `c0`–`c3` | bool(0/1) | Chat channel enable flags (indices 0–3 of `MSG_CHANNEL[]`). Parsed in the `interfaceSetting` setter: `MSG_CHANNEL[i].selected = Boolean(Number(_arg_1["c" + i]))` for `i` in 0–3. |
| `he` | bool(0/1) | Hide effects flag. `!(GLOBAL_SETTING["he"])` drives `StageMain.useEffect` (`CallBack.as:236`). |
| `hm` | bool(0/1) | Hide models flag. `!(GLOBAL_SETTING["hm"])` drives `StageMain.useModel` (`CallBack.as:237`). |
| `cf` | bool(0/1) | Low frame-rate mode. If truthy, calls `setFrameRate(GLOBAL_FRAME_RATE_20)` (`CallBack.as:240`). |
| `ubl` | bool(0/1) | User-bar locked flag. Stored as `player.isLockedUB` (`CallBack.as:243`). |
| `am` | bool(0/1) | Music-enabled setting. Read from/written to `SharedObject("musicSetting")` with priority; overridden by local SharedObject if present (`GamePredef.as:interfaceSetting` setter). |
| `flyEffect` | bool(0/1) | Flying particle effect enabled. If `!Boolean(Number(flyEffect))`, zoom rates are reset to 1 (`GamePredef.as:interfaceSetting` setter). |
| `maxView` | int | Maximum view distance setting. Defaults to `100` if absent (`GamePredef.as:interfaceSetting` setter). |
| `url` | string | Boss key URL — set as `GLOBAL_SETTING["url"] = _arg_1.bossKey.url` (`CallBack.as:238`). (inferred — sourced from `bossKey` sub-object on the login payload, not a direct `interfaceData` field.) |
| `title` | string | Boss key window title — `GLOBAL_SETTING["title"] = _arg_1.bossKey.title` (`CallBack.as:239`). (inferred — same note.) |
| `glid` | int | Guild slot group ID used to pre-load guild equipment instances (`CallBack.as:246`). (inferred — read from `GLOBAL_SETTING["glid"]`.) |

Additional boolean channel flags for chat (beyond `c0`–`c3`) may exist but were not enumerated in the setter code. The `_channelListSetting` object in `ChatCanvas.as` is built from this data and keys like `"World"`, `"Scene"`, `"Guild"`, `"Team"`, `"Wisper"`, `"Personal"`, `"System"`, `"Event"`, `"Rumour"` — suggesting those string keys may also be present in the interfaceData object.

## Client usage

- `CallBack.as:234` — `GamePredef.interfaceSetting = _arg_1.interfaceData` on character login.
- `GamePredef.as:11000–11029` — `interfaceSetting` setter: parses `c0`–`c3`, sets `GLOBAL_SETTING`, handles music SharedObject, flyEffect zoom-rate, maxView default.
- `CallBack.as:236–243` — reads `GLOBAL_SETTING["he"]`, `["hm"]`, `["cf"]`, `["ubl"]` immediately after login to configure scene rendering and player state.
- `GamePredef.as:8320` — `TBL_INDEX_ARRAY[TBL_CHARACTOR_INTERFACE] = "cid"`.
- `ChatCanvas.as:1023–1025` — `getInterfaceData(key)` reads from `_channelListSetting[key]`, which is populated from the interfaceData channel flags.

## Related tables

- `cid` → [[TBL_CHARACTOR]].
