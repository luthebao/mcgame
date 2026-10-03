// Open-sourced by BaoLT

package stats_test

import (
	"math/rand"
	"testing"

	"mcgame-server/internal/domain/stats"
)

func TestClampPM(t *testing.T) {
	cases := []struct {
		in, want int64
	}{
		{-100, 0},
		{-1, 0},
		{0, 0},
		{1, 1},
		{500, 500},
		{999, 999},
		{1000, 1000},
		{1001, 1000},
		{9999, 1000},
	}
	for _, c := range cases {
		if got := stats.ClampPM(c.in); got != c.want {
			t.Errorf("ClampPM(%d) = %d, want %d", c.in, got, c.want)
		}
	}
}

func TestRollPerMille_Boundaries(t *testing.T) {
	rng := rand.New(rand.NewSource(42))

	for range 1000 {
		if stats.RollPerMille(rng, 0) {
			t.Fatal("threshold=0 must never pass")
		}
	}
	for range 1000 {
		if !stats.RollPerMille(rng, 1000) {
			t.Fatal("threshold=1000 must always pass")
		}
	}
	for range 1000 {
		if !stats.RollPerMille(rng, 1001) {
			t.Fatal("threshold>1000 (clamped) must always pass")
		}
	}
	for range 1000 {
		if stats.RollPerMille(rng, -999) {
			t.Fatal("negative threshold must never pass")
		}
	}
}

func TestRollPerMille_ApproxRate(t *testing.T) {
	rng := rand.New(rand.NewSource(7))
	const trials = 100_000
	hits := 0
	for range trials {
		if stats.RollPerMille(rng, 300) {
			hits++
		}
	}
	rate := float64(hits) / trials
	if rate < 0.27 || rate > 0.33 {
		t.Errorf("threshold=300 should give ~30%%, got %.2f%%", rate*100)
	}
}

func TestFromPercent(t *testing.T) {
	cases := []struct {
		in   float64
		want int64
	}{
		{0, 0},
		{100, 1000},
		{50, 500},
		{0.1, 1},
		{99.9, 999},
	}
	for _, c := range cases {
		if got := stats.FromPercent(c.in); got != c.want {
			t.Errorf("FromPercent(%.1f) = %d, want %d", c.in, got, c.want)
		}
	}
}

func TestFromMyriad(t *testing.T) {
	cases := []struct {
		in   float64
		want int64
	}{
		{0, 0},
		{10000, 1000},
		{5000, 500},
		{100, 10},
		{9990, 999},
	}
	for _, c := range cases {
		if got := stats.FromMyriad(c.in); got != c.want {
			t.Errorf("FromMyriad(%.0f) = %d, want %d", c.in, got, c.want)
		}
	}
}

func TestFromCritDmgBonus(t *testing.T) {
	cases := []struct {
		in   int
		want int64
	}{
		{0, 0},
		{50, 500},
		{100, 1000},
	}
	for _, c := range cases {
		if got := stats.FromCritDmgBonus(c.in); got != c.want {
			t.Errorf("FromCritDmgBonus(%d) = %d, want %d", c.in, got, c.want)
		}
	}
}

func TestToPercent_RoundTrip(t *testing.T) {
	for _, pm := range []int64{0, 100, 500, 999, 1000} {
		back := stats.FromPercent(stats.ToPercent(pm))
		if back != pm {
			t.Errorf("round-trip FromPercent(ToPercent(%d)) = %d", pm, back)
		}
	}
}

func TestEffectiveStats(t *testing.T) {
	es := stats.NewEffectiveStats()
	if got := es.Get(stats.PropHP); got != 0 {
		t.Fatalf("zero Get = %d", got)
	}
	es.Set(stats.PropHP, 5000)
	if got := es.Get(stats.PropHP); got != 5000 {
		t.Fatalf("Set/Get = %d", got)
	}
	es.Add(stats.PropHP, 200)
	if got := es.Get(stats.PropHP); got != 5200 {
		t.Fatalf("Add = %d", got)
	}
}

func TestAggregator(t *testing.T) {
	var agg stats.Aggregator
	agg.Add(stats.PropPhysAtk, 100)
	agg.Add(stats.PropPhysAtk, 50)
	agg.Add(stats.PropCritRate, 300)

	es := stats.NewEffectiveStats()
	es.Set(stats.PropPhysAtk, 1000)
	agg.ApplyTo(&es)

	if got := es.Get(stats.PropPhysAtk); got != 1150 {
		t.Errorf("PhysAtk = %d, want 1150", got)
	}
	if got := es.Get(stats.PropCritRate); got != 300 {
		t.Errorf("CritRate = %d, want 300", got)
	}
}
