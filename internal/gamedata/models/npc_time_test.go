// Open-sourced by BaoLT

package models

import (
	"testing"
	"time"
)

func TestIsActiveAt_EmptyAt(t *testing.T) {
	npc := &NpcTemplate{At: ""}
	now := time.Now()
	if !npc.IsActiveAt(now) {
		t.Error("NPC with empty 'at' should always be active")
	}
}

func TestIsActiveAt_EventDateRange_WithinRange(t *testing.T) {
	npc := &NpcTemplate{At: "new|2024/1/1/0/0/0-2024/12/31/23/59/0"}
	// Time within range: June 15, 2024 12:00:00 ICT
	now := time.Date(2024, 6, 15, 12, 0, 0, 0, GameTimezone)
	if !npc.IsActiveAt(now) {
		t.Error("NPC should be active within event date range")
	}
}

func TestIsActiveAt_EventDateRange_BeforeRange(t *testing.T) {
	npc := &NpcTemplate{At: "new|2024/1/1/0/0/0-2024/12/31/23/59/0"}
	// Time before range: Dec 31, 2023
	now := time.Date(2023, 12, 31, 23, 59, 59, 0, GameTimezone)
	if npc.IsActiveAt(now) {
		t.Error("NPC should NOT be active before event date range")
	}
}

func TestIsActiveAt_EventDateRange_AfterRange(t *testing.T) {
	npc := &NpcTemplate{At: "new|2024/1/1/0/0/0-2024/12/31/23/59/0"}
	// Time after range: Jan 1, 2025
	now := time.Date(2025, 1, 1, 0, 0, 1, 0, GameTimezone)
	if npc.IsActiveAt(now) {
		t.Error("NPC should NOT be active after event date range")
	}
}

func TestIsActiveAt_EventDateRange_AtStartBoundary(t *testing.T) {
	npc := &NpcTemplate{At: "new|2024/1/1/0/0/0-2024/1/9/23/59/0"}
	// Exactly at start time
	now := time.Date(2024, 1, 1, 0, 0, 0, 0, GameTimezone)
	if !npc.IsActiveAt(now) {
		t.Error("NPC should be active at start boundary (inclusive)")
	}
}

func TestIsActiveAt_EventDateRange_AtEndBoundary(t *testing.T) {
	npc := &NpcTemplate{At: "new|2024/1/1/0/0/0-2024/1/9/23/59/0"}
	// Exactly at end time
	now := time.Date(2024, 1, 9, 23, 59, 0, 0, GameTimezone)
	if !npc.IsActiveAt(now) {
		t.Error("NPC should be active at end boundary (inclusive)")
	}
}

func TestIsActiveAt_EventDateRange_ChristmasNPC(t *testing.T) {
	// Real data: 'Cây Thông Giáng Sinh', NPC ID 2613
	npc := &NpcTemplate{At: "new|2025/12/25/10/0/0-2025/12/28/23/59/0"}

	// During event
	during := time.Date(2025, 12, 26, 15, 0, 0, 0, GameTimezone)
	if !npc.IsActiveAt(during) {
		t.Error("Christmas NPC should be active during event period")
	}

	// Before event
	before := time.Date(2025, 12, 24, 23, 59, 0, 0, GameTimezone)
	if npc.IsActiveAt(before) {
		t.Error("Christmas NPC should NOT be active before event period")
	}

	// After event
	after := time.Date(2025, 12, 29, 0, 0, 1, 0, GameTimezone)
	if npc.IsActiveAt(after) {
		t.Error("Christmas NPC should NOT be active after event period")
	}
}

func TestIsActiveAt_ScheduleRange_AllDay(t *testing.T) {
	// "0-23|0-6|1-31|0-11|MushroomFruit" = always active
	npc := &NpcTemplate{At: "0-23|0-6|1-31|0-11|MushroomFruit"}
	now := time.Date(2024, 6, 15, 14, 30, 0, 0, GameTimezone)
	if !npc.IsActiveAt(now) {
		t.Error("NPC with full schedule range should always be active")
	}
}

func TestIsActiveAt_ScheduleRange_HourRestriction(t *testing.T) {
	// Only active from 8am to 18pm
	npc := &NpcTemplate{At: "8-18|0-6|1-31|0-11|DayNPC"}

	// During active hours
	during := time.Date(2024, 6, 15, 12, 0, 0, 0, GameTimezone)
	if !npc.IsActiveAt(during) {
		t.Error("NPC should be active during scheduled hours")
	}

	// Before active hours
	before := time.Date(2024, 6, 15, 7, 0, 0, 0, GameTimezone)
	if npc.IsActiveAt(before) {
		t.Error("NPC should NOT be active before scheduled hours")
	}

	// After active hours
	after := time.Date(2024, 6, 15, 19, 0, 0, 0, GameTimezone)
	if npc.IsActiveAt(after) {
		t.Error("NPC should NOT be active after scheduled hours")
	}
}

func TestIsActiveAt_ScheduleRange_WeekdayRestriction(t *testing.T) {
	// Only active on weekdays (Mon=1 to Fri=5)
	npc := &NpcTemplate{At: "0-23|1-5|1-31|0-11|WeekdayNPC"}

	// Wednesday (day of week = 3)
	wednesday := time.Date(2024, 6, 12, 12, 0, 0, 0, GameTimezone)
	if !npc.IsActiveAt(wednesday) {
		t.Errorf("NPC should be active on Wednesday (weekday=%d)", wednesday.Weekday())
	}

	// Sunday (day of week = 0)
	sunday := time.Date(2024, 6, 16, 12, 0, 0, 0, GameTimezone)
	if npc.IsActiveAt(sunday) {
		t.Errorf("NPC should NOT be active on Sunday (weekday=%d)", sunday.Weekday())
	}
}

func TestIsActiveAt_ScheduleRange_MonthRestriction(t *testing.T) {
	// Only active in December (month 11 in 0-based)
	npc := &NpcTemplate{At: "0-23|0-6|1-31|11-11|DecemberNPC"}

	// In December
	december := time.Date(2024, 12, 15, 12, 0, 0, 0, GameTimezone)
	if !npc.IsActiveAt(december) {
		t.Error("NPC should be active in December")
	}

	// In June
	june := time.Date(2024, 6, 15, 12, 0, 0, 0, GameTimezone)
	if npc.IsActiveAt(june) {
		t.Error("NPC should NOT be active in June")
	}
}

func TestIsActiveAt_ScheduleRange_BossType(t *testing.T) {
	// Real data: '0-23|0-6|1-31|0-11|Boss'
	npc := &NpcTemplate{At: "0-23|0-6|1-31|0-11|Boss"}
	now := time.Date(2024, 3, 20, 22, 30, 0, 0, GameTimezone)
	if !npc.IsActiveAt(now) {
		t.Error("Boss NPC with full range should always be active")
	}
}

func TestIsActiveAt_UnknownFormat(t *testing.T) {
	npc := &NpcTemplate{At: "unknown_format"}
	now := time.Now()
	if !npc.IsActiveAt(now) {
		t.Error("NPC with unknown 'at' format should default to active")
	}
}

func TestParseGameDateTime(t *testing.T) {
	tests := []struct {
		input    string
		expected time.Time
		hasError bool
	}{
		{
			input:    "2024/1/1/0/0/0",
			expected: time.Date(2024, 1, 1, 0, 0, 0, 0, GameTimezone),
			hasError: false,
		},
		{
			input:    "2025/12/25/10/0/0",
			expected: time.Date(2025, 12, 25, 10, 0, 0, 0, GameTimezone),
			hasError: false,
		},
		{
			input:    "invalid",
			hasError: true,
		},
		{
			input:    "2024/1/1",
			hasError: true,
		},
	}

	for _, tt := range tests {
		result, err := parseGameDateTime(tt.input)
		if tt.hasError {
			if err == nil {
				t.Errorf("parseGameDateTime(%q) should return error", tt.input)
			}
		} else {
			if err != nil {
				t.Errorf("parseGameDateTime(%q) returned unexpected error: %v", tt.input, err)
			}
			if !result.Equal(tt.expected) {
				t.Errorf("parseGameDateTime(%q) = %v, want %v", tt.input, result, tt.expected)
			}
		}
	}
}

func TestIsInRange(t *testing.T) {
	tests := []struct {
		rangeStr string
		value    int
		expected bool
	}{
		{"0-23", 12, true},
		{"0-23", 0, true},
		{"0-23", 23, true},
		{"8-18", 12, true},
		{"8-18", 7, false},
		{"8-18", 19, false},
		{"8-18", 8, true},
		{"8-18", 18, true},
		{"1-5", 3, true},
		{"1-5", 0, false},
		{"1-5", 6, false},
		{"11-11", 11, true},
		{"11-11", 10, false},
		{"invalid", 5, true}, // Can't parse, default to true
	}

	for _, tt := range tests {
		result := isInRange(tt.rangeStr, tt.value)
		if result != tt.expected {
			t.Errorf("isInRange(%q, %d) = %v, want %v", tt.rangeStr, tt.value, result, tt.expected)
		}
	}
}
