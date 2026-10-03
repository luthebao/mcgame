// Open-sourced by BaoLT

// Application service for the Dress Panel.
// Coordinates dress activation, recipe extracts (free / gold / fashion-points),
// transformations, and the daily reset. Reads game data templates from
// gamedata.Manager and persists state through the character repository
// (dress_info JSON column).
package dress

import (
	"context"
	"errors"
	"fmt"
	"math/rand"
	"strconv"
	"sync"
	"time"

	"go.uber.org/zap"

	domainchar "mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"
)

const (
	freeExtractLimit = 1

	costGoldExtractOne = 30
	costGoldExtractTen = 288

	costSsdExtractOne = 300
	costSsdExtractTen = 2880

	crystalGoldPrice = 1
	jewelGoldPrice   = 5

	recipeTypeRecipe = 1
	recipeTypeChip   = 2

	transformInputCount = 3
)

var (
	ErrFreeExtractExhausted = errors.New("dress: free extract already used today")
	ErrInsufficientGold     = errors.New("dress: not enough gold")
	ErrInsufficientFashion  = errors.New("dress: not enough fashion points")
	ErrInsufficientMaterial = errors.New("dress: not enough crystal/jewel")
	ErrInsufficientScore    = errors.New("dress: not enough dress score")
	ErrInsufficientRecipes  = errors.New("dress: not enough recipes to transform")
	ErrInvalidDress         = errors.New("dress: unknown dress id")
	ErrInvalidRecipe        = errors.New("dress: unknown recipe id")
	ErrAlreadyClaimed       = errors.New("dress: already claimed")
	ErrNotActivated         = errors.New("dress: not activated yet")
	ErrAlreadyActivated     = errors.New("dress: already activated")
	ErrNoRecipePool         = errors.New("dress: empty recipe pool")
)

type Clock interface {
	Now() time.Time
}

type systemClock struct{}

func (systemClock) Now() time.Time { return time.Now() }

type RecipeDrop struct {
	RecipeID int64
	Num      int
}

type ReceiveGoodsResult struct {
	DressInfo  string
	TemplateID int
	ColorCode  int
}

type PointSpend struct {
	Label  string
	Amount int64
}

type SpendSummary struct {
	Gold           int64
	GoldBind       int64
	Money          int64
	MoneyBind      int64
	CurrencyTotals map[string]int64
	Points         []PointSpend
}

func (s *SpendSummary) AddPoint(label string, amount int64) {
	if s == nil || label == "" || amount == 0 {
		return
	}
	s.Points = append(s.Points, PointSpend{Label: label, Amount: amount})
}

func (s *SpendSummary) SetCurrencyTotal(key string, amount int64) {
	if s == nil || key == "" {
		return
	}
	if s.CurrencyTotals == nil {
		s.CurrencyTotals = make(map[string]int64)
	}
	s.CurrencyTotals[key] = amount
}

type Service struct {
	charRepo domainchar.Repository
	gameData *gamedata.Manager
	logger   *zap.Logger
	clock    Clock

	rngMu sync.Mutex
	rng   *rand.Rand
}

func NewService(charRepo domainchar.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	return &Service{
		charRepo: charRepo,
		gameData: gameData,
		logger:   logger,
		clock:    systemClock{},
		rng:      rand.New(rand.NewSource(time.Now().UnixNano())),
	}
}

func (s *Service) SetClock(c Clock) { s.clock = c }

func (s *Service) today() string {
	return s.clock.Now().UTC().Format("2006-01-02")
}

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, *domaindress.Info, bool, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, nil, false, err
	}
	info, err := domaindress.Decode(char.DressInfo)
	if err != nil {
		s.logger.Warn("dress: failed to decode dress_info, resetting", zap.Int64("character_id", charID), zap.Error(err))
		info = domaindress.NewInfo()
	}
	return char, info, s.normalizeActivatedRecipes(info), nil
}

func (s *Service) saveChar(ctx context.Context, char *domainchar.Character, info *domaindress.Info) (string, error) {
	encoded, err := info.Encode()
	if err != nil {
		return "", fmt.Errorf("dress: encode info: %w", err)
	}
	char.DressInfo = encoded
	if err := s.charRepo.Update(ctx, char); err != nil {
		return "", err
	}
	return info.EncodeClient()
}

func (s *Service) normalizeActivatedRecipes(info *domaindress.Info) bool {
	if info == nil {
		return false
	}
	changed := false
	for dressIDRaw, state := range info.Book {
		if state < 1 {
			continue
		}
		dressID, err := strconv.ParseInt(dressIDRaw, 10, 64)
		if err != nil {
			continue
		}
		if info.RecipeBurned(dressID) {
			continue
		}
		tpl := s.gameData.GetDress(int(dressID))
		if tpl != nil {
			recipeID := int64(tpl.RecipeID)
			if recipeID > 0 && info.RecipeCount(recipeID) > 0 {
				info.AddRecipe(recipeID, -1)
				changed = true
			}
		}
		info.MarkRecipeBurned(dressID)
		changed = true
	}
	return changed
}

func (s *Service) CheckSameDay(ctx context.Context, charID int64) (string, error) {
	char, info, normalized, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", err
	}
	changed := info.ResetDailyIfNeeded(s.today())
	if changed || normalized || char.DressInfo == "" || char.DressInfo == "null" {
		return s.saveChar(ctx, char, info)
	}
	return info.EncodeClient()
}

func (s *Service) ActivateDress(ctx context.Context, charID, dressID int64, autoBuy bool) (string, SpendSummary, error) {
	tpl := s.gameData.GetDress(int(dressID))
	if tpl == nil {
		return "", SpendSummary{}, ErrInvalidDress
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", SpendSummary{}, err
	}
	info.ResetDailyIfNeeded(s.today())
	if info.HasActivated(dressID) {
		return "", SpendSummary{}, ErrAlreadyActivated
	}
	spend := SpendSummary{}
	recipeID := int64(tpl.RecipeID)
	if recipeID > 0 && info.RecipeCount(recipeID) < 1 {
		return "", SpendSummary{}, ErrInsufficientRecipes
	}

	needCrystal := int(tpl.Num1)
	needJewel := int(tpl.Num2)
	missCrystal := max0(needCrystal - info.Bag.Crystal)
	missJewel := max0(needJewel - info.Bag.Jewel)

	if missCrystal > 0 || missJewel > 0 {
		if !autoBuy {
			return "", SpendSummary{}, ErrInsufficientMaterial
		}
		goldCost := int64(missCrystal*crystalGoldPrice + missJewel*jewelGoldPrice)
		if char.Gold < goldCost {
			return "", SpendSummary{}, ErrInsufficientGold
		}
		char.Gold -= goldCost
		spend.Gold += goldCost
		info.Bag.Crystal += missCrystal
		info.Bag.Jewel += missJewel
	}

	info.Bag.Crystal -= needCrystal
	info.Bag.Jewel -= needJewel
	if recipeID > 0 {
		info.AddRecipe(recipeID, -1)
	}
	info.SetActivated(dressID)
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", SpendSummary{}, err
	}
	return encoded, spend, nil
}

func (s *Service) EnsureBuyActive(ctx context.Context, charID, dressID int64) (string, SpendSummary, error) {
	return s.ActivateDress(ctx, charID, dressID, true)
}

func (s *Service) ReceiveGoods(ctx context.Context, charID, dressID int64) (*ReceiveGoodsResult, error) {
	tpl := s.gameData.GetDress(int(dressID))
	if tpl == nil {
		return nil, ErrInvalidDress
	}
	_, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return nil, err
	}
	if !info.HasActivated(dressID) {
		return nil, ErrNotActivated
	}

	templateID := int(tpl.EquiptID)
	if templateID <= 0 {
		return nil, ErrInvalidDress
	}

	dressInfo, err := info.EncodeClient()
	if err != nil {
		return nil, fmt.Errorf("dress: encode client info: %w", err)
	}

	return &ReceiveGoodsResult{
		DressInfo:  dressInfo,
		TemplateID: templateID,
		ColorCode:  domainitem.EquipmentColorCodeFromDisplayColor(int(tpl.Color)),
	}, nil
}

func (s *Service) ExchangeRecipe(ctx context.Context, charID, recipeID int64) (string, SpendSummary, error) {
	tpl := s.gameData.GetRecipe(int(recipeID))
	if tpl == nil {
		return "", SpendSummary{}, ErrInvalidRecipe
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", SpendSummary{}, err
	}
	cost := int(tpl.Money)
	if info.Score < cost {
		return "", SpendSummary{}, ErrInsufficientScore
	}
	info.Score -= cost
	info.AddRecipe(recipeID, 1)
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", SpendSummary{}, err
	}
	spend := SpendSummary{}
	spend.AddPoint("điểm thời trang", int64(cost))
	return encoded, spend, nil
}

func (s *Service) SetFakeDress(ctx context.Context, charID, dressID int64) (string, error) {
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", err
	}
	info.FakeDressID = dressID
	return s.saveChar(ctx, char, info)
}

func (s *Service) UnsetFakeDress(ctx context.Context, charID int64) (string, error) {
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", err
	}
	info.FakeDressID = 0
	return s.saveChar(ctx, char, info)
}

func (s *Service) SetFakeFlyerDress(ctx context.Context, charID, dressID int64) (string, error) {
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", err
	}
	info.FakeFlyDressID = dressID
	return s.saveChar(ctx, char, info)
}

func (s *Service) UnsetFakeFlyerDress(ctx context.Context, charID int64) (string, error) {
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", err
	}
	info.FakeFlyDressID = 0
	return s.saveChar(ctx, char, info)
}

func max0(v int) int {
	if v < 0 {
		return 0
	}
	return v
}

func (s *Service) recipePool() []*models.RecipeTemplate {
	return s.poolByType(recipeTypeChip)
}

func (s *Service) recipeSetPool() []*models.RecipeTemplate {
	return s.poolByType(recipeTypeRecipe)
}

func (s *Service) poolByType(kind int) []*models.RecipeTemplate {
	all := s.gameData.GetAllRecipes()
	out := make([]*models.RecipeTemplate, 0, len(all))
	for _, r := range all {
		if int(r.Type) != kind {
			continue
		}
		if kind == recipeTypeRecipe && r.IsOpen <= 0 {
			continue
		}
		out = append(out, r)
	}
	return out
}

func (s *Service) rollOne(pool []*models.RecipeTemplate) RecipeDrop {
	s.rngMu.Lock()
	defer s.rngMu.Unlock()
	if len(pool) == 0 {
		return RecipeDrop{}
	}
	idx := s.rng.Intn(len(pool))
	return RecipeDrop{RecipeID: pool[idx].ID, Num: 1}
}
