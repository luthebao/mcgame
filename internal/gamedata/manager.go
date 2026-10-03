// Open-sourced by BaoLT

package gamedata

import (
	"context"

	"go.uber.org/zap"

	"mcgame-server/internal/gamedata/models"
)

// Manager provides access to all game data templates
type Manager struct {
	repo   Repository
	cache  *Cache
	logger *zap.Logger
}

// NewManager creates a new GameDataManager
func NewManager(repo Repository, logger *zap.Logger) *Manager {
	return &Manager{
		repo:   repo,
		cache:  NewCache(logger),
		logger: logger,
	}
}

// LoadAll loads all game data from the repository into the cache
func (m *Manager) LoadAll(ctx context.Context) error {
	m.logger.Info("Loading game data into cache...")

	tableNames, err := m.repo.GetTableNames(ctx)
	if err != nil {
		return err
	}

	totalRecords := 0
	for _, tableName := range tableNames {
		records, err := m.repo.GetAllByTable(ctx, tableName)
		if err != nil {
			m.logger.Warn("Failed to load table",
				zap.String("table", tableName),
				zap.Error(err))
			continue
		}

		if err := m.cache.LoadTable(tableName, records); err != nil {
			m.logger.Warn("Failed to cache table",
				zap.String("table", tableName),
				zap.Error(err))
			continue
		}

		totalRecords += len(records)
	}

	m.logger.Info("Game data loaded",
		zap.Int("tables", len(tableNames)),
		zap.Int("total_records", totalRecords))

	return nil
}

// GetCache returns the underlying cache for direct access
func (m *Manager) GetCache() *Cache {
	return m.cache
}

// GetRepository returns the underlying repository
func (m *Manager) GetRepository() Repository {
	return m.repo
}

// Stats returns statistics about loaded data
func (m *Manager) Stats() map[string]int {
	return m.cache.Stats()
}

// Lookup methods - delegate to cache

func (m *Manager) GetClass(id int) *models.ClassTemplate {
	return m.cache.GetClass(id)
}

func (m *Manager) GetAllClasses() []*models.ClassTemplate {
	return m.cache.GetAllClasses()
}

func (m *Manager) GetCreature(id int) *models.CreatureTemplate {
	return m.cache.GetCreature(id)
}

func (m *Manager) GetAllCreatures() []*models.CreatureTemplate {
	return m.cache.GetAllCreatures()
}

func (m *Manager) GetCreatureLootByCreatureID(creatureID int) []*models.CreatureLootTemplate {
	return m.cache.GetCreatureLootByCreatureID(creatureID)
}

func (m *Manager) GetEquipment(id int) *models.EquiptTemplateTemplate {
	return m.cache.GetEquipment(id)
}

func (m *Manager) GetItem(id int) *models.ItemTemplateTemplate {
	return m.cache.GetItem(id)
}

func (m *Manager) GetArtifactUpgrade(tid, level int) *models.ArtifactTemplate {
	return m.cache.GetArtifactUpgrade(tid, level)
}

func (m *Manager) GetArtifactUpgradesByTid(tid int) []*models.ArtifactTemplate {
	return m.cache.GetArtifactUpgradesByTid(tid)
}

func (m *Manager) ArtifactCumulativeSpirit(tid, throughLevel int) int64 {
	return m.cache.ArtifactCumulativeSpirit(tid, throughLevel)
}

func (m *Manager) GetSkillIDsByUseEnv(useEnv int) []int {
	return m.cache.GetSkillIDsByUseEnv(useEnv)
}

func (m *Manager) GetMineralTemplate(id int) *models.MineralTemplateTemplate {
	return m.cache.GetMineralTemplate(id)
}

func (m *Manager) GetDiary(id int) *models.DiaryTemplate {
	return m.cache.GetDiary(id)
}

func (m *Manager) GetMap(id int) *models.MapTemplate {
	return m.cache.GetMap(id)
}

func (m *Manager) GetAllMaps() []*models.MapTemplate {
	return m.cache.GetAllMaps()
}

func (m *Manager) GetNPC(id int) *models.NpcTemplate {
	return m.cache.GetNPC(id)
}

func (m *Manager) GetNPCsByMapID(mapID int) []*models.NpcTemplate {
	return m.cache.GetNPCsByMapID(mapID)
}

func (m *Manager) GetNPCsByName(name string) []*models.NpcTemplate {
	return m.cache.GetNPCsByName(name)
}

func (m *Manager) GetBuilding(id int) *models.BuildingTemplate {
	return m.cache.GetBuilding(id)
}

func (m *Manager) GetExtendPositionsByMapID(mapID int) []*models.ExtendPositionTemplate {
	return m.cache.GetExtendPositionsByMapID(mapID)
}

func (m *Manager) GetSkill(id int) *models.SkillTemplate {
	return m.cache.GetSkill(id)
}

func (m *Manager) GetAllSkills() []*models.SkillTemplate {
	return m.cache.GetAllSkills()
}

func (m *Manager) GetCreatureSkills(cid int) []*models.CreatureSkillTemplate {
	return m.cache.GetCreatureSkills(cid)
}

func (m *Manager) GetQuest(id int) *models.QuestTemplate {
	return m.cache.GetQuest(id)
}

func (m *Manager) GetAllQuests() []*models.QuestTemplate {
	return m.cache.GetAllQuests()
}

func (m *Manager) GetQuestAwards(questID int) []*models.QuestAwardTemplate {
	return m.cache.GetQuestAwards(questID)
}

func (m *Manager) GetItemAwardsByItemID(itemID int) []*models.ItemAwardTemplate {
	return m.cache.GetItemAwardsByItemID(itemID)
}

func (m *Manager) GetQuestPre(questID int) []*models.QuestPreTemplate {
	return m.cache.GetQuestPre(questID)
}

func (m *Manager) GetQuestRequire(questID int) []*models.QuestRequireTemplate {
	return m.cache.GetQuestRequire(questID)
}

func (m *Manager) GetBuff(id int) *models.BuffTemplate {
	return m.cache.GetBuff(id)
}

func (m *Manager) GetShop(id int) *models.ShopTemplate {
	return m.cache.GetShop(id)
}

func (m *Manager) GetShopSlot(id int) *models.ShopSlotTemplate {
	return m.cache.GetShopSlot(id)
}

func (m *Manager) GetPmRight(id int) *models.PmRightTemplate {
	return m.cache.GetPmRight(id)
}

func (m *Manager) GetAllPmRights() []*models.PmRightTemplate {
	return m.cache.GetAllPmRights()
}

func (m *Manager) GetShopSlotsBySid(sid int) []*models.ShopSlotTemplate {
	return m.cache.GetShopSlotsBySid(sid)
}

func (m *Manager) GetMount(id int) *models.MountTemplate {
	return m.cache.GetMount(id)
}

func (m *Manager) FindMountByTypeAndLevel(mountType int, level int) *models.MountTemplate {
	return m.cache.FindMountByTypeAndLevel(mountType, level)
}

func (m *Manager) GetMountDress(id int) *models.MountDressTemplate {
	return m.cache.GetMountDress(id)
}

func (m *Manager) GetPetTalent(id int) *models.PetTalentTemplate {
	return m.cache.GetPetTalent(id)
}

func (m *Manager) GetAllPetTalents() []*models.PetTalentTemplate {
	return m.cache.GetAllPetTalents()
}

func (m *Manager) FindPetTalentBySidLv(sid, lv int) *models.PetTalentTemplate {
	return m.cache.FindPetTalentBySidLv(sid, lv)
}

func (m *Manager) GetPetSoul(id int) *models.PetSoulTemplate {
	return m.cache.GetPetSoul(id)
}

func (m *Manager) GetAchievement(id int) *models.AchievementTemplate {
	return m.cache.GetAchievement(id)
}

func (m *Manager) GetAllAchievements() []*models.AchievementTemplate {
	return m.cache.GetAllAchievements()
}

func (m *Manager) GetAchievementRequiresByAchievementID(achievementID int) []*models.AchievementRequireTemplate {
	return m.cache.GetAchievementRequiresByAchievementID(achievementID)
}

func (m *Manager) GetTitle(id int) *models.TitleTemplate {
	return m.cache.GetTitle(id)
}

func (m *Manager) FindPetGuardByLevSid(level, sid int) *models.PetGuardTemplate {
	return m.cache.FindPetGuardByLevSid(level, sid)
}

func (m *Manager) GetAllTitles() []*models.TitleTemplate {
	return m.cache.GetAllTitles()
}

func (m *Manager) FindUniqueTitleByName(name string) *models.TitleTemplate {
	return m.cache.FindUniqueTitleByName(name)
}

func (m *Manager) GetPetStone(id int) *models.PetStoneTemplate {
	return m.cache.GetPetStone(id)
}

func (m *Manager) GetAllPetStones() []*models.PetStoneTemplate {
	return m.cache.GetAllPetStones()
}

func (m *Manager) GetFairyTempalte(id int) *models.FairyTempalteTemplate {
	return m.cache.GetFairyTempalte(id)
}

func (m *Manager) GetAllFairyTempaltes() []*models.FairyTempalteTemplate {
	return m.cache.GetAllFairyTempaltes()
}

func (m *Manager) GetStarsTemplate(id int) *models.StarsTemplateTemplate {
	return m.cache.GetStarsTemplate(id)
}

func (m *Manager) FindStarsTemplateByTypeAndLevel(starType int, level int) *models.StarsTemplateTemplate {
	return m.cache.FindStarsTemplateByTypeAndLevel(starType, level)
}

func (m *Manager) GetAwakening(id int) *models.AwakeningTemplate {
	return m.cache.GetAwakening(id)
}

func (m *Manager) GetAwakeningSkill(id int) *models.AwakeningSkillTemplate {
	return m.cache.GetAwakeningSkill(id)
}

func (m *Manager) GetSoul(id int) *models.SoulTemplate {
	return m.cache.GetSoul(id)
}

func (m *Manager) GetMedal(id int) *models.MedalTemplate {
	return m.cache.GetMedal(id)
}

func (m *Manager) GetExplorerMedal(id int) *models.ExplorerMedalTemplate {
	return m.cache.GetExplorerMedal(id)
}

func (m *Manager) GetWarSprite(id int) *models.WarSpriteTemplate {
	return m.cache.GetWarSprite(id)
}

func (m *Manager) GetPrsTree(id int) *models.PrsTreeTemplate {
	return m.cache.GetPrsTree(id)
}

func (m *Manager) GetPrsShow(id int) *models.PrsShowTemplate {
	return m.cache.GetPrsShow(id)
}

func (m *Manager) GetPrsChip(id int) *models.PrsChipTemplate {
	return m.cache.GetPrsChip(id)
}

func (m *Manager) GetSceneItemInstance(id int) *models.SceneitemInstanceTemplate {
	return m.cache.GetSceneItemInstance(id)
}

func (m *Manager) GetSceneItemInstanceByTid(tid int) *models.SceneitemInstanceTemplate {
	return m.cache.GetSceneItemInstanceByTid(tid)
}

// Query methods

// GetQuestsByLevel returns all quests available for a level range
func (m *Manager) GetQuestsByLevel(minLevel, maxLevel int) []*models.QuestTemplate {
	all := m.cache.GetAllQuests()
	result := make([]*models.QuestTemplate, 0)
	for _, q := range all {
		qMinLevel := int(q.MinLevel)
		if qMinLevel >= minLevel && qMinLevel <= maxLevel {
			result = append(result, q)
		}
	}
	return result
}

// GetCreaturesByMap returns all creatures that spawn on a map
// Note: This requires looking up TBL_MAP_CREATURE table
func (m *Manager) GetCreaturesByMap(mapID int) []*models.CreatureTemplate {
	mapCreatures := m.cache.GetMapCreaturesByMapID(mapID)
	result := make([]*models.CreatureTemplate, 0, len(mapCreatures))
	for _, mc := range mapCreatures {
		if creature := m.cache.GetCreature(int(mc.Cid)); creature != nil {
			result = append(result, creature)
		}
	}
	return result
}

func (m *Manager) GetMapCreaturesByMapID(mapID int) []*models.MapCreatureTemplate {
	return m.cache.GetMapCreaturesByMapID(mapID)
}

func (m *Manager) GetNpcCreaturesByNid(nid int) []*models.NpcCreatureTemplate {
	return m.cache.GetNpcCreaturesByNid(nid)
}

func (m *Manager) GetCreatureHandbookByMapID(mapID int) []*models.CreatureHandbookTemplate {
	return m.cache.GetCreatureHandbookByMapID(mapID)
}

func (m *Manager) GetAllCreatureHandbooks() []*models.CreatureHandbookTemplate {
	return m.cache.GetAllCreatureHandbooks()
}

func (m *Manager) GetRecipePlan(id int) *models.RecipePlanTemplate {
	return m.cache.GetRecipePlan(id)
}

func (m *Manager) GetDress(id int) *models.DressTemplate {
	return m.cache.GetDress(id)
}

func (m *Manager) GetAllDresses() []*models.DressTemplate {
	return m.cache.GetAllDresses()
}

func (m *Manager) GetRecipe(id int) *models.RecipeTemplate {
	return m.cache.GetRecipe(id)
}

func (m *Manager) GetAllRecipes() []*models.RecipeTemplate {
	return m.cache.GetAllRecipes()
}

func (m *Manager) GetRecipePlansByRecipeID(recipeID int) []*models.RecipePlanTemplate {
	return m.cache.GetRecipePlansByRecipeID(recipeID)
}

func (m *Manager) PlansByType(t int) []*models.PlanTemplate {
	return m.cache.PlansByType(t)
}

func (m *Manager) GetCarveAward(id int) *models.CarveAwardTemplate {
	return m.cache.GetCarveAward(id)
}

func (m *Manager) GetDecoHole(id int) *models.DecoHoleTemplate {
	return m.cache.GetDecoHole(id)
}

func (m *Manager) GetDecoRune(id int) *models.DecoRuneTemplate {
	return m.cache.GetDecoRune(id)
}

func (m *Manager) GetDecoShow(id int) *models.DecoShowTemplate {
	return m.cache.GetDecoShow(id)
}

func (m *Manager) GetDecoShowsBySuitID(suitID int) []*models.DecoShowTemplate {
	return m.cache.GetDecoShowsBySuitID(suitID)
}

func (m *Manager) GetAllHeiyaoshiPoints() []*models.HeiyaoshiPointTemplate {
	return m.cache.GetAllHeiyaoshiPoints()
}

func (m *Manager) GetAllHeiyaoshiPointLinks() []*models.HeiyaoshiPointLinkTemplate {
	return m.cache.GetAllHeiyaoshiPointLinks()
}

func (m *Manager) GetAllHeiyaoshiAreas() []*models.HeiyaoshiAreaTemplate {
	return m.cache.GetAllHeiyaoshiAreas()
}

func (m *Manager) GetAllHeiyaoshiAreaAttrs() []*models.HeiyaoshiAreaAttributeTemplate {
	return m.cache.GetAllHeiyaoshiAreaAttrs()
}

func (m *Manager) GetAllHeiyaoshiFullBuffs() []*models.HeiyaoshiFullBuffTemplate {
	return m.cache.GetAllHeiyaoshiFullBuffs()
}
