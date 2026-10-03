// Open-sourced by BaoLT

package shop

import (
	"fmt"

	"mcgame-server/internal/gamedata/models"
)

func (s *shopService) resolveSystemShopSlot(identifier int) (*models.ShopSlotTemplate, error) {
	if s.gameDataRec == nil {
		return nil, fmt.Errorf("game data manager not initialized")
	}

	if slot := s.gameDataRec.GetShopSlot(identifier); slot != nil {
		return slot, nil
	}

	if itemTpl := s.gameDataRec.GetItem(identifier); itemTpl != nil {
		return &models.ShopSlotTemplate{
			ID:      int64(identifier),
			ItemID:  float64(identifier),
			Type:    29,
			Gold:    itemTpl.Gold,
			Money:   itemTpl.Price,
			Point:   itemTpl.Honor,
			Quality: itemTpl.Color,
		}, nil
	}

	if equipTpl := s.gameDataRec.GetEquipment(identifier); equipTpl != nil {
		return &models.ShopSlotTemplate{
			ID:      int64(identifier),
			ItemID:  float64(identifier),
			Type:    19,
			Gold:    equipTpl.Gold,
			Money:   equipTpl.Price,
			Point:   equipTpl.Honor,
			Quality: equipTpl.Color,
		}, nil
	}

	return nil, fmt.Errorf("shop slot %d not found", identifier)
}
