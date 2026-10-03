// Open-sourced by BaoLT

// Daily sign-in application service.
// Owns the rules for both the modern monthly DailySignInPanel and the legacy
// SignInPanel; the legacy panel projects from the modern record so there is a
// single ledger per character per month.
// Crit auto-bumps +5% on every signin/retroactive; on a successful crit roll
// the meter resets to 0 and an item from the inc=4 pool is granted.
// Lucky-day claim grants gold (luckyGold[w]) once cumulative sign-in spend
// has crossed the week's threshold (luckyPoint[w]). Both luckyPoint and
// luckyGold come from data.daily_signin_lucky_tiers per (year, month, week).
// Currency: Gold (Vcoin) covers retroactive sign-in and crit-rate purchases;
// regular gold (Money) is never charged here.
package dailysignin

import (
	"context"
	"errors"
	"math/rand"
	"sync"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/dailysignin"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

var (
	ErrAlreadyClaimedToday = errors.New("daily sign-in: already claimed today")
	ErrAwardNotAvailable   = errors.New("daily sign-in: award not available")
	ErrAwardAlreadyClaimed = errors.New("daily sign-in: award already claimed")
	ErrNoMissedDays        = errors.New("daily sign-in: no missed days")
	ErrCritMaxed           = errors.New("daily sign-in: crit already at 100%")
	ErrLevelTooLow         = errors.New("daily sign-in: level too low")
)

type Config struct {
	RetroactivePrice int64
	CritPrice        int64
	CritStep         int
	SurpriseDay      int
	LuckyDay         int
	EventStartUnixMS int64
	LevelGate        int
	CloseOnKey       int
}

func DefaultConfig() Config {
	return Config{
		RetroactivePrice: 50,
		CritPrice:        100,
		CritStep:         5,
		SurpriseDay:      6,
		LuckyDay:         4,
		EventStartUnixMS: 0,
		LevelGate:        50,
		CloseOnKey:       1,
	}
}

type ItemGranter interface {
	AddItemWithBindAndColor(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool, colorCode int) (*domainitem.Item, error)
	BuildClientItemDTO(it *domainitem.Item) map[string]interface{}
	GetItemTemplate(templateID int) *models.ItemTemplateTemplate
}

type Service struct {
	records dailysignin.Repository
	rewards dailysignin.RewardCatalog
	tiers   dailysignin.LuckyTierCatalog
	chars   domainchar.Repository
	items   ItemGranter
	logger  *zap.Logger
	cfg     Config
	nowFn   func() time.Time
	mu      sync.Mutex
	rng     *rand.Rand
}

func NewService(
	records dailysignin.Repository,
	rewards dailysignin.RewardCatalog,
	tiers dailysignin.LuckyTierCatalog,
	chars domainchar.Repository,
	items ItemGranter,
	logger *zap.Logger,
) *Service {
	return &Service{
		records: records,
		rewards: rewards,
		tiers:   tiers,
		chars:   chars,
		items:   items,
		logger:  logger,
		cfg:     DefaultConfig(),
		nowFn:   time.Now,
		rng:     rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *Service) SetConfig(cfg Config) {
	s.cfg = cfg
}

func (s *Service) GetConfig() Config {
	return s.cfg
}

func (s *Service) SetNowFunc(fn func() time.Time) {
	if fn != nil {
		s.nowFn = fn
	}
}

func (s *Service) SetRandSource(src rand.Source) {
	if src == nil {
		return
	}
	s.mu.Lock()
	defer s.mu.Unlock()
	s.rng = rand.New(src)
}

type State struct {
	Now      time.Time
	Record   *dailysignin.Record
	AwardDay int
}

type GrantedItem struct {
	Inc      int
	ItemID   int
	Name     string
	Quantity int
	DTO      map[string]interface{}
}

type Outcome struct {
	Record    *dailysignin.Record
	Day       int
	AwardDay  int
	Granted   []GrantedItem
	GoldSpent int64
	GoldLeft  int64
}

type rewardBundle map[int][]*dailysignin.Reward

func (s *Service) critStep() int {
	if s.cfg.CritStep <= 0 {
		return 5
	}
	return s.cfg.CritStep
}

func (s *Service) eventStartDay(now time.Time, year, month int) int {
	if s.cfg.EventStartUnixMS <= 0 {
		return 1
	}
	start := time.UnixMilli(s.cfg.EventStartUnixMS).In(now.Location())
	if start.Year() == year && int(start.Month()) == month {
		return start.Day()
	}
	return 1
}

func weekday(t time.Time) int {
	w := int(t.Weekday())
	if w == 0 {
		return 7
	}
	return w
}

func lastDayOfMonth(t time.Time) int {
	first := time.Date(t.Year(), t.Month(), 1, 0, 0, 0, 0, t.Location())
	return first.AddDate(0, 1, -1).Day()
}

func (s *Service) computeAwardDay(ctx context.Context, rec *dailysignin.Record, now time.Time) int {
	if s.cfg.LuckyDay < 1 || s.cfg.LuckyDay > 7 {
		return 0
	}
	delta := s.cfg.LuckyDay - weekday(now)
	candidate := now.Day() + delta
	if candidate < 1 {
		return 0
	}
	last := lastDayOfMonth(now)
	if candidate > last {
		return 0
	}
	if candidate < now.Day() {
		return 0
	}
	if candidate > now.Day() {
		return candidate
	}
	startDay := s.eventStartDay(now, now.Year(), int(now.Month()))
	if !rec.IsStreakComplete(now.Day(), startDay) {
		return 0
	}
	if s.tiers == nil {
		return 0
	}
	weekIndex := dailysignin.WeekOfMonth(candidate)
	tier, err := s.tiers.GetTier(ctx, now.Year(), int(now.Month()), weekIndex)
	if err != nil {
		s.logger.Warn("daily signin: get tier failed",
			zap.Int("year", now.Year()), zap.Int("month", int(now.Month())),
			zap.Int("week", weekIndex), zap.Error(err))
		return 0
	}
	if tier.Threshold <= 0 || rec.ConsumeLimitTotal < tier.Threshold {
		return 0
	}
	return candidate
}

func (s *Service) GetState(ctx context.Context, characterID int64) (*State, error) {
	now := s.nowFn()
	rec, err := s.records.Get(ctx, characterID, now.Year(), int(now.Month()))
	if err != nil {
		return nil, err
	}
	return &State{Now: now, Record: rec, AwardDay: s.computeAwardDay(ctx, rec, now)}, nil
}

func (s *Service) ListRewards(ctx context.Context) ([]*dailysignin.Reward, error) {
	return s.rewards.List(ctx, nil)
}

func (s *Service) ListLuckyTiers(ctx context.Context, year, month int) []dailysignin.LuckyTier {
	if s.tiers == nil {
		return nil
	}
	out, err := s.tiers.ListForMonth(ctx, year, month)
	if err != nil {
		s.logger.Warn("daily signin: list lucky tiers failed",
			zap.Int("year", year), zap.Int("month", month), zap.Error(err))
		return nil
	}
	return out
}

func (s *Service) Now() time.Time {
	return s.nowFn()
}

func (s *Service) requireLevel(ctx context.Context, characterID int64) (*domainchar.Character, error) {
	char, err := s.chars.FindByID(ctx, characterID)
	if err != nil {
		return nil, err
	}
	gate := s.cfg.LevelGate
	if gate <= 0 {
		gate = 50
	}
	if char.Level < gate {
		return nil, ErrLevelTooLow
	}
	return char, nil
}

func (s *Service) DoSignin(ctx context.Context, characterID int64) (*Outcome, error) {
	if _, err := s.requireLevel(ctx, characterID); err != nil {
		return nil, err
	}
	now := s.nowFn()
	year, month, day := now.Year(), int(now.Month()), now.Day()

	pre, err := s.records.Get(ctx, characterID, year, month)
	if err != nil {
		return nil, err
	}

	step := s.critStep()
	rollHit := s.rollPercent(critAfter(pre.CritPercent, step))

	res, err := s.records.Apply(ctx, dailysignin.ApplyInput{
		CharacterID: characterID, Year: year, Month: month, Day: day,
		CritDelta: step,
		ResetCrit: rollHit,
	})
	if err != nil {
		return nil, err
	}
	if !res.DaySet {
		return nil, ErrAlreadyClaimedToday
	}

	bundle := s.fetchRewardBundle(ctx)
	out := &Outcome{Record: res.Record, Day: day}
	out.Granted = append(out.Granted, s.grantFromBundle(ctx, characterID, bundle, dailysignin.IncDaily, false)...)

	startDay := s.eventStartDay(now, year, month)
	if weekday(now) == s.cfg.SurpriseDay && res.Record.IsStreakComplete(day, startDay) {
		out.Granted = append(out.Granted, s.grantFromBundle(ctx, characterID, bundle, dailysignin.IncSurpriseDay, false)...)
	}
	if rollHit {
		out.Granted = append(out.Granted, s.grantFromBundle(ctx, characterID, bundle, dailysignin.IncCritBonus, false)...)
	}

	out.AwardDay = s.computeAwardDay(ctx, out.Record, now)
	return out, nil
}

func (s *Service) GetAward(ctx context.Context, characterID int64) (*Outcome, error) {
	char, err := s.requireLevel(ctx, characterID)
	if err != nil {
		return nil, err
	}
	now := s.nowFn()
	year, month, today := now.Year(), int(now.Month()), now.Day()

	pre, err := s.records.Get(ctx, characterID, year, month)
	if err != nil {
		return nil, err
	}
	if pre.LuckyAwardClaimed {
		return nil, ErrAwardAlreadyClaimed
	}
	if weekday(now) != s.cfg.LuckyDay {
		return nil, ErrAwardNotAvailable
	}
	if !pre.IsStreakComplete(today, s.eventStartDay(now, year, month)) {
		return nil, ErrAwardNotAvailable
	}

	if s.tiers == nil {
		return nil, ErrAwardNotAvailable
	}
	weekIndex := dailysignin.WeekOfMonth(today)
	tier, err := s.tiers.GetTier(ctx, year, month, weekIndex)
	if err != nil || tier.GoldAmount <= 0 {
		return nil, ErrAwardNotAvailable
	}
	if pre.ConsumeLimitTotal < tier.Threshold {
		return nil, ErrAwardNotAvailable
	}

	res, err := s.records.Apply(ctx, dailysignin.ApplyInput{
		CharacterID: characterID, Year: year, Month: month, SetAwardClaimed: true,
	})
	if err != nil {
		return nil, err
	}
	if !res.AwardSet {
		return nil, ErrAwardAlreadyClaimed
	}

	char.Gold += tier.GoldAmount
	if err := s.chars.Update(ctx, char); err != nil {
		return nil, err
	}

	return &Outcome{
		Record:    res.Record,
		AwardDay:  today,
		GoldSpent: -tier.GoldAmount,
		GoldLeft:  char.Gold + char.GoldBind,
	}, nil
}

func (s *Service) Retroactive(ctx context.Context, characterID int64) (*Outcome, error) {
	char, err := s.requireLevel(ctx, characterID)
	if err != nil {
		return nil, err
	}
	now := s.nowFn()
	year, month, today := now.Year(), int(now.Month()), now.Day()

	pre, err := s.records.Get(ctx, characterID, year, month)
	if err != nil {
		return nil, err
	}
	missed := pre.FirstUnclaimedBefore(today, s.eventStartDay(now, year, month))
	if missed == 0 {
		return nil, ErrNoMissedDays
	}

	price := s.cfg.RetroactivePrice
	if char.Gold+char.GoldBind < price {
		return nil, pkgerrors.ErrInsufficientFunds
	}

	step := s.critStep()
	rollHit := s.rollPercent(critAfter(pre.CritPercent, step))

	res, err := s.records.Apply(ctx, dailysignin.ApplyInput{
		CharacterID: characterID, Year: year, Month: month, Day: missed,
		CritDelta:    step,
		ConsumeDelta: price,
		ResetCrit:    rollHit,
	})
	if err != nil {
		return nil, err
	}
	if !res.DaySet {
		return nil, ErrNoMissedDays
	}

	spent, left, err := s.spendGold(ctx, char, price)
	if err != nil {
		return nil, err
	}

	bundle := s.fetchRewardBundle(ctx)
	out := &Outcome{Record: res.Record, Day: missed, GoldSpent: spent, GoldLeft: left}
	out.Granted = append(out.Granted, s.grantFromBundle(ctx, characterID, bundle, dailysignin.IncDaily, false)...)
	if rollHit {
		out.Granted = append(out.Granted, s.grantFromBundle(ctx, characterID, bundle, dailysignin.IncCritBonus, false)...)
	}
	out.AwardDay = s.computeAwardDay(ctx, out.Record, now)
	return out, nil
}

func (s *Service) UpCrit(ctx context.Context, characterID int64) (*Outcome, error) {
	char, err := s.requireLevel(ctx, characterID)
	if err != nil {
		return nil, err
	}
	now := s.nowFn()
	year, month := now.Year(), int(now.Month())

	pre, err := s.records.Get(ctx, characterID, year, month)
	if err != nil {
		return nil, err
	}
	if pre.CritPercent >= 100 {
		return nil, ErrCritMaxed
	}

	price := s.cfg.CritPrice
	if char.Gold+char.GoldBind < price {
		return nil, pkgerrors.ErrInsufficientFunds
	}

	res, err := s.records.Apply(ctx, dailysignin.ApplyInput{
		CharacterID: characterID, Year: year, Month: month,
		CritDelta:    s.critStep(),
		ConsumeDelta: price,
	})
	if err != nil {
		return nil, err
	}
	if !res.CritChanged {
		return nil, ErrCritMaxed
	}

	spent, left, err := s.spendGold(ctx, char, price)
	if err != nil {
		return nil, err
	}

	return &Outcome{
		Record:    res.Record,
		AwardDay:  s.computeAwardDay(ctx, res.Record, now),
		GoldSpent: spent,
		GoldLeft:  left,
	}, nil
}

func critAfter(pre, step int) int {
	next := pre + step
	if next < 0 {
		return 0
	}
	if next > 100 {
		return 100
	}
	return next
}

type LegacyResult struct {
	State   dailysignin.LegacyState
	Granted []GrantedItem
	Record  *dailysignin.Record
}

func (s *Service) GetLegacy(ctx context.Context, characterID int64) (*LegacyResult, error) {
	st, err := s.GetState(ctx, characterID)
	if err != nil {
		return nil, err
	}
	return &LegacyResult{
		State:  st.Record.LegacyState(st.Now.Day()),
		Record: st.Record,
	}, nil
}

func (s *Service) DoLegacySignin(ctx context.Context, characterID int64) (*LegacyResult, error) {
	out, err := s.DoSignin(ctx, characterID)
	if err != nil {
		if errors.Is(err, ErrAlreadyClaimedToday) {
			return s.GetLegacy(ctx, characterID)
		}
		return nil, err
	}
	return &LegacyResult{
		State:   out.Record.LegacyState(s.nowFn().Day()),
		Granted: out.Granted,
		Record:  out.Record,
	}, nil
}

func (s *Service) spendGold(ctx context.Context, char *domainchar.Character, amount int64) (int64, int64, error) {
	if amount <= 0 {
		return 0, char.Gold + char.GoldBind, nil
	}
	if char.GoldBind+char.Gold < amount {
		return 0, 0, pkgerrors.ErrInsufficientFunds
	}
	remaining := amount
	if char.GoldBind > 0 {
		take := min(char.GoldBind, remaining)
		char.GoldBind -= take
		remaining -= take
	}
	if remaining > 0 {
		char.Gold -= remaining
	}
	if err := s.chars.Update(ctx, char); err != nil {
		return 0, 0, err
	}
	return amount, char.Gold + char.GoldBind, nil
}

func (s *Service) rollPercent(percent int) bool {
	if percent <= 0 {
		return false
	}
	if percent >= 100 {
		return true
	}
	s.mu.Lock()
	defer s.mu.Unlock()
	return s.rng.Intn(100) < percent
}

func (s *Service) pickWeighted(rewards []*dailysignin.Reward) *dailysignin.Reward {
	if len(rewards) == 0 {
		return nil
	}
	total := 0
	for _, r := range rewards {
		if r.Weight > 0 {
			total += r.Weight
		}
	}
	if total <= 0 {
		return rewards[0]
	}
	s.mu.Lock()
	pick := s.rng.Intn(total)
	s.mu.Unlock()
	for _, r := range rewards {
		if r.Weight <= 0 {
			continue
		}
		if pick < r.Weight {
			return r
		}
		pick -= r.Weight
	}
	return rewards[len(rewards)-1]
}

func (s *Service) fetchRewardBundle(ctx context.Context) rewardBundle {
	rewards, err := s.rewards.List(ctx, nil)
	if err != nil {
		s.logger.Warn("daily signin: list rewards failed", zap.Error(err))
		return rewardBundle{}
	}
	bundle := make(rewardBundle, 3)
	for _, r := range rewards {
		bundle[r.Inc] = append(bundle[r.Inc], r)
	}
	return bundle
}

func (s *Service) grantFromBundle(ctx context.Context, characterID int64, bundle rewardBundle, inc int, deterministic bool) []GrantedItem {
	rewards := bundle[inc]
	if len(rewards) == 0 {
		return nil
	}
	var picked *dailysignin.Reward
	if inc == dailysignin.IncDaily || deterministic {
		picked = highestWeight(rewards)
	} else {
		picked = s.pickWeighted(rewards)
	}
	if picked == nil {
		return nil
	}

	added, err := s.items.AddItemWithBindAndColor(ctx, characterID, picked.ItemID, domainitem.ItemTypeConsumable, picked.Quantity, true, 0)
	if err != nil {
		s.logger.Warn("daily signin: grant item failed",
			zap.Int64("characterID", characterID),
			zap.Int("itemID", picked.ItemID),
			zap.Int("inc", inc),
			zap.Error(err))
		return nil
	}
	name := ""
	if tpl := s.items.GetItemTemplate(picked.ItemID); tpl != nil {
		name = tpl.Name
	}
	return []GrantedItem{{
		Inc:      inc,
		ItemID:   picked.ItemID,
		Name:     name,
		Quantity: picked.Quantity,
		DTO:      s.items.BuildClientItemDTO(added),
	}}
}

func highestWeight(rewards []*dailysignin.Reward) *dailysignin.Reward {
	var best *dailysignin.Reward
	for _, r := range rewards {
		if best == nil || r.Weight > best.Weight {
			best = r
		}
	}
	return best
}
