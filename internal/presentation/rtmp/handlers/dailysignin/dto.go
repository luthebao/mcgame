// Open-sourced by BaoLT

// AMF payload builders for the daily sign-in RPCs.
// signInDataPayload is the SignInData sub-object reused by the
// setBtnsDailySignInAct push and the inline doSignin reply.
// confPayload's luckyPoint/luckyGold are 1-based arrays (length 6, index 0
// unused) consumed by DailySignInPanel.as line 3449. closeOnKey != 0 is
// required to make the +5% crit button visible (panel line 3750).
package dailysignin

import (
	"strconv"
	"time"

	appdailysignin "mcgame-server/internal/application/dailysignin"
	"mcgame-server/internal/domain/dailysignin"
)

func actDaysMap(rec *dailysignin.Record) map[string]interface{} {
	out := make(map[string]interface{}, 8)
	for _, d := range rec.ClaimedDays() {
		out[strconv.Itoa(d)] = true
	}
	return out
}

func signInDataPayload(rec *dailysignin.Record, awardDay int) map[string]interface{} {
	return map[string]interface{}{
		"actYear":  rec.Year,
		"actMonth": rec.Month,
		"actDays":  actDaysMap(rec),
		"crit":     rec.CritPercent,
		"getAwardTime": map[string]interface{}{
			"day":  awardDay,
			"flag": rec.LuckyAwardClaimed,
		},
	}
}

func confPayload(cfg appdailysignin.Config, rewards map[string]map[string]interface{}, tiers []dailysignin.LuckyTier) map[string]interface{} {
	luckyPoint := []interface{}{int64(0), int64(0), int64(0), int64(0), int64(0), int64(0)}
	luckyGold := []interface{}{int64(0), int64(0), int64(0), int64(0), int64(0), int64(0)}
	for _, t := range tiers {
		if t.WeekIndex >= 1 && t.WeekIndex <= 5 {
			luckyPoint[t.WeekIndex] = t.Threshold
			luckyGold[t.WeekIndex] = t.GoldAmount
		}
	}
	return map[string]interface{}{
		"start":            cfg.EventStartUnixMS,
		"surpriseDay":      cfg.SurpriseDay,
		"luckyDay":         cfg.LuckyDay,
		"luckyPoint":       luckyPoint,
		"luckyGold":        luckyGold,
		"retroactivePrice": cfg.RetroactivePrice,
		"critPrice":        cfg.CritPrice,
		"closeOnKey":       cfg.CloseOnKey,
		"iInfo":            rewards,
	}
}

func timePayload(now time.Time) map[string]interface{} {
	return map[string]interface{}{
		"year":  now.Year(),
		"month": int(now.Month()),
		"date":  now.Day(),
	}
}

func legacyPayload(state dailysignin.LegacyState) map[string]interface{} {
	return map[string]interface{}{
		"continueSigninTime": state.ContinueSigninTime,
		"signinedToday":      state.SigninedToday,
		"signedYesterday":    state.SignedYesterday,
	}
}
