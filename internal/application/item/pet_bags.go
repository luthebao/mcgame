// Open-sourced by BaoLT

package item

import (
	"context"
	"fmt"
	"regexp"
	"slices"
	"strconv"
	"strings"
	"unicode"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainpet "mcgame-server/internal/domain/pet"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"
)

type petSummonCandidate struct {
	TemplateID int
	Count      int
	Start      int
	End        int
	Alias      string
	MatchKind  int
}

func (s *Service) tryApplyPetBagEffect(ctx context.Context, char *character.Character, tpl *models.ItemTemplateTemplate) (map[string]interface{}, bool, error) {
	if !isPetSummonBoxTemplate(tpl) {
		return nil, false, nil
	}
	if s.gameDataRec == nil || s.petService == nil {
		return nil, true, pkgerrors.ErrSystemError
	}

	templateIDs, err := s.resolvePetBagTemplateIDs(tpl)
	if err != nil {
		return nil, true, err
	}

	pets, err := s.petService.ContractPets(ctx, char.ID, templateIDs)
	if err != nil {
		return nil, true, err
	}

	petDTOs := make([]map[string]interface{}, 0, len(pets))
	for _, pet := range pets {
		if pet == nil {
			continue
		}
		petDTOs = append(petDTOs, pet.ToDTO())
	}

	result := map[string]interface{}{
		"pets":     petDTOs,
		"raw_pets": pets,
	}

	if len(petDTOs) == 1 {
		result["message"] = fmt.Sprintf("Bạn nhận được pet %s.", pets[0].Name)
	} else if len(petDTOs) > 1 {
		result["message"] = fmt.Sprintf("Bạn nhận được %d pet.", len(petDTOs))
	}

	return result, true, nil
}

func isPetSummonBoxTemplate(tpl *models.ItemTemplateTemplate) bool {
	if tpl == nil || int(tpl.UseType) != 1 {
		return false
	}
	if int(tpl.Type) != 508 && int(tpl.Type) != 550 {
		return false
	}
	text := normalizePetSummonText(tpl.Name + " " + tpl.Description)
	return strings.Contains(text, " pet ")
}

func (s *Service) resolvePetBagTemplateIDs(tpl *models.ItemTemplateTemplate) ([]int, error) {
	text := normalizePetSummonText(tpl.Name + " " + tpl.Description)
	if text == "" {
		return nil, pkgerrors.ErrCannotUseItem
	}
	if strings.Contains(text, " chon nhan ") || strings.Contains(text, " tu chon ") || strings.Contains(text, " 1 trong ") || strings.Contains(text, " mo chon nhan ") {
		return nil, pkgerrors.ErrCannotUseItem
	}
	if strings.Contains(text, " pet he ") {
		return nil, pkgerrors.ErrCannotUseItem
	}

	candidates := collectPetSummonCandidates(text, s.gameDataRec.GetAllCreatures())
	if len(candidates) == 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	if strings.Contains(text, " hoac ") && !hasExplicitPetCount(candidates) {
		selected := candidates[s.randomIntInclusive(0, len(candidates)-1)]
		return []int{selected.TemplateID}, nil
	}

	templateIDs := make([]int, 0)
	for _, candidate := range candidates {
		for remaining := 0; remaining < candidate.Count; remaining++ {
			templateIDs = append(templateIDs, candidate.TemplateID)
		}
	}

	if len(templateIDs) == 0 {
		return nil, pkgerrors.ErrCannotUseItem
	}

	return templateIDs, nil
}

func collectPetSummonCandidates(text string, creatures []*models.CreatureTemplate) []petSummonCandidate {
	rawCandidates := make([]petSummonCandidate, 0)
	for _, creature := range creatures {
		if creature == nil || creature.ID <= 0 || strings.TrimSpace(creature.Name) == "" {
			continue
		}
		for _, alias := range creatureSummonAliases(creature.Name) {
			countCandidates := matchExplicitPetCount(text, alias, int(creature.ID))
			rawCandidates = append(rawCandidates, countCandidates...)
			rawCandidates = append(rawCandidates, matchSinglePet(text, alias, int(creature.ID))...)
		}
	}

	if len(rawCandidates) == 0 {
		return nil
	}

	slices.SortFunc(rawCandidates, func(left, right petSummonCandidate) int {
		if left.Start != right.Start {
			return left.Start - right.Start
		}
		if left.End != right.End {
			return right.End - left.End
		}
		if left.MatchKind != right.MatchKind {
			return right.MatchKind - left.MatchKind
		}
		return strings.Compare(left.Alias, right.Alias)
	})

	selected := make([]petSummonCandidate, 0)
	coveredUntil := -1
	for _, candidate := range rawCandidates {
		if candidate.Start < coveredUntil {
			continue
		}
		selected = append(selected, candidate)
		coveredUntil = candidate.End
	}

	merged := make(map[int]petSummonCandidate)
	for _, candidate := range selected {
		existing, ok := merged[candidate.TemplateID]
		if !ok {
			merged[candidate.TemplateID] = candidate
			continue
		}
		existing.Count += candidate.Count
		merged[candidate.TemplateID] = existing
	}

	result := make([]petSummonCandidate, 0, len(merged))
	for _, candidate := range merged {
		result = append(result, candidate)
	}

	slices.SortFunc(result, func(left, right petSummonCandidate) int {
		if left.Start != right.Start {
			return left.Start - right.Start
		}
		return left.TemplateID - right.TemplateID
	})

	return result
}

func creatureSummonAliases(name string) []string {
	normalized := strings.TrimSpace(normalizePetSummonText(name))
	if normalized == "" {
		return nil
	}

	aliases := []string{normalized}
	withoutBrackets := strings.TrimSpace(bracketSegmentPattern.ReplaceAllString(normalized, " "))
	withoutBrackets = strings.Join(strings.Fields(withoutBrackets), " ")
	if withoutBrackets != "" && withoutBrackets != normalized {
		aliases = append(aliases, withoutBrackets)
	}

	return slices.Compact(aliases)
}

func matchExplicitPetCount(text string, alias string, templateID int) []petSummonCandidate {
	pattern := regexp.MustCompile(`(\d+)\s+pet\s+` + regexp.QuoteMeta(alias))
	matches := pattern.FindAllStringSubmatchIndex(text, -1)
	result := make([]petSummonCandidate, 0, len(matches))
	for _, match := range matches {
		if len(match) < 4 {
			continue
		}
		count, err := strconv.Atoi(text[match[2]:match[3]])
		if err != nil || count <= 0 {
			continue
		}
		result = append(result, petSummonCandidate{
			TemplateID: templateID,
			Count:      count,
			Start:      match[0],
			End:        match[1],
			Alias:      alias,
			MatchKind:  2,
		})
	}
	return result
}

func matchSinglePet(text string, alias string, templateID int) []petSummonCandidate {
	pattern := regexp.MustCompile(`(^| )pet\s+` + regexp.QuoteMeta(alias) + `( |$)`)
	matches := pattern.FindAllStringIndex(text, -1)
	result := make([]petSummonCandidate, 0, len(matches))
	for _, match := range matches {
		result = append(result, petSummonCandidate{
			TemplateID: templateID,
			Count:      1,
			Start:      match[0],
			End:        match[1],
			Alias:      alias,
			MatchKind:  1,
		})
	}
	return result
}

func hasExplicitPetCount(candidates []petSummonCandidate) bool {
	for _, candidate := range candidates {
		if candidate.Count > 1 || candidate.MatchKind >= 2 {
			return true
		}
	}
	return false
}

func normalizePetSummonText(value string) string {
	if strings.TrimSpace(value) == "" {
		return ""
	}

	lowered := strings.ToLower(vietnameseSummonReplacer.Replace(value))
	var builder strings.Builder
	builder.Grow(len(lowered) + 2)
	builder.WriteByte(' ')
	lastSpace := true
	for _, r := range lowered {
		if unicode.Is(unicode.Mn, r) || unicode.Is(unicode.Me, r) || unicode.Is(unicode.Mc, r) {
			continue
		}
		if unicode.IsLetter(r) || unicode.IsDigit(r) {
			builder.WriteRune(r)
			lastSpace = false
			continue
		}
		if !lastSpace {
			builder.WriteByte(' ')
			lastSpace = true
		}
	}
	if !lastSpace {
		builder.WriteByte(' ')
	}
	return builder.String()
}

var bracketSegmentPattern = regexp.MustCompile(`[\(\[\{].*?[\)\]\}]`)

var vietnameseSummonReplacer = strings.NewReplacer(
	"à", "a", "á", "a", "ạ", "a", "ả", "a", "ã", "a",
	"â", "a", "ầ", "a", "ấ", "a", "ậ", "a", "ẩ", "a", "ẫ", "a",
	"ă", "a", "ằ", "a", "ắ", "a", "ặ", "a", "ẳ", "a", "ẵ", "a",
	"è", "e", "é", "e", "ẹ", "e", "ẻ", "e", "ẽ", "e",
	"ê", "e", "ề", "e", "ế", "e", "ệ", "e", "ể", "e", "ễ", "e",
	"ì", "i", "í", "i", "ị", "i", "ỉ", "i", "ĩ", "i",
	"ò", "o", "ó", "o", "ọ", "o", "ỏ", "o", "õ", "o",
	"ô", "o", "ồ", "o", "ố", "o", "ộ", "o", "ổ", "o", "ỗ", "o",
	"ơ", "o", "ờ", "o", "ớ", "o", "ợ", "o", "ở", "o", "ỡ", "o",
	"ù", "u", "ú", "u", "ụ", "u", "ủ", "u", "ũ", "u",
	"ư", "u", "ừ", "u", "ứ", "u", "ự", "u", "ử", "u", "ữ", "u",
	"ỳ", "y", "ý", "y", "ỵ", "y", "ỷ", "y", "ỹ", "y",
	"đ", "d",
)

type petBagEffectHandler struct {
	service *Service
}

func (h *petBagEffectHandler) CanHandle(tpl *models.ItemTemplateTemplate) bool {
	if !isPetSummonBoxTemplate(tpl) {
		return false
	}
	text := normalizePetSummonText(tpl.Name + " " + tpl.Description)
	if strings.Contains(text, " chon nhan ") ||
		strings.Contains(text, " tu chon ") ||
		strings.Contains(text, " 1 trong ") ||
		strings.Contains(text, " mo chon nhan ") {
		return false
	}
	return true
}

func (h *petBagEffectHandler) Apply(ctx context.Context, uctx *UseContext, char *character.Character, it *domainitem.Item, tpl *models.ItemTemplateTemplate) (*ItemEffectResult, error) {
	raw, _, err := h.service.tryApplyPetBagEffect(ctx, char, tpl)
	if err != nil {
		return nil, err
	}

	result := NewEffectResult()

	if msg, ok := raw["message"].(string); ok {
		result.Message = msg
	}

	if rawPets, ok := raw["raw_pets"].([]*domainpet.Pet); ok {
		result.Pets = rawPets
	}

	return result, nil
}
