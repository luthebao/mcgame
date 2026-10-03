// Open-sourced by BaoLT

package chatfmt

import (
	"context"
	"strings"
	"time"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
)

type GameDataLinkResolver struct {
	gameData *gamedata.Manager
	itemRepo domainitem.Repository
}

func NewGameDataLinkResolver(gameData *gamedata.Manager, itemRepo domainitem.Repository) *GameDataLinkResolver {
	if gameData == nil && itemRepo == nil {
		return nil
	}
	return &GameDataLinkResolver{gameData: gameData, itemRepo: itemRepo}
}

func (r *GameDataLinkResolver) ResolveChatLink(token Token) ResolvedLink {
	if r == nil {
		return ResolvedLink{}
	}

	switch token.Type {
	case LinkTypeEquipmentInstance, LinkTypeItemInstance:
		return r.resolveInstanceLink(token)
	case LinkTypeEquipmentTemplate:
		return ResolvedLink{Color: equipmentTemplateColorHex(r.gameData, int(token.ID))}
	case LinkTypeItemTemplate:
		return ResolvedLink{Color: itemTemplateColorHex(r.gameData, int(token.ID))}
	case LinkTypeRecipe:
		if r.gameData != nil {
			if recipe := r.gameData.GetRecipe(int(token.ID)); recipe != nil {
				return ResolvedLink{Color: displayColorHex(int(recipe.Color))}
			}
		}
	case LinkTypeAchievement:
		if r.gameData != nil {
			if achievement := r.gameData.GetAchievement(int(token.ID)); achievement != nil {
				return ResolvedLink{Color: displayColorHex(int(achievement.Color))}
			}
		}
	case LinkTypeSoul:
		if r.gameData != nil {
			if soul := r.gameData.GetPetSoul(int(token.ID)); soul != nil {
				return ResolvedLink{Color: displayColorHex(int(soul.Color))}
			}
		}
	case LinkTypeMedal:
		if r.gameData != nil {
			if medal := r.gameData.GetMedal(int(token.ID)); medal != nil {
				return ResolvedLink{Color: displayColorHex(int(medal.Q))}
			}
		}
	case LinkTypeTalent:
		if r.gameData != nil {
			if talent := r.gameData.GetPetTalent(int(token.ID)); talent != nil {
				return ResolvedLink{Color: displayColorHex(int(talent.Preflag))}
			}
		}
	}

	return ResolvedLink{}
}

func equipmentTemplateColorHex(gameData *gamedata.Manager, templateID int) string {
	if gameData == nil {
		return ""
	}
	template := gameData.GetEquipment(templateID)
	if template == nil {
		return ""
	}

	colorCode := domainitem.NormalizeEquipmentColorCode(int(template.ColorCode))
	if colorCode == 0 {
		colorCode = domainitem.NormalizeEquipmentColorCode(int(template.Color))
	}
	return displayColorHex(domainitem.EquipmentDisplayColorFromColorCode(colorCode))
}

func itemTemplateColorHex(gameData *gamedata.Manager, templateID int) string {
	if gameData == nil {
		return ""
	}
	template := gameData.GetItem(templateID)
	if template == nil {
		return ""
	}

	colorCode := domainitem.NormalizeEquipmentColorCode(int(template.ColorCode))
	if colorCode > 0 {
		return displayColorHex(domainitem.EquipmentDisplayColorFromColorCode(colorCode))
	}
	return displayColorHex(int(template.Color))
}

func displayColorHex(color int) string {
	switch color {
	case 0:
		return "#FFFFFF"
	case 1:
		return "#00FF00"
	case 2:
		return "#0066FF"
	case 3:
		return "#FF00FF"
	case 4:
		return "#FFFF00"
	default:
		return ""
	}
}

func (r *GameDataLinkResolver) resolveInstanceLink(token Token) ResolvedLink {
	if r.itemRepo == nil {
		return ResolvedLink{}
	}

	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()

	it, err := r.itemRepo.FindByID(ctx, token.ID)
	if err != nil || it == nil {
		return ResolvedLink{}
	}

	if it.ItemType == domainitem.ItemTypeEquipment {
		return r.resolveEquipmentInstanceLink(it, token)
	}
	return r.resolveItemInstanceLink(it, token)
}

func (r *GameDataLinkResolver) resolveEquipmentInstanceLink(it *domainitem.Item, token Token) ResolvedLink {
	colorCode := resolveEquipmentInstanceColorCode(it, r.gameData)
	name := strings.TrimSpace(token.Name)
	if r.gameData != nil {
		if template := r.gameData.GetEquipment(it.TemplateID); template != nil && strings.TrimSpace(template.Name) != "" {
			name = template.Name
		}
	}
	if name == "" {
		name = token.Name
	}
	name = domainitem.FormatEquipmentDisplayNameWithCurrent(name, it.Properties["preNameType"], colorCode)
	return ResolvedLink{
		Name:    name,
		Display: name,
		Color:   displayColorHex(domainitem.EquipmentDisplayColorFromColorCode(colorCode)),
	}
}

func (r *GameDataLinkResolver) resolveItemInstanceLink(it *domainitem.Item, token Token) ResolvedLink {
	name := strings.TrimSpace(token.Name)
	if r.gameData != nil {
		if template := r.gameData.GetItem(it.TemplateID); template != nil && strings.TrimSpace(template.Name) != "" {
			name = template.Name
		}
	}
	if name == "" {
		name = token.Name
	}
	return ResolvedLink{
		Name:    name,
		Display: name,
		Color:   displayColorHex(resolveItemInstanceDisplayColor(it, r.gameData)),
	}
}

func resolveEquipmentInstanceColorCode(it *domainitem.Item, gameData *gamedata.Manager) int {
	if it == nil {
		return 0
	}

	colorCode := domainitem.NormalizeEquipmentColorCode(it.ColorCode)
	if colorCode <= 0 {
		if value, ok := intValueOK(it.Properties["colorCode"]); ok {
			colorCode = domainitem.NormalizeEquipmentColorCode(value)
		}
	}
	if colorCode <= 0 {
		if displayColor, ok := intValueOK(it.Properties["color"]); ok {
			colorCode = domainitem.EquipmentColorCodeFromDisplayColor(displayColor)
		}
	}
	if colorCode <= 0 && gameData != nil {
		if template := gameData.GetEquipment(it.TemplateID); template != nil {
			colorCode = domainitem.NormalizeEquipmentColorCode(int(template.ColorCode))
			if colorCode <= 0 {
				colorCode = domainitem.NormalizeEquipmentColorCode(int(template.Color))
			}
		}
	}
	return colorCode
}

func resolveItemInstanceDisplayColor(it *domainitem.Item, gameData *gamedata.Manager) int {
	if it == nil {
		return -1
	}

	displayColor := it.ColorCode
	if displayColor < 0 {
		displayColor = -1
	}
	if displayColor <= 0 {
		if value, ok := intValueOK(it.Properties["color"]); ok {
			displayColor = value
		}
	}
	if displayColor <= 0 {
		if value, ok := intValueOK(it.Properties["colorCode"]); ok {
			displayColor = value
		}
	}
	if displayColor <= 0 && gameData != nil {
		if template := gameData.GetItem(it.TemplateID); template != nil {
			colorCode := domainitem.NormalizeEquipmentColorCode(int(template.ColorCode))
			if colorCode > 0 {
				return domainitem.EquipmentDisplayColorFromColorCode(colorCode)
			}
			return int(template.Color)
		}
	}
	return displayColor
}

func intValueOK(value interface{}) (int, bool) {
	switch v := value.(type) {
	case int:
		return v, true
	case int32:
		return int(v), true
	case int64:
		return int(v), true
	case float32:
		return int(v), true
	case float64:
		return int(v), true
	default:
		return 0, false
	}
}
