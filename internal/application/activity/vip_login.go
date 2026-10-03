// Open-sourced by BaoLT

// VIP login payload helper: serializes the persisted PM/VIP entitlement into the cData.vipInfo JSON blob.
// Mirrors the activeType/activeTime/keepDay derivation used by the initPmData / buyPm panel responses
// so the login snapshot and the PM panel report identical entitlement state.
package activity

import (
	"encoding/json"
	"time"

	domainchar "mcgame-server/internal/domain/character"
)

const vipInfoFallbackJSON = `{"pmExp":0,"activeTime":0,"activeType":0,"keepDay":0}`

func VipInfoLoginJSON(char *domainchar.Character, now time.Time) string {
	if char == nil {
		return vipInfoFallbackJSON
	}

	state := buildPMState(char, now)
	obj := map[string]interface{}{
		"pmExp":      state.PMExp,
		"activeTime": state.ActiveTime,
		"activeType": state.ActiveType,
		"keepDay":    state.KeepDay,
	}

	encoded, err := json.Marshal(obj)
	if err != nil {
		return vipInfoFallbackJSON
	}
	return string(encoded)
}
