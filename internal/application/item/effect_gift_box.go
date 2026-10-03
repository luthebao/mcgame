// Open-sourced by BaoLT

// Gift box effect handler for choose-one pet selection items.
// Handles items (type 508/550) with descriptions indicating player choice,
// building a GiftBoxData with creature choices for client selection UI.
package item

import (
	"context"
	"fmt"
	"regexp"
	"strconv"
	"strings"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
)

var descriptionQualityPattern = regexp.MustCompile(`phẩm chất\s+(\d+(?:[.,]\d+)?)`)

func parseDescriptionQuality(description string) int {
	m := descriptionQualityPattern.FindStringSubmatch(description)
	if len(m) < 2 {
		return 0
	}
	s := strings.ReplaceAll(m[1], ",", ".")
	f, err := strconv.ParseFloat(s, 64)
	if err != nil || f <= 0 {
		return 0
	}
	q := int(f*10 + 0.5)
	if q <= 0 || q > 250 {
		return 0
	}
	return q
}

type giftBoxEffectHandler struct {
	gameData *gamedata.Manager
}

func (h *giftBoxEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	if tpl == nil || int(tpl.UseType) != 1 {
		return false
	}
	if int(tpl.Type) != 508 && int(tpl.Type) != 550 {
		return false
	}
	text := normalizePetSummonText(tpl.Name + " " + tpl.Description)
	return strings.Contains(text, " chon nhan ") ||
		strings.Contains(text, " tu chon ") ||
		strings.Contains(text, " 1 trong ") ||
		strings.Contains(text, " mo chon nhan ")
}

func (h *giftBoxEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	result := NewEffectResult()
	result.ConsumeItem = false

	if h.gameData == nil {
		return nil, fmt.Errorf("gamedata manager not available")
	}

	creatures := h.gameData.GetAllCreatures()
	text := normalizePetSummonText(tpl.Description)
	descQuality := parseDescriptionQuality(tpl.Description)

	choices := make([]*GiftBoxChoice, 0)
	for _, creature := range creatures {
		if creature == nil || creature.ID <= 0 || strings.TrimSpace(creature.Name) == "" {
			continue
		}
		normalized := strings.TrimSpace(normalizePetSummonText(creature.Name))
		if normalized == "" {
			continue
		}
		if strings.Contains(text, " "+normalized+" ") || strings.Contains(text, " pet "+normalized+" ") {
			quality := descQuality
			if quality <= 0 {
				quality = int(creature.GrowBase * 10)
			}
			choices = append(choices, &GiftBoxChoice{
				TableType: 12,
				ID:        int(creature.ID),
				StackNum:  1,
				Quality:   quality,
			})
		}
	}

	if len(choices) == 0 {
		return nil, fmt.Errorf("no creature choices found in gift box description")
	}

	result.GiftBox = &GiftBoxData{
		Choices: choices,
		GetNum:  1,
	}

	return result, nil
}
