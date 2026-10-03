# HP/MP Bulk Recovery Targeting

`fullHpRecoverByItem` and `fullMpRecoverByItem` use the first two RPC args as the recovery target selector. `targetType=1` is the character and `targetType=2` is the active pet resolved through `pet.Service.GetActivePet()`.

`fullMpRecoverByItem` cannot rely on the client always sending an item array. The server now falls back to scanning bag consumables, rebuilding the same priority ordering from potion heal amount and bound status, then consuming the lowest-priority matching potions first.

When the active pet is the target, the server must persist the pet and send `updateActivatePetObj` plus `onRefreshPetProp` so the Flash client updates the pet portrait and pet-panel stats immediately after the recovery item is consumed.
