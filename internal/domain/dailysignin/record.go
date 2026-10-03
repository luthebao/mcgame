// Open-sourced by BaoLT

// Daily sign-in domain entities.
// One Record per (character_id, year, month). The claimed_days_bitmap is a
// bigint where bit (day-1) is set when that day-of-month has been signed in
// (modern monthly calendar). Helpers stay pure; the application service
// injects time.Now() so tests can drive the day boundary.
// The legacy SignInPanel projects from the same Record by reading the
// trailing streak ending today.
package dailysignin

import "time"

type MonthKey struct {
	Year  int
	Month int
}

func MonthKeyOf(t time.Time) MonthKey {
	return MonthKey{Year: t.Year(), Month: int(t.Month())}
}

func WeekOfMonth(day int) int {
	if day <= 0 {
		return 0
	}
	if day > 31 {
		day = 31
	}
	return ((day - 1) / 7) + 1
}

type Record struct {
	CharacterID       int64
	Year              int
	Month             int
	ClaimedDaysBitmap int64
	CritPercent       int
	LuckyAwardClaimed bool
	ConsumeLimitTotal int64
	LastSignedAt      *time.Time
	UpdatedAt         time.Time
}

func (r *Record) Key() MonthKey {
	return MonthKey{Year: r.Year, Month: r.Month}
}

func (r *Record) IsClaimed(day int) bool {
	if day < 1 || day > 31 {
		return false
	}
	return r.ClaimedDaysBitmap&(int64(1)<<uint(day-1)) != 0
}

func (r *Record) MarkClaimed(day int) {
	if day < 1 || day > 31 {
		return
	}
	r.ClaimedDaysBitmap |= int64(1) << uint(day-1)
}

func (r *Record) ClaimedDays() []int {
	out := make([]int, 0, 31)
	for d := 1; d <= 31; d++ {
		if r.IsClaimed(d) {
			out = append(out, d)
		}
	}
	return out
}

func (r *Record) StreakEndingAt(day int) int {
	if day < 1 {
		return 0
	}
	if day > 31 {
		day = 31
	}
	streak := 0
	for d := day; d >= 1; d-- {
		if !r.IsClaimed(d) {
			break
		}
		streak++
	}
	return streak
}

func (r *Record) IsStreakComplete(throughDay, fromDay int) bool {
	if fromDay < 1 {
		fromDay = 1
	}
	if throughDay < fromDay {
		return false
	}
	for d := fromDay; d <= throughDay; d++ {
		if !r.IsClaimed(d) {
			return false
		}
	}
	return true
}

func (r *Record) FirstUnclaimedBefore(day int, fromDay int) int {
	if fromDay < 1 {
		fromDay = 1
	}
	if day > 31 {
		day = 31
	}
	for d := fromDay; d < day; d++ {
		if !r.IsClaimed(d) {
			return d
		}
	}
	return 0
}

func (r *Record) LegacyState(today int) LegacyState {
	signedToday := r.IsClaimed(today)
	signedYesterday := today > 1 && r.IsClaimed(today-1)
	streak := r.StreakEndingAt(today)
	if streak > 5 {
		streak = ((streak - 1) % 5) + 1
	}
	return LegacyState{
		ContinueSigninTime: streak,
		SigninedToday:      signedToday,
		SignedYesterday:    signedYesterday,
	}
}

type LegacyState struct {
	ContinueSigninTime int
	SigninedToday      bool
	SignedYesterday    bool
}
