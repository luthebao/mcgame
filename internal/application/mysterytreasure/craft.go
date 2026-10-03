// Open-sourced by BaoLT

// Mystery Treasure craft / daily-limit / codex write-paths.
//
// =====================================================================================
// DOCUMENTED CALIBRATION ASSUMPTION (the single unknown for this feature)
// =====================================================================================
// No game-data table maps addTimes.n -> the makeLimitTimes daily craft cap. The mapping is
// server-only and absent from the schema. We bake in a base daily cap plus one bonus craft
// per purchased addTimes slot:
//
//	cap = mysBaseDailyMakeCap + addTimes.n
//
// Both knobs are named constants below so calibration against a live-log is a one-line edit.
// The purchase-cost tiers (MysAddTimesGold) are NOT an assumption — they mirror the client's
// MYS_TRE_ADD_TIMES_GOLD literal exactly (DecoratePanel.as:4117).
//
// SECONDARY conservative default (reported, not the headline assumption): a recipe's result
// spec "st" = "16-<level>-<kindOrdinal>" names a kind+level GROUP of output rows, not one
// mysId. makeMysTre deterministically produces the LOWEST-id data_tbl_mystre row of that
// kind+level (stable, no RNG, no exploit surface). Calibrate to the real selection rule later.
// =====================================================================================
//
// Material routing (ground truth, diverges from the original triage brief): recipe t1..t6 are
// crafting-MATERIAL item-template ids (e.g. 7=Kim Loai, 18=Go, 22=Ngoc) living in the
// player's MAIN item bag, not rune chips or mystery items. The Flash client (putMaterialIn)
// matches main-bag items by tid==t<i> AND color==q<i> AND stackNum>=n<i>, and sends the matched
// item-instance id as slotMap[i].idx. We therefore consume from the main item bag via the
// ItemBagProvider, validating tid/quality/count strictly before consuming (consume-then-credit).
package mysterytreasure

import "context"

const (
	// mysBaseDailyMakeCap is the per-day craft cap before any addTimes purchases.
	mysBaseDailyMakeCap = 10
	// mysMakeCapPerAddTime is the extra daily crafts granted per purchased addTimes slot.
	mysMakeCapPerAddTime = 1
	// mysMaxAddTimesTier caps purchases at the highest tier the client knows about.
	mysMaxAddTimesTier = 6
	// MysKindMin / MysKindMax bound the mystery-treasure tab kind range.
	MysKindMin = 1
	MysKindMax = 11
)

// MysAddTimesGold mirrors the client's MYS_TRE_ADD_TIMES_GOLD literal: tier threshold (the
// addTimes.n value the purchase moves you PAST) and the gold cost charged at that step.
var MysAddTimesGold = [mysMaxAddTimesTier][2]int{
	{5, 20}, {10, 30}, {15, 40}, {20, 50}, {25, 60}, {40, 70},
}

// MakeCapForAddTimes applies the documented assumption.
func MakeCapForAddTimes(addTimesN int) int {
	if addTimesN < 0 {
		addTimesN = 0
	}
	return mysBaseDailyMakeCap + addTimesN*mysMakeCapPerAddTime
}

// AddTimesGoldCost returns the gold cost to buy the NEXT addTimes slot given the current
// addTimes.n, and whether another purchase is allowed. Mirrors onAddLimitMakeTimes: find the
// first tier whose threshold the current count is still below; that tier's cost applies.
func AddTimesGoldCost(currentN int) (cost int, ok bool) {
	for i := 0; i < mysMaxAddTimesTier; i++ {
		if currentN < MysAddTimesGold[i][0] {
			return MysAddTimesGold[i][1], true
		}
	}
	return 0, false
}

func ActiveObjToWire(active map[string]int) map[string]interface{} {
	wire := make(map[string]interface{}, len(active))
	for k, v := range active {
		wire[k] = float64(v)
	}
	return wire
}

func MysBookToWire(book map[string]map[string]int) map[string]interface{} {
	wire := make(map[string]interface{}, len(book))
	for kind, set := range book {
		inner := make(map[string]interface{}, len(set))
		for mysID, v := range set {
			inner[mysID] = float64(v)
		}
		wire[kind] = inner
	}
	return wire
}

// RefreshDailyCounters rolls addTimes/makeLimitTimes over when the stored date is not today,
// and recomputes the makeLimitTimes cap from the (possibly reset) addTimes.n. Returns true if
// anything changed (so the caller can persist). today is "<month0idx>|<day>" as the client
// builds it. On a fresh day addTimes.n resets to 0 (matching the client's stale-date handling)
// and the make cap is refilled to the base.
func RefreshDailyCounters(st *MysteryTreasureState, today string) bool {
	changed := false
	if st.AddTimes.T != today {
		st.AddTimes.N = 0
		st.AddTimes.T = today
		changed = true
	}
	wantCap := MakeCapForAddTimes(st.AddTimes.N)
	if st.MakeLimit.T != today {
		st.MakeLimit.N = wantCap
		st.MakeLimit.T = today
		changed = true
	}
	return changed
}

// PurchaseAddTime increments addTimes.n by one tier-step and refills the make cap accordingly.
// Returns the gold cost to charge and whether the purchase is allowed (false = max tier).
// The caller is responsible for charging the gold and persisting (consume-then-credit: charge
// first, then this state mutation + save).
func (s *Service) PurchaseAddTime(st *MysteryTreasureState, today string) (cost int, ok bool) {
	RefreshDailyCounters(st, today)
	cost, ok = AddTimesGoldCost(st.AddTimes.N)
	if !ok {
		return 0, false
	}
	st.AddTimes.N++
	st.AddTimes.T = today
	st.MakeLimit.N = MakeCapForAddTimes(st.AddTimes.N)
	st.MakeLimit.T = today
	return cost, true
}

// LoadRefreshed loads state and rolls daily counters to today, persisting if the roll changed
// anything. It is the read-path used by onGetMysAddTimes / onGetMakeLimitTimes so the client
// always sees a current-day view.
func (s *Service) LoadRefreshed(ctx context.Context, charID int64, today string) (*MysteryTreasureState, error) {
	st, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	if RefreshDailyCounters(st, today) {
		if saveErr := s.Save(ctx, charID, st); saveErr != nil {
			return st, saveErr
		}
	}
	return st, nil
}
