// Open-sourced by BaoLT

package gamedata

import (
	"encoding/json"
	"sort"
	"strings"
	"sync"

	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

// Cache holds all game data templates in memory for fast access
type Cache struct {
	logger *zap.Logger
	// Core gameplay tables
	classes           map[int]*models.ClassTemplate
	creatures         map[int]*models.CreatureTemplate
	creatureLoot      map[int]*models.CreatureLootTemplate
	creatureLootByCid map[int][]*models.CreatureLootTemplate
	creatureSkills    map[int]*models.CreatureSkillTemplate
	equipment         map[int]*models.EquiptTemplateTemplate
	items             map[int]*models.ItemTemplateTemplate
	maps              map[int]*models.MapTemplate
	mapCreatures      map[int]*models.MapCreatureTemplate
	npcs              map[int]*models.NpcTemplate
	npcCreatures      map[int]*models.NpcCreatureTemplate
	npcCreaturesByNid map[int][]*models.NpcCreatureTemplate
	npcSkills         map[int]*models.NpcSkillTemplate
	skills            map[int]*models.SkillTemplate
	skillsByUseEnv    map[int][]int
	quests            map[int]*models.QuestTemplate
	questAwards       map[int]*models.QuestAwardTemplate
	itemAwards        map[int]*models.ItemAwardTemplate
	questRequires     map[int]*models.QuestRequireTemplate
	questLoops        map[int]*models.QuestLoopTemplate
	questPres         map[int]*models.QuestPreTemplate
	sceneItemInstance map[int]*models.SceneitemInstanceTemplate
	sceneItemTemplate map[int]*models.SceneitemTemplateTemplate

	// Shops
	shops     map[int]*models.ShopTemplate
	shopSlots map[int]*models.ShopSlotTemplate

	// Skills
	skillKinds map[int]*models.SkillKindTemplate
	skillPools map[int]*models.SkillPoolTemplate
	skillTypes map[int]*models.SkillTypeTemplate

	// Combat
	buffs map[int]*models.BuffTemplate

	// Equipment
	equipSuits map[int]*models.EquiptSuitTemplate

	// Progression
	plans        map[int]*models.PlanTemplate
	titles       map[int]*models.TitleTemplate
	achievements map[int]*models.AchievementTemplate
	achieveReqs  map[int]*models.AchievementRequireTemplate
	guides       map[int]*models.GuideTemplate

	// Pet system
	petSouls      map[int]*models.PetSoulTemplate
	petTalents    map[int]*models.PetTalentTemplate
	petContracts  map[int]*models.PetContractTemplate
	petGuards     map[int]*models.PetGuardTemplate
	petStones     map[int]*models.PetStoneTemplate
	creatureHbook map[int]*models.CreatureHandbookTemplate

	// Mounts
	mounts     map[int]*models.MountTemplate
	mountDress map[int]*models.MountDressTemplate

	// Other tables
	mapCells            map[int]*models.MapCellTemplate
	answers             map[int]*models.AnswerTemplate
	feasts              map[int]*models.FeastTemplate
	buildings           map[int]*models.BuildingTemplate
	extendPos           map[int]*models.ExtendPositionTemplate
	nameLibs            map[int]*models.NameLibTemplate
	mineralTempl        map[int]*models.MineralTemplateTemplate
	diaries             map[int]*models.DiaryTemplate
	fairyTempl          map[int]*models.FairyTempalteTemplate
	starsTempl          map[int]*models.StarsTemplateTemplate
	warMaps             map[int]*models.WarMapTemplate
	pmRights            map[int]*models.PmRightTemplate
	medals              map[int]*models.MedalTemplate
	mazes               map[int]*models.MazeTemplate
	artifacts           map[int]*models.ArtifactTemplate
	artifactsByTidLevel map[int64]*models.ArtifactTemplate
	artifactsByTid      map[int][]*models.ArtifactTemplate
	dresses             map[int]*models.DressTemplate
	recipes             map[int]*models.RecipeTemplate
	recipePlans         map[int]*models.RecipePlanTemplate
	credits             map[int]*models.CreditTemplate
	sublimations        map[int]*models.SublimationTemplate
	sublimationPet      map[int]*models.SublimationPetTemplate
	awakenings          map[int]*models.AwakeningTemplate
	awakeSkills         map[int]*models.AwakeningSkillTemplate
	recyclings          map[int]*models.RecyclingTemplate
	souls               map[int]*models.SoulTemplate
	decoHoles           map[int]*models.DecoHoleTemplate
	decoRunes           map[int]*models.DecoRuneTemplate
	decoShows           map[int]*models.DecoShowTemplate
	mystreRecipes       map[int]*models.MystreRecipeTemplate
	mystres             map[int]*models.MystreTemplate
	runeChips           map[int]*models.RuneChipTemplate
	prsTrees            map[int]*models.PrsTreeTemplate
	prsShows            map[int]*models.PrsShowTemplate
	prsChips            map[int]*models.PrsChipTemplate
	meventMaps          map[int]*models.MeventMapTemplate
	meventTypes         map[int]*models.MeventTypeTemplate
	warSprites          map[int]*models.WarSpriteTemplate
	creatureHeart       map[int]*models.CreaturehHeartTemplate
	creatureComb        map[int]*models.CreaturehCombineTemplate
	creatureCont        map[int]*models.CreaturehContainTemplate
	creaturePoint       map[int]*models.CreaturehPointTemplate
	explorerMedals      map[int]*models.ExplorerMedalTemplate
	carves              map[int]*models.CarveTemplate
	carveAwards         map[int]*models.CarveAwardTemplate
	carveMasters        map[int]*models.CarveMasterTemplate
	mytcSuits           map[int]*models.MytcSuitTemplate
	mytcDetails         map[int]*models.MytcDetailTemplate

	heiyaoshiPoints     map[int]*models.HeiyaoshiPointTemplate
	heiyaoshiPointLinks map[int]*models.HeiyaoshiPointLinkTemplate
	heiyaoshiAreas      map[int]*models.HeiyaoshiAreaTemplate
	heiyaoshiAreaAttrs  map[int]*models.HeiyaoshiAreaAttributeTemplate
	heiyaoshiFullBuffs  map[int]*models.HeiyaoshiFullBuffTemplate

	mu sync.RWMutex
}

// snakeToCamelJSON converts JSON with snake_case keys to camelCase
func snakeToCamelJSON(data json.RawMessage) (json.RawMessage, error) {
	var obj map[string]interface{}
	if err := json.Unmarshal(data, &obj); err != nil {
		return nil, err
	}

	camelObj := make(map[string]interface{})
	for k, v := range obj {
		camelKey := toCamelCase(k)
		camelObj[camelKey] = v
	}

	return json.Marshal(camelObj)
}

// toCamelCase converts snake_case to camelCase
func toCamelCase(s string) string {
	if s == "" {
		return s
	}
	parts := strings.Split(s, "_")
	for i := 1; i < len(parts); i++ {
		if len(parts[i]) > 0 {
			parts[i] = strings.ToUpper(parts[i][0:1]) + parts[i][1:]
		}
	}
	return strings.Join(parts, "")
}

// NewCache creates a new empty cache
func NewCache(logger *zap.Logger) *Cache {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Cache{
		logger:              logger,
		classes:             make(map[int]*models.ClassTemplate),
		creatures:           make(map[int]*models.CreatureTemplate),
		creatureLoot:        make(map[int]*models.CreatureLootTemplate),
		creatureLootByCid:   make(map[int][]*models.CreatureLootTemplate),
		creatureSkills:      make(map[int]*models.CreatureSkillTemplate),
		equipment:           make(map[int]*models.EquiptTemplateTemplate),
		items:               make(map[int]*models.ItemTemplateTemplate),
		maps:                make(map[int]*models.MapTemplate),
		mapCreatures:        make(map[int]*models.MapCreatureTemplate),
		npcs:                make(map[int]*models.NpcTemplate),
		npcCreatures:        make(map[int]*models.NpcCreatureTemplate),
		npcCreaturesByNid:   make(map[int][]*models.NpcCreatureTemplate),
		npcSkills:           make(map[int]*models.NpcSkillTemplate),
		skills:              make(map[int]*models.SkillTemplate),
		skillsByUseEnv:      make(map[int][]int),
		quests:              make(map[int]*models.QuestTemplate),
		questAwards:         make(map[int]*models.QuestAwardTemplate),
		itemAwards:          make(map[int]*models.ItemAwardTemplate),
		questRequires:       make(map[int]*models.QuestRequireTemplate),
		questLoops:          make(map[int]*models.QuestLoopTemplate),
		questPres:           make(map[int]*models.QuestPreTemplate),
		sceneItemInstance:   make(map[int]*models.SceneitemInstanceTemplate),
		sceneItemTemplate:   make(map[int]*models.SceneitemTemplateTemplate),
		shops:               make(map[int]*models.ShopTemplate),
		shopSlots:           make(map[int]*models.ShopSlotTemplate),
		skillKinds:          make(map[int]*models.SkillKindTemplate),
		skillPools:          make(map[int]*models.SkillPoolTemplate),
		skillTypes:          make(map[int]*models.SkillTypeTemplate),
		buffs:               make(map[int]*models.BuffTemplate),
		equipSuits:          make(map[int]*models.EquiptSuitTemplate),
		plans:               make(map[int]*models.PlanTemplate),
		titles:              make(map[int]*models.TitleTemplate),
		achievements:        make(map[int]*models.AchievementTemplate),
		achieveReqs:         make(map[int]*models.AchievementRequireTemplate),
		guides:              make(map[int]*models.GuideTemplate),
		petSouls:            make(map[int]*models.PetSoulTemplate),
		petTalents:          make(map[int]*models.PetTalentTemplate),
		petContracts:        make(map[int]*models.PetContractTemplate),
		petGuards:           make(map[int]*models.PetGuardTemplate),
		petStones:           make(map[int]*models.PetStoneTemplate),
		creatureHbook:       make(map[int]*models.CreatureHandbookTemplate),
		mounts:              make(map[int]*models.MountTemplate),
		mountDress:          make(map[int]*models.MountDressTemplate),
		mapCells:            make(map[int]*models.MapCellTemplate),
		answers:             make(map[int]*models.AnswerTemplate),
		feasts:              make(map[int]*models.FeastTemplate),
		buildings:           make(map[int]*models.BuildingTemplate),
		extendPos:           make(map[int]*models.ExtendPositionTemplate),
		nameLibs:            make(map[int]*models.NameLibTemplate),
		mineralTempl:        make(map[int]*models.MineralTemplateTemplate),
		diaries:             make(map[int]*models.DiaryTemplate),
		fairyTempl:          make(map[int]*models.FairyTempalteTemplate),
		starsTempl:          make(map[int]*models.StarsTemplateTemplate),
		warMaps:             make(map[int]*models.WarMapTemplate),
		pmRights:            make(map[int]*models.PmRightTemplate),
		medals:              make(map[int]*models.MedalTemplate),
		mazes:               make(map[int]*models.MazeTemplate),
		artifacts:           make(map[int]*models.ArtifactTemplate),
		artifactsByTidLevel: make(map[int64]*models.ArtifactTemplate),
		artifactsByTid:      make(map[int][]*models.ArtifactTemplate),
		dresses:             make(map[int]*models.DressTemplate),
		recipes:             make(map[int]*models.RecipeTemplate),
		recipePlans:         make(map[int]*models.RecipePlanTemplate),
		credits:             make(map[int]*models.CreditTemplate),
		sublimations:        make(map[int]*models.SublimationTemplate),
		sublimationPet:      make(map[int]*models.SublimationPetTemplate),
		awakenings:          make(map[int]*models.AwakeningTemplate),
		awakeSkills:         make(map[int]*models.AwakeningSkillTemplate),
		recyclings:          make(map[int]*models.RecyclingTemplate),
		souls:               make(map[int]*models.SoulTemplate),
		decoHoles:           make(map[int]*models.DecoHoleTemplate),
		decoRunes:           make(map[int]*models.DecoRuneTemplate),
		decoShows:           make(map[int]*models.DecoShowTemplate),
		mystreRecipes:       make(map[int]*models.MystreRecipeTemplate),
		mystres:             make(map[int]*models.MystreTemplate),
		runeChips:           make(map[int]*models.RuneChipTemplate),
		prsTrees:            make(map[int]*models.PrsTreeTemplate),
		prsShows:            make(map[int]*models.PrsShowTemplate),
		prsChips:            make(map[int]*models.PrsChipTemplate),
		meventMaps:          make(map[int]*models.MeventMapTemplate),
		meventTypes:         make(map[int]*models.MeventTypeTemplate),
		warSprites:          make(map[int]*models.WarSpriteTemplate),
		creatureHeart:       make(map[int]*models.CreaturehHeartTemplate),
		creatureComb:        make(map[int]*models.CreaturehCombineTemplate),
		creatureCont:        make(map[int]*models.CreaturehContainTemplate),
		creaturePoint:       make(map[int]*models.CreaturehPointTemplate),
		explorerMedals:      make(map[int]*models.ExplorerMedalTemplate),
		carves:              make(map[int]*models.CarveTemplate),
		carveAwards:         make(map[int]*models.CarveAwardTemplate),
		carveMasters:        make(map[int]*models.CarveMasterTemplate),
		mytcSuits:           make(map[int]*models.MytcSuitTemplate),
		mytcDetails:         make(map[int]*models.MytcDetailTemplate),
		heiyaoshiPoints:     make(map[int]*models.HeiyaoshiPointTemplate),
		heiyaoshiPointLinks: make(map[int]*models.HeiyaoshiPointLinkTemplate),
		heiyaoshiAreas:      make(map[int]*models.HeiyaoshiAreaTemplate),
		heiyaoshiAreaAttrs:  make(map[int]*models.HeiyaoshiAreaAttributeTemplate),
		heiyaoshiFullBuffs:  make(map[int]*models.HeiyaoshiFullBuffTemplate),
	}
}

// LoadTable loads data for a specific table from raw JSON
func (c *Cache) LoadTable(tableName string, records []json.RawMessage) error {
	c.mu.Lock()
	defer c.mu.Unlock()

	for _, data := range records {
		if err := c.loadRecord(tableName, data); err != nil {
			return err
		}
	}
	return nil
}

// loadRecord unmarshals and stores a single record
func (c *Cache) loadRecord(tableName string, data json.RawMessage) error {
	switch tableName {
	case models.TableClass:
		var t models.ClassTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.classes[t.GetID()] = &t
	case models.TableCreature:
		var t models.CreatureTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatures[t.GetID()] = &t
	case models.TableCreatureLoot:
		var t models.CreatureLootTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatureLoot[t.GetID()] = &t
		c.creatureLootByCid[int(t.Cid)] = append(c.creatureLootByCid[int(t.Cid)], &t)
	case models.TableCreatureSkill:
		var t models.CreatureSkillTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatureSkills[t.GetID()] = &t
	case models.TableEquiptTemplate:
		camelData, err := snakeToCamelJSON(data)
		if err != nil {
			return err
		}
		var t models.EquiptTemplateTemplate
		if err := json.Unmarshal(camelData, &t); err != nil {
			return err
		}
		c.equipment[t.GetID()] = &t
	case models.TableItemTemplate:
		camelData, err := snakeToCamelJSON(data)
		if err != nil {
			return err
		}
		var t models.ItemTemplateTemplate
		if err := json.Unmarshal(camelData, &t); err != nil {
			return err
		}
		c.items[t.GetID()] = &t
	case models.TableMap:
		var t models.MapTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.maps[t.GetID()] = &t
	case models.TableMapCreature:
		var t models.MapCreatureTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mapCreatures[t.GetID()] = &t
	case models.TableNpc:
		var t models.NpcTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.npcs[t.GetID()] = &t
	case models.TableNpcCreature:
		var t models.NpcCreatureTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.npcCreatures[t.GetID()] = &t
		c.npcCreaturesByNid[int(t.Nid)] = append(c.npcCreaturesByNid[int(t.Nid)], &t)
	case models.TableNpcSkill:
		var t models.NpcSkillTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.npcSkills[t.GetID()] = &t
	case models.TableSkill:
		var t models.SkillTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.skills[t.GetID()] = &t
		useEnv := int(t.UseEnv)
		c.skillsByUseEnv[useEnv] = append(c.skillsByUseEnv[useEnv], t.GetID())
	case models.TableQuest:
		var t models.QuestTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.quests[t.GetID()] = &t
	case models.TableQuestAward:
		var t models.QuestAwardTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.questAwards[t.GetID()] = &t
	case models.TableItemAward:
		var t models.ItemAwardTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.itemAwards[t.GetID()] = &t
	case models.TableQuestRequire:
		var t models.QuestRequireTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.questRequires[t.GetID()] = &t
	case models.TableQuestLoop:
		var t models.QuestLoopTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.questLoops[t.GetID()] = &t
	case models.TableQuestPre:
		var t models.QuestPreTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.questPres[t.GetID()] = &t
	case models.TableSceneitemInstance:
		var t models.SceneitemInstanceTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.sceneItemInstance[t.GetID()] = &t
	case models.TableSceneitemTemplate:
		var t models.SceneitemTemplateTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.sceneItemTemplate[t.GetID()] = &t
	case models.TableShop:
		var t models.ShopTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.shops[t.GetID()] = &t
	case models.TableShopSlot:
		var t models.ShopSlotTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.shopSlots[t.GetID()] = &t
	case models.TableSkillKind:
		var t models.SkillKindTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.skillKinds[t.GetID()] = &t
	case models.TableSkillPool:
		var t models.SkillPoolTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.skillPools[t.GetID()] = &t
	case models.TableSkillType:
		var t models.SkillTypeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.skillTypes[t.GetID()] = &t
	case models.TableBuff:
		var t models.BuffTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.buffs[t.GetID()] = &t
	case models.TableEquiptSuit:
		var t models.EquiptSuitTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.equipSuits[t.GetID()] = &t
	case models.TablePlan:
		var t models.PlanTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.plans[t.GetID()] = &t
	case models.TableTitle:
		var t models.TitleTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.titles[t.GetID()] = &t
	case models.TableAchievement:
		var t models.AchievementTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.achievements[t.GetID()] = &t
	case models.TableAchievementRequire:
		var t models.AchievementRequireTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.achieveReqs[t.GetID()] = &t
	case models.TableGuide:
		var t models.GuideTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.guides[t.GetID()] = &t
	case models.TablePetSoul:
		var t models.PetSoulTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.petSouls[t.GetID()] = &t
	case models.TablePetTalent:
		var t models.PetTalentTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.petTalents[t.GetID()] = &t
	case models.TablePetContract:
		var t models.PetContractTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.petContracts[t.GetID()] = &t
	case models.TablePetGuard:
		var t models.PetGuardTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.petGuards[t.GetID()] = &t
	case models.TablePetStone:
		var t models.PetStoneTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.petStones[t.GetID()] = &t
	case models.TableCreatureHandbook:
		var t models.CreatureHandbookTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatureHbook[t.GetID()] = &t
	case models.TableMount:
		var t models.MountTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mounts[t.GetID()] = &t
	case models.TableMountDress:
		var t models.MountDressTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mountDress[t.GetID()] = &t
	case models.TableMapCell:
		var t models.MapCellTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mapCells[t.GetID()] = &t
	case models.TableAnswer:
		var t models.AnswerTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.answers[t.GetID()] = &t
	case models.TableFeast:
		var t models.FeastTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.feasts[t.GetID()] = &t
	case models.TableBuilding:
		var t models.BuildingTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.buildings[t.GetID()] = &t
	case models.TableExtendPosition:
		var t models.ExtendPositionTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.extendPos[t.GetID()] = &t
	case models.TableNameLib:
		var t models.NameLibTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.nameLibs[t.GetID()] = &t
	case models.TableMineralTemplate:
		var t models.MineralTemplateTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mineralTempl[t.GetID()] = &t
	case models.TableDiary:
		var t models.DiaryTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.diaries[t.GetID()] = &t
	case models.TableFairyTempalte:
		var t models.FairyTempalteTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.fairyTempl[t.GetID()] = &t
	case models.TableStarsTemplate:
		var t models.StarsTemplateTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.starsTempl[t.GetID()] = &t
	case models.TableWarMap:
		var t models.WarMapTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.warMaps[t.GetID()] = &t
	case models.TablePmRight:
		var t models.PmRightTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.pmRights[t.GetID()] = &t
	case models.TableMedal:
		var t models.MedalTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.medals[t.GetID()] = &t
	case models.TableMaze:
		var t models.MazeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mazes[t.GetID()] = &t
	case models.TableArtifact:
		var t models.ArtifactTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.artifacts[t.GetID()] = &t
		tid := int(t.Tid)
		level := int(t.Level)
		c.artifactsByTidLevel[(int64(tid)<<32)|int64(level)] = &t
		c.artifactsByTid[tid] = append(c.artifactsByTid[tid], &t)
	case models.TableDress:
		var t models.DressTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.dresses[t.GetID()] = &t
	case models.TableRecipe:
		var t models.RecipeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.recipes[t.GetID()] = &t
	case models.TableRecipePlan:
		var t models.RecipePlanTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.recipePlans[t.GetID()] = &t
	case models.TableCredit:
		var t models.CreditTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.credits[t.GetID()] = &t
	case models.TableSublimation:
		var t models.SublimationTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.sublimations[t.GetID()] = &t
	case models.TableSublimationPet:
		var t models.SublimationPetTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.sublimationPet[t.GetID()] = &t
	case models.TableAwakening:
		var t models.AwakeningTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.awakenings[t.GetID()] = &t
	case models.TableAwakeningSkill:
		var t models.AwakeningSkillTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.awakeSkills[t.GetID()] = &t
	case models.TableRecycling:
		var t models.RecyclingTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.recyclings[t.GetID()] = &t
	case models.TableSoul:
		var t models.SoulTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.souls[t.GetID()] = &t
	case models.TableDecoHole:
		var t models.DecoHoleTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.decoHoles[t.GetID()] = &t
	case models.TableDecoRune:
		var t models.DecoRuneTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.decoRunes[t.GetID()] = &t
	case models.TableDecoShow:
		var t models.DecoShowTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.decoShows[t.GetID()] = &t
	case models.TableMystreRecipe:
		var t models.MystreRecipeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mystreRecipes[t.GetID()] = &t
	case models.TableMystre:
		var t models.MystreTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mystres[t.GetID()] = &t
	case models.TableRuneChip:
		var t models.RuneChipTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.runeChips[t.GetID()] = &t
	case models.TablePrsTree:
		var t models.PrsTreeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.prsTrees[t.GetID()] = &t
	case models.TablePrsShow:
		var t models.PrsShowTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.prsShows[t.GetID()] = &t
	case models.TablePrsChip:
		var t models.PrsChipTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.prsChips[t.GetID()] = &t
	case models.TableMeventMap:
		var t models.MeventMapTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.meventMaps[t.GetID()] = &t
	case models.TableMeventType:
		var t models.MeventTypeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.meventTypes[t.GetID()] = &t
	case models.TableWarSprite:
		var t models.WarSpriteTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.warSprites[t.GetID()] = &t
	case models.TableCreaturehHeart:
		var t models.CreaturehHeartTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatureHeart[t.GetID()] = &t
	case models.TableCreaturehCombine:
		var t models.CreaturehCombineTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatureComb[t.GetID()] = &t
	case models.TableCreaturehContain:
		var t models.CreaturehContainTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creatureCont[t.GetID()] = &t
	case models.TableCreaturehPoint:
		var t models.CreaturehPointTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.creaturePoint[t.GetID()] = &t
	case models.TableExplorerMedal:
		var t models.ExplorerMedalTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.explorerMedals[t.GetID()] = &t
	case models.TableCarve:
		var t models.CarveTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.carves[t.GetID()] = &t
	case models.TableCarveAward:
		var t models.CarveAwardTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.carveAwards[t.GetID()] = &t
	case models.TableCarveMaster:
		var t models.CarveMasterTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.carveMasters[t.GetID()] = &t
	case models.TableMytcSuit:
		var t models.MytcSuitTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mytcSuits[t.GetID()] = &t
	case models.TableMytcDetail:
		var t models.MytcDetailTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.mytcDetails[t.GetID()] = &t
	case models.TableHeiyaoshiPoint:
		var t models.HeiyaoshiPointTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.heiyaoshiPoints[t.GetID()] = &t
	case models.TableHeiyaoshiPointLink:
		var t models.HeiyaoshiPointLinkTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.heiyaoshiPointLinks[t.GetID()] = &t
	case models.TableHeiyaoshiArea:
		var t models.HeiyaoshiAreaTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.heiyaoshiAreas[t.GetID()] = &t
	case models.TableHeiyaoshiAreaAttr:
		var t models.HeiyaoshiAreaAttributeTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.heiyaoshiAreaAttrs[t.GetID()] = &t
	case models.TableHeiyaoshiFullBuff:
		var t models.HeiyaoshiFullBuffTemplate
		if err := json.Unmarshal(data, &t); err != nil {
			return err
		}
		c.heiyaoshiFullBuffs[t.GetID()] = &t
	}
	return nil
}

// Getter methods for each table

func (c *Cache) GetClass(id int) *models.ClassTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.classes[id]
}

func (c *Cache) GetAllClasses() []*models.ClassTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.ClassTemplate, 0, len(c.classes))
	for _, v := range c.classes {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetCreature(id int) *models.CreatureTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.creatures[id]
}

func (c *Cache) GetAllCreatures() []*models.CreatureTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.CreatureTemplate, 0, len(c.creatures))
	for _, v := range c.creatures {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetCreatureLootByCreatureID(creatureID int) []*models.CreatureLootTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	loot := c.creatureLootByCid[creatureID]
	result := make([]*models.CreatureLootTemplate, len(loot))
	copy(result, loot)
	return result
}

func (c *Cache) GetNpcCreaturesByNid(nid int) []*models.NpcCreatureTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	rows := c.npcCreaturesByNid[nid]
	result := make([]*models.NpcCreatureTemplate, len(rows))
	copy(result, rows)
	sort.Slice(result, func(i, j int) bool { return result[i].ID < result[j].ID })
	return result
}

func (c *Cache) GetAllMapCreatures() []*models.MapCreatureTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.MapCreatureTemplate, 0, len(c.mapCreatures))
	for _, mc := range c.mapCreatures {
		result = append(result, mc)
	}
	return result
}

func (c *Cache) GetMapCreaturesByMapID(mapID int) []*models.MapCreatureTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.MapCreatureTemplate, 0)
	for _, mc := range c.mapCreatures {
		if int(mc.Mid) == mapID {
			result = append(result, mc)
		}
	}
	return result
}

func (c *Cache) GetCreatureHandbookByMapID(mapID int) []*models.CreatureHandbookTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.CreatureHandbookTemplate, 0)
	for _, ch := range c.creatureHbook {
		if int(ch.Mid) == mapID {
			result = append(result, ch)
		}
	}
	return result
}

func (c *Cache) GetAllCreatureHandbooks() []*models.CreatureHandbookTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.CreatureHandbookTemplate, 0, len(c.creatureHbook))
	for _, v := range c.creatureHbook {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetEquipment(id int) *models.EquiptTemplateTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.equipment[id]
}

func (c *Cache) GetDress(id int) *models.DressTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.dresses[id]
}

func (c *Cache) GetAllDresses() []*models.DressTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.DressTemplate, 0, len(c.dresses))
	for _, d := range c.dresses {
		out = append(out, d)
	}
	return out
}

func (c *Cache) GetRecipe(id int) *models.RecipeTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.recipes[id]
}

func (c *Cache) GetAllRecipes() []*models.RecipeTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.RecipeTemplate, 0, len(c.recipes))
	for _, r := range c.recipes {
		out = append(out, r)
	}
	return out
}

func (c *Cache) GetItem(id int) *models.ItemTemplateTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.items[id]
}

func (c *Cache) GetArtifactUpgrade(tid, level int) *models.ArtifactTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.artifactsByTidLevel[(int64(tid)<<32)|int64(level)]
}

func (c *Cache) GetArtifactUpgradesByTid(tid int) []*models.ArtifactTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	src := c.artifactsByTid[tid]
	if len(src) == 0 {
		return nil
	}
	out := make([]*models.ArtifactTemplate, len(src))
	copy(out, src)
	return out
}

func (c *Cache) ArtifactCumulativeSpirit(tid, throughLevel int) int64 {
	c.mu.RLock()
	defer c.mu.RUnlock()
	total := int64(0)
	for level := 1; level <= throughLevel; level++ {
		row, ok := c.artifactsByTidLevel[(int64(tid)<<32)|int64(level)]
		if !ok {
			continue
		}
		total += int64(row.SpiritNum)
	}
	return total
}

func (c *Cache) GetMineralTemplate(id int) *models.MineralTemplateTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.mineralTempl[id]
}

func (c *Cache) GetBuilding(id int) *models.BuildingTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.buildings[id]
}

func (c *Cache) GetDiary(id int) *models.DiaryTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.diaries[id]
}

func (c *Cache) GetExtendPositionsByMapID(mapID int) []*models.ExtendPositionTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.ExtendPositionTemplate, 0)
	for _, pos := range c.extendPos {
		if int(pos.Mid) == mapID {
			result = append(result, pos)
		}
	}
	return result
}

func (c *Cache) GetMap(id int) *models.MapTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.maps[id]
}

func (c *Cache) GetAllMaps() []*models.MapTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.MapTemplate, 0, len(c.maps))
	for _, v := range c.maps {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetNPC(id int) *models.NpcTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.npcs[id]
}

// GetNPCsByMapID returns all NPCs that belong to a specific map
func (c *Cache) GetNPCsByMapID(mapID int) []*models.NpcTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.NpcTemplate, 0)
	for _, npc := range c.npcs {
		if int(npc.PosMapID) == mapID {
			result = append(result, npc)
		}
	}
	return result
}

// GetNPCsByName returns all NPCs whose name matches exactly and have fd > 0.
func (c *Cache) GetNPCsByName(name string) []*models.NpcTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.NpcTemplate, 0)
	for _, npc := range c.npcs {
		if npc.Name == name && npc.Fd > 0 {
			result = append(result, npc)
		}
	}
	return result
}

func (c *Cache) GetSkill(id int) *models.SkillTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.skills[id]
}

func (c *Cache) GetAllSkills() []*models.SkillTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.SkillTemplate, 0, len(c.skills))
	for _, skill := range c.skills {
		result = append(result, skill)
	}
	return result
}

func (c *Cache) GetSkillIDsByUseEnv(useEnv int) []int {
	c.mu.RLock()
	defer c.mu.RUnlock()
	src := c.skillsByUseEnv[useEnv]
	if len(src) == 0 {
		return nil
	}
	out := make([]int, len(src))
	copy(out, src)
	return out
}

func (c *Cache) GetCreatureSkills(cid int) []*models.CreatureSkillTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.CreatureSkillTemplate, 0)
	for _, entry := range c.creatureSkills {
		if int(entry.Cid) != cid {
			continue
		}
		result = append(result, entry)
	}
	sort.Slice(result, func(i, j int) bool {
		if result[i].Position == result[j].Position {
			return result[i].ID < result[j].ID
		}
		return result[i].Position < result[j].Position
	})
	return result
}

func (c *Cache) GetQuest(id int) *models.QuestTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.quests[id]
}

func (c *Cache) GetAllQuests() []*models.QuestTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.QuestTemplate, 0, len(c.quests))
	for _, v := range c.quests {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetQuestRequire(questID int) []*models.QuestRequireTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.QuestRequireTemplate, 0)
	for _, req := range c.questRequires {
		if int(req.Qid) == questID {
			result = append(result, req)
		}
	}
	return result
}

func (c *Cache) GetQuestPre(questID int) []*models.QuestPreTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.QuestPreTemplate, 0)
	for _, pre := range c.questPres {
		if int(pre.Qid) == questID {
			result = append(result, pre)
		}
	}
	return result
}

func (c *Cache) GetQuestAwards(questID int) []*models.QuestAwardTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.QuestAwardTemplate, 0)
	for _, award := range c.questAwards {
		if int(award.Qid) == questID {
			result = append(result, award)
		}
	}
	return result
}

func (c *Cache) GetItemAwardsByItemID(itemID int) []*models.ItemAwardTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.ItemAwardTemplate, 0)
	for _, award := range c.itemAwards {
		if int(award.ItemID) == itemID {
			result = append(result, award)
		}
	}
	return result
}

func (c *Cache) GetBuff(id int) *models.BuffTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.buffs[id]
}

func (c *Cache) GetShop(id int) *models.ShopTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.shops[id]
}

func (c *Cache) GetShopSlot(id int) *models.ShopSlotTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.shopSlots[id]
}

func (c *Cache) GetPmRight(id int) *models.PmRightTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.pmRights[id]
}

func (c *Cache) GetAllPmRights() []*models.PmRightTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()

	result := make([]*models.PmRightTemplate, 0, len(c.pmRights))
	for _, right := range c.pmRights {
		result = append(result, right)
	}

	sort.Slice(result, func(i, j int) bool {
		if result[i].SortIndex == result[j].SortIndex {
			return result[i].ID < result[j].ID
		}
		return result[i].SortIndex < result[j].SortIndex
	})

	return result
}

func (c *Cache) GetShopSlotsBySid(sid int) []*models.ShopSlotTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()

	result := make([]*models.ShopSlotTemplate, 0)
	for _, slot := range c.shopSlots {
		if int(slot.Sid) != sid {
			continue
		}
		result = append(result, slot)
	}

	sort.Slice(result, func(i, j int) bool {
		if result[i].Position == result[j].Position {
			return result[i].ID < result[j].ID
		}
		return result[i].Position < result[j].Position
	})

	return result
}

func (c *Cache) GetMount(id int) *models.MountTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.mounts[id]
}

func (c *Cache) FindMountByTypeAndLevel(mountType int, level int) *models.MountTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	for _, mount := range c.mounts {
		if int(mount.Type) == mountType && int(mount.Level) == level {
			return mount
		}
	}
	return nil
}

func (c *Cache) GetMountDress(id int) *models.MountDressTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.mountDress[id]
}

func (c *Cache) GetPetTalent(id int) *models.PetTalentTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.petTalents[id]
}

func (c *Cache) GetAllPetTalents() []*models.PetTalentTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.PetTalentTemplate, 0, len(c.petTalents))
	for _, t := range c.petTalents {
		out = append(out, t)
	}
	return out
}

func (c *Cache) FindPetTalentBySidLv(sid, lv int) *models.PetTalentTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	for _, t := range c.petTalents {
		if t != nil && int(t.Sid) == sid && int(t.Lv) == lv {
			return t
		}
	}
	return nil
}

func (c *Cache) GetPetSoul(id int) *models.PetSoulTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.petSouls[id]
}

func (c *Cache) GetAchievement(id int) *models.AchievementTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.achievements[id]
}

func (c *Cache) GetAllAchievements() []*models.AchievementTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.AchievementTemplate, 0, len(c.achievements))
	for _, achievement := range c.achievements {
		result = append(result, achievement)
	}
	return result
}

func (c *Cache) GetAchievementRequiresByAchievementID(achievementID int) []*models.AchievementRequireTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.AchievementRequireTemplate, 0)
	for _, requirement := range c.achieveReqs {
		if int(requirement.Aid) == achievementID {
			result = append(result, requirement)
		}
	}
	return result
}

func (c *Cache) GetTitle(id int) *models.TitleTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.titles[id]
}

func (c *Cache) FindPetGuardByLevSid(level, sid int) *models.PetGuardTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	for _, tpl := range c.petGuards {
		if tpl == nil {
			continue
		}
		if int(tpl.Lev) == level && int(tpl.Sid) == sid {
			return tpl
		}
	}
	return nil
}

func (c *Cache) GetAllTitles() []*models.TitleTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.TitleTemplate, 0, len(c.titles))
	for _, title := range c.titles {
		result = append(result, title)
	}
	return result
}

func (c *Cache) FindUniqueTitleByName(name string) *models.TitleTemplate {
	trimmedName := strings.TrimSpace(name)
	if trimmedName == "" {
		return nil
	}

	c.mu.RLock()
	defer c.mu.RUnlock()

	var matched *models.TitleTemplate
	for _, title := range c.titles {
		if title == nil || !strings.EqualFold(strings.TrimSpace(title.N), trimmedName) {
			continue
		}
		if matched != nil {
			return nil
		}
		matched = title
	}

	return matched
}

func (c *Cache) GetPetStone(id int) *models.PetStoneTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.petStones[id]
}

func (c *Cache) GetAllPetStones() []*models.PetStoneTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.PetStoneTemplate, 0, len(c.petStones))
	for _, t := range c.petStones {
		out = append(out, t)
	}
	return out
}

func (c *Cache) GetFairyTempalte(id int) *models.FairyTempalteTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.fairyTempl[id]
}

func (c *Cache) GetAllFairyTempaltes() []*models.FairyTempalteTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	out := make([]*models.FairyTempalteTemplate, 0, len(c.fairyTempl))
	for _, t := range c.fairyTempl {
		out = append(out, t)
	}
	return out
}

func (c *Cache) GetStarsTemplate(id int) *models.StarsTemplateTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.starsTempl[id]
}

func (c *Cache) FindStarsTemplateByTypeAndLevel(starType int, level int) *models.StarsTemplateTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	for _, template := range c.starsTempl {
		if int(template.Type) == starType && int(template.Level) == level {
			return template
		}
	}
	return nil
}

func (c *Cache) GetAwakening(id int) *models.AwakeningTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.awakenings[id]
}

func (c *Cache) GetAwakeningSkill(id int) *models.AwakeningSkillTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.awakeSkills[id]
}

func (c *Cache) GetSoul(id int) *models.SoulTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.souls[id]
}

func (c *Cache) GetMedal(id int) *models.MedalTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.medals[id]
}

func (c *Cache) GetExplorerMedal(id int) *models.ExplorerMedalTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.explorerMedals[id]
}

func (c *Cache) GetWarSprite(id int) *models.WarSpriteTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.warSprites[id]
}

func (c *Cache) GetPrsTree(id int) *models.PrsTreeTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.prsTrees[id]
}

func (c *Cache) GetPrsShow(id int) *models.PrsShowTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.prsShows[id]
}

func (c *Cache) GetPrsChip(id int) *models.PrsChipTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.prsChips[id]
}

func (c *Cache) GetSceneItemInstance(id int) *models.SceneitemInstanceTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.sceneItemInstance[id]
}

// GetSceneItemInstanceByTid finds a scene item instance by its template ID
func (c *Cache) GetSceneItemInstanceByTid(tid int) *models.SceneitemInstanceTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	for _, instance := range c.sceneItemInstance {
		if int(instance.Tid) == tid {
			return instance
		}
	}
	return nil
}

// Stats returns cache statistics
func (c *Cache) Stats() map[string]int {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return map[string]int{
		"classes":           len(c.classes),
		"creatures":         len(c.creatures),
		"equipment":         len(c.equipment),
		"items":             len(c.items),
		"maps":              len(c.maps),
		"npcs":              len(c.npcs),
		"skills":            len(c.skills),
		"quests":            len(c.quests),
		"buffs":             len(c.buffs),
		"petTalents":        len(c.petTalents),
		"sceneItemInstance": len(c.sceneItemInstance),
		"itemAwards":        len(c.itemAwards),
	}
}

func (c *Cache) GetRecipePlan(id int) *models.RecipePlanTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.recipePlans[id]
}

func (c *Cache) GetAllRecipePlans() []*models.RecipePlanTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	plans := make([]*models.RecipePlanTemplate, 0, len(c.recipePlans))
	for _, plan := range c.recipePlans {
		plans = append(plans, plan)
	}
	return plans
}

func (c *Cache) GetRecipePlansByRecipeID(recipeID int) []*models.RecipePlanTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	plans := make([]*models.RecipePlanTemplate, 0)
	for _, plan := range c.recipePlans {
		if int(plan.RecipeID) == recipeID {
			plans = append(plans, plan)
		}
	}
	return plans
}

func (c *Cache) PlansByType(t int) []*models.PlanTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	plans := make([]*models.PlanTemplate, 0)
	for _, plan := range c.plans {
		if int(plan.T) == t {
			plans = append(plans, plan)
		}
	}
	return plans
}

func (c *Cache) GetCarveAward(id int) *models.CarveAwardTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.carveAwards[id]
}

func (c *Cache) GetDecoHole(id int) *models.DecoHoleTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.decoHoles[id]
}

func (c *Cache) GetDecoRune(id int) *models.DecoRuneTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.decoRunes[id]
}

func (c *Cache) GetDecoShow(id int) *models.DecoShowTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	return c.decoShows[id]
}

func (c *Cache) GetDecoShowsBySuitID(suitID int) []*models.DecoShowTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	var out []*models.DecoShowTemplate
	for _, t := range c.decoShows {
		if int(t.SuitID) == suitID {
			out = append(out, t)
		}
	}
	return out
}

func (c *Cache) GetAllHeiyaoshiPoints() []*models.HeiyaoshiPointTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.HeiyaoshiPointTemplate, 0, len(c.heiyaoshiPoints))
	for _, v := range c.heiyaoshiPoints {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetAllHeiyaoshiPointLinks() []*models.HeiyaoshiPointLinkTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.HeiyaoshiPointLinkTemplate, 0, len(c.heiyaoshiPointLinks))
	for _, v := range c.heiyaoshiPointLinks {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetAllHeiyaoshiAreas() []*models.HeiyaoshiAreaTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.HeiyaoshiAreaTemplate, 0, len(c.heiyaoshiAreas))
	for _, v := range c.heiyaoshiAreas {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetAllHeiyaoshiAreaAttrs() []*models.HeiyaoshiAreaAttributeTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.HeiyaoshiAreaAttributeTemplate, 0, len(c.heiyaoshiAreaAttrs))
	for _, v := range c.heiyaoshiAreaAttrs {
		result = append(result, v)
	}
	return result
}

func (c *Cache) GetAllHeiyaoshiFullBuffs() []*models.HeiyaoshiFullBuffTemplate {
	c.mu.RLock()
	defer c.mu.RUnlock()
	result := make([]*models.HeiyaoshiFullBuffTemplate, 0, len(c.heiyaoshiFullBuffs))
	for _, v := range c.heiyaoshiFullBuffs {
		result = append(result, v)
	}
	return result
}
