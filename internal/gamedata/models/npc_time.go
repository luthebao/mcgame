// Open-sourced by BaoLT

package models

import (
	"fmt"
	"strconv"
	"strings"
	"time"
)

// GameTimezone is the timezone used for NPC time range calculations.
// Vietnamese game servers use ICT (Indochina Time, UTC+7).
var GameTimezone = time.FixedZone("ICT", 7*60*60)

// IsActiveAt checks if the NPC should be visible at the given time based on the `at` field.
// Returns true if the NPC should be displayed at the specified time.
// If `at` is empty, the NPC is always visible.
//
// The `at` field supports two formats:
//
// Format 1 - Event date range: "new|YYYY/M/D/H/m/s-YYYY/M/D/H/m/s"
//
//	Example: "new|2024/1/1/0/0/0-2024/1/9/23/59/0"
//	NPC is only visible between the two specified dates.
//
// Format 2 - Schedule range: "hourStart-hourEnd|dowStart-dowEnd|dayStart-dayEnd|monthStart-monthEnd|eventName"
//
//	Example: "0-23|0-6|1-31|0-11|MushroomFruit"
//	NPC is visible when current time falls within all specified ranges.
//	Hours: 0-23, DayOfWeek: 0(Sun)-6(Sat), Day: 1-31, Month: 0(Jan)-11(Dec)
func (t *NpcTemplate) IsActiveAt(now time.Time) bool {
	if t.At == "" {
		return true
	}

	// Format 1: new|YYYY/M/D/H/m/s-YYYY/M/D/H/m/s
	if strings.HasPrefix(t.At, "new|") {
		return checkEventDateRange(t.At, now)
	}

	// Format 2: hourStart-hourEnd|dowStart-dowEnd|dayStart-dayEnd|monthStart-monthEnd|eventName
	parts := strings.Split(t.At, "|")
	if len(parts) >= 4 {
		return checkScheduleRange(parts, now)
	}

	// Unknown format, default to visible
	return true
}

// checkEventDateRange handles "new|YYYY/M/D/H/m/s-YYYY/M/D/H/m/s" format.
// NPC is only visible between startTime and endTime (inclusive).
func checkEventDateRange(at string, now time.Time) bool {
	dateRange := strings.TrimPrefix(at, "new|")

	// The "-" separates start and end datetimes.
	// Date parts use "/" so there's exactly one "-" in the string.
	parts := strings.SplitN(dateRange, "-", 2)
	if len(parts) != 2 {
		return true // Can't parse, default to visible
	}

	startTime, err := parseGameDateTime(parts[0])
	if err != nil {
		return true
	}

	endTime, err := parseGameDateTime(parts[1])
	if err != nil {
		return true
	}

	nowInZone := now.In(GameTimezone)
	return !nowInZone.Before(startTime) && !nowInZone.After(endTime)
}

// checkScheduleRange handles "hourStart-hourEnd|dowStart-dowEnd|dayStart-dayEnd|monthStart-monthEnd|eventName" format.
// NPC is visible when all time ranges match the current time.
func checkScheduleRange(parts []string, now time.Time) bool {
	nowInZone := now.In(GameTimezone)

	// Check hour range (parts[0]): e.g., "0-23"
	if !isInRange(parts[0], nowInZone.Hour()) {
		return false
	}

	// Check day of week range (parts[1]): e.g., "0-6"
	// Go's time.Weekday(): Sunday=0, Monday=1, ..., Saturday=6
	if !isInRange(parts[1], int(nowInZone.Weekday())) {
		return false
	}

	// Check day of month range (parts[2]): e.g., "1-31"
	if !isInRange(parts[2], nowInZone.Day()) {
		return false
	}

	// Check month range (parts[3]): e.g., "0-11" (0-based: 0=Jan, 11=Dec)
	// Go's time.Month(): January=1, ..., December=12 → convert to 0-based
	month0Based := int(nowInZone.Month()) - 1
	if !isInRange(parts[3], month0Based) {
		return false
	}

	return true
}

// parseGameDateTime parses "YYYY/M/D/H/m/s" format into time.Time using GameTimezone.
func parseGameDateTime(s string) (time.Time, error) {
	segments := strings.Split(strings.TrimSpace(s), "/")
	if len(segments) != 6 {
		return time.Time{}, fmt.Errorf("invalid datetime format: %s", s)
	}

	year, err := strconv.Atoi(strings.TrimSpace(segments[0]))
	if err != nil {
		return time.Time{}, fmt.Errorf("invalid year: %s", segments[0])
	}
	month, err := strconv.Atoi(strings.TrimSpace(segments[1]))
	if err != nil {
		return time.Time{}, fmt.Errorf("invalid month: %s", segments[1])
	}
	day, err := strconv.Atoi(strings.TrimSpace(segments[2]))
	if err != nil {
		return time.Time{}, fmt.Errorf("invalid day: %s", segments[2])
	}
	hour, err := strconv.Atoi(strings.TrimSpace(segments[3]))
	if err != nil {
		return time.Time{}, fmt.Errorf("invalid hour: %s", segments[3])
	}
	min, err := strconv.Atoi(strings.TrimSpace(segments[4]))
	if err != nil {
		return time.Time{}, fmt.Errorf("invalid minute: %s", segments[4])
	}
	sec, err := strconv.Atoi(strings.TrimSpace(segments[5]))
	if err != nil {
		return time.Time{}, fmt.Errorf("invalid second: %s", segments[5])
	}

	return time.Date(year, time.Month(month), day, hour, min, sec, 0, GameTimezone), nil
}

// isInRange parses "start-end" and checks if value is within [start, end] (inclusive).
func isInRange(rangeStr string, value int) bool {
	parts := strings.SplitN(strings.TrimSpace(rangeStr), "-", 2)
	if len(parts) != 2 {
		return true // Can't parse, default to in-range
	}

	start, err := strconv.Atoi(strings.TrimSpace(parts[0]))
	if err != nil {
		return true
	}

	end, err := strconv.Atoi(strings.TrimSpace(parts[1]))
	if err != nil {
		return true
	}

	return value >= start && value <= end
}
