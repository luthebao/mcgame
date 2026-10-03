// Open-sourced by BaoLT

// Recipe extract & transform logic for the Dress Panel.
package dress

import (
	"context"
	"strconv"

	"mcgame-server/internal/gamedata/models"
)

func (s *Service) FreeExtract(ctx context.Context, charID int64) (string, RecipeDrop, SpendSummary, error) {
	pool := s.recipePool()
	if len(pool) == 0 {
		return "", RecipeDrop{}, SpendSummary{}, ErrNoRecipePool
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", RecipeDrop{}, SpendSummary{}, err
	}
	info.ResetDailyIfNeeded(s.today())
	if info.Extract >= freeExtractLimit {
		return "", RecipeDrop{}, SpendSummary{}, ErrFreeExtractExhausted
	}
	drop := s.rollOne(pool)
	info.Extract++
	info.AddRecipe(drop.RecipeID, drop.Num)
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", RecipeDrop{}, SpendSummary{}, err
	}
	return encoded, drop, SpendSummary{}, nil
}

func (s *Service) GoldExtract(ctx context.Context, charID int64) (string, RecipeDrop, SpendSummary, error) {
	pool := s.recipePool()
	if len(pool) == 0 {
		return "", RecipeDrop{}, SpendSummary{}, ErrNoRecipePool
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", RecipeDrop{}, SpendSummary{}, err
	}
	info.ResetDailyIfNeeded(s.today())
	if char.Gold < int64(costGoldExtractOne) {
		return "", RecipeDrop{}, SpendSummary{}, ErrInsufficientGold
	}
	char.Gold -= int64(costGoldExtractOne)
	drop := s.rollOne(pool)
	info.AddRecipe(drop.RecipeID, drop.Num)
	info.Score += costGoldExtractOne
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", RecipeDrop{}, SpendSummary{}, err
	}
	spend := SpendSummary{Gold: int64(costGoldExtractOne)}
	spend.SetCurrencyTotal("gold", char.Gold)
	return encoded, drop, spend, nil
}

func (s *Service) TenExtract(ctx context.Context, charID int64) (string, []RecipeDrop, SpendSummary, error) {
	pool := s.recipePool()
	setPool := s.recipeSetPool()
	if len(pool) == 0 {
		return "", nil, SpendSummary{}, ErrNoRecipePool
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", nil, SpendSummary{}, err
	}
	info.ResetDailyIfNeeded(s.today())
	if char.Gold < int64(costGoldExtractTen) {
		return "", nil, SpendSummary{}, ErrInsufficientGold
	}
	char.Gold -= int64(costGoldExtractTen)
	drops := s.rollMany(pool, 10)
	if len(setPool) > 0 {
		drops = append(drops, s.rollOne(setPool))
	}
	for _, d := range drops {
		info.AddRecipe(d.RecipeID, d.Num)
	}
	info.Score += costGoldExtractTen
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", nil, SpendSummary{}, err
	}
	spend := SpendSummary{Gold: int64(costGoldExtractTen)}
	spend.SetCurrencyTotal("gold", char.Gold)
	return encoded, drops, spend, nil
}

func (s *Service) SsdExtract(ctx context.Context, charID int64) (string, RecipeDrop, error) {
	return "", RecipeDrop{}, ErrInsufficientFashion
}

func (s *Service) LargeSsdExtract(ctx context.Context, charID int64) (string, []RecipeDrop, error) {
	return "", nil, ErrInsufficientFashion
}

func (s *Service) MakeAllChips(ctx context.Context, charID int64) (string, int, error) {
	char, info, normalized, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", 0, err
	}

	converted := 0
	for key, count := range info.Recipe {
		if count <= 0 {
			continue
		}

		recipeID, err := strconv.ParseInt(key, 10, 64)
		if err != nil {
			continue
		}

		tpl := s.gameData.GetRecipe(int(recipeID))
		if tpl == nil || int(tpl.Type) != recipeTypeChip {
			continue
		}

		required := int(tpl.Num)
		productID := int64(tpl.Product)
		if required <= 0 || productID <= 0 {
			continue
		}

		rounds := count / required
		if rounds <= 0 {
			continue
		}

		info.AddRecipe(recipeID, -(rounds * required))
		info.AddRecipe(productID, rounds)
		converted += rounds
	}

	if converted == 0 {
		if normalized {
			encoded, err := s.saveChar(ctx, char, info)
			return encoded, 0, err
		}
		encoded, err := info.EncodeClient()
		return encoded, 0, err
	}

	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", 0, err
	}

	return encoded, converted, nil
}

func (s *Service) TransformRecipe(ctx context.Context, charID int64, recipeIDs []int64) (string, RecipeDrop, error) {
	pool := s.recipeSetPool()
	if len(pool) == 0 {
		return "", RecipeDrop{}, ErrNoRecipePool
	}
	if len(recipeIDs) < transformInputCount {
		return "", RecipeDrop{}, ErrInsufficientRecipes
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", RecipeDrop{}, err
	}
	consumed := recipeIDs[:transformInputCount]
	if !s.consumeRecipes(info, consumed) {
		return "", RecipeDrop{}, ErrInsufficientRecipes
	}
	drop := s.rollOne(pool)
	info.AddRecipe(drop.RecipeID, drop.Num)
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", RecipeDrop{}, err
	}
	return encoded, drop, nil
}

func (s *Service) TransformAllRecipe(ctx context.Context, charID int64, recipeIDs []int64) (string, []RecipeDrop, error) {
	pool := s.recipeSetPool()
	if len(pool) == 0 {
		return "", nil, ErrNoRecipePool
	}
	if len(recipeIDs) < transformInputCount {
		return "", nil, ErrInsufficientRecipes
	}
	char, info, _, err := s.loadChar(ctx, charID)
	if err != nil {
		return "", nil, err
	}
	rounds := s.maxTransformRounds(info, recipeIDs[:transformInputCount])
	if rounds <= 0 {
		return "", nil, ErrInsufficientRecipes
	}
	for r := 0; r < rounds; r++ {
		if !s.consumeRecipes(info, recipeIDs[:transformInputCount]) {
			break
		}
	}
	drops := s.rollMany(pool, rounds)
	for _, d := range drops {
		info.AddRecipe(d.RecipeID, d.Num)
	}
	encoded, err := s.saveChar(ctx, char, info)
	if err != nil {
		return "", nil, err
	}
	return encoded, drops, nil
}

func (s *Service) consumeRecipes(info infoConsumer, ids []int64) bool {
	counts := map[int64]int{}
	for _, id := range ids {
		counts[id]++
	}
	for id, n := range counts {
		if info.RecipeCount(id) < n {
			return false
		}
	}
	for id, n := range counts {
		info.AddRecipe(id, -n)
	}
	return true
}

type infoConsumer interface {
	RecipeCount(int64) int
	AddRecipe(int64, int)
}

func (s *Service) maxTransformRounds(info infoConsumer, ids []int64) int {
	counts := map[int64]int{}
	for _, id := range ids {
		counts[id]++
	}
	rounds := -1
	for id, perRound := range counts {
		have := info.RecipeCount(id)
		r := have / perRound
		if rounds < 0 || r < rounds {
			rounds = r
		}
	}
	if rounds < 0 {
		return 0
	}
	return rounds
}

func (s *Service) rollMany(pool []*models.RecipeTemplate, n int) []RecipeDrop {
	out := make([]RecipeDrop, 0, n)
	for i := 0; i < n; i++ {
		out = append(out, s.rollOne(pool))
	}
	return out
}
