// Open-sourced by BaoLT

// Farm service manages planting, ripening, harvesting, and farm data retrieval.
package farm

import (
	"context"
	"errors"
	"fmt"
	"sort"
	"strconv"
	"time"

	appitem "mcgame-server/internal/application/item"
	domainchar "mcgame-server/internal/domain/character"
	domainfarm "mcgame-server/internal/domain/farm"
	domainitem "mcgame-server/internal/domain/item"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

var (
	ErrInvalidPlotNPCID  = errors.New("invalid plot npc id")
	ErrInvalidCropNPCID  = errors.New("invalid crop npc id")
	ErrPlotOccupied      = errors.New("plot is occupied")
	ErrAnotherPlotActive = errors.New("another farm plot is active")
	ErrPlotNotFound      = errors.New("plot not found")
	ErrCropNotReady      = errors.New("crop not ready")
	ErrSeedNotFound      = errors.New("required seed not found")
	ErrFarmUnavailable   = errors.New("farm service is unavailable")
	ErrPlotAlreadyShared = errors.New("plot already shared harvested")
	ErrPlotSharedOut     = errors.New("plot shared harvest unavailable")
)

type CharacterRepository interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
}

type CropConfig struct {
	CropNPCID             int
	HarvestItemTemplateID int
	HarvestCount          int
	GrowDuration          time.Duration
	SeedTemplateID        int
}

type PlantResult struct {
	Plot             *domainfarm.Plot
	CropName         string
	ConsumedSeedItem *domainitem.Item
}

type HarvestResult struct {
	Plot                 *domainfarm.Plot
	OwnerCharacterID     int64
	HarvesterCharacterID int64
	RewardTemplateID     int
	RewardCount          int
	RewardName           string
	AddedInventoryItem   *domainitem.Item
	IsSharedHarvest      bool
}

type PlantQueryResult struct {
	Name      string
	OwnerName string
	Level     int
	Remain    int
	Total     int
	State     int
	TimeLeft  int64
}

type Service struct {
	repo                domainfarm.Repository
	charRepo            CharacterRepository
	itemService         *appitem.Service
	gameData            *gamedata.Manager
	logger              *zap.Logger
	validPlotNPCIDList  []int
	validPlotNPCIDs     map[int]struct{}
	legacyPlotIndexByID map[int]int
	crops               map[int]CropConfig
	moneyTree           CropConfig
}

const (
	farmWitherDurationNumerator   = 2
	farmWitherDurationDenominator = 3
	farmLongTermHarvestMultiplier = 5
)

func NewService(repo domainfarm.Repository, charRepo CharacterRepository, itemService *appitem.Service, logger *zap.Logger) *Service {
	plotIDs := make([]int, 0, 20)
	plotIDs = append(plotIDs, 1228)
	for id := 1707; id <= 1725; id++ {
		plotIDs = append(plotIDs, id)
	}

	validPlotNPCIDs := make(map[int]struct{}, len(plotIDs))
	for _, id := range plotIDs {
		validPlotNPCIDs[id] = struct{}{}
	}

	sorted := append([]int(nil), plotIDs...)
	sort.Ints(sorted)
	legacyIndexByID := make(map[int]int, 16)
	for i := 0; i < 16 && i < len(sorted); i++ {
		legacyIndexByID[sorted[i]] = i + 1
	}

	crops := map[int]CropConfig{
		1229: {CropNPCID: 1229, HarvestItemTemplateID: 2481, HarvestCount: 11, GrowDuration: 5 * time.Minute},
		1230: {CropNPCID: 1230, HarvestItemTemplateID: 2482, HarvestCount: 11, GrowDuration: 5 * time.Minute},
		1231: {CropNPCID: 1231, HarvestItemTemplateID: 2483, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1232: {CropNPCID: 1232, HarvestItemTemplateID: 2484, HarvestCount: 12, GrowDuration: 5 * time.Minute},
		1233: {CropNPCID: 1233, HarvestItemTemplateID: 2485, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1234: {CropNPCID: 1234, HarvestItemTemplateID: 2486, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1235: {CropNPCID: 1235, HarvestItemTemplateID: 2487, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1236: {CropNPCID: 1236, HarvestItemTemplateID: 2488, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1239: {CropNPCID: 1239, HarvestItemTemplateID: 2489, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1240: {CropNPCID: 1240, HarvestItemTemplateID: 2490, HarvestCount: 10, GrowDuration: 5 * time.Minute},
		1525: {CropNPCID: 1525, HarvestItemTemplateID: 2613, HarvestCount: 10, GrowDuration: 40 * time.Minute},
		1526: {CropNPCID: 1526, HarvestItemTemplateID: 2614, HarvestCount: 10, GrowDuration: 40 * time.Minute},
		1527: {CropNPCID: 1527, HarvestItemTemplateID: 2615, HarvestCount: 10, GrowDuration: 40 * time.Minute},
		1528: {CropNPCID: 1528, HarvestItemTemplateID: 2616, HarvestCount: 10, GrowDuration: 40 * time.Minute},
		1529: {CropNPCID: 1529, HarvestItemTemplateID: 2617, HarvestCount: 10, GrowDuration: 40 * time.Minute},
	}

	moneyTree := CropConfig{
		CropNPCID:             1529,
		HarvestItemTemplateID: 1156,
		HarvestCount:          5,
		GrowDuration:          40 * time.Minute,
		SeedTemplateID:        2909,
	}

	return &Service{
		repo:                repo,
		charRepo:            charRepo,
		itemService:         itemService,
		logger:              logger,
		validPlotNPCIDList:  sorted,
		validPlotNPCIDs:     validPlotNPCIDs,
		legacyPlotIndexByID: legacyIndexByID,
		crops:               crops,
		moneyTree:           moneyTree,
	}
}

func (s *Service) SetGameDataManager(manager *gamedata.Manager) {
	s.gameData = manager
}

func (s *Service) IsPlotTemplateID(npcID int) bool {
	_, ok := s.validPlotNPCIDs[npcID]
	return ok
}

func (s *Service) PlantCrop(ctx context.Context, characterID int64, plotNPCID int, cropNPCID int) (*PlantResult, error) {
	cfg, ok := s.crops[cropNPCID]
	if !ok {
		return nil, ErrInvalidCropNPCID
	}
	return s.plantWithConfig(ctx, characterID, plotNPCID, cfg)
}

func (s *Service) PlantCropWithDuration(ctx context.Context, characterID int64, plotNPCID int, cropNPCID int, growDuration time.Duration) (*PlantResult, error) {
	cfg, ok := s.crops[cropNPCID]
	if !ok {
		return nil, ErrInvalidCropNPCID
	}
	if growDuration > 0 {
		cfg.GrowDuration = growDuration
	}
	return s.plantWithConfig(ctx, characterID, plotNPCID, cfg)
}

func (s *Service) PlantMoneyTree(ctx context.Context, characterID int64, plotNPCID int) (*PlantResult, error) {
	return s.plantWithConfig(ctx, characterID, plotNPCID, s.moneyTree)
}

func (s *Service) GetPlot(ctx context.Context, characterID int64, plotNPCID int) (*domainfarm.Plot, error) {
	plot, err := s.GetPlotRaw(ctx, characterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	return s.pruneWitheredPlot(ctx, characterID, plot)
}

func (s *Service) GetPlotRaw(ctx context.Context, characterID int64, plotNPCID int) (*domainfarm.Plot, error) {
	return s.repo.FindByCharacterAndPlot(ctx, characterID, plotNPCID)
}

func (s *Service) GetPlotByNPCID(ctx context.Context, plotNPCID int) (*domainfarm.Plot, error) {
	plot, err := s.GetPlotByNPCIDRaw(ctx, plotNPCID)
	if err != nil {
		return nil, err
	}
	if plot == nil {
		return nil, nil
	}

	return s.pruneWitheredPlot(ctx, plot.CharacterID, plot)
}

func (s *Service) GetPlotByNPCIDRaw(ctx context.Context, plotNPCID int) (*domainfarm.Plot, error) {
	return s.repo.FindByPlot(ctx, plotNPCID)
}

func (s *Service) GetPlots(ctx context.Context, characterID int64) ([]*domainfarm.Plot, error) {
	plots, err := s.repo.FindByCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	return s.pruneWitheredPlots(ctx, characterID, plots)
}

func (s *Service) GetScenePlots(ctx context.Context) ([]*domainfarm.Plot, error) {
	plots, err := s.repo.FindByPlots(ctx, s.validPlotNPCIDList)
	if err != nil {
		return nil, err
	}

	return s.pruneSharedPlots(ctx, plots)
}

func (s *Service) GetBlockingPlantPlot(ctx context.Context, characterID int64, targetPlotNPCID int) (*domainfarm.Plot, error) {
	plots, err := s.GetPlots(ctx, characterID)
	if err != nil {
		return nil, err
	}

	var blocking *domainfarm.Plot
	for _, plot := range plots {
		if plot == nil || plot.PlotNPCID == 0 || plot.PlotNPCID == targetPlotNPCID {
			continue
		}
		if blocking == nil || plot.PlotNPCID < blocking.PlotNPCID {
			blocking = plot
		}
	}

	return blocking, nil
}

func (s *Service) HarvestPlot(ctx context.Context, ownerCharacterID int64, harvesterCharacterID int64, plotNPCID int) (*HarvestResult, error) {
	if s.itemService == nil {
		return nil, ErrFarmUnavailable
	}

	plot, err := s.GetPlot(ctx, ownerCharacterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	if plot == nil {
		return nil, ErrPlotNotFound
	}

	now := time.Now()
	if now.Before(plot.ReadyAt) {
		return nil, ErrCropNotReady
	}

	rewardCount := plot.HarvestCount
	isSharedHarvest := ownerCharacterID != harvesterCharacterID
	if isSharedHarvest {
		if s.hasSharedHarvester(plot, harvesterCharacterID) {
			return nil, ErrPlotAlreadyShared
		}
		if len(plot.SharedHarvesterIDs) > 0 {
			return nil, ErrPlotSharedOut
		}

		rewardCount = s.sharedHarvestCount(plot.TotalHarvestCount)
		if rewardCount <= 0 || plot.HarvestCount-rewardCount < 1 {
			return nil, ErrPlotSharedOut
		}
	}

	addedItem, err := s.itemService.AddItem(ctx, harvesterCharacterID, plot.HarvestItemTemplateID, domainitem.ItemTypeMaterial, rewardCount)
	if err != nil {
		return nil, err
	}

	if isSharedHarvest {
		plot.HarvestCount -= rewardCount
		plot.SharedHarvesterIDs = append(plot.SharedHarvesterIDs, harvesterCharacterID)
		if err := s.repo.Upsert(ctx, plot); err != nil {
			return nil, err
		}
	} else {
		if err := s.repo.Delete(ctx, ownerCharacterID, plotNPCID); err != nil {
			return nil, err
		}
	}

	rewardName := s.getItemName(plot.HarvestItemTemplateID)
	result := &HarvestResult{
		Plot:                 plot,
		OwnerCharacterID:     ownerCharacterID,
		HarvesterCharacterID: harvesterCharacterID,
		RewardTemplateID:     plot.HarvestItemTemplateID,
		RewardCount:          rewardCount,
		RewardName:           rewardName,
		AddedInventoryItem:   addedItem,
		IsSharedHarvest:      isSharedHarvest,
	}
	return result, nil
}

func (s *Service) GetPlantQueryData(ctx context.Context, characterID int64, plotNPCID int) (*PlantQueryResult, error) {
	return s.GetPlantQueryDataForViewer(ctx, characterID, characterID, plotNPCID)
}

func (s *Service) GetPlantQueryDataForViewer(ctx context.Context, ownerCharacterID int64, _ int64, plotNPCID int) (*PlantQueryResult, error) {
	plot, resolvedOwnerCharacterID, err := s.resolvePlotOwner(ctx, ownerCharacterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	if plot == nil {
		return nil, nil
	}

	now := time.Now()
	state, timeLeft := s.plantQueryTiming(plot, now)
	result := &PlantQueryResult{
		Name:      s.getCropName(plot.CropNPCID),
		OwnerName: "",
		Remain:    plot.HarvestCount,
		Total:     max(plot.TotalHarvestCount, plot.HarvestCount),
		State:     state,
		TimeLeft:  timeLeft,
	}

	if s.charRepo != nil {
		if ch, err := s.charRepo.FindByID(ctx, resolvedOwnerCharacterID); err == nil && ch != nil {
			result.OwnerName = ch.Name
		}
	}

	if s.gameData != nil {
		if npc := s.gameData.GetNPC(plot.CropNPCID); npc != nil {
			result.Level = int(npc.Lv)
			if npc.Name != "" {
				result.Name = npc.Name
			}
		}
	}

	return result, nil
}

func (s *Service) DestroyPlot(ctx context.Context, characterID int64, plotNPCID int) (bool, error) {
	plot, err := s.GetPlot(ctx, characterID, plotNPCID)
	if err != nil {
		return false, err
	}
	if plot == nil {
		return false, nil
	}
	if err := s.repo.Delete(ctx, characterID, plotNPCID); err != nil {
		return false, err
	}
	return true, nil
}

func (s *Service) RipenPlot(ctx context.Context, characterID int64, plotNPCID int) (*domainfarm.Plot, bool, error) {
	plot, err := s.GetPlot(ctx, characterID, plotNPCID)
	if err != nil {
		return nil, false, err
	}
	if plot == nil {
		return nil, false, ErrPlotNotFound
	}
	if time.Now().After(plot.ReadyAt) {
		return plot, true, nil
	}

	plot.ReadyAt = time.Now()
	if err := s.repo.Upsert(ctx, plot); err != nil {
		return nil, false, err
	}
	return plot, false, nil
}

func (s *Service) DoubleHarvestPlot(ctx context.Context, characterID int64, plotNPCID int) (*domainfarm.Plot, bool, error) {
	plot, err := s.GetPlot(ctx, characterID, plotNPCID)
	if err != nil {
		return nil, false, err
	}
	if plot == nil {
		return nil, false, ErrPlotNotFound
	}

	cfg, ok := s.crops[plot.CropNPCID]
	if !ok {
		if plot.CropNPCID == s.moneyTree.CropNPCID {
			cfg = s.moneyTree
			ok = true
		}
	}
	if !ok {
		return plot, false, ErrInvalidCropNPCID
	}

	baseCount := s.resolveHarvestCount(cfg, plot.ReadyAt.Sub(plot.PlantedAt))
	doubledCount := baseCount * 2
	if plot.TotalHarvestCount >= doubledCount {
		return plot, true, nil
	}

	delta := doubledCount - plot.TotalHarvestCount
	plot.TotalHarvestCount = doubledCount
	plot.HarvestCount += delta
	if err := s.repo.Upsert(ctx, plot); err != nil {
		return nil, false, err
	}

	return plot, false, nil
}

func (s *Service) GetFarmData(ctx context.Context, characterID int64) (map[string]interface{}, error) {
	plots, err := s.GetPlots(ctx, characterID)
	if err != nil {
		return nil, err
	}

	name := ""
	level := 0
	if s.charRepo != nil {
		if ch, err := s.charRepo.FindByID(ctx, characterID); err == nil && ch != nil {
			name = ch.Name
			level = ch.Level
		}
	}

	mine := make(map[string]interface{}, len(plots)*2)
	for _, plot := range plots {
		if plot == nil || plot.PlotNPCID <= 0 || plot.CropNPCID <= 0 {
			continue
		}
		entry := map[string]interface{}{
			"id":         plot.CropNPCID,
			"num":        plot.HarvestCount,
			"time":       plot.ReadyAt.UnixMilli(),
			"havestFlag": len(plot.SharedHarvesterIDs) > 0,
		}
		mine[strconv.Itoa(plot.PlotNPCID)] = entry
		if legacyIndex, ok := s.legacyPlotIndexByID[plot.PlotNPCID]; ok {
			mine[strconv.Itoa(legacyIndex)] = entry
		}
	}

	farmData := map[string]interface{}{
		"farm": map[string]interface{}{
			"cid":     characterID,
			"name":    name,
			"exp":     0,
			"farmNum": len(s.validPlotNPCIDs),
		},
		"mine": mine,
		"lv":   level,
	}

	return farmData, nil
}

func (s *Service) GetPlantedCropNPCByPlot(ctx context.Context, characterID int64) (map[int]int, error) {
	plots, err := s.GetPlots(ctx, characterID)
	if err != nil {
		return nil, err
	}

	result := make(map[int]int, len(plots))
	for _, plot := range plots {
		if plot == nil || plot.PlotNPCID == 0 || plot.CropNPCID == 0 {
			continue
		}
		result[plot.PlotNPCID] = plot.CropNPCID
	}

	return result, nil
}

func (s *Service) plantWithConfig(ctx context.Context, characterID int64, plotNPCID int, cfg CropConfig) (*PlantResult, error) {
	if plotNPCID <= 0 || !s.IsPlotTemplateID(plotNPCID) {
		return nil, ErrInvalidPlotNPCID
	}

	existing, err := s.GetPlotByNPCID(ctx, plotNPCID)
	if err != nil {
		return nil, err
	}
	if existing != nil {
		return nil, ErrPlotOccupied
	}

	blockingPlot, err := s.GetBlockingPlantPlot(ctx, characterID, plotNPCID)
	if err != nil {
		return nil, err
	}
	if blockingPlot != nil {
		return nil, ErrAnotherPlotActive
	}

	var consumedSeed *domainitem.Item
	if cfg.SeedTemplateID > 0 {
		if s.itemService == nil {
			return nil, ErrFarmUnavailable
		}
		consumedSeed, err = s.itemService.ConsumeItemByTemplateID(ctx, characterID, cfg.SeedTemplateID)
		if err != nil {
			return nil, err
		}
		if consumedSeed == nil {
			return nil, ErrSeedNotFound
		}
	}

	now := time.Now()
	cfg.HarvestCount = s.resolveHarvestCount(cfg, cfg.GrowDuration)
	plot := &domainfarm.Plot{
		CharacterID:           characterID,
		PlotNPCID:             plotNPCID,
		CropNPCID:             cfg.CropNPCID,
		HarvestItemTemplateID: cfg.HarvestItemTemplateID,
		HarvestCount:          cfg.HarvestCount,
		TotalHarvestCount:     cfg.HarvestCount,
		SharedHarvesterIDs:    []int64{},
		PlantedAt:             now,
		ReadyAt:               now.Add(cfg.GrowDuration),
	}

	if err := s.repo.Upsert(ctx, plot); err != nil {
		return nil, err
	}

	result := &PlantResult{
		Plot:             plot,
		CropName:         s.getCropName(cfg.CropNPCID),
		ConsumedSeedItem: consumedSeed,
	}
	return result, nil
}

func (s *Service) resolveHarvestCount(cfg CropConfig, growDuration time.Duration) int {
	if cfg.HarvestItemTemplateID == s.moneyTree.HarvestItemTemplateID && cfg.SeedTemplateID == s.moneyTree.SeedTemplateID {
		return cfg.HarvestCount
	}
	if growDuration >= 40*time.Minute {
		return cfg.HarvestCount * farmLongTermHarvestMultiplier
	}
	return cfg.HarvestCount
}

func (s *Service) sharedHarvestCount(totalHarvestCount int) int {
	shareCount := totalHarvestCount / 10
	if shareCount < 1 {
		return 1
	}
	return shareCount
}

func (s *Service) hasSharedHarvester(plot *domainfarm.Plot, characterID int64) bool {
	if plot == nil || characterID <= 0 {
		return false
	}

	for _, sharedCharacterID := range plot.SharedHarvesterIDs {
		if sharedCharacterID == characterID {
			return true
		}
	}

	return false
}

func (s *Service) getCropName(cropNPCID int) string {
	if s.gameData != nil {
		if npc := s.gameData.GetNPC(cropNPCID); npc != nil && npc.Name != "" {
			return npc.Name
		}
	}
	return fmt.Sprintf("Nông sản %d", cropNPCID)
}

func (s *Service) getItemName(templateID int) string {
	if s.gameData != nil {
		if tpl := s.gameData.GetItem(templateID); tpl != nil && tpl.Name != "" {
			return tpl.Name
		}
	}
	return fmt.Sprintf("Vật phẩm %d", templateID)
}

func (s *Service) GetPlotWitherAt(plot *domainfarm.Plot) time.Time {
	if plot == nil {
		return time.Time{}
	}

	growDuration := plot.ReadyAt.Sub(plot.PlantedAt)
	if growDuration <= 0 {
		return plot.ReadyAt
	}

	return plot.ReadyAt.Add((growDuration * farmWitherDurationNumerator) / farmWitherDurationDenominator)
}

func (s *Service) plantQueryTiming(plot *domainfarm.Plot, now time.Time) (int, int64) {
	if plot == nil {
		return 2, 0
	}

	if now.Before(plot.ReadyAt) {
		return 2, max(0, plot.ReadyAt.Sub(now).Milliseconds())
	}

	witherAt := s.GetPlotWitherAt(plot)
	if witherAt.IsZero() || !now.Before(witherAt) {
		return 3, 0
	}

	return 3, max(0, witherAt.Sub(now).Milliseconds())
}

func (s *Service) IsPlotWithered(plot *domainfarm.Plot, now time.Time) bool {
	if plot == nil {
		return false
	}

	witherAt := s.GetPlotWitherAt(plot)
	if witherAt.IsZero() {
		return false
	}

	return !now.Before(witherAt)
}

func (s *Service) pruneWitheredPlot(ctx context.Context, characterID int64, plot *domainfarm.Plot) (*domainfarm.Plot, error) {
	if plot == nil || !s.IsPlotWithered(plot, time.Now()) {
		return plot, nil
	}

	if err := s.repo.Delete(ctx, characterID, plot.PlotNPCID); err != nil {
		return nil, err
	}

	return nil, nil
}

func (s *Service) pruneWitheredPlots(ctx context.Context, characterID int64, plots []*domainfarm.Plot) ([]*domainfarm.Plot, error) {
	if len(plots) == 0 {
		return plots, nil
	}

	now := time.Now()
	active := make([]*domainfarm.Plot, 0, len(plots))
	for _, plot := range plots {
		if plot == nil {
			continue
		}
		if s.IsPlotWithered(plot, now) {
			if err := s.repo.Delete(ctx, characterID, plot.PlotNPCID); err != nil {
				return nil, err
			}
			continue
		}

		active = append(active, plot)
	}

	return active, nil
}

func (s *Service) pruneSharedPlots(ctx context.Context, plots []*domainfarm.Plot) ([]*domainfarm.Plot, error) {
	if len(plots) == 0 {
		return plots, nil
	}

	now := time.Now()
	active := make([]*domainfarm.Plot, 0, len(plots))
	for _, plot := range plots {
		if plot == nil {
			continue
		}
		if s.IsPlotWithered(plot, now) {
			if err := s.repo.Delete(ctx, plot.CharacterID, plot.PlotNPCID); err != nil {
				return nil, err
			}
			continue
		}

		active = append(active, plot)
	}

	return active, nil
}

func (s *Service) ResolvePlotOwnerCharacterID(ctx context.Context, preferredOwnerCharacterID int64, plotNPCID int) (int64, error) {
	_, ownerCharacterID, err := s.resolvePlotOwner(ctx, preferredOwnerCharacterID, plotNPCID)
	if err != nil {
		return 0, err
	}

	return ownerCharacterID, nil
}

func (s *Service) resolvePlotOwner(ctx context.Context, preferredOwnerCharacterID int64, plotNPCID int) (*domainfarm.Plot, int64, error) {
	if preferredOwnerCharacterID > 0 {
		plot, err := s.GetPlot(ctx, preferredOwnerCharacterID, plotNPCID)
		if err != nil {
			return nil, 0, err
		}
		if plot != nil {
			return plot, preferredOwnerCharacterID, nil
		}
	}

	plot, err := s.GetPlotByNPCID(ctx, plotNPCID)
	if err != nil {
		return nil, 0, err
	}
	if plot == nil {
		return nil, 0, nil
	}

	return plot, plot.CharacterID, nil
}
