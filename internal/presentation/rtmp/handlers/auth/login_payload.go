// Open-sourced by BaoLT

// Payload builders for the onChooseCharactor callback and related cData/cProp helpers.
// Contains buildOnChooseCharactorPayload, cData construction, and achievement snapshot.
// Pure helper functions (calculateOfflineSeconds, normalizeDressInfo, etc.) live in login_helpers.go.
package auth

import (
	"context"
	"fmt"
	"strconv"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	appdress "mcgame-server/internal/application/dress"
	appitem "mcgame-server/internal/application/item"
	apppet "mcgame-server/internal/application/pet"
	appstar "mcgame-server/internal/application/star"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"

	"go.uber.org/zap"
)

func (h *Handler) buildOnChooseCharactorPayload(ctx context.Context, char *character.Character) map[string]interface{} {
	charID := char.ID
	if h.itemService != nil {
		h.itemService.ApplyCharacterElementState(ctx, char)
	}

	itemDTOs := make(map[string]interface{})
	var allItems []*domainitem.Item
	if h.itemService != nil {
		items, err := h.itemService.GetAllItems(ctx, charID)
		if err != nil {
			h.logger.Warn("Failed to get items", zap.Error(err))
		} else {
			allItems = items
			for _, item := range items {
				itemDTOs[fmt.Sprintf("%d", item.ID)] = item.ToDTO()
			}
		}
	}

	activeQuestCount := 0
	questLogStr := "|"
	if h.questService != nil {
		quests, err := h.questService.GetActiveQuests(ctx, charID)
		if err != nil {
			h.logger.Warn("Failed to get quests", zap.Error(err))
		} else {
			activeQuestCount = len(quests)
		}
		if logStr, logErr := h.questService.BuildQuestLogString(ctx, charID); logErr != nil {
			h.logger.Warn("Failed to build questLog string",
				zap.Int64("character_id", charID),
				zap.Error(logErr))
		} else {
			questLogStr = logStr
		}
	}

	skillDTOs := []map[string]interface{}{}
	if h.skillService != nil {
		loadedSkillDTOs, err := h.skillService.GetSkillsForCallback(ctx, charID)
		if err != nil {
			h.logger.Warn("Failed to get skills", zap.Error(err))
		} else {
			skillDTOs = loadedSkillDTOs
		}
	}

	var showPetID int64
	var showPetObj map[string]interface{}
	petListDTOs := make(map[string]interface{})
	if h.petService != nil {
		followingPet, err := h.petService.GetFollowingPet(ctx, charID)
		if err == nil && followingPet != nil {
			showPetID = followingPet.ID
			showPetObj = followingPet.ToSceneDTO()
		} else if err != nil {
			h.logger.Warn("Failed to load following pet for login",
				zap.Int64("character_id", charID),
				zap.Error(err))
		}

		allPets, err := h.petService.GetPetList(ctx, charID)
		if err == nil {
			for _, p := range allPets {
				petDTO := p.ToDTO()
				if data, ok := petDTO["data"].(map[string]interface{}); ok {
					petListDTOs[strconv.FormatInt(p.ID, 10)] = data
				}
			}
		}
	}

	var resCode int64
	var imgCode int64
	var iconCode int64
	var colorCode int64
	if h.charService != nil {
		resCodeStr, imgCodeStr, iconCodeStr, colorCodeStr := h.charService.GetAppearanceCodesByClassAndGender(char.ClassID, char.Gender)
		resCode, _ = strconv.ParseInt(resCodeStr, 10, 64)
		imgCode, _ = strconv.ParseInt(imgCodeStr, 10, 64)
		iconCode, _ = strconv.ParseInt(iconCodeStr, 10, 64)
		colorCode, _ = strconv.ParseInt(colorCodeStr, 10, 64)
	}
	if transformedResCode, ok := char.ActivePMTransformResCode(time.Now()); ok {
		resCode = transformedResCode
	}

	cProp := map[string]interface{}{}
	if h.charService != nil {
		if h.itemService != nil {
			h.itemService.ApplyCharacterMakerSetState(ctx, char)
		}
		var equipBonuses character.EquipmentStatBonuses
		if h.itemService != nil {
			equipBonuses = h.itemService.AggregateEquipmentStats(ctx, charID)
		}
		cProp = h.charService.BuildViewPropertiesWithEquipment(char, equipBonuses)
	} else {
		cProp = char.ToDTO()
	}

	appearance := appitem.CharacterAppearance{}
	persistedInterfaceSettings := map[string]interface{}{}
	if ctx != nil && h.settingsRepo != nil {
		persistedInterfaceSettings = h.loadPersistedInterfaceSettings(ctx, charID)
	}
	if h.itemService != nil {
		appearance = h.itemService.BuildCharacterAppearance(ctx, charID, char.Gender)
		effectiveInterfaceSettings := mergeInterfaceSettings(characterInterfaceSettings(char), persistedInterfaceSettings)
		appearance = h.itemService.ApplyDressStateToAppearance(appearance, char.Gender, char.DressInfo, appitem.DressHiddenFromSettings(effectiveInterfaceSettings))
	}
	if _, ok := char.ActivePMTransformResCode(time.Now()); ok {
		appearance.DressResCode = 0
	}

	hpMax := propInt(cProp["finalHp"], char.MaxHP)
	mpMax := propInt(cProp["finalMp"], char.MaxMP)
	spMax := propInt(cProp["finalSp"], char.MaxSP)
	pmLevel := char.CurrentPMLevel(time.Now())

	mCrystalInfo := h.buildMCrystalInfoJSON(ctx, charID)

	var starsState appstar.StarsState
	starFlagJSON := `{"stars":{},"warMap":{}}`
	if h.starService != nil {
		if state, err := h.starService.Load(ctx, charID); err == nil {
			starsState = state
			var warMapGrid map[string]interface{}
			if h.starInstanceService != nil {
				if grid, werr := h.starInstanceService.WarMapLoginGrid(ctx, charID); werr == nil {
					warMapGrid = grid
				} else {
					h.logger.Warn("buildChooseCharacterPayload: failed to load warMap grid",
						zap.Int64("character_id", charID), zap.Error(werr))
				}
			}
			starFlagJSON = appstar.StarFlagLoginJSON(state, warMapGrid)
		} else {
			h.logger.Warn("buildChooseCharacterPayload: failed to load stars state",
				zap.Int64("character_id", charID), zap.Error(err))
		}
	}

	loginBlobs := h.buildLoginBlobs(ctx, charID, allItems)
	guardInfoJSON := buildGuardInfoJSON(char)
	tempBagJSON := buildTempBagJSON(char)
	guideLogJSON := buildGuideLogJSON(char)

	activeTitleID, activeSpecialTitleID, ctStr, ctsStr := h.resolveActiveTitleStrings(ctx, charID)

	cData := map[string]interface{}{
		"id":                  char.ID,
		"name":                char.Name,
		"classId":             char.ClassID,
		"gender":              char.Gender,
		"level":               char.Level,
		"exp":                 char.CumulativeExpCapped(),
		"expSkill":            char.Experience,
		"posMapId":            char.MapID,
		"posX":                char.PosX,
		"posY":                char.PosY,
		"posCenterX":          char.PosX,
		"posCenterY":          char.PosY,
		"dir":                 char.Direction,
		"posDir":              strconv.Itoa(char.Direction),
		"money":               char.Money,
		"moneyBind":           char.MoneyBind,
		"gold":                char.Gold,
		"goldBind":            char.GoldBind,
		"gmLevel":             char.GMLevel,
		"currentHp":           char.CurrentHP,
		"currentMp":           char.CurrentMP,
		"currentSp":           char.CurrentSP,
		"hpMax":               hpMax,
		"mpMax":               mpMax,
		"spMax":               spMax,
		"pmLevel":             pmLevel,
		"ep":                  "|0|0|0|0",
		"vipT":                -1,
		"attStrength":         strconv.Itoa(char.Strength),
		"attAgility":          strconv.Itoa(char.Agility),
		"attStamina":          strconv.Itoa(char.Stamina),
		"attIntelligence":     strconv.Itoa(char.Intelligence),
		"attEnergy":           strconv.Itoa(char.Spirit),
		"attLastPoint":        strconv.Itoa(char.AttrPoints),
		"cl":                  strconv.Itoa(char.ClassRank),
		"expRe":               strconv.FormatInt(char.RebirthExp, 10),
		"expBattle":           "0",
		"exPoint":             strconv.Itoa(char.ExPoint),
		"chival":              strconv.FormatInt(char.Chivalry, 10),
		"SpeT":                0,
		"showPetId":           showPetID,
		"petguardout":         char.PetGuardOut,
		"petguardin":          char.PetGuardIn,
		"heiyaoshiPoint":      char.HeiyaoshiPoint,
		"heiyaoshiPoint2":     char.HeiyaoshiPoint2,
		"mcbeans":             char.MCBeans,
		"magiccystalrec":      char.MagicCrystalRec,
		"magiccystalpre":      char.MagicCrystalPre,
		"magiccystallimit":    char.MagicCrystalLimit,
		"wisdonCrystal":       char.WisdomCrystal,
		"couragePoint":        char.CouragePoint,
		"mysteryCrystal":      char.MysteryCrystal,
		"decoSilver":          char.DecoSilver,
		"runeExp":             char.RuneExp,
		"heroScore2507":       char.HeroScore2507,
		"yijieElement":        char.YijieElement,
		"xmCandy":             char.XmCandy24,
		"xcdsp":               char.Xcds2403p,
		"realSoulStone":       char.RealSoulStone,
		"realSoulCrystal":     char.RealSoulCrystal,
		"realSoulWater":       char.RealSoulWater,
		"warSprite":           char.WarSprite,
		"battleSprite":        char.BattleSprite,
		"monsterHeart":        char.MonsterHeart,
		"mhjingshi":           char.MhJingshi,
		"energyStone":         char.EnergyStone,
		"npPnt":               char.NpPoint,
		"elementPnt":          char.ElementPoint,
		"pvePoint":            char.PvePoint,
		"stoneSealPoint":      char.StoneSealPoint,
		"soulPnt":             char.SoulPoints,
		"threePvpPnt":         char.ThreePvpPoint,
		"dogM":                char.DogMedal,
		"paPnt":               char.PetArenaPoint,
		"petPK":               0,
		"btPnt":               char.ArenaPoints,
		"cbM":                 char.AchillesMedal,
		"starPnt":             char.StarPnt,
		"summerGameScore2015": 0,
		"newGrade":            "1",
		"lotooBagLength":      0,
		"lotteryBagLength":    0,
		"actpoint":            0,
		"maxActPoint":         100,
		"movePnt":             0,
		"maxMovePnt":          100,
		"maxVigor":            char.MaxVigor,
		"inBattleServer":      false,
		"ee":                  char.Ee,
		"ef":                  char.Ef,
		"en":                  char.En,
		"resCode":             resCode,
		"imgCode":             imgCode,
		"iconCode":            iconCode,
		"portraitCode":        iconCode,
		"colorCode":           colorCode,
		"bagSlots":            char.MaxBagSlots(),
		"bankSlots":           char.MaxBankSlots(),
		"bagSlotNum":          char.BagSlotNum,
		"bankSlotNum":         char.BankSlotNum,
		"petMaxNum":           char.PetMaxNum,
		"shishangdian":        char.ShopGold,
		"dressInfo":           normalizeDressInfo(char.DressInfo),
		"petList":             petListDTOs,
		"star":                appearance.Star,
	}
	applyM4CDataBlobs(cData, mCrystalInfo, starFlagJSON, guardInfoJSON, tempBagJSON, guideLogJSON, loginBlobs)
	applyM6CDataScalars(cData, char, appearance.FlyerEquipped, activeTitleID, activeSpecialTitleID, ctStr, ctsStr)
	cData["vipInfo"] = appactivity.VipInfoLoginJSON(char, time.Now())
	if h.mountService != nil {
		cData["mountInfo"] = h.mountService.MountInfoForLogin(ctx, charID)
	}
	if h.mysteryService != nil {
		cData["mysTreasure"] = h.mysteryService.BuildLoginBlob(ctx, charID)
	}
	if h.decoHoleService != nil {
		if decoState, err := h.decoHoleService.GetDecoHoleState(ctx, charID); err == nil {
			cData["decoInfo"] = appdress.DecoHoleStateToWire(charID, decoState)
		} else {
			h.logger.Warn("buildOnChooseCharactorPayload: failed to load decoInfo",
				zap.Int64("character_id", charID), zap.Error(err))
		}
	}
	if h.magicEstateService != nil {
		actpoint, maxActpoint := h.magicEstateService.GetActpoint(ctx, char.ID, char.Level)
		movePnt, maxMovePnt := h.magicEstateService.GetMovePnt(ctx, char.ID, char.Level)
		cData["actpoint"] = actpoint
		cData["maxActPoint"] = maxActpoint
		cData["movePnt"] = movePnt
		cData["maxMovePnt"] = maxMovePnt
	}
	if showPetObj != nil {
		cData["showPetObj"] = showPetObj
	}
	cData = appearance.Apply(cData)
	cData["questLog"] = questLogStr
	achievementSnapshot := h.loadAchievementSnapshot(ctx, charID)
	cData["achPnt"] = achievementSnapshot.AchievementPoints
	cData["achPoint"] = strconv.Itoa(achievementSnapshot.AchievementPoints)

	guideFlag := map[string]bool{}
	if mappedGuideFlag, ok := cProp["guideFlag"].(map[string]bool); ok {
		guideFlag = mappedGuideFlag
	}

	interfaceData := h.buildInterfaceData(ctx, char)
	if len(persistedInterfaceSettings) > 0 {
		interfaceData = mergeInterfaceSettings(interfaceData, persistedInterfaceSettings)
	}

	blacklistEntries := []interface{}{}
	if h.socialService != nil {
		if bl, blErr := h.socialService.GetBlacklistForLogin(ctx, charID); blErr != nil {
			h.logger.Warn("buildOnChooseCharactorPayload: failed to load blacklist",
				zap.Int64("character_id", charID),
				zap.Error(blErr))
		} else if bl != nil {
			blacklistEntries = bl
		}
	}

	bossKey := map[string]interface{}{
		"url":   "",
		"title": "",
	}

	equipActiveList := map[string]interface{}{}
	if h.itemService != nil {
		equipActiveList = h.itemService.BuildEquipActiveList(ctx, charID)
	}

	guildPayload := interface{}(nil)
	guildMemberPayload := interface{}(nil)
	guildWarehousePayload := interface{}(nil)
	if h.guildService != nil {
		guildItem, selfMember, guildErr := h.guildService.GetGuildByMemberForClient(ctx, charID)
		if guildErr != nil {
			h.logger.Warn("buildChooseCharacterPayload: failed to load guild state", zap.Int64("character_id", charID), zap.Error(guildErr))
		} else if guildItem != nil {
			guildDTO := guildItem.ToDTO()
			for _, member := range guildItem.Members {
				if member == nil {
					continue
				}
				if member.Rank == 1 {
					guildDTO["ln"] = member.CharacterName
					break
				}
			}
			guildPayload = guildDTO
			if selfMember != nil {
				guildMemberPayload = selfMember.ToDTO()
			}
			guildWarehousePayload = guildItem.Warehouse
		}
	}

	starsPayload := map[string]interface{}{}
	if starsState != nil {
		starsPayload = appstar.StateToWire(starsState)
	}

	payload := map[string]interface{}{
		"cData":                 cData,
		"cProp":                 cProp,
		"serverTime":            time.Now().UnixMilli(),
		"s":                     skillDTOs,
		"i":                     itemDTOs,
		"equipActiveList":       equipActiveList,
		"qn":                    activeQuestCount,
		"guild":                 guildPayload,
		"gData":                 guildMemberPayload,
		"gi":                    guildWarehousePayload,
		"achieveLog":            achievementSnapshot.AchieveLog,
		"achieveReqLog":         achievementSnapshot.AchieveReqLog,
		"offlineTime":           calculateOfflineSeconds(char, time.Now()),
		"interfaceData":         interfaceData,
		"bossKey":               bossKey,
		"startedActList":        h.buildStartedActList(ctx, char),
		"showDailyAct":          shouldShowDailyAct(char),
		"guideOpen":             char.GuideOpen,
		"guideFlag":             guideFlag,
		"starsData":             starsPayload,
		"seniorPetJoinEnable":   true,
		"seniorWingJoinEnable":  true,
		"submitQuestionEnable":  false,
		"ifShowJXHDCircleByASI": false,
		"tBag":                  h.buildTBagLogin(char, allItems),
		"black":                 blacklistEntries,
		"timeZone":              defaultServerTimeZone,
		"sph":                   defaultServerSpeedHackThreshold,
		"soulBagData":           map[string]interface{}{"data": map[string]interface{}{}, "open": 0},
		"tempSoulData":          map[string]interface{}{},
		"soulExp":               loginBlobs.SoulExp,
		"soulChip":              loginBlobs.SoulChip,
		"petGuardData":          apppet.NormalizePetGuardPayload(char),
		"crystalSid":            loginBlobs.CrystalSid,
		"takeAchieveAwardLog":   achievementSnapshot.TakeAchieveAwardLog,
		"jewelOffRate":          1,
		"cp":                    nil,
		"vipT":                  -1,
	}

	if h.lottoService != nil {
		lottoLen, lotteryLen := h.lottoService.BagLengths(ctx, charID)
		cData["lotooBagLength"] = lottoLen
		cData["lotteryBagLength"] = lotteryLen
	}

	if h.soulService != nil {
		payload["soulBagData"] = h.soulService.SoulBagDataForLogin(ctx, charID)
		payload["crystalSid"] = h.soulService.CrystalSidForLogin(ctx, charID)
		payload["tempSoulData"] = h.soulService.TempSoulDataForLogin(ctx, charID)
	}

	if h.loginState != nil {
		loginState, err := h.loginState.BuildCharacterLoginState(ctx, charID)
		if err != nil {
			h.logger.Warn("Failed to build stat feature login state",
				zap.Int64("character_id", charID),
				zap.Error(err))
		} else {
			if warSpriteState, ok := loginState["warSprite"].(map[string]interface{}); ok {
				payload["warSpritePanel"] = warSpriteState
				delete(loginState, "warSprite")
			}
			for key, value := range loginState {
				payload[key] = value
				cData[key] = value
			}
		}
	}

	return payload
}

func (h *Handler) buildTBagLogin(char *character.Character, items []*domainitem.Item) map[string]interface{} {
	if h.itemService == nil {
		return buildTBagSkeleton()
	}
	return h.itemService.BuildTBagPayload(char, items)
}
