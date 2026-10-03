// Open-sourced by BaoLT

// VIP-shop-specific item purchase: gold-only (currencyType=4), single quantity,
// server applies the VIP-tier discount. Bound gold (Gt=1) and PType1/2 special
// currencies are intentionally not supported — VIP slots are always priced
// from TBL_SHOP_SLOT.gold and paid from char.Gold.
package shop

import (
	"context"
	"errors"
	"math"
	"time"

	"mcgame-server/internal/domain/character"
	pkgitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

const vipShopCurrencyType = 4

func (s *shopService) buyVIPSlotItem(
	ctx context.Context,
	char *character.Character,
	slot *models.ShopSlotTemplate,
	amount int,
	now time.Time,
) (*BuyResult, error) {
	if s.itemService == nil {
		return nil, errors.New("item service not initialized")
	}

	itType, itemName, itemKind, itemTableType, err := s.resolveVIPSlotItemMetadata(slot)
	if err != nil {
		return nil, err
	}

	pmLevel := char.CurrentPMLevel(now)
	pricePerItem := applyDiscount(int64(slot.Gold), pmLevel)
	if pricePerItem <= 0 {
		return nil, errors.New("vip shop item has no price defined")
	}

	cost := pricePerItem * int64(amount)
	if char.Gold < cost {
		return nil, ErrVIPShopInsufficientGold
	}
	char.Gold -= cost

	templateID := int(slot.ItemID)

	beforeStacks, err := s.snapshotPurchaseBagStacks(ctx, char.ID, templateID, itType, false)
	if err != nil {
		return nil, err
	}
	colorCode := int(math.Ceil(slot.Quality / 5))
	addedItem, err := s.itemService.AddItemWithBindAndColor(ctx, char.ID, templateID, itType, amount, false, colorCode)
	if err != nil {
		return nil, err
	}
	addedItemDTOs, err := s.changedPurchaseBagDTOs(ctx, char.ID, templateID, itType, false, beforeStacks)
	if err != nil {
		return nil, err
	}
	if itType == pkgitem.ItemTypeEquipment {
		itemName = pkgitem.FormatEquipmentDisplayName(itemName, addedItem.ColorCode)
	}

	if err := s.charRepo.Update(ctx, char); err != nil {
		return nil, err
	}

	return &BuyResult{
		NewMoney:     char.Gold,
		Cost:         cost,
		CurrencyType: vipShopCurrencyType,
		ItemData: map[string]any{
			"i":  addedItem.TemplateID,
			"q":  amount,
			"s":  "",
			"c":  pkgitem.PopupNoticeColor(itType, addedItem.ColorCode),
			"t":  itemTableType,
			"n":  itemName,
			"tt": itemKind,
		},
		AddedItemDTO:  addedItem.ToDTO(),
		AddedItemDTOs: addedItemDTOs,
	}, nil
}

func (s *shopService) resolveVIPSlotItemMetadata(slot *models.ShopSlotTemplate) (pkgitem.ItemType, string, int, int, error) {
	if int(slot.Type) == 19 {
		equipTpl := s.gameDataRec.GetEquipment(int(slot.ItemID))
		if equipTpl == nil {
			return 0, "", 0, 0, errors.New("equipment template not found")
		}
		return pkgitem.ItemTypeEquipment, equipTpl.Name, int(equipTpl.Kind), 19, nil
	}

	itemTpl := s.gameDataRec.GetItem(int(slot.ItemID))
	if itemTpl == nil {
		return 0, "", 0, 0, errors.New("item template not found")
	}
	itType := pkgitem.ItemTypeConsumable
	if int(itemTpl.Kind) == 1 {
		itType = pkgitem.ItemTypeEquipment
	}
	return itType, itemTpl.Name, int(itemTpl.Kind), 29, nil
}
