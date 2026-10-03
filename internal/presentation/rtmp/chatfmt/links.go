// Open-sourced by BaoLT

package chatfmt

import (
	"fmt"
	"html"
	"regexp"
	"strconv"
	"strings"
)

var chatLinkTokenPattern = regexp.MustCompile(`\[@([A-Z]+)\|(-?\d+)\|([^|\]]+)(?:\|(-?\d+))?(?:\|(-?\d+))?(?:\|(-?\d+))?\]`)

type LinkType string

const (
	LinkTypeNPC               LinkType = "N"
	LinkTypeMap               LinkType = "MA"
	LinkTypeMapPosition       LinkType = "POS"
	LinkTypeEventTooltip      LinkType = "ET"
	LinkTypeItemTemplate      LinkType = "ITT"
	LinkTypeItemInstance      LinkType = "IT"
	LinkTypeEquipmentTemplate LinkType = "EQT"
	LinkTypeEquipmentInstance LinkType = "EQ"
	LinkTypePet               LinkType = "PET"
	LinkTypeMonster           LinkType = "M"
	LinkTypeSkill             LinkType = "SK"
	LinkTypeQuest             LinkType = "Q"
	LinkTypeRecipe            LinkType = "RECIPE"
	LinkTypeTitle             LinkType = "TITLE"
	LinkTypePlayer            LinkType = "PID"
	LinkTypePanel             LinkType = "P"
	LinkTypeHelp              LinkType = "HELP"
	LinkTypeAchievement       LinkType = "ACH"
	LinkTypeSoul              LinkType = "SOUL"
	LinkTypeMedal             LinkType = "MEDAL"
	LinkTypeTalent            LinkType = "TALENT"
	LinkTypeActivity          LinkType = "ACTIVITY"
)

type Link struct {
	Type    LinkType
	ID      int64
	Name    string
	Display string
	Color   string
}

type Token struct {
	Type        LinkType
	ID          int64
	Name        string
	ColorIndex  int
	PrefixIndex int
	ExtraIndex  int
}

type ResolvedLink struct {
	Name    string
	Display string
	Color   string
}

type LinkResolver interface {
	ResolveChatLink(token Token) ResolvedLink
}

type LinkResolverFunc func(token Token) ResolvedLink

func (f LinkResolverFunc) ResolveChatLink(token Token) ResolvedLink {
	if f == nil {
		return ResolvedLink{}
	}
	return f(token)
}

func FormatLink(link Link) string {
	linkType := strings.TrimSpace(string(link.Type))
	name := strings.TrimSpace(link.Name)
	if linkType == "" || link.ID <= 0 || name == "" {
		return ""
	}

	display := strings.TrimSpace(link.Display)
	if display == "" {
		display = name
	}

	label := formatLinkLabel(display)
	anchor := fmt.Sprintf(
		`<a href="event:L_%s|%d|%s">%s</a>`,
		html.EscapeString(linkType),
		link.ID,
		html.EscapeString(name),
		html.EscapeString(label),
	)

	color := normalizeLinkColor(link.Color)
	if color == "" {
		return anchor
	}

	return fmt.Sprintf(`<font color="%s">%s</font>`, html.EscapeString(color), anchor)
}

func ExpandTokens(text string) string {
	return ExpandTokensWithResolver(text, nil)
}

func ExpandTokensWithResolver(text string, resolver LinkResolver) string {
	if text == "" {
		return ""
	}

	matches := chatLinkTokenPattern.FindAllStringSubmatchIndex(text, -1)
	if len(matches) == 0 {
		return text
	}

	var builder strings.Builder
	last := 0
	for _, match := range matches {
		start, end := match[0], match[1]
		builder.WriteString(text[last:start])

		token, ok := parseTokenMatch(text, match)
		if !ok {
			builder.WriteString(text[start:end])
			last = end
			continue
		}

		link := resolvedTokenLink(token, resolver)
		if !isInsideFontWrapper(text, start, end) {
			link.Color = normalizeLinkColor(link.Color)
		} else {
			link.Color = ""
		}

		formatted := FormatLink(Link{
			Type:    token.Type,
			ID:      token.ID,
			Name:    link.Name,
			Display: link.Display,
			Color:   link.Color,
		})
		if formatted == "" {
			builder.WriteString(text[start:end])
			last = end
			continue
		}
		builder.WriteString(formatted)
		last = end
	}
	builder.WriteString(text[last:])
	return builder.String()
}

func formatLinkLabel(display string) string {
	trimmed := strings.TrimSpace(display)
	if trimmed == "" {
		return "[]"
	}
	if (strings.HasPrefix(trimmed, "[") && strings.HasSuffix(trimmed, "]")) ||
		(strings.HasPrefix(trimmed, "【") && strings.HasSuffix(trimmed, "】")) {
		return trimmed
	}
	return "[" + trimmed + "]"
}

func normalizeLinkColor(color string) string {
	trimmed := strings.TrimSpace(color)
	if trimmed == "" {
		return ""
	}
	if strings.HasPrefix(trimmed, "#") {
		return strings.ToUpper(trimmed)
	}
	return "#" + strings.ToUpper(trimmed)
}

func parseTokenMatch(text string, match []int) (Token, bool) {
	if len(match) < 8 {
		return Token{}, false
	}

	id, err := strconv.ParseInt(text[match[4]:match[5]], 10, 64)
	if err != nil || id <= 0 {
		return Token{}, false
	}

	token := Token{
		Type: LinkType(text[match[2]:match[3]]),
		ID:   id,
		Name: text[match[6]:match[7]],
	}
	token.ColorIndex = parseOptionalTokenInt(text, match, 8)
	token.PrefixIndex = parseOptionalTokenInt(text, match, 10)
	token.ExtraIndex = parseOptionalTokenInt(text, match, 12)
	return token, true
}

func parseOptionalTokenInt(text string, match []int, offset int) int {
	if len(match) <= offset+1 || match[offset] < 0 || match[offset+1] < 0 {
		return 0
	}

	value, err := strconv.Atoi(text[match[offset]:match[offset+1]])
	if err != nil {
		return 0
	}
	return value
}

func resolvedTokenLink(token Token, resolver LinkResolver) ResolvedLink {
	link := ResolvedLink{
		Name:    token.Name,
		Display: token.Name,
		Color:   defaultTokenColor(token),
	}
	if resolver != nil {
		resolved := resolver.ResolveChatLink(token)
		if name := strings.TrimSpace(resolved.Name); name != "" {
			link.Name = name
		}
		if display := strings.TrimSpace(resolved.Display); display != "" {
			link.Display = display
		}
		if color := normalizeLinkColor(resolved.Color); color != "" {
			link.Color = color
		}
	}
	return link
}

func defaultTokenColor(token Token) string {
	if color := fixedLinkTypeColor(token.Type); color != "" {
		return color
	}
	return indexedLinkColor(token.ColorIndex)
}

func fixedLinkTypeColor(linkType LinkType) string {
	switch linkType {
	case LinkTypeNPC:
		return "#FFCC00"
	case LinkTypePlayer:
		return "#FF9900"
	case LinkTypeMonster:
		return "#FF0000"
	case LinkTypeSkill:
		return "#3399CC"
	case LinkTypeMap, LinkTypeMapPosition:
		return "#33FF66"
	case LinkTypeHelp, LinkTypeActivity:
		return "#00FF00"
	default:
		return ""
	}
}

func indexedLinkColor(index int) string {
	switch index {
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
	case 5:
		return "#FF0000"
	case 6:
		return "#33CCAA"
	default:
		return ""
	}
}

func isInsideFontWrapper(text string, start int, end int) bool {
	lower := strings.ToLower(text)
	lastOpen := strings.LastIndex(lower[:start], "<font")
	if lastOpen < 0 {
		return false
	}
	lastClose := strings.LastIndex(lower[:start], "</font>")
	if lastClose > lastOpen {
		return false
	}
	nextClose := strings.Index(lower[end:], "</font>")
	return nextClose >= 0
}
