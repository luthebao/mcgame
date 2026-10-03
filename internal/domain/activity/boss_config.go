// Open-sourced by BaoLT

// Embedded boss daily config extracted from client BOSS_DAILY_CONFIG.
package activity

type BossConfigEntry struct {
	Type    int     `json:"type"`
	IsSuper int     `json:"isSuper"`
	Num     int     `json:"num"`
	Step    int64   `json:"step"`
	S       float64 `json:"s"`
	X       int     `json:"x"`
	Y       int     `json:"y"`
	Award   string  `json:"award"`
}

var BossDailyConfigs map[int]*BossConfigEntry

var WildList = []int{2262, 2263, 2264, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2468}

func init() {
	BossDailyConfigs = make(map[int]*BossConfigEntry)

	type1Normal2 := []int{
		2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213,
		2214, 2215, 2216, 2217, 2218, 2219, 2220, 2222, 2224, 2225,
		2227, 2229, 2231, 2233, 2235, 2237, 2239, 2241, 2243, 2245,
		2247, 2249, 2250, 2253, 2256, 2259, 2260, 2455, 2457,
	}
	for _, id := range type1Normal2 {
		BossDailyConfigs[id] = &BossConfigEntry{
			Type: 1, IsSuper: 0, Num: 2, S: 1.0, X: 1, Y: 0,
		}
	}

	type1Normal4 := []int{
		2221, 2223, 2226, 2228, 2230, 2232, 2234, 2236, 2238, 2240,
		2242, 2244, 2246, 2248, 2251, 2252, 2254, 2255, 2257, 2258,
		2261, 2456, 2458,
	}
	for _, id := range type1Normal4 {
		BossDailyConfigs[id] = &BossConfigEntry{
			Type: 1, IsSuper: 0, Num: 4, S: 1.0, X: 1, Y: 0,
		}
	}

	type1Super2 := []int{
		2262, 2264, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2468, 2568,
	}
	for _, id := range type1Super2 {
		BossDailyConfigs[id] = &BossConfigEntry{
			Type: 1, IsSuper: 1, Num: 2, S: 1.0, X: 1, Y: 0,
		}
	}

	BossDailyConfigs[2263] = &BossConfigEntry{
		Type: 1, IsSuper: 1, Num: 2, S: 0.7, X: 1, Y: 0,
	}

	type2Super := []int{2265, 2266, 2267, 2268}
	for _, id := range type2Super {
		BossDailyConfigs[id] = &BossConfigEntry{
			Type: 2, IsSuper: 1, Step: 259200000, S: 1.0, X: 1, Y: 0,
		}
	}

	BossDailyConfigs[2567] = &BossConfigEntry{
		Type: 1, IsSuper: 1, Num: 4, S: 1.0, X: 1, Y: 0,
	}
}

func GetBossConfig(bossID int) *BossConfigEntry {
	return BossDailyConfigs[bossID]
}

func IsWildBoss(bossID int) bool {
	for _, id := range WildList {
		if id == bossID {
			return true
		}
	}
	return false
}
