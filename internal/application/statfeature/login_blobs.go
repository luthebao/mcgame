// Open-sourced by BaoLT

package statfeature

import (
	"encoding/json"
	"strconv"

	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
)

func buildMedalInfoJSON(state map[string]interface{}) (string, int) {
	medalExp := 0
	if v, ok := intValue(state["exp"]); ok {
		medalExp = v
	}

	medalBag := map[string]interface{}{}
	if bag, ok := state["bag"]; ok {
		if m, ok := bag.(map[string]interface{}); ok {
			medalBag = m
		}
	}

	petBuff := map[string]interface{}{}
	if pb, ok := state["petBuff"]; ok {
		if m, ok := pb.(map[string]interface{}); ok {
			petBuff = m
		}
	}

	charBuff := map[string]interface{}{}
	if cb, ok := state["charBuff"]; ok {
		if m, ok := cb.(map[string]interface{}); ok {
			charBuff = m
		}
	}

	checkFlag := false
	if cf, ok := state["checkFlag"]; ok {
		if b, ok := cf.(bool); ok {
			checkFlag = b
		}
	}

	obj := map[string]interface{}{
		"medalExp":  medalExp,
		"medalBag":  medalBag,
		"petBuff":   petBuff,
		"charBuff":  charBuff,
		"checkFlag": checkFlag,
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return "{}", medalExp
	}
	return string(b), medalExp
}

func buildSoulBagJSON(progression *domainfeature.CharacterProgression) (string, int64, int64, int64) {
	soulExp := int64(0)
	chip := int64(0)
	open := 0
	sid := int64(0)

	if progression != nil {
		soulExp = progression.SoulExp
		chip = progression.SoulPoints
	}

	obj := map[string]interface{}{
		"open":     open,
		"soulExp":  soulExp,
		"chip":     chip,
		"sid":      sid,
		"data":     map[string]interface{}{},
		"soulData": map[string]interface{}{},
		"petinfo":  map[string]interface{}{},
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return "{}", soulExp, chip, sid
	}
	return string(b), soulExp, chip, sid
}

func buildPRSInfoJSON(state map[string]interface{}) string {
	if len(state) == 0 {
		return `{"tid":"0","actArr":{},"actLimitObj":{},"useSid":0,"chipBag":{},"excBag":{},"isShow":0}`
	}
	tid := "0"
	if v, ok := stringValue(state["tid"]); ok {
		tid = v
	} else if v, ok := intValue(state["tid"]); ok {
		tid = strconv.Itoa(v)
	}

	actArr := cloneMap(stateValueAsMap(state, "actArr"))
	actLimitObj := cloneMap(stateValueAsMap(state, "actLimitObj"))
	useSid := 0
	if v, ok := intValue(state["useSid"]); ok {
		useSid = v
	}
	chipBag := cloneMap(stateValueAsMap(state, "chipBag"))
	excBag := cloneMap(stateValueAsMap(state, "excBag"))
	isShow := 0
	if v, ok := intValue(state["isShow"]); ok {
		isShow = v
	}

	obj := map[string]interface{}{
		"tid":         tid,
		"actArr":      actArr,
		"actLimitObj": actLimitObj,
		"useSid":      useSid,
		"chipBag":     chipBag,
		"excBag":      excBag,
		"isShow":      isShow,
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"tid":"0","actArr":{},"actLimitObj":{},"useSid":0,"chipBag":{},"excBag":{},"isShow":0}`
	}
	return string(b)
}

func buildStoneSealInfoJSON(
	state map[string]interface{},
	equippedByEquipSid map[int]*domainitem.Item,
	accessor StoneSealItemAccessor,
) string {
	if len(state) == 0 {
		return `{"stone":{}}`
	}
	stone := cloneMap(stateValueAsMap(state, "stone"))
	obj := map[string]interface{}{"stone": stone}
	if addBlock := computeStoneSealAddBlock(state, equippedByEquipSid, accessor); addBlock != nil {
		obj["add"] = addBlock
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"stone":{}}`
	}
	return string(b)
}

func buildRuneInfoJSON(state map[string]interface{}) string {
	if len(state) == 0 {
		return `{"chaBag":{},"petBag":{},"upLvlHole":0}`
	}
	chaBag := cloneMap(stateValueAsMap(state, "chaBag"))
	petBag := cloneMap(stateValueAsMap(state, "petBag"))
	upLvlHole := 0
	if v, ok := intValue(state["upLvlHole"]); ok {
		upLvlHole = v
	}
	obj := map[string]interface{}{
		"chaBag":    chaBag,
		"petBag":    petBag,
		"upLvlHole": upLvlHole,
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"chaBag":{},"petBag":{},"upLvlHole":0}`
	}
	return string(b)
}

func buildPraBuffInfoJSON(state map[string]interface{}) string {
	keys := []string{
		"def", "defExp", "magicDef", "magicDefExp",
		"petDef", "petDefExp", "petMagicDef", "petMagicDefExp",
		"peoAttack", "peoAttackExp", "petAttack", "petAttackExp",
		"peoSpeed", "peoSpeedExp", "petSpeed", "petSpeedExp",
	}
	obj := make(map[string]interface{}, len(keys))
	for _, k := range keys {
		value := 0
		if v, ok := intValue(state[k]); ok {
			value = v
		}
		obj[k] = value
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"def":0,"defExp":0,"magicDef":0,"magicDefExp":0,"petDef":0,"petDefExp":0,"petMagicDef":0,"petMagicDefExp":0,"peoAttack":0,"peoAttackExp":0,"petAttack":0,"petAttackExp":0,"peoSpeed":0,"peoSpeedExp":0,"petSpeed":0,"petSpeedExp":0}`
	}
	return string(b)
}

func buildPetPVEDataJSON(state map[string]interface{}) string {
	p := cloneMap(stateValueAsMap(state, "p"))
	ppveConfig := cloneMap(stateValueAsMap(state, "ppveConfig"))
	mlv := 0
	if v, ok := intValue(state["mlv"]); ok {
		mlv = v
	}
	obj := map[string]interface{}{
		"p":          p,
		"mlv":        mlv,
		"ppveConfig": ppveConfig,
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"p":{},"mlv":0,"ppveConfig":{}}`
	}
	return string(b)
}

func buildPetTalentInfoJSON(state map[string]interface{}) string {
	obj := map[string]interface{}{
		"tal":   cloneMap(stateValueAsMap(state, "tal")),
		"inTal": cloneMap(stateValueAsMap(state, "inTal")),
		"b":     cloneMap(stateValueAsMap(state, "b")),
	}
	b, err := json.Marshal(obj)
	if err != nil {
		return `{"tal":{},"inTal":{},"b":{}}`
	}
	return string(b)
}

func buildPetStoneBagJSON(state map[string]interface{}) string {
	bag := stateValueAsMap(state, "b")
	maxSlot := -1
	entries := map[int][]interface{}{}
	for slotKey, raw := range bag {
		slot, err := strconv.Atoi(slotKey)
		if err != nil || slot < 0 {
			continue
		}
		entryMap, ok := raw.(map[string]interface{})
		if !ok {
			continue
		}
		giid, _ := intValue(entryMap["g"])
		stack, _ := intValue(entryMap["n"])
		skill, _ := intValue(entryMap["s"])
		if giid <= 0 || stack <= 0 {
			continue
		}
		entries[slot] = []interface{}{giid, stack, skill}
		if slot > maxSlot {
			maxSlot = slot
		}
	}
	arr := make([]interface{}, maxSlot+1)
	for slot, triple := range entries {
		arr[slot] = triple
	}
	b, err := json.Marshal(arr)
	if err != nil {
		return "[]"
	}
	return string(b)
}

func BuildLoginBlobs(featureStates map[string]map[string]interface{}, progression *domainfeature.CharacterProgression, equippedByEquipSid map[int]*domainitem.Item, stoneSealAccessor StoneSealItemAccessor) LoginBlobs {
	medalInfo := `{"medalExp":0,"medalBag":{},"petBuff":{},"charBuff":{},"checkFlag":false}`
	medalExp := 0
	if state := featureStates[domainfeature.FeatureMedal]; len(state) > 0 {
		medalInfo, medalExp = buildMedalInfoJSON(state)
	}

	soulBag, soulExp, soulChip, crystalSid := buildSoulBagJSON(progression)

	prsInfo := buildPRSInfoJSON(featureStates[domainfeature.FeaturePRS])
	prsUseId := 0
	if state := featureStates[domainfeature.FeaturePRS]; len(state) > 0 {
		if v, ok := intValue(state["useId"]); ok {
			prsUseId = v
		}
	}

	stoneSealInfo := buildStoneSealInfoJSON(featureStates[domainfeature.FeatureStoneSeal], equippedByEquipSid, stoneSealAccessor)
	runeInfo := buildRuneInfoJSON(featureStates[domainfeature.FeatureRune])
	praBuffInfo := buildPraBuffInfoJSON(featureStates[domainfeature.FeaturePraBuff])
	petPVEData := buildPetPVEDataJSON(featureStates[domainfeature.FeaturePetPVE])
	petTalentInfo := buildPetTalentInfoJSON(featureStates[domainfeature.FeaturePetTalent])
	petStoneBag := buildPetStoneBagJSON(featureStates[domainfeature.FeaturePetStone])

	return LoginBlobs{
		MedalInfo:     medalInfo,
		MedalExp:      medalExp,
		SoulBag:       soulBag,
		SoulExp:       soulExp,
		SoulChip:      soulChip,
		CrystalSid:    crystalSid,
		PrsInfo:       prsInfo,
		PrsUseId:      prsUseId,
		StoneSealInfo: stoneSealInfo,
		RuneInfo:      runeInfo,
		PraBuffInfo:   praBuffInfo,
		PetPVEData:    petPVEData,
		PetTalentInfo: petTalentInfo,
		PetStoneBag:   petStoneBag,
	}
}

type LoginBlobs struct {
	MedalInfo     string
	MedalExp      int
	SoulBag       string
	SoulExp       int64
	SoulChip      int64
	CrystalSid    int64
	PrsInfo       string
	PrsUseId      int
	StoneSealInfo string
	RuneInfo      string
	PraBuffInfo   string
	PetPVEData    string
	PetTalentInfo string
	PetStoneBag   string
}
