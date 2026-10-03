# Element System

Element Enum: `0`=neutral/Vo, `1`=light/Quang, `2`=dark/Am, `3`=wind/Phong, `4`=earth/Dia, `5`=water/Thuy, `6`=fire/Hoa. Shared helper in `internal/domain/element/client.go`.

`ELEMENT_INFO` is a client-local lookup table from `Language.GAMEPREDEF_S[248..254]`, not a server payload.

Character Element Fields: `ee` = element id, `en` = element strength tier (< 4="Yeu", 4-8="Vua", 9-12="Manh"), `ef` = max-state flag. Tooltip: `Language.CHARACTORPANEL_S[2] + GamePredef.ELEMENT_INFO[ee]`.

Star Progression System (`starsData`): Separate system keyed by star slot `1..12`. Each value: `tid`, `finishDate`, `addition`. RPCs: `beginStarLvUp`, `finishStarLvUp`, `cancelStarLvUp`, `speedUpStarLvUp`, `addStarAddition`. Server should send `{}` (empty object) when no star progress exists.

Current Server State: Element normalization done. Pet/creature/battle/equipment payloads use `0..6` enum. Character DTOs expose `ee`/`en`/`ef`. Missing: `starsData` returns nil, no star RPC handlers, no element/star persistence, new-character defaults are placeholder data.

## Change Element System

Handler in `internal/presentation/rtmp/handlers/item/change_element.go`. Two-step preview-confirm flow: `changeElement` (preview) and `sureChangeElement` (confirm).

Cost: 30,000 silver per attempt. Rolls a random element (1-6) different from the current element. Pending preview stored per character between preview and confirm steps.

Application-layer element logic in `internal/application/item/element.go`. Character element state (`Ee`/`En`/`Ef`) aggregated from all equipped items and sent via `onUPP`.
