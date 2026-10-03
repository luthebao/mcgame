// Open-sourced by BaoLT

// Decoration suit property query logic for the getDecoSuitProp RPC.
// Reads TBL_DECO_SHOW game-data to build the suit metadata reply.
// Player-activation state (actArr / actFlag) is stubbed empty until
// character_decorations is wired into the character load path.
package dress

import (
	"sort"
	"strconv"

	"mcgame-server/internal/gamedata/models"
)

type SuitPropEntry struct {
	T       int
	PropVal int
}

type DecoSuitPropResult struct {
	ActName         string
	SuitIdObj       map[string]interface{}
	SuitProp        map[string]interface{}
	ActArr          map[string]interface{}
	ActFlag         bool
	LinkProp        interface{}
	LinkFlag        bool
	ActLinkSuitFlag bool
	ActLinkSuitName string
}

func (s *Service) GetDecoSuitProp(suitID, linkSuitID, linkID int) *DecoSuitPropResult {
	shows := s.gameData.GetDecoShowsBySuitID(suitID)
	suitIdObj := buildSuitIdObj(shows)
	suitProp := buildSuitProps(shows)
	actName := extractSuitName(shows)

	result := &DecoSuitPropResult{
		ActName:         actName,
		SuitIdObj:       suitIdObj,
		SuitProp:        suitProp,
		ActArr:          map[string]interface{}{},
		ActFlag:         false,
		LinkProp:        "null",
		LinkFlag:        false,
		ActLinkSuitFlag: false,
		ActLinkSuitName: "",
	}

	if linkSuitID > 0 && linkSuitID != suitID {
		linkShows := s.gameData.GetDecoShowsBySuitID(linkSuitID)
		if len(linkShows) > 0 {
			result.ActLinkSuitName = extractSuitName(linkShows)
			linkProps := buildLinkProps(linkShows, linkID)
			if len(linkProps) > 0 {
				result.LinkProp = buildIndexedPropMap(linkProps)
			}
		}
	} else {
		if len(shows) > 0 {
			result.ActLinkSuitName = actName
		}
	}

	return result
}

func buildSuitIdObj(shows []*models.DecoShowTemplate) map[string]interface{} {
	m := make(map[string]interface{}, len(shows))
	for _, t := range shows {
		id := int(t.ID)
		m[strconv.Itoa(id)] = id
	}
	return m
}

func accumulateSuitProps(shows []*models.DecoShowTemplate) []SuitPropEntry {
	totals := make(map[int]float64)
	for _, t := range shows {
		pairs := [4]struct {
			typ int
			num float64
		}{
			{int(t.PropType1), t.PropNum1},
			{int(t.PropType2), t.PropNum2},
			{int(t.PropType3), t.PropNum3},
			{int(t.PropType4), t.PropNum4},
		}
		for _, p := range pairs {
			if p.typ > 0 {
				totals[p.typ] += p.num
			}
		}
	}
	keys := make([]int, 0, len(totals))
	for k := range totals {
		keys = append(keys, k)
	}
	sort.Ints(keys)
	out := make([]SuitPropEntry, 0, len(keys))
	for _, k := range keys {
		out = append(out, SuitPropEntry{T: k, PropVal: int(totals[k])})
	}
	return out
}

func buildSuitProps(shows []*models.DecoShowTemplate) map[string]interface{} {
	return buildIndexedPropMap(accumulateSuitProps(shows))
}

func buildLinkProps(shows []*models.DecoShowTemplate, linkID int) []SuitPropEntry {
	return accumulateSuitProps(shows)
}

func buildIndexedPropMap(props []SuitPropEntry) map[string]interface{} {
	m := make(map[string]interface{}, len(props))
	for i, p := range props {
		m[strconv.Itoa(i)] = map[string]interface{}{
			"t":       p.T,
			"propVal": p.PropVal,
		}
	}
	return m
}

func extractSuitName(shows []*models.DecoShowTemplate) string {
	if len(shows) == 0 {
		return ""
	}
	minID := shows[0]
	for _, t := range shows[1:] {
		if t.ID < minID.ID {
			minID = t
		}
	}
	return minID.Name
}
