// Open-sourced by BaoLT

// Pure helper functions and loader utilities shared by login_payload.go and login_callbacks.go.
// Includes deterministic helpers (calculateOfflineSeconds, normalizeDressInfo, etc.)
// and the loadAchievementSnapshot loader used in buildOnChooseCharactorPayload.
package auth

import (
	"context"
	"time"

	domainachievement "mcgame-server/internal/domain/achievement"
	"mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"

	"go.uber.org/zap"
)

func calculateOfflineSeconds(char *character.Character, now time.Time) int64 {
	if char == nil || char.LastActive.IsZero() || !now.After(char.LastActive) {
		return 0
	}
	return int64(now.Sub(char.LastActive).Seconds())
}

func normalizeDressInfo(raw string) string {
	info, err := domaindress.Decode(raw)
	if err != nil {
		info = domaindress.NewInfo()
	}
	encoded, err := info.EncodeClient()
	if err != nil {
		return `{"book":{},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`
	}
	return encoded
}

func payloadOfflineSeconds(payload map[string]interface{}) (int64, bool) {
	value, ok := payload["offlineTime"]
	if !ok {
		return 0, false
	}
	switch typed := value.(type) {
	case int64:
		return typed, true
	case int:
		return int64(typed), true
	case float64:
		return int64(typed), true
	default:
		return 0, false
	}
}

func shouldShowDailyAct(char *character.Character) bool {
	if char == nil {
		return false
	}
	if char.Level <= 20 {
		return true
	}
	return len(char.GuideLog) == 0
}

func (h *Handler) buildStartedActList(ctx context.Context, char *character.Character) []interface{} {
	if char == nil {
		return []interface{}{}
	}
	if h.activityList != nil {
		startedActList, err := h.activityList.BuildStartedActList(ctx)
		if err != nil {
			h.logger.Warn("buildStartedActList: failed to load activity configs",
				zap.Int64("character_id", char.ID),
				zap.Error(err))
		} else {
			return startedActList
		}
	}
	return defaultStartedActList()
}

func defaultStartedActList() []interface{} {
	result := make([]interface{}, 0, defaultStartedActivityCount)
	for id := 0; id < defaultStartedActivityCount; id++ {
		result = append(result, map[string]interface{}{
			"id":       id,
			"flag":     true,
			"sortType": id,
		})
	}
	return result
}

func buildMoneyPreferenceSettings(char *character.Character) map[string]interface{} {
	settings := map[string]interface{}{
		"defaultMoney": 1,
		"defaultGold":  1,
	}
	if char == nil {
		return settings
	}
	switch char.SelectedMoneyType {
	case 2:
		settings["defaultMoney"] = 2
	}
	switch char.SelectedGoldType {
	case 4:
		settings["defaultGold"] = 2
	}
	return settings
}

func propInt(value interface{}, fallback int) int {
	switch typed := value.(type) {
	case int:
		return typed
	case int32:
		return int(typed)
	case int64:
		return int(typed)
	case float64:
		return int(typed)
	default:
		return fallback
	}
}

func (h *Handler) loadAchievementSnapshot(ctx context.Context, charID int64) domainachievement.Snapshot {
	snapshot := domainachievement.Snapshot{
		AchieveLog:          map[string]interface{}{},
		AchieveReqLog:       map[string]interface{}{},
		TakeAchieveAwardLog: map[string]interface{}{},
	}

	if h.achievementState == nil {
		return snapshot
	}

	loadedSnapshot, err := h.achievementState.LoadSnapshot(ctx, charID)
	if err != nil {
		h.logger.Warn("Failed to load achievement snapshot",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return snapshot
	}

	if loadedSnapshot.AchieveLog != nil {
		snapshot.AchieveLog = loadedSnapshot.AchieveLog
	}
	if loadedSnapshot.AchieveReqLog != nil {
		snapshot.AchieveReqLog = loadedSnapshot.AchieveReqLog
	}
	if loadedSnapshot.TakeAchieveAwardLog != nil {
		snapshot.TakeAchieveAwardLog = loadedSnapshot.TakeAchieveAwardLog
	}
	snapshot.AchievementPoints = loadedSnapshot.AchievementPoints

	return snapshot
}
