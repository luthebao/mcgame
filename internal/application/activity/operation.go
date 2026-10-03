// Open-sourced by BaoLT

package activity

import (
	"context"
	"errors"
	"fmt"
	domainchar "mcgame-server/internal/domain/character"
	"strconv"
	"strings"
	"time"
)

var (
	ErrPMOperationInvalid        = errors.New("pm operation invalid")
	ErrPMOperationExpired        = errors.New("pm operation expired")
	ErrPMOperationAlreadyClaimed = errors.New("pm operation already claimed")
)

type PMOperationInput struct {
	Index         int
	OperationType int
	CountConfig   string
	DryRun        bool
}

type PMOperationResult struct {
	Index   int
	Day     interface{}
	Type    int
	Time    int
	PMLevel int
}

type pmOperationCountConfig struct {
	CycleType int
	Window    int
	MaxCount  int
}

type pmOperationProgress struct {
	Day  interface{}
	Type int
	Time int
}

func (s *PremiumService) DoPMOperation(ctx context.Context, characterID int64, input PMOperationInput) (*PMOperationResult, error) {
	if input.Index <= 0 {
		return nil, ErrPMOperationInvalid
	}
	if input.OperationType != 2 && input.OperationType != 4 {
		return nil, ErrPMOperationInvalid
	}

	countConfig := parsePMOperationCountConfig(input.CountConfig)

	char, now, changed, err := s.loadCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if changed && !input.DryRun {
		if err := s.persistCharacter(ctx, char); err != nil {
			return nil, err
		}
		if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
			return nil, err
		}
	}
	if !char.HasActiveVIP(now) {
		return nil, ErrPMOperationExpired
	}

	level := char.CurrentPMLevel(now)
	progress, err := resolvePMOperationProgress(char, now, input, countConfig)
	if err != nil {
		return nil, err
	}

	if input.DryRun {
		return &PMOperationResult{
			Index:   input.Index,
			Day:     progress.Day,
			Type:    progress.Type,
			Time:    progress.Time,
			PMLevel: level,
		}, nil
	}

	if char.PMProcessData == nil {
		char.PMProcessData = map[string]interface{}{}
	}
	char.PMProcessData[strconv.Itoa(input.Index)] = map[string]interface{}{
		"day":  progress.Day,
		"type": progress.Type,
		"time": progress.Time,
	}
	if input.OperationType == 4 {
		char.PMFindback = false
	}

	if err := s.persistCharacter(ctx, char); err != nil {
		return nil, err
	}
	if err := s.syncAccountVIPLevel(ctx, char, now); err != nil {
		return nil, err
	}

	return &PMOperationResult{
		Index:   input.Index,
		Day:     progress.Day,
		Type:    progress.Type,
		Time:    progress.Time,
		PMLevel: level,
	}, nil
}

func resolvePMOperationProgress(char *domainchar.Character, now time.Time, input PMOperationInput, countConfig pmOperationCountConfig) (*pmOperationProgress, error) {
	if input.OperationType == 4 {
		if !char.PMFindback {
			return nil, ErrPMOperationExpired
		}
		return &pmOperationProgress{
			Day:  now.UnixMilli(),
			Type: 4,
			Time: 1,
		}, nil
	}

	currentDay := pmCurrentCycleDay(now, countConfig)
	progress, hasProgress := pmReadProgress(char.PMProcessData, input.Index)
	currentCount := 0
	if hasProgress && pmIsSameCycle(progress, now, countConfig, currentDay) {
		currentCount = progress.Time
	}
	if currentCount >= countConfig.MaxCount {
		return nil, ErrPMOperationAlreadyClaimed
	}

	return &pmOperationProgress{
		Day:  currentDay,
		Type: countConfig.CycleType,
		Time: currentCount + 1,
	}, nil
}

func parsePMOperationCountConfig(raw string) pmOperationCountConfig {
	cfg := pmOperationCountConfig{
		CycleType: 1,
		Window:    1,
		MaxCount:  1,
	}
	if raw == "" {
		return cfg
	}

	parts := strings.Split(raw, "|")
	if len(parts) >= 1 {
		if value, err := strconv.Atoi(strings.TrimSpace(parts[0])); err == nil && value > 0 {
			cfg.CycleType = value
		}
	}
	if len(parts) >= 2 {
		if value, err := strconv.Atoi(strings.TrimSpace(parts[1])); err == nil && value > 0 {
			cfg.Window = value
		}
	}
	if len(parts) >= 3 {
		if value, err := strconv.Atoi(strings.TrimSpace(parts[2])); err == nil && value > 0 {
			cfg.MaxCount = value
		}
	}
	return cfg
}

func pmCurrentCycleDay(now time.Time, cfg pmOperationCountConfig) interface{} {
	if cfg.CycleType == 1 {
		return fmt.Sprintf("%d|%d|%d", int(now.Month())-1, now.Day(), int(now.Weekday()))
	}
	if cfg.Window == 7 {
		start := pmStartOfWeekMonday(now)
		return start.Format("2006-01-02")
	}
	if cfg.Window == 30 {
		return strconv.Itoa(int(now.Month()) - 1)
	}
	return now.UnixMilli()
}

func pmIsSameCycle(previous pmOperationProgress, now time.Time, cfg pmOperationCountConfig, currentDay interface{}) bool {
	if previous.Type != cfg.CycleType {
		return false
	}
	if cfg.CycleType == 1 {
		return pmToString(previous.Day) == pmToString(currentDay)
	}
	if cfg.Window == 7 || cfg.Window == 30 {
		return pmToString(previous.Day) == pmToString(currentDay)
	}
	lastMillis, ok := pmToInt64(previous.Day)
	if !ok {
		return false
	}
	elapsedDays := float64(now.UnixMilli()-lastMillis) / float64(24*60*60*1000)
	return elapsedDays < float64(cfg.Window)
}

func pmStartOfWeekMonday(now time.Time) time.Time {
	weekday := int(now.Weekday())
	if weekday == 0 {
		weekday = 7
	}
	dayStart := time.Date(now.Year(), now.Month(), now.Day(), 0, 0, 0, 0, now.Location())
	return dayStart.AddDate(0, 0, -(weekday - 1))
}

func pmReadProgress(pmProcessData map[string]interface{}, index int) (pmOperationProgress, bool) {
	raw, ok := pmProcessData[strconv.Itoa(index)]
	if !ok {
		return pmOperationProgress{}, false
	}

	payload, ok := raw.(map[string]interface{})
	if !ok {
		return pmOperationProgress{}, false
	}

	progress := pmOperationProgress{}
	progress.Day = payload["day"]

	progressType, ok := pmToInt(payload["type"])
	if !ok {
		return pmOperationProgress{}, false
	}
	progress.Type = progressType

	progressTime, ok := pmToInt(payload["time"])
	if !ok {
		return pmOperationProgress{}, false
	}
	progress.Time = progressTime

	return progress, true
}

func pmToInt(value interface{}) (int, bool) {
	switch typed := value.(type) {
	case int:
		return typed, true
	case int32:
		return int(typed), true
	case int64:
		return int(typed), true
	case float32:
		return int(typed), true
	case float64:
		return int(typed), true
	case string:
		parsed, err := strconv.Atoi(strings.TrimSpace(typed))
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func pmToInt64(value interface{}) (int64, bool) {
	switch typed := value.(type) {
	case int:
		return int64(typed), true
	case int32:
		return int64(typed), true
	case int64:
		return typed, true
	case float32:
		return int64(typed), true
	case float64:
		return int64(typed), true
	case string:
		parsed, err := strconv.ParseInt(strings.TrimSpace(typed), 10, 64)
		if err != nil {
			return 0, false
		}
		return parsed, true
	default:
		return 0, false
	}
}

func pmToString(value interface{}) string {
	switch typed := value.(type) {
	case string:
		return typed
	case int:
		return strconv.Itoa(typed)
	case int32:
		return strconv.Itoa(int(typed))
	case int64:
		return strconv.FormatInt(typed, 10)
	case float32:
		return strconv.Itoa(int(typed))
	case float64:
		return strconv.Itoa(int(typed))
	default:
		return ""
	}
}
