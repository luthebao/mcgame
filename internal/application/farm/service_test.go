// Open-sourced by BaoLT

package farm

import (
	"context"
	"testing"
	"time"

	"go.uber.org/zap"
	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/farm"
	domainitem "mcgame-server/internal/domain/item"
)

type stubRepository struct {
	plots map[int]*farm.Plot
}

type stubCharacterRepository struct {
	characters map[int64]string
}

type stubItemRepository struct {
	items  map[int64]*domainitem.Item
	nextID int64
}

func (r *stubRepository) FindByCharacter(ctx context.Context, characterID int64) ([]*farm.Plot, error) {
	result := make([]*farm.Plot, 0, len(r.plots))
	for _, plot := range r.plots {
		if plot == nil || plot.CharacterID != characterID {
			continue
		}
		copyPlot := *plot
		result = append(result, &copyPlot)
	}
	return result, nil
}

func (r *stubRepository) FindByCharacterAndPlot(ctx context.Context, characterID int64, plotNPCID int) (*farm.Plot, error) {
	plot, ok := r.plots[plotNPCID]
	if !ok || plot == nil || plot.CharacterID != characterID {
		return nil, nil
	}
	copyPlot := *plot
	return &copyPlot, nil
}

func (r *stubRepository) FindByPlot(ctx context.Context, plotNPCID int) (*farm.Plot, error) {
	plot, ok := r.plots[plotNPCID]
	if !ok || plot == nil {
		return nil, nil
	}
	copyPlot := *plot
	return &copyPlot, nil
}

func (r *stubRepository) FindByPlots(ctx context.Context, plotNPCIDs []int) ([]*farm.Plot, error) {
	result := make([]*farm.Plot, 0, len(plotNPCIDs))
	for _, plotNPCID := range plotNPCIDs {
		plot, ok := r.plots[plotNPCID]
		if !ok || plot == nil {
			continue
		}
		copyPlot := *plot
		result = append(result, &copyPlot)
	}
	return result, nil
}

func (r *stubRepository) Upsert(ctx context.Context, plot *farm.Plot) error {
	if r.plots == nil {
		r.plots = make(map[int]*farm.Plot)
	}
	copyPlot := *plot
	r.plots[plot.PlotNPCID] = &copyPlot
	return nil
}

func (r *stubRepository) Delete(ctx context.Context, characterID int64, plotNPCID int) error {
	delete(r.plots, plotNPCID)
	return nil
}

func (r *stubItemRepository) FindByID(ctx context.Context, id int64) (*domainitem.Item, error) {
	if r.items == nil {
		return nil, nil
	}
	item, ok := r.items[id]
	if !ok {
		return nil, nil
	}
	copyItem := *item
	return &copyItem, nil
}

func (r *stubItemRepository) FindByCharacterID(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID {
			copyItem := *item
			result = append(result, &copyItem)
		}
	}
	return result, nil
}

func (r *stubItemRepository) FindByCharacterAndSlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) ([]*domainitem.Item, error) {
	result := make([]*domainitem.Item, 0)
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID && item.SlotType == slotType {
			copyItem := *item
			result = append(result, &copyItem)
		}
	}
	return result, nil
}

func (r *stubItemRepository) FindBySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, slotIndex int) (*domainitem.Item, error) {
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID && item.SlotType == slotType && item.SlotIndex == slotIndex {
			copyItem := *item
			return &copyItem, nil
		}
	}
	return nil, nil
}

func (r *stubItemRepository) FindEquipped(ctx context.Context, charID int64) ([]*domainitem.Item, error) {
	return []*domainitem.Item{}, nil
}

func (r *stubItemRepository) Create(ctx context.Context, item *domainitem.Item) error {
	if r.items == nil {
		r.items = make(map[int64]*domainitem.Item)
	}
	r.nextID++
	copyItem := *item
	copyItem.ID = r.nextID
	r.items[copyItem.ID] = &copyItem
	item.ID = copyItem.ID
	return nil
}

func (r *stubItemRepository) Update(ctx context.Context, item *domainitem.Item) error {
	if r.items == nil {
		r.items = make(map[int64]*domainitem.Item)
	}
	copyItem := *item
	r.items[item.ID] = &copyItem
	return nil
}

func (r *stubItemRepository) Delete(ctx context.Context, id int64) error {
	delete(r.items, id)
	return nil
}

func (r *stubItemRepository) DeleteByCharacterID(ctx context.Context, charID int64) error {
	for id, item := range r.items {
		if item != nil && item.CharacterID == charID {
			delete(r.items, id)
		}
	}
	return nil
}

func (r *stubItemRepository) MoveItem(ctx context.Context, id int64, slotType domainitem.SlotType, slotIndex int) error {
	item, ok := r.items[id]
	if !ok || item == nil {
		return nil
	}
	item.SlotType = slotType
	item.SlotIndex = slotIndex
	return nil
}

func (r *stubItemRepository) UpdateStack(ctx context.Context, id int64, stackCount int) error {
	item, ok := r.items[id]
	if !ok || item == nil {
		return nil
	}
	item.StackCount = stackCount
	return nil
}

func (r *stubItemRepository) FindFirstEmptySlot(ctx context.Context, charID int64, slotType domainitem.SlotType, maxSlots int) (int, error) {
	for slotIndex := 1; slotIndex <= maxSlots; slotIndex++ {
		occupied := false
		for _, item := range r.items {
			if item != nil && item.CharacterID == charID && item.SlotType == slotType && item.SlotIndex == slotIndex {
				occupied = true
				break
			}
		}
		if !occupied {
			return slotIndex, nil
		}
	}
	return maxSlots + 1, nil
}

func (r *stubItemRepository) CountBySlotType(ctx context.Context, charID int64, slotType domainitem.SlotType) (int, error) {
	count := 0
	for _, item := range r.items {
		if item != nil && item.CharacterID == charID && item.SlotType == slotType {
			count++
		}
	}
	return count, nil
}

func (r *stubCharacterRepository) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if r == nil {
		return nil, nil
	}

	name, ok := r.characters[id]
	if !ok {
		return nil, nil
	}

	return &domainchar.Character{ID: id, Name: name}, nil
}

func TestGetPlotWitherAt(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())
	plot := &farm.Plot{
		PlantedAt: time.Date(2026, 3, 14, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 3, 14, 10, 4, 0, 0, time.UTC),
	}

	expected := time.Date(2026, 3, 14, 10, 6, 40, 0, time.UTC)
	if actual := service.GetPlotWitherAt(plot); !actual.Equal(expected) {
		t.Fatalf("GetPlotWitherAt() = %v, expected %v", actual, expected)
	}
}

func TestIsPlotWithered(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())
	plot := &farm.Plot{
		PlantedAt: time.Date(2026, 3, 14, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 3, 14, 10, 40, 0, 0, time.UTC),
	}

	if service.IsPlotWithered(plot, time.Date(2026, 3, 14, 11, 6, 39, 0, time.UTC)) {
		t.Fatal("expected plot to still be active before wither time")
	}

	if !service.IsPlotWithered(plot, time.Date(2026, 3, 14, 11, 6, 40, 0, time.UTC)) {
		t.Fatal("expected plot to be withered at wither time")
	}
}

func TestPlantQueryTimingBeforeReady(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())
	plot := &farm.Plot{
		PlantedAt: time.Date(2026, 4, 4, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 4, 4, 10, 5, 0, 0, time.UTC),
	}

	state, timeLeft := service.plantQueryTiming(plot, time.Date(2026, 4, 4, 10, 1, 0, 0, time.UTC))
	if state != 2 {
		t.Fatalf("plantQueryTiming() state before ready = %d, expected 2", state)
	}
	if timeLeft != int64(4*time.Minute/time.Millisecond) {
		t.Fatalf("plantQueryTiming() timeLeft before ready = %d, expected %d", timeLeft, int64(4*time.Minute/time.Millisecond))
	}
}

func TestPlantQueryTimingAfterReadyCountsDownToWither(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())
	plot := &farm.Plot{
		PlantedAt: time.Date(2026, 4, 4, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 4, 4, 10, 5, 0, 0, time.UTC),
	}

	now := time.Date(2026, 4, 4, 10, 6, 0, 0, time.UTC)
	state, timeLeft := service.plantQueryTiming(plot, now)
	expectedTimeLeft := service.GetPlotWitherAt(plot).Sub(now).Milliseconds()

	if state != 3 {
		t.Fatalf("plantQueryTiming() state after ready = %d, expected 3", state)
	}
	if timeLeft != expectedTimeLeft {
		t.Fatalf("plantQueryTiming() timeLeft after ready = %d, expected %d", timeLeft, expectedTimeLeft)
	}
}

func TestPlantQueryTimingAfterWitherDeadline(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())
	plot := &farm.Plot{
		PlantedAt: time.Date(2026, 4, 4, 10, 0, 0, 0, time.UTC),
		ReadyAt:   time.Date(2026, 4, 4, 10, 5, 0, 0, time.UTC),
	}

	state, timeLeft := service.plantQueryTiming(plot, service.GetPlotWitherAt(plot))
	if state != 3 {
		t.Fatalf("plantQueryTiming() state at wither deadline = %d, expected 3", state)
	}
	if timeLeft != 0 {
		t.Fatalf("plantQueryTiming() timeLeft at wither deadline = %d, expected 0", timeLeft)
	}
}

func TestGetPlotRawKeepsWitheredPlotForLifecycleCallbacks(t *testing.T) {
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1707: {
				CharacterID: 1,
				PlotNPCID:   1707,
				CropNPCID:   1229,
				PlantedAt:   time.Date(2026, 4, 4, 10, 0, 0, 0, time.UTC),
				ReadyAt:     time.Date(2026, 4, 4, 10, 5, 0, 0, time.UTC),
			},
		},
	}
	service := NewService(repo, nil, nil, zap.NewNop())

	plot, err := service.GetPlotRaw(context.Background(), 1, 1707)
	if err != nil {
		t.Fatalf("GetPlotRaw() error = %v", err)
	}
	if plot == nil {
		t.Fatal("GetPlotRaw() = nil, expected plot")
	}
	if !service.IsPlotWithered(plot, time.Date(2026, 4, 4, 10, 8, 20, 0, time.UTC)) {
		t.Fatal("expected raw plot to be considered withered for lifecycle callback")
	}
}

func TestGetBlockingPlantPlotReturnsLowestOtherPlot(t *testing.T) {
	now := time.Now().UTC()
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1710: {CharacterID: 1, PlotNPCID: 1710, CropNPCID: 1230, PlantedAt: now.Add(-2 * time.Minute), ReadyAt: now.Add(3 * time.Minute)},
			1708: {CharacterID: 1, PlotNPCID: 1708, CropNPCID: 1229, PlantedAt: now.Add(-2 * time.Minute), ReadyAt: now.Add(3 * time.Minute)},
		},
	}
	service := NewService(repo, nil, nil, zap.NewNop())

	blocking, err := service.GetBlockingPlantPlot(context.Background(), 1, 1712)
	if err != nil {
		t.Fatalf("GetBlockingPlantPlot() error = %v", err)
	}
	if blocking == nil || blocking.PlotNPCID != 1708 {
		t.Fatalf("GetBlockingPlantPlot() = %#v, expected plot 1708", blocking)
	}
}

func TestGetBlockingPlantPlotSkipsTargetPlot(t *testing.T) {
	now := time.Now().UTC()
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1708: {CharacterID: 1, PlotNPCID: 1708, CropNPCID: 1229, PlantedAt: now.Add(-2 * time.Minute), ReadyAt: now.Add(3 * time.Minute)},
		},
	}
	service := NewService(repo, nil, nil, zap.NewNop())

	blocking, err := service.GetBlockingPlantPlot(context.Background(), 1, 1708)
	if err != nil {
		t.Fatalf("GetBlockingPlantPlot() error = %v", err)
	}
	if blocking != nil {
		t.Fatalf("GetBlockingPlantPlot() = %#v, expected nil", blocking)
	}
}

func TestGetPlantQueryDataForViewerResolvesSharedPlotOwner(t *testing.T) {
	now := time.Now().UTC()
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1707: {
				CharacterID:           2,
				PlotNPCID:             1707,
				CropNPCID:             1229,
				HarvestItemTemplateID: 2481,
				HarvestCount:          11,
				TotalHarvestCount:     11,
				PlantedAt:             now.Add(-2 * time.Minute),
				ReadyAt:               now.Add(3 * time.Minute),
			},
		},
	}
	charRepo := &stubCharacterRepository{characters: map[int64]string{2: "Gia Hưng"}}
	service := NewService(repo, charRepo, nil, zap.NewNop())

	query, err := service.GetPlantQueryDataForViewer(context.Background(), 1, 1, 1707)
	if err != nil {
		t.Fatalf("GetPlantQueryDataForViewer() error = %v", err)
	}
	if query == nil {
		t.Fatal("GetPlantQueryDataForViewer() = nil, expected plot data")
	}
	if query.OwnerName != "Gia Hưng" {
		t.Fatalf("query ownerName = %q, expected Gia Hưng", query.OwnerName)
	}
	if query.Remain != 11 || query.Total != 11 {
		t.Fatalf("query counts = (%d,%d), expected (11,11)", query.Remain, query.Total)
	}
}

func TestMoneyTreeUsesSeedTemplate2909(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())
	if service.moneyTree.SeedTemplateID != 2909 {
		t.Fatalf("moneyTree.SeedTemplateID = %d, expected 2909", service.moneyTree.SeedTemplateID)
	}
}

func TestPlantCropWithDurationUsesLongTermMultiplier(t *testing.T) {
	repo := &stubRepository{plots: map[int]*farm.Plot{}}
	service := NewService(repo, nil, nil, zap.NewNop())

	result, err := service.PlantCropWithDuration(context.Background(), 1, 1707, 1525, 40*time.Minute)
	if err != nil {
		t.Fatalf("PlantCropWithDuration() error = %v", err)
	}
	if result == nil || result.Plot == nil {
		t.Fatal("PlantCropWithDuration() returned nil plot")
	}
	if result.Plot.HarvestCount != 50 {
		t.Fatalf("PlantCropWithDuration() harvestCount = %d, expected 50", result.Plot.HarvestCount)
	}
	if result.Plot.TotalHarvestCount != 50 {
		t.Fatalf("PlantCropWithDuration() totalHarvestCount = %d, expected 50", result.Plot.TotalHarvestCount)
	}
	if result.Plot.SharedHarvesterIDs == nil {
		t.Fatal("PlantCropWithDuration() sharedHarvesterIDs = nil, expected empty slice")
	}
}

func TestPlantCropWithDurationRejectsSharedMapOccupiedPlot(t *testing.T) {
	now := time.Now().UTC()
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1707: {
				CharacterID:           2,
				PlotNPCID:             1707,
				CropNPCID:             1229,
				HarvestItemTemplateID: 2481,
				HarvestCount:          11,
				TotalHarvestCount:     11,
				PlantedAt:             now.Add(-2 * time.Minute),
				ReadyAt:               now.Add(3 * time.Minute),
			},
		},
	}
	service := NewService(repo, nil, nil, zap.NewNop())

	if _, err := service.PlantCropWithDuration(context.Background(), 1, 1707, 1230, 5*time.Minute); err != ErrPlotOccupied {
		t.Fatalf("PlantCropWithDuration() error = %v, expected %v", err, ErrPlotOccupied)
	}
}

func TestIsPlotTemplateIDIncludesFarmPlot1228(t *testing.T) {
	service := NewService(nil, nil, nil, zap.NewNop())

	if !service.IsPlotTemplateID(1228) {
		t.Fatal("IsPlotTemplateID(1228) = false, expected true")
	}
}

func TestDoubleHarvestPlotUsesResolvedLongTermYield(t *testing.T) {
	now := time.Now().UTC()
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1707: {
				CharacterID:           1,
				PlotNPCID:             1707,
				CropNPCID:             1525,
				HarvestItemTemplateID: 2613,
				HarvestCount:          50,
				TotalHarvestCount:     50,
				PlantedAt:             now.Add(-10 * time.Minute),
				ReadyAt:               now.Add(30 * time.Minute),
			},
		},
	}
	service := NewService(repo, nil, nil, zap.NewNop())

	plot, alreadyBoosted, err := service.DoubleHarvestPlot(context.Background(), 1, 1707)
	if err != nil {
		t.Fatalf("DoubleHarvestPlot() error = %v", err)
	}
	if alreadyBoosted {
		t.Fatal("DoubleHarvestPlot() unexpectedly reported already boosted")
	}
	if plot.TotalHarvestCount != 100 || plot.HarvestCount != 100 {
		t.Fatalf("DoubleHarvestPlot() counts = (%d,%d), expected (100,100)", plot.TotalHarvestCount, plot.HarvestCount)
	}
}

func TestHarvestPlotAllowsOneSharedHarvestAndLeavesOwnerYield(t *testing.T) {
	now := time.Now().UTC()
	repo := &stubRepository{
		plots: map[int]*farm.Plot{
			1707: {
				CharacterID:           1,
				PlotNPCID:             1707,
				CropNPCID:             1229,
				HarvestItemTemplateID: 2481,
				HarvestCount:          11,
				TotalHarvestCount:     11,
				PlantedAt:             now.Add(-6 * time.Minute),
				ReadyAt:               now.Add(-1 * time.Minute),
			},
		},
	}
	itemService := appitem.NewService(&stubItemRepository{}, zap.NewNop())
	service := NewService(repo, nil, itemService, zap.NewNop())

	result, err := service.HarvestPlot(context.Background(), 1, 2, 1707)
	if err != nil {
		t.Fatalf("HarvestPlot() shared harvest error = %v", err)
	}
	if result == nil || !result.IsSharedHarvest {
		t.Fatal("HarvestPlot() expected shared harvest result")
	}
	if result.RewardCount != 1 {
		t.Fatalf("HarvestPlot() shared reward = %d, expected 1", result.RewardCount)
	}

	plot, err := service.GetPlot(context.Background(), 1, 1707)
	if err != nil {
		t.Fatalf("GetPlot() error = %v", err)
	}
	if plot == nil {
		t.Fatal("expected plot to remain after shared harvest")
	}
	if plot.HarvestCount != 10 || plot.TotalHarvestCount != 11 {
		t.Fatalf("plot counts after shared harvest = (%d,%d), expected (10,11)", plot.HarvestCount, plot.TotalHarvestCount)
	}
	if len(plot.SharedHarvesterIDs) != 1 || plot.SharedHarvesterIDs[0] != 2 {
		t.Fatalf("shared harvester IDs = %#v, expected [2]", plot.SharedHarvesterIDs)
	}

	query, err := service.GetPlantQueryDataForViewer(context.Background(), 1, 2, 1707)
	if err != nil {
		t.Fatalf("GetPlantQueryDataForViewer() error = %v", err)
	}
	if query == nil || query.Remain != 10 || query.Total != 11 {
		t.Fatalf("query = %#v, expected remain=10 total=11", query)
	}

	if _, err := service.HarvestPlot(context.Background(), 1, 2, 1707); err != ErrPlotAlreadyShared {
		t.Fatalf("HarvestPlot() repeat shared error = %v, expected %v", err, ErrPlotAlreadyShared)
	}
	if _, err := service.HarvestPlot(context.Background(), 1, 3, 1707); err != ErrPlotSharedOut {
		t.Fatalf("HarvestPlot() second shared by other error = %v, expected %v", err, ErrPlotSharedOut)
	}

	ownerResult, err := service.HarvestPlot(context.Background(), 1, 1, 1707)
	if err != nil {
		t.Fatalf("HarvestPlot() owner harvest error = %v", err)
	}
	if ownerResult.RewardCount != 10 {
		t.Fatalf("HarvestPlot() owner reward = %d, expected 10", ownerResult.RewardCount)
	}

	plot, err = service.GetPlot(context.Background(), 1, 1707)
	if err != nil {
		t.Fatalf("GetPlot() after owner harvest error = %v", err)
	}
	if plot != nil {
		t.Fatalf("expected plot to be deleted after owner harvest, got %#v", plot)
	}
}
