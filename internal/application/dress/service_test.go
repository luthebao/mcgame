// Open-sourced by BaoLT

package dress

import (
	"context"
	"encoding/json"
	"testing"

	"go.uber.org/zap"

	domainchar "mcgame-server/internal/domain/character"
	domaindress "mcgame-server/internal/domain/dress"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"github.com/google/uuid"
)

type dressTestCharacterRepo struct {
	char        *domainchar.Character
	updateCount int
}

func (r *dressTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	return r.char, nil
}

func (r *dressTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *dressTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (r *dressTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (r *dressTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (r *dressTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	r.char = character
	r.updateCount++
	return nil
}

func (r *dressTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (r *dressTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (r *dressTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (r *dressTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

func newDressTestService(t *testing.T, char *domainchar.Character, dressRecords ...string) *Service {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	rawMessages := make([]json.RawMessage, 0, len(dressRecords))
	for _, dressRecord := range dressRecords {
		rawMessages = append(rawMessages, json.RawMessage(dressRecord))
	}
	if err := manager.GetCache().LoadTable(models.TableDress, rawMessages); err != nil {
		t.Fatalf("LoadTable(TBL_DRESS) error = %v", err)
	}

	repo := &dressTestCharacterRepo{char: char}
	return NewService(repo, manager, zap.NewNop())
}

func TestActivateDress_ConsumesStoredBagMaterials(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1001
	char.Gold = 0
	char.DressInfo = `{"book":{},"recipe":{"2001":1},"bag":{"crystal":3,"jewel":2},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char, `{"id":1001,"num1":2,"num2":1,"recipe_id":2001}`)

	got, spend, err := service.ActivateDress(context.Background(), char.ID, 1001, false)
	if err != nil {
		t.Fatalf("ActivateDress() error = %v", err)
	}
	if spend.Gold != 0 {
		t.Fatalf("gold spend = %d, want 0", spend.Gold)
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	if info.Bag.Crystal != 1 || info.Bag.Jewel != 1 {
		t.Fatalf("bag = %+v, want crystal=1 jewel=1", info.Bag)
	}
	if got := info.Recipe["2001"]; got != 0 {
		t.Fatalf("recipe 2001 count = %d, want removed", got)
	}
	if !info.HasActivated(1001) {
		t.Fatalf("dress 1001 not marked activated in %#v", info.Book)
	}
	if char.Gold != 0 {
		t.Fatalf("gold = %d, want 0", char.Gold)
	}
}

func TestActivateDress_ReturnsInsufficientMaterialWhenBagTooSmall(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1002
	char.DressInfo = `{"book":{},"recipe":{"2002":1},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char, `{"id":1002,"num1":2,"num2":1,"recipe_id":2002}`)

	if _, _, err := service.ActivateDress(context.Background(), char.ID, 1002, false); err != ErrInsufficientMaterial {
		t.Fatalf("ActivateDress() error = %v, want %v", err, ErrInsufficientMaterial)
	}
}

func TestActivateDress_ReturnsInsufficientRecipesWhenActivationRecipeMissing(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1010
	char.DressInfo = `{"book":{},"recipe":{},"bag":{"crystal":2,"jewel":1},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char, `{"id":1010,"num1":2,"num2":1,"recipe_id":2010}`)

	if _, _, err := service.ActivateDress(context.Background(), char.ID, 1010, false); err != ErrInsufficientRecipes {
		t.Fatalf("ActivateDress() error = %v, want %v", err, ErrInsufficientRecipes)
	}
}

func TestCheckSameDay_NormalizesLegacyActivatedRecipeEntries(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1011
	char.DressInfo = `{"book":{"1062":1,"1067":1,"2022":1},"recipe":{"1078":1,"1084":1,"1089":1},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char,
		`{"id":1062,"recipe_id":1084}`,
		`{"id":1067,"recipe_id":1089}`,
		`{"id":2022,"recipe_id":1078}`,
	)

	got, err := service.CheckSameDay(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("CheckSameDay() error = %v", err)
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	for _, recipeID := range []string{"1078", "1084", "1089"} {
		if got := info.Recipe[recipeID]; got != 0 {
			t.Fatalf("recipe %s count = %d, want removed", recipeID, got)
		}
	}
}

func TestReceiveGoods_DoesNotMarkDressClaimed(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1003
	char.DressInfo = `{"book":{"1003":1},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char, `{"id":1003,"equipt_id":5001,"color":3}`)

	result, err := service.ReceiveGoods(context.Background(), char.ID, 1003)
	if err != nil {
		t.Fatalf("ReceiveGoods() error = %v", err)
	}
	if result.TemplateID != 5001 {
		t.Fatalf("TemplateID = %d, want 5001", result.TemplateID)
	}
	if result.ColorCode != 4 {
		t.Fatalf("ColorCode = %d, want 4", result.ColorCode)
	}

	info, err := domaindress.Decode(result.DressInfo)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	if info.Book["1003"] != 1 {
		t.Fatalf("book[1003] = %d, want 1", info.Book["1003"])
	}
}

func TestAggregateCharacterStatBonuses_UsesActivatedDressBook(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1004
	char.DressInfo = `{"book":{"1004":1,"1005":2,"9999":0},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char,
		`{"id":1004,"prop1":1,"prop_num1":120,"prop2":4,"prop_num2":33}`,
		`{"id":1005,"prop1":11,"prop_num1":9,"prop2":59,"prop_num2":0.12}`,
	)

	bonuses := service.AggregateCharacterStatBonuses(context.Background(), char.ID)

	if got := bonuses.Flat[domainchar.PropMaxHP]; got != 120 {
		t.Fatalf("PropMaxHP = %d, want 120", got)
	}
	if got := bonuses.Flat[domainchar.PropAttack]; got != 33 {
		t.Fatalf("PropAttack = %d, want 33", got)
	}
	if got := bonuses.Flat[domainchar.PropSpeed]; got != 9 {
		t.Fatalf("PropSpeed = %d, want 9", got)
	}
	if got := bonuses.Float[domainchar.PropFinalPhysReduce]; got != 12 {
		t.Fatalf("PropFinalPhysReduce = %v, want 12", got)
	}
}

func TestGoldExtract_UsesGoldCostAsDressScore(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1005
	char.Gold = 100
	char.DressInfo = `{"book":{},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char)
	if err := service.gameData.GetCache().LoadTable(models.TableRecipe, []json.RawMessage{
		json.RawMessage(`{"id":2001,"type":2}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_RECIPE) error = %v", err)
	}

	got, _, spend, err := service.GoldExtract(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("GoldExtract() error = %v", err)
	}
	if spend.Gold != 30 {
		t.Fatalf("gold spend = %d, want 30", spend.Gold)
	}
	if got := spend.CurrencyTotals["gold"]; got != 70 {
		t.Fatalf("gold total = %d, want 70", got)
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	if info.Score != 30 {
		t.Fatalf("score = %d, want 30", info.Score)
	}
}

func TestTenExtract_UsesGoldCostAsDressScore(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1006
	char.Gold = 1000
	char.DressInfo = `{"book":{},"recipe":{},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char)
	if err := service.gameData.GetCache().LoadTable(models.TableRecipe, []json.RawMessage{
		json.RawMessage(`{"id":2001,"type":2}`),
		json.RawMessage(`{"id":3001,"type":1,"is_open":1}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_RECIPE) error = %v", err)
	}

	got, _, spend, err := service.TenExtract(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("TenExtract() error = %v", err)
	}
	if spend.Gold != 288 {
		t.Fatalf("gold spend = %d, want 288", spend.Gold)
	}
	if got := spend.CurrencyTotals["gold"]; got != 712 {
		t.Fatalf("gold total = %d, want 712", got)
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	if info.Score != 288 {
		t.Fatalf("score = %d, want 288", info.Score)
	}
}

func TestMakeAllChips_ConsumesChipCountsAndAddsRecipes(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1007
	char.DressInfo = `{"book":{},"recipe":{"2100":23,"3100":1},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char)
	if err := service.gameData.GetCache().LoadTable(models.TableRecipe, []json.RawMessage{
		json.RawMessage(`{"id":2100,"type":2,"num":10,"product":3100}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_RECIPE) error = %v", err)
	}

	got, converted, err := service.MakeAllChips(context.Background(), char.ID)
	if err != nil {
		t.Fatalf("MakeAllChips() error = %v", err)
	}
	if converted != 2 {
		t.Fatalf("converted = %d, want 2", converted)
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	if info.Recipe["2100"] != 3 {
		t.Fatalf("chip count = %d, want 3", info.Recipe["2100"])
	}
	if info.Recipe["3100"] != 3 {
		t.Fatalf("recipe count = %d, want 3", info.Recipe["3100"])
	}
}

func TestTransformRecipe_ConsumesInputsAndStacksExistingDrop(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1008
	char.DressInfo = `{"book":{},"recipe":{"1001":1,"1005":1,"1021":1,"2001":2},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char)
	if err := service.gameData.GetCache().LoadTable(models.TableRecipe, []json.RawMessage{
		json.RawMessage(`{"id":2001,"type":1,"is_open":1}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_RECIPE) error = %v", err)
	}

	got, drop, err := service.TransformRecipe(context.Background(), char.ID, []int64{1001, 1005, 1021})
	if err != nil {
		t.Fatalf("TransformRecipe() error = %v", err)
	}
	if drop.RecipeID != 2001 || drop.Num != 1 {
		t.Fatalf("drop = %+v, want recipe 2001 x1", drop)
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	for _, id := range []string{"1001", "1005", "1021"} {
		if got := info.Recipe[id]; got != 0 {
			t.Fatalf("recipe %s count = %d, want removed", id, got)
		}
	}
	if info.Recipe["2001"] != 3 {
		t.Fatalf("recipe 2001 count = %d, want 3", info.Recipe["2001"])
	}
}

func TestTransformAllRecipe_ConsumesAllRoundsAndStacksDrops(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1009
	char.DressInfo = `{"book":{},"recipe":{"1001":2,"1005":2,"1021":2,"2001":1},"bag":{"crystal":0,"jewel":0},"extract":0,"score":0,"fakeDressId":0,"fakeFlyDressId":0}`

	service := newDressTestService(t, char)
	if err := service.gameData.GetCache().LoadTable(models.TableRecipe, []json.RawMessage{
		json.RawMessage(`{"id":2001,"type":1,"is_open":1}`),
	}); err != nil {
		t.Fatalf("LoadTable(TBL_RECIPE) error = %v", err)
	}

	got, drops, err := service.TransformAllRecipe(context.Background(), char.ID, []int64{1001, 1005, 1021})
	if err != nil {
		t.Fatalf("TransformAllRecipe() error = %v", err)
	}
	if len(drops) != 2 {
		t.Fatalf("drop count = %d, want 2", len(drops))
	}
	for idx, drop := range drops {
		if drop.RecipeID != 2001 || drop.Num != 1 {
			t.Fatalf("drop[%d] = %+v, want recipe 2001 x1", idx, drop)
		}
	}

	info, err := domaindress.Decode(got)
	if err != nil {
		t.Fatalf("Decode() error = %v", err)
	}
	for _, id := range []string{"1001", "1005", "1021"} {
		if got := info.Recipe[id]; got != 0 {
			t.Fatalf("recipe %s count = %d, want removed", id, got)
		}
	}
	if info.Recipe["2001"] != 3 {
		t.Fatalf("recipe 2001 count = %d, want 3", info.Recipe["2001"])
	}
}
