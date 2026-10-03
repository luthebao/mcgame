// Open-sourced by BaoLT

// Daily sign-in service unit tests.
// Verify the rule sheet contracts:
//   - Auto +5% crit on signin and retroactive
//   - Crit roll resets to 0 on success
//   - Surprise reward only with full streak
//   - Lucky-day claim gated by both streak AND consume threshold
//   - Lucky-day grants gold (luckyGold[w]), not items
//   - Level-50 gate rejects under-level players
package dailysignin

import (
	"context"
	"errors"
	"math/rand"
	"testing"
	"time"

	"github.com/google/uuid"
	"go.uber.org/zap"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/dailysignin"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

type stubRecordRepo struct {
	rec *dailysignin.Record
}

func newStubRecordRepo(rec *dailysignin.Record) *stubRecordRepo {
	if rec == nil {
		rec = &dailysignin.Record{}
	}
	return &stubRecordRepo{rec: rec}
}

func (r *stubRecordRepo) Get(_ context.Context, characterID int64, year, month int) (*dailysignin.Record, error) {
	if r.rec.CharacterID == 0 {
		r.rec.CharacterID = characterID
	}
	if r.rec.Year == 0 {
		r.rec.Year = year
	}
	if r.rec.Month == 0 {
		r.rec.Month = month
	}
	clone := *r.rec
	return &clone, nil
}

func (r *stubRecordRepo) Apply(_ context.Context, in dailysignin.ApplyInput) (*dailysignin.ApplyResult, error) {
	if r.rec.CharacterID == 0 {
		r.rec.CharacterID = in.CharacterID
		r.rec.Year = in.Year
		r.rec.Month = in.Month
	}
	res := &dailysignin.ApplyResult{}
	preCrit := r.rec.CritPercent
	if in.Day >= 1 && in.Day <= 31 {
		if !r.rec.IsClaimed(in.Day) {
			r.rec.MarkClaimed(in.Day)
			res.DaySet = true
			now := time.Now()
			r.rec.LastSignedAt = &now
		}
	}
	if in.ResetCrit {
		r.rec.CritPercent = 0
	} else if in.CritDelta != 0 {
		next := r.rec.CritPercent + in.CritDelta
		if next < 0 {
			next = 0
		}
		if next > 100 {
			next = 100
		}
		r.rec.CritPercent = next
	}
	if in.ConsumeDelta > 0 {
		r.rec.ConsumeLimitTotal += in.ConsumeDelta
	}
	if in.SetAwardClaimed && !r.rec.LuckyAwardClaimed {
		r.rec.LuckyAwardClaimed = true
		res.AwardSet = true
	}
	res.CritChanged = r.rec.CritPercent != preCrit
	clone := *r.rec
	res.Record = &clone
	return res, nil
}

type stubRewardCatalog struct {
	rewards []*dailysignin.Reward
}

func (c *stubRewardCatalog) List(_ context.Context, inc *int) ([]*dailysignin.Reward, error) {
	if inc == nil {
		return c.rewards, nil
	}
	out := make([]*dailysignin.Reward, 0, len(c.rewards))
	for _, r := range c.rewards {
		if r.Inc == *inc {
			out = append(out, r)
		}
	}
	return out, nil
}

type stubTierCatalog struct {
	tiers map[int]dailysignin.LuckyTier
}

func (c *stubTierCatalog) ListForMonth(_ context.Context, year, month int) ([]dailysignin.LuckyTier, error) {
	out := make([]dailysignin.LuckyTier, 0, len(c.tiers))
	for _, t := range c.tiers {
		if t.Year == year && t.Month == month {
			out = append(out, t)
		}
	}
	return out, nil
}

func (c *stubTierCatalog) GetTier(_ context.Context, year, month, weekIndex int) (dailysignin.LuckyTier, error) {
	if t, ok := c.tiers[weekIndex]; ok && t.Year == year && t.Month == month {
		return t, nil
	}
	return dailysignin.LuckyTier{}, errors.New("tier not found")
}

type stubCharRepo struct {
	char *domainchar.Character
}

func (r *stubCharRepo) FindByID(_ context.Context, id int64) (*domainchar.Character, error) {
	if r.char == nil {
		return nil, errors.New("character not found")
	}
	clone := *r.char
	return &clone, nil
}
func (r *stubCharRepo) FindByAccountID(_ context.Context, _ uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *stubCharRepo) FindByMapID(_ context.Context, _ int) ([]*domainchar.Character, error) {
	return nil, nil
}
func (r *stubCharRepo) FindByName(_ context.Context, _ string) (*domainchar.Character, error) {
	return nil, nil
}
func (r *stubCharRepo) Create(_ context.Context, _ *domainchar.Character) error  { return nil }
func (r *stubCharRepo) Delete(_ context.Context, _ int64) error                  { return nil }
func (r *stubCharRepo) ExistsByName(_ context.Context, _ string) (bool, error)   { return false, nil }
func (r *stubCharRepo) UpdatePosition(_ context.Context, _ int64, _ domainchar.Position) error {
	return nil
}
func (r *stubCharRepo) UpdateStats(_ context.Context, _ int64, _, _, _ int) error { return nil }
func (r *stubCharRepo) Update(_ context.Context, c *domainchar.Character) error {
	clone := *c
	r.char = &clone
	return nil
}

type stubItemGranter struct {
	granted []*domainitem.Item
}

func (g *stubItemGranter) AddItemWithBindAndColor(_ context.Context, _ int64, templateID int, _ domainitem.ItemType, qty int, _ bool, _ int) (*domainitem.Item, error) {
	it := &domainitem.Item{TemplateID: templateID, StackCount: qty}
	g.granted = append(g.granted, it)
	return it, nil
}
func (g *stubItemGranter) BuildClientItemDTO(it *domainitem.Item) map[string]interface{} {
	return map[string]interface{}{"templateID": it.TemplateID, "number": it.StackCount}
}
func (g *stubItemGranter) GetItemTemplate(templateID int) *models.ItemTemplateTemplate {
	return &models.ItemTemplateTemplate{Name: "stub-item"}
}

func newTestService(
	rec *dailysignin.Record,
	rewards []*dailysignin.Reward,
	tiers map[int]dailysignin.LuckyTier,
	char *domainchar.Character,
	now time.Time,
	rngSeed int64,
) (*Service, *stubItemGranter, *stubCharRepo, *stubRecordRepo) {
	recordRepo := newStubRecordRepo(rec)
	rewardCatalog := &stubRewardCatalog{rewards: rewards}
	tierCatalog := &stubTierCatalog{tiers: tiers}
	charRepo := &stubCharRepo{char: char}
	granter := &stubItemGranter{}
	svc := NewService(recordRepo, rewardCatalog, tierCatalog, charRepo, granter, zap.NewNop())
	svc.SetNowFunc(func() time.Time { return now })
	svc.SetRandSource(rand.NewSource(rngSeed))
	return svc, granter, charRepo, recordRepo
}

func levelFiftyChar(id int64) *domainchar.Character {
	return &domainchar.Character{ID: id, Level: 50, Gold: 100000, GoldBind: 0}
}

func defaultRewards() []*dailysignin.Reward {
	return []*dailysignin.Reward{
		{RewardID: 1, Inc: dailysignin.IncDaily, ItemID: 408, Quantity: 1, Weight: 1},
		{RewardID: 2, Inc: dailysignin.IncSurpriseDay, ItemID: 4015, Quantity: 1, Weight: 1},
		{RewardID: 3, Inc: dailysignin.IncCritBonus, ItemID: 4080, Quantity: 1, Weight: 1},
	}
}

func TestDoSigninAutoBumpsCrit(t *testing.T) {
	now := time.Date(2026, 5, 10, 12, 0, 0, 0, time.UTC)
	svc, _, _, _ := newTestService(
		&dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5, CritPercent: 0},
		defaultRewards(),
		nil,
		levelFiftyChar(1),
		now,
		1,
	)
	out, err := svc.DoSignin(context.Background(), 1)
	if err != nil {
		t.Fatalf("DoSignin: %v", err)
	}
	if out.Record.CritPercent != 5 {
		t.Fatalf("crit %d, want 5", out.Record.CritPercent)
	}
	if !out.Record.IsClaimed(now.Day()) {
		t.Fatalf("today not marked claimed")
	}
}

func TestDoSigninCritResetsOnSuccess(t *testing.T) {
	now := time.Date(2026, 5, 10, 12, 0, 0, 0, time.UTC)
	svc, granter, _, _ := newTestService(
		&dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5, CritPercent: 95},
		defaultRewards(),
		nil,
		levelFiftyChar(1),
		now,
		1,
	)
	out, err := svc.DoSignin(context.Background(), 1)
	if err != nil {
		t.Fatalf("DoSignin: %v", err)
	}
	if out.Record.CritPercent != 0 {
		t.Fatalf("crit %d after successful roll, want 0 (reset)", out.Record.CritPercent)
	}
	foundCritItem := false
	for _, it := range granter.granted {
		if it.TemplateID == 4080 {
			foundCritItem = true
		}
	}
	if !foundCritItem {
		t.Fatalf("expected inc=4 crit-bonus item granted, got %+v", granter.granted)
	}
}

func TestDoSigninRejectsUnderLevel(t *testing.T) {
	now := time.Date(2026, 5, 10, 12, 0, 0, 0, time.UTC)
	svc, _, _, _ := newTestService(
		&dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5},
		defaultRewards(),
		nil,
		&domainchar.Character{ID: 1, Level: 49, Gold: 100000},
		now,
		1,
	)
	_, err := svc.DoSignin(context.Background(), 1)
	if !errors.Is(err, ErrLevelTooLow) {
		t.Fatalf("err = %v, want ErrLevelTooLow", err)
	}
}

func TestRetroactiveBumpsCrit(t *testing.T) {
	now := time.Date(2026, 5, 10, 12, 0, 0, 0, time.UTC)
	svc, _, _, _ := newTestService(
		&dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5, CritPercent: 10},
		defaultRewards(),
		nil,
		levelFiftyChar(1),
		now,
		1,
	)
	out, err := svc.Retroactive(context.Background(), 1)
	if err != nil {
		t.Fatalf("Retroactive: %v", err)
	}
	if out.Record.CritPercent != 15 && out.Record.CritPercent != 0 {
		t.Fatalf("crit %d, want 15 (or 0 if rolled), got neither", out.Record.CritPercent)
	}
	if out.Day < 1 {
		t.Fatalf("expected missed day, got %d", out.Day)
	}
}

func TestSurpriseRewardRequiresStreak(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Date(2026, 5, 9, 12, 0, 0, 0, time.UTC)
	if weekday(now) != cfg.SurpriseDay {
		t.Skip("test fixture date does not match configured surpriseDay")
	}
	svc, granter, _, _ := newTestService(
		&dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5},
		defaultRewards(),
		nil,
		levelFiftyChar(1),
		now,
		1,
	)
	_, err := svc.DoSignin(context.Background(), 1)
	if err != nil {
		t.Fatalf("DoSignin: %v", err)
	}
	for _, it := range granter.granted {
		if it.TemplateID == 4015 {
			t.Fatalf("surprise item granted despite incomplete streak")
		}
	}
}

func TestGetAwardRequiresThreshold(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Date(2026, 5, 7, 12, 0, 0, 0, time.UTC)
	if weekday(now) != cfg.LuckyDay {
		t.Skip("test fixture date does not match configured luckyDay")
	}
	rec := &dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5, ConsumeLimitTotal: 100}
	for d := 1; d <= now.Day(); d++ {
		rec.MarkClaimed(d)
	}
	tiers := map[int]dailysignin.LuckyTier{
		1: {Year: 2026, Month: 5, WeekIndex: 1, Threshold: 499, GoldAmount: 500},
	}
	svc, _, _, _ := newTestService(rec, defaultRewards(), tiers, levelFiftyChar(1), now, 1)
	_, err := svc.GetAward(context.Background(), 1)
	if !errors.Is(err, ErrAwardNotAvailable) {
		t.Fatalf("err = %v, want ErrAwardNotAvailable (threshold not met)", err)
	}
}

func TestGetAwardGrantsGold(t *testing.T) {
	cfg := DefaultConfig()
	now := time.Date(2026, 5, 7, 12, 0, 0, 0, time.UTC)
	if weekday(now) != cfg.LuckyDay {
		t.Skip("test fixture date does not match configured luckyDay")
	}
	rec := &dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5, ConsumeLimitTotal: 600}
	for d := 1; d <= now.Day(); d++ {
		rec.MarkClaimed(d)
	}
	tiers := map[int]dailysignin.LuckyTier{
		1: {Year: 2026, Month: 5, WeekIndex: 1, Threshold: 499, GoldAmount: 500},
	}
	char := levelFiftyChar(1)
	startGold := char.Gold
	svc, _, charRepo, _ := newTestService(rec, defaultRewards(), tiers, char, now, 1)
	out, err := svc.GetAward(context.Background(), 1)
	if err != nil {
		t.Fatalf("GetAward: %v", err)
	}
	if out.GoldSpent != -500 {
		t.Fatalf("GoldSpent = %d, want -500 (credit)", out.GoldSpent)
	}
	if charRepo.char.Gold != startGold+500 {
		t.Fatalf("gold = %d, want %d", charRepo.char.Gold, startGold+500)
	}
	if !out.Record.LuckyAwardClaimed {
		t.Fatalf("luckyAwardClaimed not set")
	}
}

func TestUpCritRequiresLevel(t *testing.T) {
	now := time.Date(2026, 5, 10, 12, 0, 0, 0, time.UTC)
	svc, _, _, _ := newTestService(
		&dailysignin.Record{CharacterID: 1, Year: 2026, Month: 5},
		defaultRewards(),
		nil,
		&domainchar.Character{ID: 1, Level: 49, Gold: 100000},
		now,
		1,
	)
	_, err := svc.UpCrit(context.Background(), 1)
	if !errors.Is(err, ErrLevelTooLow) {
		t.Fatalf("err = %v, want ErrLevelTooLow", err)
	}
}

func TestWeekOfMonth(t *testing.T) {
	cases := []struct {
		day  int
		want int
	}{
		{0, 0},
		{1, 1},
		{7, 1},
		{8, 2},
		{14, 2},
		{15, 3},
		{21, 3},
		{22, 4},
		{28, 4},
		{29, 5},
		{31, 5},
	}
	for _, c := range cases {
		if got := dailysignin.WeekOfMonth(c.day); got != c.want {
			t.Fatalf("WeekOfMonth(%d)=%d, want %d", c.day, got, c.want)
		}
	}
}
