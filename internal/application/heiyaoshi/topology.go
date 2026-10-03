// Open-sourced by BaoLT

// Pure topology helpers: completion checks for areas/lines/figures and buff aggregation.
package heiyaoshi

import "sort"

func starterPoints(figure int) []int {
	points := PointsInFigure(figure)
	starters := make([]int, 0, 1)
	for pid, p := range points {
		if p.Price <= 0 {
			starters = append(starters, pid)
		}
	}
	sort.Ints(starters)
	return starters
}

func seedStarters(state *State, figure int) bool {
	if state == nil {
		return false
	}
	added := false
	for _, pid := range starterPoints(figure) {
		if !state.HasPoint(pid) {
			state.AddPoint(pid)
			added = true
		}
	}
	return added
}

func reconcileFigureProgress(state *State) bool {
	if state == nil {
		return false
	}
	changed := false
	guard := 0
	for guard < (MaxFigure + 1) {
		guard++
		figure := state.LastActFigure
		if figure < MinFigure || figure > MaxFigure {
			break
		}
		if seedStarters(state, figure) {
			changed = true
		}
		for areaID := range AreasInFigure(figure) {
			if state.HasArea(areaID) {
				continue
			}
			if areaIsComplete(state, figure, areaID) {
				state.MarkArea(areaID)
				changed = true
			}
		}
		for pid := range PointsInFigure(figure) {
			if !state.HasPoint(pid) {
				continue
			}
			point, _ := LookupPoint(figure, pid)
			for _, lineID := range point.AroundLine {
				if state.HasLine(lineID) {
					continue
				}
				if lineIsComplete(state, figure, lineID) {
					state.MarkLine(lineID)
					changed = true
				}
			}
		}
		if !figureIsComplete(state, figure) {
			break
		}
		state.LastActFigure = nextFigureAfter(figure)
		state.ResetCurrentFigure()
		changed = true
		if state.LastActFigure > MaxFigure {
			break
		}
	}
	return changed
}

func newlyCompletedAreas(state *State, figure, pointID int) []int {
	point, ok := LookupPoint(figure, pointID)
	if !ok {
		return nil
	}
	completed := make([]int, 0, len(point.Area))
	for _, areaID := range point.Area {
		if state.HasArea(areaID) {
			continue
		}
		if !areaIsComplete(state, figure, areaID) {
			continue
		}
		completed = append(completed, areaID)
	}
	return completed
}

func areaIsComplete(state *State, figure, areaID int) bool {
	points := PointsInFigure(figure)
	if len(points) == 0 {
		return false
	}
	for pointID, p := range points {
		if !pointBelongsToArea(p, areaID) {
			continue
		}
		if !state.HasPoint(pointID) {
			return false
		}
	}
	return true
}

func pointBelongsToArea(p Point, areaID int) bool {
	for _, a := range p.Area {
		if a == areaID {
			return true
		}
	}
	return false
}

func newlyCompletedLines(state *State, figure, pointID int) []int {
	point, ok := LookupPoint(figure, pointID)
	if !ok {
		return nil
	}
	completed := make([]int, 0, len(point.AroundLine))
	for _, lineID := range point.AroundLine {
		if state.HasLine(lineID) {
			continue
		}
		if !lineIsComplete(state, figure, lineID) {
			continue
		}
		completed = append(completed, lineID)
	}
	return completed
}

func lineIsComplete(state *State, figure, lineID int) bool {
	points := PointsInFigure(figure)
	endpointCount := 0
	for pointID, p := range points {
		if !pointBelongsToLine(p, lineID) {
			continue
		}
		if !state.HasPoint(pointID) {
			return false
		}
		endpointCount++
	}
	return endpointCount >= 2
}

func pointBelongsToLine(p Point, lineID int) bool {
	for _, l := range p.AroundLine {
		if l == lineID {
			return true
		}
	}
	return false
}

func figureIsComplete(state *State, figure int) bool {
	areas := AreasInFigure(figure)
	if len(areas) == 0 {
		return false
	}
	for areaID := range areas {
		if !state.HasArea(areaID) {
			return false
		}
	}
	return true
}

func recomputeBuffs(state *State, currentFigure int) {
	if state == nil {
		return
	}
	state.Buff = computeBuffs(state, currentFigure)
}

func stage2Multiplier(propID int) float64 {
	switch propID {
	case 1:
		return 2.0
	case 13, 31, 59, 60, 62, 63:
		return 1.5
	case 34:
		return 0.5
	default:
		return 1.0
	}
}

func computeBuffs(state *State, currentFigure int) map[int]float64 {
	totals := make(map[int]float64)
	if state == nil {
		return totals
	}
	if currentFigure < MinFigure {
		currentFigure = MinFigure
	}
	for completedFigure := MinFigure; completedFigure < currentFigure; completedFigure++ {
		scaled := IsStage2Figure(completedFigure)
		sourceFig := completedFigure
		if scaled {
			sourceFig = completedFigure - Stage1MaxFigure
		}
		for _, area := range AreasInFigure(sourceFig) {
			for propID, value := range area.Attribute {
				if scaled {
					totals[propID] += value * stage2Multiplier(propID)
				} else {
					totals[propID] += value
				}
			}
		}
		for propID, value := range FullFigureBuffs(sourceFig) {
			if scaled {
				totals[propID] += value * stage2Multiplier(propID)
			} else {
				totals[propID] += value
			}
		}
	}
	if currentFigure <= MaxFigure {
		scaled := IsStage2Figure(currentFigure)
		for areaID := range state.ActArea {
			area, ok := AreaAttributes(currentFigure, areaID)
			if !ok {
				continue
			}
			for propID, value := range area.Attribute {
				if scaled {
					totals[propID] += value * stage2Multiplier(propID)
				} else {
					totals[propID] += value
				}
			}
		}
	}
	return totals
}

func buffsEqual(a, b map[int]float64) bool {
	if len(a) != len(b) {
		return false
	}
	for k, v := range a {
		if bv, ok := b[k]; !ok || bv != v {
			return false
		}
	}
	return true
}

func nextFigureAfter(figure int) int {
	if figure < MinFigure {
		return MinFigure
	}
	return figure + 1
}
