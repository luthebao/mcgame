// Open-sourced by BaoLT

// Helpers for constructing cData JSON blobs, title-string resolution,
// and applying per-milestone cData scalar fields for the login payload.
package auth

import (
	"context"
	"encoding/json"
	"strconv"

	apppet "mcgame-server/internal/application/pet"
	appstatfeature "mcgame-server/internal/application/statfeature"
	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"

	"go.uber.org/zap"
)

func (h *Handler) buildMCrystalInfoJSON(ctx context.Context, charID int64) string {
	if h.magicCrystalService == nil {
		return buildDefaultMCrystalInfo()
	}
	return h.magicCrystalService.LoadLoginJSON(ctx, charID)
}

func buildDefaultMCrystalInfo() string {
	obj := make(map[string]interface{}, 17)
	for i := 0; i < 16; i++ {
		obj[strconv.Itoa(i)] = map[string]interface{}{
			"a": 0, "lv": 0, "max": 100, "l": 0, "s": 0,
		}
	}
	obj["time"] = "0|0|0"
	b, _ := json.Marshal(obj)
	return string(b)
}

func (h *Handler) buildLoginBlobs(ctx context.Context, charID int64, equippedItems []*domainitem.Item) appstatfeature.LoginBlobs {
	if h.statFeatureService == nil {
		return defaultLoginCDataBlobs()
	}
	blobs, err := h.statFeatureService.GetCharacterLoginBlobs(ctx, charID, equippedItems)
	if err != nil {
		h.logger.Warn("buildLoginBlobs: failed to load statfeature login blobs",
			zap.Int64("character_id", charID),
			zap.Error(err))
		return defaultLoginCDataBlobs()
	}
	return blobs
}

func defaultLoginCDataBlobs() appstatfeature.LoginBlobs {
	return appstatfeature.LoginBlobs{
		MedalInfo:     `{"medalExp":0,"medalBag":{},"petBuff":{},"charBuff":{},"checkFlag":false}`,
		MedalExp:      0,
		SoulBag:       `{"open":0,"soulExp":0,"chip":0,"sid":0,"data":{},"soulData":{},"petinfo":{}}`,
		SoulExp:       0,
		SoulChip:      0,
		CrystalSid:    0,
		PrsInfo:       `{"tid":"0","actArr":{},"actLimitObj":{},"useSid":0,"chipBag":{},"excBag":{},"isShow":0}`,
		PrsUseId:      0,
		StoneSealInfo: `{"stone":{}}`,
		RuneInfo:      `{"chaBag":{},"petBag":{},"upLvlHole":0}`,
		PraBuffInfo:   `{"def":0,"defExp":0,"magicDef":0,"magicDefExp":0,"petDef":0,"petDefExp":0,"petMagicDef":0,"petMagicDefExp":0,"peoAttack":0,"peoAttackExp":0,"petAttack":0,"petAttackExp":0,"peoSpeed":0,"peoSpeedExp":0,"petSpeed":0,"petSpeedExp":0}`,
		PetPVEData:    `{"p":{},"mlv":0,"ppveConfig":{}}`,
		PetTalentInfo: `{"tal":{},"inTal":{},"b":{}}`,
		PetStoneBag:   `[]`,
	}
}

func buildGuardInfoJSON(char *character.Character) string {
	return apppet.GuardInfoLoginJSON(char)
}

func buildTBagSkeleton() map[string]interface{} {
	return map[string]interface{}{
		"curNum":      0,
		"dire":        false,
		"mx":          map[string]interface{}{"curNum": 0, "ot": false, "tempBag": map[string]interface{}{}, "tempList": map[string]interface{}{}},
		"ot":          false,
		"tempBag":     map[string]interface{}{},
		"tempList":    map[string]interface{}{},
		"tempSlotNum": 0,
		"tempbagNum":  0,
		"vipbagNum":   0,
	}
}

func buildTempBagJSON(char *character.Character) string {
	obj := map[string]interface{}{
		"tempbagNum": char.TempBagSlots,
		"tempList":   map[string]interface{}{},
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"tempbagNum":0,"tempList":{}}`
	}
	return string(b)
}

func buildMysTreasureStub() map[string]interface{} {
	return map[string]interface{}{
		"activeObj":      map[string]interface{}{},
		"addTimes":       map[string]interface{}{"n": 0, "t": "0|0"},
		"chipBag":        map[string]interface{}{},
		"makeData":       map[string]interface{}{"learnedRec": map[string]interface{}{}, "skiLvl": 0, "skiPt": 0},
		"makeLimitTimes": map[string]interface{}{"n": 0, "t": "0|0"},
		"mysBag":         map[string]interface{}{},
		"mysBook":        map[string]interface{}{},
	}
}

func buildGuideLogJSON(char *character.Character) string {
	if len(char.GuideLog) == 0 {
		return "{}"
	}
	m := make(map[string]bool, len(char.GuideLog))
	for k, v := range char.GuideLog {
		m[strconv.Itoa(k)] = v
	}
	b, err := json.Marshal(m)
	if err != nil {
		return "{}"
	}
	return string(b)
}

func buildMountInfoJSON() string {
	return `{"getDate":0,"dressData":{},"lv":0,"upLv":0,"exp":0,"addRate":0,"addRateDay":"0|0|0","useDress":-1}`
}

func buildMonsterHeartBagStub() string {
	return `{"ren":{},"shou":{},"zhi":{},"mo":{},"ji":{},"lon":{},"te":{}}`
}

func (h *Handler) resolveActiveTitleStrings(ctx context.Context, charID int64) (int, int, string, string) {
	if h.titleService == nil {
		return 0, 0, "", ""
	}
	activeTitleID := 0
	if tid, err := h.titleService.GetActiveTitle(ctx, charID); err == nil {
		activeTitleID = tid
	}
	activeSpecialTitleID := 0
	if tid, err := h.titleService.GetActiveSpecialTitle(ctx, charID); err == nil {
		activeSpecialTitleID = tid
	}
	ctStr := ""
	ctsStr := ""
	if titleList, err := h.titleService.GetTitleList(ctx, charID); err == nil {
		if v, ok := titleList["ct"].(string); ok {
			ctStr = v
		}
		if v, ok := titleList["cts"].(string); ok {
			ctsStr = v
		}
	}
	return activeTitleID, activeSpecialTitleID, ctStr, ctsStr
}

func applyM6CDataScalars(
	cData map[string]interface{},
	char *character.Character,
	flyerEquipped bool,
	activeTitleID int,
	activeSpecialTitleID int,
	ctStr string,
	ctsStr string,
) {
	cData["isFlying"] = flyerEquipped

	cData["t"] = strconv.Itoa(activeTitleID)
	cData["actT"] = activeSpecialTitleID
	cData["ct"] = ctStr
	cData["cts"] = ctsStr

	cData["fairy"] = nil

	cData["guid"] = "0"

	cData["ll"] = "0|0"

	cData["last"] = strconv.FormatInt(char.LastActive.UnixMilli(), 10)
	cData["crt"] = strconv.FormatInt(char.CreatedAt.UnixMilli(), 10)

	cData["brightCode"] = "0"

	cData["honor"] = strconv.Itoa(char.Honor)
	cData["spirituality"] = char.Spirituality
	cData["worldCupPoint"] = char.WorldCupPoint
	cData["worldCupGoldPoint"] = char.GoldWorldCup
	cData["pop"] = strconv.FormatInt(char.Pop, 10)
	cData["popDay"] = "0"
	cData["popWeek"] = "0"
	cData["popMonth"] = "0"
	cData["reputation"] = strconv.FormatInt(char.Reputation, 10)
	cData["vigor"] = strconv.Itoa(char.Vigor)
	cData["ti"] = "-1"
	cData["tl"] = "0"
	cData["tn"] = ""
	cData["tp"] = "0"
	cData["tkyyhp"] = 0
	cData["txkcp"] = 0
	cData["totalActpoint"] = "0"
	cData["totalBp"] = "0"
	cData["exprb"] = "0"

	cData["delTime"] = "-1"
	cData["award"] = ""
	cData["dmbkp"] = 0
	cData["leagueIcon"] = "undefined"
	cData["dailySignInAct"] = nil
	cData["lotteryBag"] = nil
	cData["luckDrawBag"] = nil
	cData["monthWelfareBag"] = nil
}

func applyM4CDataBlobs(
	cData map[string]interface{},
	mCrystalInfo string,
	starFlagJSON string,
	guardInfoJSON string,
	tempBagJSON string,
	guideLogJSON string,
	blobs appstatfeature.LoginBlobs,
) {
	cData["mCrystalInfo"] = mCrystalInfo
	cData["starFlag"] = starFlagJSON
	cData["guardInfo"] = guardInfoJSON
	cData["petPVEData"] = blobs.PetPVEData
	cData["petTalentInfo"] = blobs.PetTalentInfo
	cData["petStoneBag"] = blobs.PetStoneBag
	cData["medalInfo"] = blobs.MedalInfo
	cData["medalExp"] = blobs.MedalExp
	cData["soulBag"] = blobs.SoulBag
	cData["runeInfo"] = blobs.RuneInfo
	cData["stoneSealInfo"] = blobs.StoneSealInfo
	cData["prsInfo"] = blobs.PrsInfo
	cData["prsUseId"] = blobs.PrsUseId
	cData["praBuffInfo"] = blobs.PraBuffInfo
	cData["mountInfo"] = buildMountInfoJSON()
	cData["tempBag"] = tempBagJSON
	cData["mysTreasure"] = buildMysTreasureStub()
	cData["monsterHeartBag"] = buildMonsterHeartBagStub()
	cData["lottoBag"] = "{}"
	cData["safeCBMids"] = []interface{}{}
	cData["guideLog"] = guideLogJSON
}
