// Open-sourced by BaoLT

// makeMysTre execution: validate a craft request against a recipe, consume the main-bag
// material inputs, produce the output mystery item into mysBag, and record the codex.
//
// Flow (consume-then-credit, ordered to only ever LOSE inputs, never DUPLICATE output):
//  1. Resolve the recipe (data_tbl_mystre_recipe) and the player slot/stack maps into inputs.
//  2. Validate strictly: every non-empty t<i>/n<i>/q<i> slot must be satisfied by a main-bag
//     item whose tid==t<i>, ColorCode==q<i>, StackCount>=n<i>. Reject (no mutation) on any
//     mismatch -> a forged/wrong request can never craft.
//  3. Consume each matched material instance (count = recipe n<i>) from the main item bag.
//  4. Resolve the output mysId, add it to mysBag, write mysBook[kind][mysId], flip
//     activeObj[kind], decrement the daily make cap, and persist this feature's state.
//
// Material routing (ground truth): recipe t1..t6 are crafting-MATERIAL item-template ids in the
// player's MAIN item bag (not rune chips / mystery items). slotMap[i].idx is the matched
// item-instance id; we consume that instance via ItemBagProvider (bound to *item.Service).
//
// Output resolution: a recipe's result spec st = "16-<level>-<kindOrdinal>" names a kind+level
// GROUP. resolveOutputID applies the documented conservative rule: the LOWEST-id
// data_tbl_mystre row of that kind at the recipe level.
package mysterytreasure

import (
	"context"
	"errors"
	"sort"
	"strconv"
	"strings"

	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata/models"
)

var (
	ErrNoRecipe        = errors.New("mysterytreasure: recipe not found")
	ErrRecipeNotLearnt = errors.New("mysterytreasure: recipe not learned")
	ErrMaterialMissing = errors.New("mysterytreasure: required material missing or wrong quality")
	ErrMakeCapReached  = errors.New("mysterytreasure: daily make cap reached")
	ErrNoOutput        = errors.New("mysterytreasure: recipe has no resolvable output item")
	ErrItemBag         = errors.New("mysterytreasure: item bag provider unavailable")
	ErrGameData        = errors.New("mysterytreasure: game data provider unavailable")
)

const mysMaxBagSlots = 200

// GameDataPort is the slice of gamedata makeMysTre needs. The signatures match the
// gamedata.Manager deferred accessors so the parent binds *gamedata.Manager directly.
type GameDataPort interface {
	MysGetRecipe(id int) *models.MystreRecipeTemplate
	MysListMystreByKindLevel(kind, level int) []*models.MystreTemplate
}

// ItemBagProvider is the slice of the main item service makeMysTre needs to consume material
// inputs. Both signatures match *item.Service exactly so the parent binds it with no adapter.
type ItemBagProvider interface {
	GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error)
	ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error)
}

type recipeInput struct {
	index      int
	templateID int
	quality    int
	count      int
	itemID     int64
}

// MakeResult reports what a craft produced, for the caller's logging / client re-fetch.
type MakeResult struct {
	MysID      int
	Kind       int
	BagSlot    string
	MakeLeft   int
	BookFirst  bool
	KindOpened bool
}

func (s *Service) SetGameData(gd GameDataPort) { s.gameData = gd }

func (s *Service) SetItemBag(items ItemBagProvider) { s.items = items }

// MakeMysTre runs the craft. slotMap maps 1..6 -> item-instance id; stackMap maps 1..6 -> the
// stack the client intends to spend. The recipe n<i> is authoritative for the consumed count;
// slotMap locates the instance, stackMap is validated for sanity only.
func (s *Service) MakeMysTre(
	ctx context.Context,
	charID int64,
	recipeID int,
	slotMap map[int]int64,
	stackMap map[int]int,
	today string,
) (*MakeResult, error) {
	if s.gameData == nil {
		return nil, ErrGameData
	}
	if s.items == nil {
		return nil, ErrItemBag
	}
	recipe := s.gameData.MysGetRecipe(recipeID)
	if recipe == nil {
		return nil, ErrNoRecipe
	}

	st, err := s.Load(ctx, charID)
	if err != nil {
		return nil, err
	}
	RefreshDailyCounters(st, today)

	if _, learnt := st.LearnedRec[strconv.Itoa(recipeID)]; !learnt {
		return nil, ErrRecipeNotLearnt
	}
	if st.MakeLimit.N <= 0 {
		return nil, ErrMakeCapReached
	}

	inputs, err := resolveInputs(recipe, slotMap, stackMap)
	if err != nil {
		return nil, err
	}

	for i := range inputs {
		in := &inputs[i]
		it, getErr := s.items.GetItemByID(ctx, charID, in.itemID)
		if getErr != nil || it == nil {
			return nil, ErrMaterialMissing
		}
		if it.CharacterID != charID || it.TemplateID != in.templateID || it.ColorCode != in.quality || it.StackCount < in.count {
			return nil, ErrMaterialMissing
		}
	}

	kind := outputKindFromRecipe(recipe)
	mysID, ok := s.resolveOutputID(kind, int(recipe.Level))
	if !ok || mysID <= 0 {
		return nil, ErrNoOutput
	}

	for i := range inputs {
		in := &inputs[i]
		if _, _, consumeErr := s.items.ConsumeItemStackByID(ctx, charID, in.itemID, in.count); consumeErr != nil {
			return nil, consumeErr
		}
	}

	res := s.applyCraftOutput(st, kind, mysID)

	st.MakeLimit.N--
	st.MakeLimit.T = today
	res.MakeLeft = st.MakeLimit.N

	if saveErr := s.Save(ctx, charID, st); saveErr != nil {
		return res, saveErr
	}
	return res, nil
}

// resolveOutputID applies the documented conservative rule: lowest-id mystre row of the
// recipe's output kind at the recipe level.
func (s *Service) resolveOutputID(kind, level int) (int, bool) {
	rows := s.gameData.MysListMystreByKindLevel(kind, level)
	if len(rows) == 0 {
		return 0, false
	}
	best := -1
	for _, r := range rows {
		if r == nil {
			continue
		}
		id := r.GetID()
		if best < 0 || id < best {
			best = id
		}
	}
	if best < 0 {
		return 0, false
	}
	return best, true
}

func (s *Service) applyCraftOutput(st *MysteryTreasureState, kind, mysID int) *MakeResult {
	res := &MakeResult{MysID: mysID, Kind: kind}

	kindKey := strconv.Itoa(kind)
	if st.MysBook[kindKey] == nil {
		st.MysBook[kindKey] = map[string]int{}
	}
	mysKey := strconv.Itoa(mysID)
	if _, seen := st.MysBook[kindKey][mysKey]; !seen {
		st.MysBook[kindKey][mysKey] = mysID
		res.BookFirst = true
	}

	if _, open := st.ActiveObj[kindKey]; !open {
		st.ActiveObj[kindKey] = kind
		res.KindOpened = true
	}

	res.BagSlot = addToMysBag(st, mysID)
	return res
}

func addToMysBag(st *MysteryTreasureState, mysID int) string {
	for key, slot := range st.Bag {
		if slot.Mid == mysID {
			slot.Num++
			st.Bag[key] = slot
			return key
		}
	}
	for pos := 0; pos < mysMaxBagSlots; pos++ {
		key := strconv.Itoa(pos)
		if _, taken := st.Bag[key]; !taken {
			st.Bag[key] = BagSlot{Mid: mysID, Num: 1}
			return key
		}
	}
	key := strconv.Itoa(len(st.Bag))
	st.Bag[key] = BagSlot{Mid: mysID, Num: 1}
	return key
}

// outputKindFromRecipe decodes the recipe result spec st="16-<level>-<kindOrdinal>". The third
// dash-part is the output mystery-item kind (1..11). Falls back to 0 (=> ErrNoOutput) if the
// spec is malformed.
func outputKindFromRecipe(recipe *models.MystreRecipeTemplate) int {
	parts := strings.Split(recipe.St, "-")
	if len(parts) < 3 {
		return 0
	}
	kind, err := strconv.Atoi(strings.TrimSpace(parts[2]))
	if err != nil || kind < MysKindMin || kind > MysKindMax {
		return 0
	}
	return kind
}

// resolveInputs pairs each non-empty recipe material slot with the client's chosen instance id.
// Every required slot must have a matching slotMap entry; a missing/non-positive item id, or a
// stackMap value below the recipe count, is rejected (no partial crafts).
func resolveInputs(recipe *models.MystreRecipeTemplate, slotMap map[int]int64, stackMap map[int]int) ([]recipeInput, error) {
	mats := recipeMats(recipe)
	inputs := make([]recipeInput, 0, 6)
	for i := 1; i <= 6; i++ {
		mat := mats[i-1]
		if mat.tid == 0 || mat.count <= 0 {
			continue
		}
		itemID, ok := slotMap[i]
		if !ok || itemID <= 0 {
			return nil, ErrMaterialMissing
		}
		if want, ok := stackMap[i]; ok && want < mat.count {
			return nil, ErrMaterialMissing
		}
		inputs = append(inputs, recipeInput{
			index:      i,
			templateID: mat.tid,
			quality:    mat.quality,
			count:      mat.count,
			itemID:     itemID,
		})
	}
	if len(inputs) == 0 {
		return nil, ErrMaterialMissing
	}
	sort.Slice(inputs, func(a, b int) bool { return inputs[a].index < inputs[b].index })
	return inputs, nil
}

type matSpec struct {
	tid     int
	quality int
	count   int
}

func recipeMats(r *models.MystreRecipeTemplate) [6]matSpec {
	return [6]matSpec{
		{int(r.T1), int(r.Q1), int(r.N1)},
		{int(r.T2), int(r.Q2), int(r.N2)},
		{int(r.T3), int(r.Q3), int(r.N3)},
		{int(r.T4), int(r.Q4), int(r.N4)},
		{int(r.T5), int(r.Q5), int(r.N5)},
		{int(r.T6), int(r.Q6), int(r.N6)},
	}
}
