// Open-sourced by BaoLT

// Slot-DTO builder for the VIP shop response. The discount is applied here,
// so callers (GetVIPShopConfig, RefreshVIPShopConfig) just hand in the player's
// effective pmLevel and the list of sold-out slot ids.
package shop

import (
	"fmt"
	"hash/fnv"
	"slices"

	"mcgame-server/internal/gamedata/models"
)

type vipShopDynamicEntry struct {
	CID    int64
	CName  string
	Type   int
	ItemID int
	Num    int
	Time   int64
}

func (s *shopService) buildVIPShopSlotDTOs(slotIDs []int32, purchasedSlotIDs []int32, pmLevel int) []map[string]any {
	dtos := make([]map[string]any, 0, len(slotIDs))
	for _, id := range slotIDs {
		slot := s.gameDataRec.GetShopSlot(int(id))
		if slot == nil {
			continue
		}
		dtos = append(dtos, vipShopSlotDTO(slot, slices.Contains(purchasedSlotIDs, id), pmLevel))
	}
	return dtos
}

func vipShopSlotDTO(slot *models.ShopSlotTemplate, purchased bool, pmLevel int) map[string]any {
	baseGold := int64(slot.Gold)
	finalGold := applyDiscount(baseGold, pmLevel)

	return map[string]any{
		"id":       slot.ID,
		"sid":      int(slot.Sid),
		"st":       int(slot.St),
		"position": int(slot.Position),
		"type":     int(slot.Type),
		"itemId":   int(slot.ItemID),
		"quality":  int(slot.Quality),
		"q":        int(slot.Quality),
		"money":    int(slot.Money),
		"gold":     finalGold,
		"priceAll": baseGold,
		"point":    int(slot.Point),
		"amount":   int(slot.Amount),
		"pType1":   int(slot.PType1),
		"pNum1":    int(slot.PNum1),
		"pType2":   int(slot.PType2),
		"pNum2":    int(slot.PNum2),
		"sale":     int(slot.Sale),
		"gt":       int(slot.Gt),
		"r":        slot.R,
		"flag":     purchased,
	}
}

func (s *shopService) recordVIPDynamicEntry(entry vipShopDynamicEntry) {
	s.vipMu.Lock()
	defer s.vipMu.Unlock()
	s.vipDynamic = append([]vipShopDynamicEntry{entry}, s.vipDynamic...)
	if len(s.vipDynamic) > vipShopDynamicLimit {
		s.vipDynamic = s.vipDynamic[:vipShopDynamicLimit]
	}
}

func (s *shopService) vipShopDynamicSnapshot() []map[string]any {
	s.vipMu.Lock()
	defer s.vipMu.Unlock()
	out := make([]map[string]any, 0, len(s.vipDynamic))
	for _, entry := range s.vipDynamic {
		out = append(out, map[string]any{
			"cid":    entry.CID,
			"cName":  entry.CName,
			"type":   entry.Type,
			"itemId": entry.ItemID,
			"num":    entry.Num,
			"time":   entry.Time,
		})
	}
	return out
}

func vipShopPersonalSeed(characterID, rotationEpoch int64, refreshIndex int32) int64 {
	hasher := fnv.New64a()
	_, _ = fmt.Fprintf(hasher, "vip_shop_personal:%d:%d:%d", characterID, rotationEpoch, refreshIndex)
	return int64(hasher.Sum64())
}
