// Open-sourced by BaoLT

package mysterytreasure

import (
	"context"
	"errors"
	"testing"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type fakeGameData struct {
	recipes map[int]*models.MystreRecipeTemplate
	mystres map[int]*models.MystreTemplate
}

func (g *fakeGameData) MysGetRecipe(id int) *models.MystreRecipeTemplate { return g.recipes[id] }

func (g *fakeGameData) MysListMystreByKindLevel(kind, level int) []*models.MystreTemplate {
	out := []*models.MystreTemplate{}
	for _, m := range g.mystres {
		if int(m.Kind) == kind && int(m.Level) == level {
			out = append(out, m)
		}
	}
	return out
}

type fakeItemBag struct {
	items    map[int64]*domainitem.Item
	consumed map[int64]int
	getErr   error
}

func newFakeItemBag() *fakeItemBag {
	return &fakeItemBag{items: map[int64]*domainitem.Item{}, consumed: map[int64]int{}}
}

func (b *fakeItemBag) GetItemByID(ctx context.Context, charID, itemID int64) (*domainitem.Item, error) {
	if b.getErr != nil {
		return nil, b.getErr
	}
	return b.items[itemID], nil
}

func (b *fakeItemBag) ConsumeItemStackByID(ctx context.Context, charID, itemID int64, count int) (*domainitem.Item, bool, error) {
	it := b.items[itemID]
	if it == nil {
		return nil, false, errors.New("no item")
	}
	b.consumed[itemID] += count
	it.StackCount -= count
	depleted := it.StackCount <= 0
	if depleted {
		delete(b.items, itemID)
	}
	return it, depleted, nil
}

func recipeTwoMats() *models.MystreRecipeTemplate {
	return &models.MystreRecipeTemplate{
		ID: 1, Level: 1, St: "16-1-1",
		T1: 7, Q1: 2, N1: 1,
		T2: 18, Q2: 2, N2: 1,
	}
}

func mystreRows() map[int]*models.MystreTemplate {
	return map[int]*models.MystreTemplate{
		7: {ID: 7, Kind: 1, Level: 1, Star: 1},
		4: {ID: 4, Kind: 1, Level: 1, Star: 1},
		1: {ID: 1, Kind: 1, Level: 1, Star: 1},
	}
}

func setupMakeSvc(t *testing.T) (*Service, *fakeFeatureRepo, *fakeGameData, *fakeItemBag) {
	t.Helper()
	repo := newFakeRepo()
	svc := NewService(repo, zap.NewNop())
	gd := &fakeGameData{recipes: map[int]*models.MystreRecipeTemplate{1: recipeTwoMats()}, mystres: mystreRows()}
	items := newFakeItemBag()
	svc.SetGameData(gd)
	svc.SetItemBag(items)
	return svc, repo, gd, items
}

func seedMaterials(items *fakeItemBag, charID int64) {
	items.items[100] = &domainitem.Item{ID: 100, CharacterID: charID, TemplateID: 7, ColorCode: 2, StackCount: 5}
	items.items[200] = &domainitem.Item{ID: 200, CharacterID: charID, TemplateID: 18, ColorCode: 2, StackCount: 5}
}

func learnRecipe(t *testing.T, svc *Service, charID int64, recipeID int) {
	t.Helper()
	st, err := svc.Load(context.Background(), charID)
	if err != nil {
		t.Fatalf("load: %v", err)
	}
	st.LearnedRec["1"] = recipeID
	if err := svc.Save(context.Background(), charID, st); err != nil {
		t.Fatalf("save: %v", err)
	}
}

func TestMakeMysTre_HappyPath(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)

	slotMap := map[int]int64{1: 100, 2: 200}
	stackMap := map[int]int{1: 1, 2: 1}
	res, err := svc.MakeMysTre(ctx, cid, 1, slotMap, stackMap, "5|10")
	if err != nil {
		t.Fatalf("MakeMysTre: %v", err)
	}
	if res.MysID != 1 {
		t.Fatalf("expected lowest-id output 1, got %d", res.MysID)
	}
	if res.Kind != 1 {
		t.Fatalf("expected kind 1, got %d", res.Kind)
	}
	if !res.BookFirst || !res.KindOpened {
		t.Fatalf("first craft should set bookFirst+kindOpened, got %+v", res)
	}
	if items.consumed[100] != 1 || items.consumed[200] != 1 {
		t.Fatalf("materials not consumed exactly once: %+v", items.consumed)
	}

	st, _ := svc.Load(ctx, cid)
	if st.MysBook["1"]["1"] != 1 {
		t.Fatalf("mysBook not written: %+v", st.MysBook)
	}
	if st.ActiveObj["1"] != 1 {
		t.Fatalf("activeObj not flipped: %+v", st.ActiveObj)
	}
	foundOutput := false
	for _, slot := range st.Bag {
		if slot.Mid == 1 && slot.Num == 1 {
			foundOutput = true
		}
	}
	if !foundOutput {
		t.Fatalf("output item not added to mysBag: %+v", st.Bag)
	}
	if st.MakeLimit.N != mysBaseDailyMakeCap-1 {
		t.Fatalf("make cap should drop by 1 from base, got %d", st.MakeLimit.N)
	}
}

func TestMakeMysTre_RejectsWrongQuality_NoConsume(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)
	items.items[100].ColorCode = 1 // recipe wants quality 2

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if !errors.Is(err, ErrMaterialMissing) {
		t.Fatalf("expected ErrMaterialMissing, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("no materials should be consumed on rejection, got %+v", items.consumed)
	}
	st, _ := svc.Load(ctx, cid)
	if len(st.MysBook) != 0 || len(st.Bag) != 0 {
		t.Fatalf("no output should be produced on rejection: book=%+v bag=%+v", st.MysBook, st.Bag)
	}
}

func TestMakeMysTre_RejectsWrongTemplate_NoConsume(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)
	items.items[200].TemplateID = 99 // recipe wants tid 18

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if !errors.Is(err, ErrMaterialMissing) {
		t.Fatalf("expected ErrMaterialMissing, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("no consume on wrong template, got %+v", items.consumed)
	}
}

func TestMakeMysTre_RejectsInsufficientStack_NoConsume(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)
	items.items[100].StackCount = 0

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if !errors.Is(err, ErrMaterialMissing) {
		t.Fatalf("expected ErrMaterialMissing, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("no consume on insufficient stack, got %+v", items.consumed)
	}
}

func TestMakeMysTre_RejectsForeignItem_NoConsume(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)
	items.items[100].CharacterID = 999 // owned by another character

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if !errors.Is(err, ErrMaterialMissing) {
		t.Fatalf("expected ErrMaterialMissing, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("no consume on foreign item, got %+v", items.consumed)
	}
}

func TestMakeMysTre_RejectsMissingSlotEntry(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100}, map[int]int{1: 1}, "5|10")
	if !errors.Is(err, ErrMaterialMissing) {
		t.Fatalf("expected ErrMaterialMissing for missing slot 2, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("no consume when a required slot is missing, got %+v", items.consumed)
	}
}

func TestMakeMysTre_RejectsUnlearnedRecipe(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	seedMaterials(items, cid)

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if !errors.Is(err, ErrRecipeNotLearnt) {
		t.Fatalf("expected ErrRecipeNotLearnt, got %v", err)
	}
}

func TestMakeMysTre_RejectsUnknownRecipe(t *testing.T) {
	svc, _, _, _ := setupMakeSvc(t)
	_, err := svc.MakeMysTre(context.Background(), 1, 999, map[int]int64{1: 100}, map[int]int{1: 1}, "5|10")
	if !errors.Is(err, ErrNoRecipe) {
		t.Fatalf("expected ErrNoRecipe, got %v", err)
	}
}

func TestMakeMysTre_RejectsWhenCapReached(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	seedMaterials(items, cid)

	st, _ := svc.Load(ctx, cid)
	st.MakeLimit = DailyCounter{N: 0, T: "5|10"}
	if err := svc.Save(ctx, cid, st); err != nil {
		t.Fatalf("save: %v", err)
	}

	_, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if !errors.Is(err, ErrMakeCapReached) {
		t.Fatalf("expected ErrMakeCapReached, got %v", err)
	}
	if len(items.consumed) != 0 {
		t.Fatalf("no consume when cap reached, got %+v", items.consumed)
	}
}

func TestMakeMysTre_SecondCraftSameItem_NoDuplicateBook(t *testing.T) {
	svc, _, _, items := setupMakeSvc(t)
	ctx := context.Background()
	const cid = int64(1)
	learnRecipe(t, svc, cid, 1)
	items.items[100] = &domainitem.Item{ID: 100, CharacterID: cid, TemplateID: 7, ColorCode: 2, StackCount: 99}
	items.items[200] = &domainitem.Item{ID: 200, CharacterID: cid, TemplateID: 18, ColorCode: 2, StackCount: 99}

	r1, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if err != nil {
		t.Fatalf("craft1: %v", err)
	}
	r2, err := svc.MakeMysTre(ctx, cid, 1, map[int]int64{1: 100, 2: 200}, map[int]int{1: 1, 2: 1}, "5|10")
	if err != nil {
		t.Fatalf("craft2: %v", err)
	}
	if r1.BookFirst != true || r2.BookFirst != false {
		t.Fatalf("second craft of same item should not be bookFirst: r1=%v r2=%v", r1.BookFirst, r2.BookFirst)
	}
	st, _ := svc.Load(ctx, cid)
	total := 0
	for _, slot := range st.Bag {
		if slot.Mid == 1 {
			total += slot.Num
		}
	}
	if total != 2 {
		t.Fatalf("two crafts should stack to 2 in mysBag, got %d", total)
	}
}
