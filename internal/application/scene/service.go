// Open-sourced by BaoLT

// Scene service handles map and environment use cases.
// Manages NPCs, scene items, teleportation, and character positioning.
// Integrates with game data for map bounds and safe point lookups.
package scene

import (
	"context"
	"strconv"
	"time"

	appitem "mcgame-server/internal/application/item"
	"mcgame-server/internal/application/title"
	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/npc"
	"mcgame-server/internal/domain/sceneitem"
	"mcgame-server/internal/gamedata"

	"go.uber.org/zap"
)

type Service struct {
	charRepo       character.Repository
	npcRepo        npc.Repository
	sceneItemRepo  sceneitem.Repository
	titleRepo      title.Repository
	appearanceRepo interface {
		BuildCharacterAppearance(ctx context.Context, charID int64, gender int) appitem.CharacterAppearance
		ApplyDressStateToAppearance(appearance appitem.CharacterAppearance, gender int, dressInfo string, dressHidden bool) appitem.CharacterAppearance
		ApplyCharacterElementState(ctx context.Context, char *character.Character)
	}
	gameDataManager *gamedata.Manager
	logger          *zap.Logger
}

func NewService(
	charRepo character.Repository,
	npcRepo npc.Repository,
	sceneItemRepo sceneitem.Repository,
	titleRepo title.Repository,
	logger *zap.Logger,
) *Service {
	return &Service{
		charRepo:      charRepo,
		npcRepo:       npcRepo,
		sceneItemRepo: sceneItemRepo,
		titleRepo:     titleRepo,
		logger:        logger,
	}
}

func (s *Service) SetGameDataManager(manager *gamedata.Manager) {
	s.gameDataManager = manager
}

func (s *Service) SetAppearanceProvider(provider interface {
	BuildCharacterAppearance(ctx context.Context, charID int64, gender int) appitem.CharacterAppearance
	ApplyDressStateToAppearance(appearance appitem.CharacterAppearance, gender int, dressInfo string, dressHidden bool) appitem.CharacterAppearance
	ApplyCharacterElementState(ctx context.Context, char *character.Character)
}) {
	s.appearanceRepo = provider
}

func (s *Service) GetNearbyCharacters(ctx context.Context, mapID int, excludeCharID int64) ([]*character.Character, error) {
	chars, err := s.charRepo.FindByMapID(ctx, mapID)
	if err != nil {
		return nil, err
	}

	result := make([]*character.Character, 0, len(chars))
	for _, c := range chars {
		if c.ID != excludeCharID {
			result = append(result, c)
		}
	}

	return result, nil
}

func (s *Service) GetMapNPCs(ctx context.Context, mapID int) ([]*npc.NPC, error) {
	npcs, err := s.npcRepo.FindByMapID(ctx, mapID)
	if err != nil {
		return nil, err
	}

	return npcs, nil
}

func (s *Service) GetMapItems(ctx context.Context, mapID int) ([]*sceneitem.SceneItem, error) {
	items, err := s.sceneItemRepo.FindByMapID(ctx, mapID)
	if err != nil {
		return nil, err
	}

	s.logger.Debug("Retrieved map items",
		zap.Int("map_id", mapID),
		zap.Int("count", len(items)))

	return items, nil
}

type SafePoint struct {
	MapID int
	X     int
	Y     int
}

var fallbackSafePoints = map[int]SafePoint{
	1: {MapID: 1, X: 100, Y: 100},
}

func (s *Service) GetSafePoint(mapID int) (x, y int) {
	if s.gameDataManager != nil {
		mapData := s.gameDataManager.GetMap(mapID)
		if mapData != nil {
			safeX := int(mapData.SafeX)
			safeY := int(mapData.SafeY)
			if safeX > 0 || safeY > 0 {
				s.logger.Debug("Using TBL_MAP safe point",
					zap.Int("map_id", mapID),
					zap.Int("safe_x", safeX),
					zap.Int("safe_y", safeY))
				return safeX, safeY
			}
		}
	}

	if sp, ok := fallbackSafePoints[mapID]; ok {
		return sp.X, sp.Y
	}

	return 100, 100
}

func (s *Service) GetMapBounds(mapID int) (width, height int) {
	if s.gameDataManager != nil {
		mapData := s.gameDataManager.GetMap(mapID)
		if mapData != nil {
			w := int(mapData.Width)
			h := int(mapData.Height)
			if w > 0 && h > 0 {
				return w, h
			}
		}
	}
	return 10000, 10000
}

func (s *Service) ValidateTeleport(mapID, targetX, targetY int) bool {
	if targetX < 0 || targetY < 0 {
		return false
	}

	if mapID <= 0 {
		return false
	}

	width, height := s.GetMapBounds(mapID)
	if targetX > width || targetY > height {
		s.logger.Debug("Teleport rejected: out of bounds",
			zap.Int("map_id", mapID),
			zap.Int("target_x", targetX),
			zap.Int("target_y", targetY),
			zap.Int("max_x", width),
			zap.Int("max_y", height))
		return false
	}

	return true
}

func (s *Service) DropItem(ctx context.Context, templateID, mapID, posX, posY, stackCount int, ownerID int64) (*sceneitem.SceneItem, error) {
	item := sceneitem.NewSceneItem(templateID, mapID, posX, posY, stackCount, &ownerID)

	if err := s.sceneItemRepo.Create(ctx, item); err != nil {
		return nil, err
	}

	s.logger.Info("Item dropped",
		zap.Int64("item_id", item.ID),
		zap.Int("template_id", templateID),
		zap.Int("map_id", mapID),
		zap.Int64("owner_id", ownerID))

	return item, nil
}

func (s *Service) PickupItem(ctx context.Context, itemID int64, charID int64) (*sceneitem.SceneItem, error) {
	item, err := s.sceneItemRepo.FindByID(ctx, itemID)
	if err != nil {
		return nil, err
	}

	if !item.CanPickup(charID) {
		return nil, nil
	}

	if item.IsExpired() {
		_ = s.sceneItemRepo.Delete(ctx, itemID)
		return nil, nil
	}

	if err := s.sceneItemRepo.Delete(ctx, itemID); err != nil {
		return nil, err
	}

	s.logger.Info("Item picked up",
		zap.Int64("item_id", itemID),
		zap.Int("template_id", item.TemplateID),
		zap.Int64("character_id", charID))

	return item, nil
}

func (s *Service) CleanupExpiredItems(ctx context.Context) (int64, error) {
	count, err := s.sceneItemRepo.DeleteExpired(ctx)
	if err != nil {
		return 0, err
	}

	if count > 0 {
		s.logger.Info("Cleaned up expired items", zap.Int64("count", count))
	}

	return count, nil
}

type TeleportDestination struct {
	MapID int
	X     int
	Y     int
}

func (s *Service) GetTeleportDestination(sourceGateID int) (*TeleportDestination, error) {
	if s.gameDataManager == nil {
		s.logger.Warn("Game data manager not set, cannot lookup teleport destination")
		return nil, nil
	}

	sourceGate := s.gameDataManager.GetSceneItemInstance(sourceGateID)
	if sourceGate == nil {
		s.logger.Warn("Source gate not found",
			zap.Int("source_gate_id", sourceGateID))
		return nil, nil
	}

	// Use From field to find the destination gate (From points to the destination gate ID)
	destGateID := int(sourceGate.From)
	if destGateID == 0 {
		s.logger.Warn("Missing 'from' field in source gate",
			zap.Int("source_gate_id", sourceGateID))
		return nil, nil
	}

	destGate := s.gameDataManager.GetSceneItemInstance(destGateID)
	if destGate == nil {
		s.logger.Warn("Destination gate not found",
			zap.Int("source_gate_id", sourceGateID),
			zap.Int("dest_gate_id", destGateID))
		return nil, nil
	}

	destMapID := int(destGate.PosMapID)
	if destMapID == 0 {
		s.logger.Error("Invalid destination map ID in gate",
			zap.Int("dest_gate_id", destGateID),
			zap.Int("pos_map_id", destMapID))
		return nil, nil
	}

	destX := int(destGate.PosX)
	destY := int(destGate.PosY)

	s.logger.Debug("Looked up teleport destination",
		zap.Int("source_gate_id", sourceGateID),
		zap.Int("dest_gate_id", destGateID),
		zap.Int("dest_map", destMapID),
		zap.Int("dest_x", destX),
		zap.Int("dest_y", destY))

	return &TeleportDestination{
		MapID: destMapID,
		X:     destX + 100,
		Y:     destY + 100,
	}, nil
}

type NPCClientData struct {
	InstanceID int
	NID        int
	X          int
	Y          int
	Name       string
	ResCode    int64
	Type       int
}

func (s *Service) GetCharacterForClient(char *character.Character) map[string]interface{} {
	if s.appearanceRepo != nil {
		s.appearanceRepo.ApplyCharacterElementState(context.Background(), char)
	}

	var resCode, iconCode int64

	if s.gameDataManager != nil {
		classData := s.gameDataManager.GetClass(char.ClassID)
		if classData != nil {
			if char.Gender == 1 {
				resCode = int64(classData.ResCodeFemale)
				iconCode = int64(classData.IconCodeFemale)
			} else {
				resCode = int64(classData.ResCodeMale)
				iconCode = int64(classData.IconCodeMale)
			}
		}
	}
	if transformedResCode, ok := char.ActivePMTransformResCode(time.Now()); ok {
		resCode = transformedResCode
	}

	var titleID, specialTitleID int
	if s.titleRepo != nil {
		t, err := s.titleRepo.GetActiveTitle(context.Background(), char.ID)
		if err == nil {
			titleID = t
		}
		st, err := s.titleRepo.GetActiveSpecialTitle(context.Background(), char.ID)
		if err == nil {
			specialTitleID = st
		}
	}

	appearance := appitem.CharacterAppearance{}
	if s.appearanceRepo != nil {
		appearance = s.appearanceRepo.BuildCharacterAppearance(context.Background(), char.ID, char.Gender)
		appearance = s.appearanceRepo.ApplyDressStateToAppearance(appearance, char.Gender, char.DressInfo, appitem.DressHiddenFromCharacter(char))
	}
	if _, ok := char.ActivePMTransformResCode(time.Now()); ok {
		appearance.DressResCode = 0
	}

	dressResCode := int64(-2)
	if appearance.DressResCode > 0 {
		dressResCode = appearance.DressResCode
	}

	result := map[string]interface{}{
		"id":                char.ID,
		"name":              char.Name,
		"classId":           strconv.Itoa(char.ClassID),
		"gender":            strconv.Itoa(char.Gender),
		"level":             char.Level,
		"pmLevel":           char.CurrentPMLevel(time.Now()),
		"ee":                char.Ee,
		"ef":                char.Ef,
		"en":                char.En,
		"iconCode":          strconv.FormatInt(iconCode, 10),
		"resCode":           strconv.FormatInt(resCode, 10),
		"posX":              strconv.Itoa(char.PosX),
		"posY":              strconv.Itoa(char.PosY),
		"posMapId":          strconv.Itoa(char.MapID),
		"posDir":            strconv.Itoa(char.Direction),
		"vipT":              -1,
		"SpeT":              0,
		"actT":              specialTitleID,
		"t":                 titleID,
		"exp":               strconv.FormatInt(char.CumulativeExpCapped(), 10),
		"expRe":             strconv.FormatInt(char.RebirthExp, 10),
		"honor":             strconv.Itoa(char.Honor),
		"colorCode":         "1",
		"isFlying":          false,
		"doubleFly":         false,
		"broT":              "",
		"ct":                "",
		"decoInfo":          map[string]interface{}{},
		"fairy":             nil,
		"inGroup":           false,
		"leagueIcon":        nil,
		"prsUseId":          0,
		"showPetId":         int64(-1),
		"showPetObj":        nil,
		"wp":                "0",
		"star":              appearance.Star,
		"dressResCode":      dressResCode,
		"flyerResCode":      "0",
		"flyerFrontResCode": "0",
		"wingResCode":       0,
		"mountResCode":      0,
	}

	if appearance.WeaponResCode > 0 {
		result["wp"] = strconv.FormatInt(appearance.WeaponResCode, 10)
	}
	if appearance.FlyerResCode > 0 {
		result["flyerResCode"] = strconv.FormatInt(appearance.FlyerResCode, 10)
	}
	if appearance.FlyerFrontResCode > 0 {
		result["flyerFrontResCode"] = strconv.FormatInt(appearance.FlyerFrontResCode, 10)
	}
	if appearance.WingResCode > 0 {
		result["wingResCode"] = int(appearance.WingResCode)
	}
	if appearance.EquiptList != nil {
		result["equiptList"] = appearance.EquiptList
	}

	return result
}

func (s *Service) GetMapNPCsForClient(ctx context.Context, mapID int) ([]NPCClientData, error) {
	if s.gameDataManager == nil {
		s.logger.Warn("Game data manager not set, cannot load NPCs")
		return nil, nil
	}

	npcTemplates := s.gameDataManager.GetNPCsByMapID(mapID)
	now := time.Now()

	result := make([]NPCClientData, 0, len(npcTemplates))
	filtered := 0
	for _, npc := range npcTemplates {
		// Filter by time range - skip NPCs outside their display window
		if !npc.IsActiveAt(now) {
			filtered++
			continue
		}

		posX := int(npc.PosX)
		posY := int(npc.PosY)
		resCode := int64(npc.ResCode)
		npcID := npc.GetID()

		data := NPCClientData{
			InstanceID: npcID,
			NID:        npcID,
			X:          posX,
			Y:          posY,
			Name:       npc.Name,
			ResCode:    resCode,
			Type:       int(npc.Type),
		}

		result = append(result, data)
	}

	return result, nil
}

// BeginFlyingResult contains the result of beginning flying
type BeginFlyingResult struct {
	CharacterID int64
}

// BeginFlying handles the request to start flying for a character
func (s *Service) BeginFlying(ctx context.Context, characterID int64) (*BeginFlyingResult, error) {
	// Verify character exists
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		s.logger.Warn("Character not found for beginFlying",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	s.logger.Info("Character beginning to fly",
		zap.Int64("character_id", characterID),
		zap.String("character_name", char.Name),
		zap.Int("map_id", char.MapID))

	return &BeginFlyingResult{
		CharacterID: characterID,
	}, nil
}

// StopFlyingResult contains the result of stopping flying
type StopFlyingResult struct {
	CharacterID int64
}

// StopFlying handles the request to stop flying for a character
func (s *Service) StopFlying(ctx context.Context, characterID int64) (*StopFlyingResult, error) {
	// Verify character exists
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		s.logger.Warn("Character not found for stopFlying",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	s.logger.Info("Character stopping flying",
		zap.Int64("character_id", characterID),
		zap.String("character_name", char.Name),
		zap.Int("map_id", char.MapID))

	return &StopFlyingResult{
		CharacterID: characterID,
	}, nil
}
