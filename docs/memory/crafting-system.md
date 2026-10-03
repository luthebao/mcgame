# Crafting System

## getMakeColor (Preview)

Read-only preview returning crafting success percentages for 4 quality tiers before player confirms via `newMake`.

Request: `getMakeColor(materials, recipeID)`. Materials object: `{1: {tempBagFlag, idx}, 2: {...}, 3: {...}}`. When `tempBagFlag=true`, `idx` is temp bag slot; when false, `idx` is database ID.

Response: `{canMake: true, colorPerList: {makePer1: 85, makePer2: 60, makePer3: 30, makePer4: 5}, flag: 0}`.

Preview bucket mapping: `makePer1`=green (color code 2), `makePer2`=blue (3), `makePer3`=purple (4), `makePer4`=orange (5).

## Quality Tier Determination

`TBL_RECIPE_PLAN` rows contain per-star-level success rates. `rate` values treated as tier weights. Total < 100 means deficit = failure region. Total > 100 triggers normalization.

No plan rows: Derive fallback tier from selected material instances. Mixed tiers use lowest visible tier. Falls back to template visible band, then defaults `makePer1 = 100`.

## Custom Material Level Craft Rates

Equipment crafting supports custom probability model based on material levels (2-6):

| Material Level | Craft Rates |
| --- | --- |
| 2 | makePer1=100 (100% green) |
| 3 | makePer2=100 (100% blue) |
| 4 | makePer3=100 (100% purple) |
| 5 | makePer3=95, makePer4=5 (95% purple, 5% orange) |
| 6 | makePer4=100 (100% orange) |

Mixed-level selections use lowest supported material level as cap profile. Level 6 materials only accepted for equipment with required level >= 60. Materials outside levels 2-6 fall back to recipe-plan/template behavior. Material levels resolved from item-template `level`/`itemLevel`; when `0`, derives from color band (colorCode 1..5 => levels 2..6).

Craft Result Quality Ranges: makePer1=green q6..10, makePer2=blue q11..15, makePer3=purple q16..20, makePer4=orange q21..25.

## Crafting Prefix Rules

Single 100% bucket: randomizes `preNameType` from 1..5.

Multiple buckets with nonzero rates: lower bucket locks to `preNameType=5` ("Trac Viet"), highest bucket randomizes `preNameType` from 1..5.

Examples: `makePer1=100` -> green with random prefix. `makePer1=95, makePer2=5` -> 95% green "Trac Viet" + 5% blue random prefix. `makePer3=95, makePer4=5` -> 95% purple "Trac Viet" + 5% orange random prefix.

## Equipment Maker Signature

`changeName` RPC lets players sign their name onto equipment. Validates: owned equipment, bound, purple-or-higher quality. Requires material from template field `requireItem3`. Charges 10,000 silver, consumes one material. Persists `maker` so tooltip renders `maker + " che tao"`.

During `newMake`, crafter's character name is automatically persisted into the `maker` field.

## Equipment Random Elements

Crafted equipment from `newMake` and quest reward equipment get random non-neutral element (1..6). Normal equipment creation from shops/generic grants not affected.

## Change Prefix Handler

`changePrefix` (preview) and `sureChangePrefix` (confirm) for re-rolling equipment prefixes.

Eligibility: Purple-or-higher quality equipment. Three template-specific material slots. All materials must resolve to same level.

Material Level Restrictions: Purple equipment accepts levels 4, 5, 6. Orange equipment accepts levels 5, 6.

Silver Cost: `reqLevel * reqLevel * 10`.

Result by Material Level:

- Level 4: Rerolls into purple band, reduces star level by 1.
- Level 5: Keeps orange at current quality; non-orange becomes "Trac Viet tim" (purple Trac Viet).
- Level 6: Keeps "Trac Viet cam" (orange Trac Viet) unchanged; otherwise rerolls inside orange band.
- Both preview and confirm reroll element. Sockets unchanged.

Pending preview stored per character between `changePrefix` and `sureChangePrefix`.

## Orange Equipment System Notice

Broadcasts `onSystemSay` when crafting (`newMake`) or change-prefix (`sureChangePrefix`) produces orange-quality equipment. `changePrefix` preview DTO forced to `binded = "1"`. `sureChangePrefix` persists `IsBound = true`.
