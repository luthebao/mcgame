// Open-sourced by BaoLT

// Heiyaoshi static config loaded from data.data_tbl_heiyaoshi_* via gameDataManager.
package heiyaoshi

import (
	"bytes"
	"encoding/json"
	"fmt"
	"sort"
	"strconv"

	"mcgame-server/internal/gamedata"
)

const (
	MinFigure        = 1
	MaxFigure        = 20
	Stage1MaxFigure  = 10
	TypeNumStoneOne  = 1
	TypeNumStoneTwo  = 2
	GMResetMinLevel  = 5
	MaxFigureForArea = 10
	
)

type Point struct {
	Price      int
	Gold       int
	Around     []int
	Area       []int
	AroundLine []int
}

type Area struct {
	LResNum   int64
	AResNum   int64
	Attribute map[int]float64
}

type configData struct {
	pointFigure    map[int]map[int]Point
	triangleFigure map[int]map[int]Area
	allHeiyaoshi   map[int]map[int]float64
	rawTriangle    map[string]any
}

var cfg *configData

func InitFromGameData(mgr *gamedata.Manager) error {
	points := mgr.GetAllHeiyaoshiPoints()
	links := mgr.GetAllHeiyaoshiPointLinks()
	areas := mgr.GetAllHeiyaoshiAreas()
	attrs := mgr.GetAllHeiyaoshiAreaAttrs()
	buffs := mgr.GetAllHeiyaoshiFullBuffs()

	if len(points) == 0 {
		return fmt.Errorf("heiyaoshi: no point rows in database")
	}

	type linkKey struct{ figure, pointID int }
	type linkEntry struct{ ord, neighborID int }
	type pointLinks struct {
		around, area, aroundLine []linkEntry
	}
	linksByPoint := make(map[linkKey]pointLinks, len(points))
	for _, l := range links {
		k := linkKey{l.Figure, l.PointID}
		pl := linksByPoint[k]
		switch l.LinkType {
		case "around":
			pl.around = append(pl.around, linkEntry{l.Ord, l.NeighborID})
		case "area":
			pl.area = append(pl.area, linkEntry{l.Ord, l.NeighborID})
		case "around_line":
			pl.aroundLine = append(pl.aroundLine, linkEntry{l.Ord, l.NeighborID})
		}
		linksByPoint[k] = pl
	}
	for k, pl := range linksByPoint {
		sort.Slice(pl.around, func(i, j int) bool { return pl.around[i].ord < pl.around[j].ord })
		sort.Slice(pl.area, func(i, j int) bool { return pl.area[i].ord < pl.area[j].ord })
		sort.Slice(pl.aroundLine, func(i, j int) bool { return pl.aroundLine[i].ord < pl.aroundLine[j].ord })
		linksByPoint[k] = pl
	}

	type areaKey struct{ figure, areaID int }
	attrsByArea := make(map[areaKey]map[int]float64, len(attrs))
	for _, at := range attrs {
		k := areaKey{at.Figure, at.AreaID}
		if attrsByArea[k] == nil {
			attrsByArea[k] = make(map[int]float64)
		}
		attrsByArea[k][at.PropID] = at.Value
	}

	out := &configData{
		pointFigure:    make(map[int]map[int]Point, MaxFigure),
		triangleFigure: make(map[int]map[int]Area, Stage1MaxFigure),
		allHeiyaoshi:   make(map[int]map[int]float64, MaxFigure),
		rawTriangle:    make(map[string]any, Stage1MaxFigure),
	}

	toInts := func(entries []linkEntry) []int {
		if len(entries) == 0 {
			return nil
		}
		s := make([]int, len(entries))
		for i, e := range entries {
			s[i] = e.neighborID
		}
		return s
	}
	for _, p := range points {
		if out.pointFigure[p.Figure] == nil {
			out.pointFigure[p.Figure] = make(map[int]Point)
		}
		k := linkKey{p.Figure, p.PointID}
		pl := linksByPoint[k]
		out.pointFigure[p.Figure][p.PointID] = Point{
			Price:      p.Price,
			Gold:       p.Gold,
			Around:     toInts(pl.around),
			Area:       toInts(pl.area),
			AroundLine: toInts(pl.aroundLine),
		}
	}

	for _, a := range areas {
		if out.triangleFigure[a.Figure] == nil {
			out.triangleFigure[a.Figure] = make(map[int]Area)
		}
		k := areaKey{a.Figure, a.AreaID}
		attrMap := attrsByArea[k]
		if attrMap == nil {
			attrMap = make(map[int]float64)
		}
		out.triangleFigure[a.Figure][a.AreaID] = Area{
			LResNum:   a.LResNum,
			AResNum:   a.AResNum,
			Attribute: attrMap,
		}

		figKey := strconv.Itoa(a.Figure)
		areaKeyStr := strconv.Itoa(a.AreaID)
		figMap, ok := out.rawTriangle[figKey].(map[string]any)
		if !ok {
			figMap = make(map[string]any)
			out.rawTriangle[figKey] = figMap
		}
		rawAttr := make(map[string]any, len(attrMap))
		for propID, v := range attrMap {
			rawAttr[strconv.Itoa(propID)] = v
		}
		figMap[areaKeyStr] = map[string]any{
			"LResNum":   float64(a.LResNum),
			"AResNum":   float64(a.AResNum),
			"attribute": rawAttr,
		}
	}

	for i := MinFigure; i <= Stage1MaxFigure; i++ {
		key := strconv.Itoa(i)
		advKey := strconv.Itoa(i + Stage1MaxFigure)
		if v, ok := out.rawTriangle[key]; ok {
			if figMap, ok := v.(map[string]any); ok {
				out.rawTriangle[advKey] = scaleRawTriangleFigure(figMap)
			} else {
				out.rawTriangle[advKey] = v
			}
		}
	}

	for _, b := range buffs {
		if out.allHeiyaoshi[b.Figure] == nil {
			out.allHeiyaoshi[b.Figure] = make(map[int]float64)
		}
		out.allHeiyaoshi[b.Figure][b.PropID] = b.Value
	}

	cfg = out
	return nil
}

func InitFromConfigBlob(blob []byte) error {
	c, err := loadConfigFromJSON(blob)
	if err != nil {
		return err
	}
	cfg = c
	return nil
}

func loadConfigFromJSON(blob []byte) (*configData, error) {
	var raw struct {
		PointFigure map[string]map[string]struct {
			Price      json.Number `json:"price"`
			Gold       json.Number `json:"gold"`
			Around     []int       `json:"around"`
			Area       []int       `json:"area"`
			AroundLine []int       `json:"aroundLine"`
		} `json:"POINT_FIGURE"`
		TriangleFigure map[string]map[string]struct {
			LResNum   json.Number            `json:"LResNum"`
			AResNum   json.Number            `json:"AResNum"`
			Attribute map[string]json.Number `json:"attribute"`
		} `json:"TRIANGLE_FIGURE"`
		AllHeiyaoshi map[string]map[string]json.Number `json:"ALL_HEIYAOSHI"`
	}
	dec := json.NewDecoder(bytes.NewReader(blob))
	dec.UseNumber()
	if err := dec.Decode(&raw); err != nil {
		return nil, err
	}

	out := &configData{
		pointFigure:    make(map[int]map[int]Point, len(raw.PointFigure)),
		triangleFigure: make(map[int]map[int]Area, len(raw.TriangleFigure)),
		allHeiyaoshi:   make(map[int]map[int]float64, len(raw.AllHeiyaoshi)),
	}

	for figureKey, points := range raw.PointFigure {
		figure, err := strconv.Atoi(figureKey)
		if err != nil {
			return nil, fmt.Errorf("POINT_FIGURE figure key %q: %w", figureKey, err)
		}
		bucket := make(map[int]Point, len(points))
		for pointKey, p := range points {
			pointID, err := strconv.Atoi(pointKey)
			if err != nil {
				return nil, fmt.Errorf("POINT_FIGURE[%d] point key %q: %w", figure, pointKey, err)
			}
			price, _ := p.Price.Int64()
			gold, _ := p.Gold.Int64()
			bucket[pointID] = Point{
				Price:      int(price),
				Gold:       int(gold),
				Around:     append([]int(nil), p.Around...),
				Area:       append([]int(nil), p.Area...),
				AroundLine: append([]int(nil), p.AroundLine...),
			}
		}
		out.pointFigure[figure] = bucket
	}

	for figureKey, areas := range raw.TriangleFigure {
		figure, err := strconv.Atoi(figureKey)
		if err != nil {
			return nil, fmt.Errorf("TRIANGLE_FIGURE figure key %q: %w", figureKey, err)
		}
		bucket := make(map[int]Area, len(areas))
		for areaKey, a := range areas {
			areaID, err := strconv.Atoi(areaKey)
			if err != nil {
				return nil, fmt.Errorf("TRIANGLE_FIGURE[%d] area key %q: %w", figure, areaKey, err)
			}
			lRes, _ := a.LResNum.Int64()
			aRes, _ := a.AResNum.Int64()
			attrs := make(map[int]float64, len(a.Attribute))
			for propKey, propVal := range a.Attribute {
				propID, err := strconv.Atoi(propKey)
				if err != nil {
					return nil, fmt.Errorf("TRIANGLE_FIGURE[%d][%d] prop %q: %w", figure, areaID, propKey, err)
				}
				v, _ := propVal.Float64()
				attrs[propID] = v
			}
			bucket[areaID] = Area{LResNum: lRes, AResNum: aRes, Attribute: attrs}
		}
		out.triangleFigure[figure] = bucket
	}

	for figureKey, props := range raw.AllHeiyaoshi {
		figure, err := strconv.Atoi(figureKey)
		if err != nil {
			return nil, fmt.Errorf("ALL_HEIYAOSHI figure key %q: %w", figureKey, err)
		}
		bucket := make(map[int]float64, len(props))
		for propKey, propVal := range props {
			propID, err := strconv.Atoi(propKey)
			if err != nil {
				return nil, fmt.Errorf("ALL_HEIYAOSHI[%d] prop %q: %w", figure, propKey, err)
			}
			v, _ := propVal.Float64()
			bucket[propID] = v
		}
		out.allHeiyaoshi[figure] = bucket
	}

	out.rawTriangle = make(map[string]any, len(raw.TriangleFigure))
	for figureKey, areas := range raw.TriangleFigure {
		figMap := make(map[string]any, len(areas))
		for areaKey, a := range areas {
			lRes, _ := a.LResNum.Int64()
			aRes, _ := a.AResNum.Int64()
			rawAttr := make(map[string]any, len(a.Attribute))
			for propKey, propVal := range a.Attribute {
				v, _ := propVal.Float64()
				rawAttr[propKey] = v
			}
			figMap[areaKey] = map[string]any{
				"LResNum":   float64(lRes),
				"AResNum":   float64(aRes),
				"attribute": rawAttr,
			}
		}
		out.rawTriangle[figureKey] = figMap
	}
	for i := MinFigure; i <= Stage1MaxFigure; i++ {
		key := strconv.Itoa(i)
		advKey := strconv.Itoa(i + Stage1MaxFigure)
		if v, ok := out.rawTriangle[key]; ok {
			if figMap, ok := v.(map[string]any); ok {
				out.rawTriangle[advKey] = scaleRawTriangleFigure(figMap)
			} else {
				out.rawTriangle[advKey] = v
			}
		}
	}
	return out, nil
}

func scaleRawTriangleFigure(fig map[string]any) map[string]any {
	out := make(map[string]any, len(fig))
	for areaKey, areaAny := range fig {
		areaMap, ok := areaAny.(map[string]any)
		if !ok {
			out[areaKey] = areaAny
			continue
		}
		newArea := make(map[string]any, len(areaMap))
		for k, v := range areaMap {
			newArea[k] = v
		}
		if attrAny, ok := areaMap["attribute"]; ok {
			if attrMap, ok := attrAny.(map[string]any); ok {
				newAttr := make(map[string]any, len(attrMap))
				for propKey, propVal := range attrMap {
					propID, err := strconv.Atoi(propKey)
					if err != nil {
						newAttr[propKey] = propVal
						continue
					}
					if f, ok := propVal.(float64); ok {
						newAttr[propKey] = f * stage2Multiplier(propID)
					} else {
						newAttr[propKey] = propVal
					}
				}
				newArea["attribute"] = newAttr
			}
		}
		out[areaKey] = newArea
	}
	return out
}

func LookupPoint(figure, pointID int) (Point, bool) {
	if cfg == nil {
		return Point{}, false
	}
	bucket, ok := cfg.pointFigure[figure]
	if !ok {
		return Point{}, false
	}
	p, ok := bucket[pointID]
	return p, ok
}

func PointsInFigure(figure int) map[int]Point {
	if cfg == nil {
		return nil
	}
	return cfg.pointFigure[figure]
}

func TriangleFigureForPanel() map[string]any {
	if cfg == nil {
		return nil
	}
	return cfg.rawTriangle
}

func AreaAttributes(figure, areaID int) (Area, bool) {
	if cfg == nil {
		return Area{}, false
	}
	idx := figure
	if idx > Stage1MaxFigure {
		idx -= Stage1MaxFigure
	}
	bucket, ok := cfg.triangleFigure[idx]
	if !ok {
		return Area{}, false
	}
	a, ok := bucket[areaID]
	return a, ok
}

func AreasInFigure(figure int) map[int]Area {
	if cfg == nil {
		return nil
	}
	idx := figure
	if idx > Stage1MaxFigure {
		idx -= Stage1MaxFigure
	}
	return cfg.triangleFigure[idx]
}

func FullFigureBuffs(figure int) map[int]float64 {
	if cfg == nil {
		return nil
	}
	return cfg.allHeiyaoshi[figure]
}

func IsValidFigure(figure int) bool {
	return figure >= MinFigure && figure <= MaxFigure
}

func IsStage1Figure(figure int) bool {
	return figure >= MinFigure && figure <= Stage1MaxFigure
}

func IsStage2Figure(figure int) bool {
	return figure > Stage1MaxFigure && figure <= MaxFigure
}

func PoolForFigure(figure int) int {
	if IsStage2Figure(figure) {
		return TypeNumStoneTwo
	}
	return TypeNumStoneOne
}
