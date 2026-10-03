// Open-sourced by BaoLT

// Wallet effect handler grants money from known currency item templates.
// Uses I1 as the amount, falling back to tpl.Gold if I1 is zero.
package item

import (
	"context"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

var walletTemplateIDs = map[int]bool{
	643: true, 1076: true, 2908: true, 4196: true, 4201: true,
	4206: true, 4211: true, 4216: true, 4221: true, 4226: true,
	4231: true, 4236: true, 4241: true, 4246: true, 4251: true,
	4256: true, 4261: true, 4266: true, 4271: true, 4276: true,
	4551: true, 4571: true, 5343: true, 3815: true, 4591: true,
	5256: true, 4839: true, 3816: true, 4905: true, 4906: true,
	4838: true, 4886: true, 4724: true, 5968: true, 5967: true,
	5948: true, 5949: true, 5215: true, 5216: true, 4673: true,
}

type walletEffectHandler struct{}

func (h *walletEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	return walletTemplateIDs[int(tpl.ID)]
}

func (h *walletEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()

	amount := int64(tpl.I1)
	if amount <= 0 {
		amount = int64(tpl.Gold)
	}

	if amount > 0 {
		char.Money += amount
		result.Message = fmt.Sprintf("Bạn nhận được %d bạc.", amount)
	}

	return result, nil
}
