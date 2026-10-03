// Open-sourced by BaoLT

// Activity application helpers for PM findback normalization.
package activity

import (
	"sort"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata/models"
)

const (
	pmFindbackStateKey = "pmFindbackState"
	pmFindbackAuditKey = "pmFindbackAudit"
)

func (s *PremiumService) normalizePMFindback(char *domainchar.Character, now time.Time) bool {
	if char == nil {
		return false
	}

	if !char.HasActiveVIP(now) {
		return pmClearFindbackState(char)
	}

	if s.gameData == nil {
		return false
	}

	level := char.CurrentPMLevel(now)
	entitled := s.pmFindbackEntitled(level)
	currentDay := pmToString(pmCurrentCycleDay(now, pmOperationCountConfig{CycleType: 1, Window: 1, MaxCount: 1}))
	trackedDay, trackedRights := pmReadFindbackAudit(char.PMProcessData)
	grantedDay := pmReadFindbackStateDay(char.PMProcessData)
	currentRights := []int{}
	changed := false

	if !entitled {
		if char.PMFindback {
			char.PMFindback = false
			changed = true
		}
	} else {
		currentRights = s.pmEligibleDailyFindbackRights(level)
		if trackedDay != "" && trackedDay != currentDay && grantedDay != currentDay && s.pmHasMissedTrackedDailyRights(char.PMProcessData, trackedDay, trackedRights) {
			if char.PMProcessData == nil {
				char.PMProcessData = map[string]interface{}{}
			}
			pmWriteFindbackState(char.PMProcessData, currentDay)
			if !char.PMFindback {
				char.PMFindback = true
			}
			changed = true
		}
	}

	if trackedDay != currentDay || !pmIntSlicesEqual(trackedRights, currentRights) {
		if char.PMProcessData == nil {
			char.PMProcessData = map[string]interface{}{}
		}
		pmWriteFindbackAudit(char.PMProcessData, currentDay, currentRights)
		changed = true
	}

	return changed
}

func (s *PremiumService) pmFindbackEntitled(level int) bool {
	right := s.gameData.GetPmRight(24)
	if right == nil {
		return false
	}
	return pmFindbackRightEnabledForLevel(right, level)
}

func (s *PremiumService) pmEligibleDailyFindbackRights(level int) []int {
	if s.gameData == nil || level <= 0 {
		return nil
	}

	rights := s.gameData.GetAllPmRights()
	if len(rights) == 0 {
		return nil
	}

	eligible := make([]int, 0, len(rights))
	for _, right := range rights {
		if right == nil || int(right.Type) != 2 {
			continue
		}
		cfg := parsePMOperationCountConfig(right.CountConfig)
		if cfg.CycleType != 1 {
			continue
		}
		if !pmFindbackRightEnabledForLevel(right, level) {
			continue
		}
		eligible = append(eligible, right.GetID())
	}

	sort.Ints(eligible)
	return eligible
}

func (s *PremiumService) pmHasMissedTrackedDailyRights(pmProcessData map[string]interface{}, trackedDay string, rightIDs []int) bool {
	if s.gameData == nil || trackedDay == "" || len(rightIDs) == 0 {
		return false
	}

	for _, id := range rightIDs {
		right := s.gameData.GetPmRight(id)
		if right == nil {
			continue
		}
		cfg := parsePMOperationCountConfig(right.CountConfig)
		progress, ok := pmReadProgress(pmProcessData, id)
		if !ok {
			return true
		}
		if progress.Type != cfg.CycleType {
			return true
		}
		if pmToString(progress.Day) != trackedDay {
			return true
		}
		if progress.Time < cfg.MaxCount {
			return true
		}
	}

	return false
}

func pmClearFindbackState(char *domainchar.Character) bool {
	if char == nil {
		return false
	}

	changed := false
	if char.PMFindback {
		char.PMFindback = false
		changed = true
	}
	if len(char.PMProcessData) == 0 {
		return changed
	}
	if _, ok := char.PMProcessData[pmFindbackStateKey]; ok {
		delete(char.PMProcessData, pmFindbackStateKey)
		changed = true
	}
	if _, ok := char.PMProcessData[pmFindbackAuditKey]; ok {
		delete(char.PMProcessData, pmFindbackAuditKey)
		changed = true
	}
	return changed
}

func pmReadFindbackAudit(pmProcessData map[string]interface{}) (string, []int) {
	if len(pmProcessData) == 0 {
		return "", nil
	}

	raw, ok := pmProcessData[pmFindbackAuditKey]
	if !ok {
		return "", nil
	}

	entry, ok := raw.(map[string]interface{})
	if !ok {
		return "", nil
	}

	rights := pmReadFindbackRights(entry["rights"])
	sort.Ints(rights)
	return pmToString(entry["day"]), rights
}

func pmReadFindbackRights(value interface{}) []int {
	switch typed := value.(type) {
	case []int:
		copied := append([]int(nil), typed...)
		return copied
	case []interface{}:
		rights := make([]int, 0, len(typed))
		for _, raw := range typed {
			id, ok := pmToInt(raw)
			if !ok || id <= 0 {
				continue
			}
			rights = append(rights, id)
		}
		return rights
	default:
		return nil
	}
}

func pmReadFindbackStateDay(pmProcessData map[string]interface{}) string {
	if len(pmProcessData) == 0 {
		return ""
	}

	raw, ok := pmProcessData[pmFindbackStateKey]
	if !ok {
		return ""
	}

	entry, ok := raw.(map[string]interface{})
	if !ok {
		return ""
	}

	return pmToString(entry["day"])
}

func pmWriteFindbackAudit(pmProcessData map[string]interface{}, day string, rightIDs []int) {
	rights := make([]interface{}, 0, len(rightIDs))
	for _, id := range rightIDs {
		rights = append(rights, id)
	}
	pmProcessData[pmFindbackAuditKey] = map[string]interface{}{
		"day":    day,
		"rights": rights,
	}
}

func pmWriteFindbackState(pmProcessData map[string]interface{}, day string) {
	pmProcessData[pmFindbackStateKey] = map[string]interface{}{
		"day": day,
	}
}

func pmFindbackRightEnabledForLevel(right *models.PmRightTemplate, level int) bool {
	switch pmFindbackClampLevel(level) {
	case 1:
		return right.Vip1 > 0
	case 2:
		return right.Vip2 > 0
	case 3:
		return right.Vip3 > 0
	case 4:
		return right.Vip4 > 0
	case 5:
		return right.Vip5 > 0
	case 6:
		return right.Vip6 > 0
	case 7:
		return right.Vip7 > 0
	case 8:
		return right.Vip8 > 0
	case 9:
		return right.Vip9 > 0
	default:
		return false
	}
}

func pmFindbackClampLevel(level int) int {
	if level < 1 {
		return 1
	}
	if level > 9 {
		return 9
	}
	return level
}

func pmIntSlicesEqual(left []int, right []int) bool {
	if len(left) != len(right) {
		return false
	}
	for index := range left {
		if left[index] != right[index] {
			return false
		}
	}
	return true
}
