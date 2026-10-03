// Open-sourced by BaoLT

package statfeature

import (
	"context"
	"encoding/json"
	"testing"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

type testRepository struct {
	progression    *domainfeature.CharacterProgression
	characterState []*domainfeature.CharacterFeatureState
	petState       []*domainfeature.PetFeatureState
	activeMount    *domainfeature.ActiveMount
}

func (r *testRepository) GetCharacterProgression(ctx context.Context, charID int64) (*domainfeature.CharacterProgression, error) {
	return r.progression, nil
}

func (r *testRepository) ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*domainfeature.CharacterFeatureState, error) {
	return r.characterState, nil
}

func (r *testRepository) UpsertCharacterSoulProgression(_ context.Context, _ int64, _ int, _ int64) error {
	return nil
}

func (r *testRepository) UpsertCharacterFeatureState(ctx context.Context, state *domainfeature.CharacterFeatureState) error {
	return nil
}

func (r *testRepository) ListPetFeatureStates(ctx context.Context, petID int64) ([]*domainfeature.PetFeatureState, error) {
	return r.petState, nil
}

func (r *testRepository) UpsertPetFeatureState(ctx context.Context, state *domainfeature.PetFeatureState) error {
	return nil
}

func (r *testRepository) GetActiveMount(ctx context.Context, charID int64) (*domainfeature.ActiveMount, error) {
	return r.activeMount, nil
}

func (r *testRepository) PPVEChallengeNextFloor(_ context.Context, _ int64, _ int, _ int, _ string) (*domainfeature.PPVEChallengeResult, error) {
	return nil, nil
}

func TestAggregateCharacterStatBonusesAppliesMultipleSystems(t *testing.T) {
	repo := &testRepository{
		progression: &domainfeature.CharacterProgression{
			CharacterID:      7,
			AwakenLevel:      2,
			AwakenPoints:     3,
			AwakenPointsUsed: 1,
			SoulLevel:        3,
		},
		characterState: []*domainfeature.CharacterFeatureState{
			{CharacterID: 7, FeatureKey: domainfeature.FeatureMagicArray, State: map[string]interface{}{"starsNow": map[string]interface{}{"0": 2, "1": 1}}},
			{CharacterID: 7, FeatureKey: domainfeature.FeatureExplorerMedal, State: map[string]interface{}{"info": "1|0"}},
			{CharacterID: 7, FeatureKey: domainfeature.FeatureWarSprite, State: map[string]interface{}{"wObj": map[string]interface{}{"1": 1101}, "bObj": map[string]interface{}{"1": 2110}}},
		},
		activeMount: &domainfeature.ActiveMount{CharacterID: 7, MountID: 1, Level: 2, IsActive: true},
	}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(loadTestManager(t, map[string][]map[string]interface{}{
		models.TableAwakening: {
			{"id": 2, "prop1": 4, "prop_num1": 490, "prop2": 5, "prop_num2": 392},
		},
		models.TableSoul: {
			{"id": 3, "prop1": 1, "prop_num1": 716, "prop2": 11, "prop_num2": 72, "prop3": 4, "prop_num3": 179},
		},
		models.TableMount: {
			{"id": 3, "type": 1, "level": 2, "life_basic": 743, "phy_attack_basic": 186, "mag_attack_basic": 149, "phy_defense_basic": 594, "mag_defense_basic": 594},
		},
		models.TableStarsTemplate: {
			{"id": 2, "type": 1, "level": 2, "add_prop": "hp", "add_value": 2000},
			{"id": 13, "type": 2, "level": 1, "add_prop": "attack", "add_value": 250},
		},
		models.TableExplorerMedal: {
			{"id": 1, "prop_type1": 1, "prop_num1": 1200, "prop_type2": 6, "prop_num2": 750, "prop_type3": 7, "prop_num3": 750},
		},
		models.TableWarSprite: {
			{"id": 1101, "p_t1": 1, "p_n1": 150, "p_t2": 4, "p_n2": 38, "p_t3": 5, "p_n3": 38},
			{"id": 2110, "p_t1": 1, "p_n1": 40000, "p_t2": 4, "p_n2": 40000, "p_t3": 5, "p_n3": 40000},
		},
	}))

	bonuses := service.AggregateCharacterStatBonuses(context.Background(), 7)

	if got, want := bonuses.Flat[domainchar.PropMaxHP], 5409; got != want {
		t.Fatalf("hp bonus = %d, want %d (war sprite contributes 150 + 150×40000/10000 = 750)", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropAttack], 1295; got != want {
		t.Fatalf("attack bonus = %d, want %d (war sprite contributes 38 + 38×40000/10000 = 190)", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropMagicAttack], 731; got != want {
		t.Fatalf("magic attack bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropDefense], 1344; got != want {
		t.Fatalf("defense bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropMagicDef], 1344; got != want {
		t.Fatalf("magic defense bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropSpeed], 72; got != want {
		t.Fatalf("speed bonus = %d, want %d", got, want)
	}
}

func TestAggregateCharacterStatBonusesAppliesHeiyaoshiBuff(t *testing.T) {
	repo := &testRepository{
		characterState: []*domainfeature.CharacterFeatureState{
			{
				CharacterID: 7,
				FeatureKey:  domainfeature.FeatureHeiyaoshi,
				State: map[string]interface{}{
					"Buff": map[string]interface{}{
						"1": float64(300),
						"4": float64(150),
						"5": float64(120),
						"6": float64(240),
						"7": float64(240),
					},
				},
			},
		},
	}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(loadTestManager(t, map[string][]map[string]interface{}{}))

	bonuses := service.AggregateCharacterStatBonuses(context.Background(), 7)

	if got, want := bonuses.Flat[domainchar.PropMaxHP], 300; got != want {
		t.Fatalf("PropMaxHP bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropAttack], 150; got != want {
		t.Fatalf("PropAttack bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropMagicAttack], 120; got != want {
		t.Fatalf("PropMagicAttack bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropDefense], 240; got != want {
		t.Fatalf("PropDefense bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropMagicDef], 240; got != want {
		t.Fatalf("PropMagicDef bonus = %d, want %d", got, want)
	}

	char := &domainchar.Character{
		ID:           7,
		ClassID:      2,
		Strength:     8,
		Agility:      10,
		Stamina:      8,
		Intelligence: 12,
		Spirit:       12,
	}
	char.RecalculateStats()
	baseMaxHP := char.MaxHP
	if baseMaxHP <= 0 {
		t.Fatalf("base MaxHP after RecalculateStats = %d, want > 0", baseMaxHP)
	}

	view := domainchar.BuildViewPropertiesWithEquipment(char, bonuses)
	if got, want := view["hpMax"], baseMaxHP+300; got != want {
		t.Fatalf("hpMax = %v, want %d", got, want)
	}
	if got, want := view["finalHp"], baseMaxHP+300; got != want {
		t.Fatalf("finalHp = %v, want %d", got, want)
	}
}

func TestAggregateCharacterStatBonusesPreservesHeiyaoshiRateValues(t *testing.T) {
	repo := &testRepository{
		characterState: []*domainfeature.CharacterFeatureState{
			{
				CharacterID: 7,
				FeatureKey:  domainfeature.FeatureHeiyaoshi,
				State: map[string]interface{}{
					"Buff": map[string]interface{}{
						"14": 0.32,
						"31": 1.4,
						"52": 0.05,
						"59": 0.005,
						"71": 0.25,
					},
				},
			},
		},
	}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(loadTestManager(t, map[string][]map[string]interface{}{}))

	bonuses := service.AggregateCharacterStatBonuses(context.Background(), 7)

	if got, want := bonuses.FinalAdds[14], 0.32; got != want {
		t.Fatalf("FinalAdds[14] (Defy) = %v, want %v (raw heiyaoshi config value, routed via AddFinal)", got, want)
	}
	if got, want := bonuses.FinalAdds[31], 1.4; got != want {
		t.Fatalf("FinalAdds[31] (ResiCritical) = %v, want %v", got, want)
	}
	if got, want := bonuses.Float[domainchar.PropConfusion], 0.05; got != want {
		t.Fatalf("PropConfusion bonus = %v, want %v (raw, not 5)", got, want)
	}
	if got, want := bonuses.Float[domainchar.PropFinalPhysReduce], 0.5; got != want {
		t.Fatalf("PropFinalPhysReduce bonus = %v, want %v (fraction-of-1 * 100, so 0.005 Buff -> 0.5 stat)", got, want)
	}
	if got, want := bonuses.Float[domainchar.PropCriticalDamage], 0.25; got != want {
		t.Fatalf("PropCriticalDamage bonus = %v, want %v (raw, not 25)", got, want)
	}

	char := &domainchar.Character{ID: 7, ClassID: 2, Strength: 8, Agility: 10, Stamina: 8, Intelligence: 12, Spirit: 12}
	char.RecalculateStats()
	view := domainchar.BuildViewPropertiesWithEquipment(char, bonuses)
	if got := view["finalDefy"]; got != 0.32 {
		t.Fatalf("finalDefy in view payload = %v, want 0.32 (DetailPropPanel renders this as \"0.32\")", got)
	}
	if got := view["finalConfusion"]; got != 0.05 {
		t.Fatalf("finalConfusion in view payload = %v, want 0.05", got)
	}
}

func TestApplyHeiyaoshiPropBonus_PercentPointPropsRouteToFinalAdds(t *testing.T) {
	cases := []struct {
		propID int
		value  float64
	}{
		{14, 1.5},
		{31, 0.32},
		{34, 2.4},
		{61, 1.5},
	}
	for _, tc := range cases {
		bonuses := domainchar.NewEquipmentStatBonuses()
		applyHeiyaoshiPropBonus(&bonuses, tc.propID, tc.value)
		if got := bonuses.FinalAdds[tc.propID]; got != tc.value {
			t.Fatalf("propID %d: FinalAdds = %v, want %v", tc.propID, got, tc.value)
		}
		if got := bonuses.Float[domainchar.PropCriticalDamage]; got != 0 {
			t.Fatalf("propID %d: Float[PropCriticalDamage] = %v, want 0", tc.propID, got)
		}
		if got := bonuses.Flat[domainchar.PropCritical]; got != 0 {
			t.Fatalf("propID %d: Flat[PropCritical] = %d, want 0", tc.propID, got)
		}
	}
}

func TestScaleWarSpriteRawValue_DividesPercentageProps(t *testing.T) {
	cases := []struct {
		propID int
		raw    float64
		want   float64
	}{
		{1, 3000, 3000},
		{4, 750, 750},
		{6, 500, 500},
		{11, 300, 300},
		{13, 120000, 12},
		{14, 80000, 8},
		{31, 60000, 6},
		{61, 40000, 4},
		{59, 200, 2},
		{60, 200, 2},
		{62, 200, 2},
		{63, 200, 2},
	}
	for _, tc := range cases {
		got := scaleWarSpriteRawValue(tc.propID, tc.raw)
		if got != tc.want {
			t.Fatalf("scaleWarSpriteRawValue(propID=%d, raw=%v) = %v, want %v", tc.propID, tc.raw, got, tc.want)
		}
	}
}

func TestApplyHeiyaoshiPropBonus_Prop13RoutesToCriticalFlat(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	applyHeiyaoshiPropBonus(&bonuses, 13, 12)
	if got, want := bonuses.Flat[domainchar.PropCritical], 12; got != want {
		t.Fatalf("propID 13: Flat[PropCritical] = %d, want %d", got, want)
	}
	if _, present := bonuses.FinalAdds[13]; present {
		t.Fatalf("propID 13: FinalAdds[13] should not be set")
	}
	if got := bonuses.Float[domainchar.PropCriticalDamage]; got != 0 {
		t.Fatalf("propID 13: Float[PropCriticalDamage] = %v, want 0", got)
	}

	char := &domainchar.Character{ID: 1, ClassID: 2, Strength: 8, Agility: 10, Stamina: 8, Intelligence: 12, Spirit: 12}
	char.RecalculateStats()
	baseCritical := char.FinalCritical
	baseCritDmg := char.FinalCriticalDamage
	char.ApplyEquipmentBonuses(bonuses)
	if got, want := char.FinalCritical, baseCritical+12.0; got != want {
		t.Fatalf("FinalCritical after heiyaoshi prop 13 = %v, want %v", got, want)
	}
	if got := char.FinalCriticalDamage; got != baseCritDmg {
		t.Fatalf("FinalCriticalDamage should be unchanged by prop 13, got %v, want %v", got, baseCritDmg)
	}
}

func TestApplyHeiyaoshiPropBonus_FractionPropsStillRouteToFloat(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	applyHeiyaoshiPropBonus(&bonuses, 59, 0.04)
	if got, want := bonuses.Float[domainchar.PropFinalPhysReduce], 4.0; got != want {
		t.Fatalf("propID 59: Float[PropFinalPhysReduce] = %v, want %v (fraction * 100 for character stat)", got, want)
	}
	if len(bonuses.FinalAdds) != 0 {
		t.Fatalf("propID 59: FinalAdds should be empty, got %v", bonuses.FinalAdds)
	}
}

func TestBuildCharacterLoginStateUsesProgressionAndFeatureState(t *testing.T) {
	repo := &testRepository{
		progression: &domainfeature.CharacterProgression{
			CharacterID:      9,
			AwakenLevel:      77,
			AwakenPoints:     2,
			AwakenPointsUsed: 1,
			SoulLevel:        100,
			SoulExp:          456,
			SoulPoints:       7,
		},
		characterState: []*domainfeature.CharacterFeatureState{
			{CharacterID: 9, FeatureKey: domainfeature.FeatureMagicArray, State: map[string]interface{}{"starsNow": map[string]interface{}{"0": 10}, "refreshCount": 3}},
			{CharacterID: 9, FeatureKey: domainfeature.FeatureAwakening, State: map[string]interface{}{"pointDict": map[string]interface{}{"SKILL1": 1}, "awakenAdd": 5}},
			{CharacterID: 9, FeatureKey: domainfeature.FeatureHeiyaoshi, State: map[string]interface{}{"Buff": map[string]interface{}{"1": 180000}}},
			{CharacterID: 9, FeatureKey: domainfeature.FeatureWarSprite, State: map[string]interface{}{"wObj": map[string]interface{}{"1": 1110}}},
			{CharacterID: 9, FeatureKey: domainfeature.FeatureExplorerMedal, State: map[string]interface{}{"info": "100|0"}},
			{CharacterID: 9, FeatureKey: domainfeature.FeatureContractPet, State: map[string]interface{}{"hp": 50, "hpExp": 10}},
			{CharacterID: 9, FeatureKey: domainfeature.FeatureMonsterHeart, State: map[string]interface{}{"bag": map[string]interface{}{"ren": map[string]interface{}{"5001": map[string]interface{}{"itemId": 5001, "n": 3}}}, "data": map[string]interface{}{}}},
		},
	}

	service := NewService(repo, zap.NewNop())
	loginState, err := service.BuildCharacterLoginState(context.Background(), 9)
	if err != nil {
		t.Fatalf("BuildCharacterLoginState() error = %v", err)
	}

	if got, want := loginState["awakenLevel"], 77; got != want {
		t.Fatalf("awakenLevel = %v, want %v", got, want)
	}
	if got, want := loginState["trainSoulLvl"], 100; got != want {
		t.Fatalf("trainSoulLvl = %v, want %v", got, want)
	}
	if got, want := loginState["soulChip"], int64(7); got != want {
		t.Fatalf("soulChip = %v, want %v", got, want)
	}
	astrologicData, ok := loginState["astrologicData"].(map[string]interface{})
	if !ok {
		t.Fatalf("astrologicData missing map payload")
	}
	if got, want := astrologicData["refreshCount"], 3; got != want {
		t.Fatalf("refreshCount = %v, want %v", got, want)
	}
	contractPet, ok := loginState["contractPet"].(map[string]interface{})
	if !ok || contractPet["hp"] != 50 {
		t.Fatalf("contractPet = %v, want hp 50", loginState["contractPet"])
	}
	if _, present := loginState["monsterHeart"]; present {
		t.Fatalf("loginState must not emit monsterHeart (collides with scalar cData.monsterHeart); the panel ships via initMonsterHeartData")
	}
	monsterHeartBag, ok := loginState["monsterHeartBag"].(map[string]interface{})
	if !ok {
		t.Fatalf("monsterHeartBag = %v, want map with 7 categories", loginState["monsterHeartBag"])
	}
	for _, category := range []string{"ren", "shou", "zhi", "mo", "ji", "lon", "te"} {
		if _, has := monsterHeartBag[category]; !has {
			t.Fatalf("monsterHeartBag missing category %q", category)
		}
	}
	ren, ok := monsterHeartBag["ren"].(map[string]interface{})
	if !ok || ren["5001"] == nil {
		t.Fatalf("monsterHeartBag[ren] = %v, want persisted entry 5001", monsterHeartBag["ren"])
	}
}

func TestAggregateCharacterStatBonusesAppliesPMDailyBuff(t *testing.T) {
	repo := &testRepository{
		characterState: []*domainfeature.CharacterFeatureState{
			{
				CharacterID: 12,
				FeatureKey:  domainfeature.FeaturePMDailyBuff,
				State: map[string]interface{}{
					"day":    pmDailyBuffCycleDay(time.Now()),
					"buffId": 3309,
				},
			},
		},
	}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(loadTestManager(t, map[string][]map[string]interface{}{
		models.TableBuff: {
			{"id": 3309, "percent_flag": 1, "prop1": 1, "prop2": 4, "prop3": 5, "prop4": 6, "prop5": 7, "prop_num1": 12, "prop_num2": 12, "prop_num3": 12, "prop_num4": 12, "prop_num5": 12},
		},
	}))

	bonuses := service.AggregateCharacterStatBonuses(context.Background(), 12)

	if got, want := bonuses.Percent[domainchar.PropMaxHP], 12; got != want {
		t.Fatalf("hp percent bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Percent[domainchar.PropAttack], 12; got != want {
		t.Fatalf("attack percent bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Percent[domainchar.PropMagicAttack], 12; got != want {
		t.Fatalf("magic attack percent bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Percent[domainchar.PropDefense], 12; got != want {
		t.Fatalf("defense percent bonus = %d, want %d", got, want)
	}
	if got, want := bonuses.Percent[domainchar.PropMagicDef], 12; got != want {
		t.Fatalf("magic defense percent bonus = %d, want %d", got, want)
	}

	char := &domainchar.Character{MaxHP: 1000, Attack: 100, MagicAttack: 100, Defense: 100, MagicDefense: 100}
	char.ApplyEquipmentBonuses(bonuses)

	if got, want := char.MaxHP, 1120; got != want {
		t.Fatalf("MaxHP = %d, want %d", got, want)
	}
	if got, want := char.Attack, 112; got != want {
		t.Fatalf("Attack = %d, want %d", got, want)
	}
	if got, want := char.MagicAttack, 112; got != want {
		t.Fatalf("MagicAttack = %d, want %d", got, want)
	}
	if got, want := char.Defense, 112; got != want {
		t.Fatalf("Defense = %d, want %d", got, want)
	}
	if got, want := char.MagicDefense, 112; got != want {
		t.Fatalf("MagicDefense = %d, want %d", got, want)
	}
}

func TestApplyBuffTemplateBonus_PreservesPercentVsRateSemantics(t *testing.T) {
	bonuses := domainchar.NewEquipmentStatBonuses()
	ApplyBuffTemplateBonus(&bonuses, &models.BuffTemplate{
		PercentFlag: 1,
		Prop1:       4,
		Prop2:       13,
		Prop3:       14,
		Prop4:       59,
		PropNum1:    12,
		PropNum2:    6,
		PropNum3:    7,
		PropNum4:    3,
	})

	char := &domainchar.Character{
		Attack: 100,
	}
	char.ApplyEquipmentBonuses(bonuses)

	if got, want := char.Attack, 112; got != want {
		t.Fatalf("Attack = %d, want %d", got, want)
	}
	if got, want := char.Critical, 6; got != want {
		t.Fatalf("Critical = %d, want %d", got, want)
	}
	if got, want := char.FinalDefy, 7.0; got != want {
		t.Fatalf("FinalDefy = %v, want %v", got, want)
	}
	if got, want := char.FinalPraDef, 3.0; got != want {
		t.Fatalf("FinalPraDef = %v, want %v", got, want)
	}
}

func TestAggregateCharacterStatBonusesAppliesStarsFeature(t *testing.T) {
	repo := &testRepository{
		characterState: []*domainfeature.CharacterFeatureState{
			{
				CharacterID: 11,
				FeatureKey:  domainfeature.FeatureStars,
				State: map[string]interface{}{
					"1": map[string]interface{}{"tid": 2, "level": 2, "addition": 2.0, "finishDate": 0},
					"2": map[string]interface{}{"tid": 13, "level": 1, "addition": 1.0, "finishDate": 0},
					"3": map[string]interface{}{"tid": 0, "level": 0, "addition": 1.0, "finishDate": 0},
				},
			},
		},
	}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(loadTestManager(t, map[string][]map[string]interface{}{
		models.TableStarsTemplate: {
			{"id": 2, "type": 1, "level": 2, "add_prop": "hp", "add_value": 2000},
			{"id": 13, "type": 2, "level": 1, "add_prop": "attack", "add_value": 250},
		},
	}))

	bonuses := service.AggregateCharacterStatBonuses(context.Background(), 11)

	if got, want := bonuses.Flat[domainchar.PropMaxHP], 4000; got != want {
		t.Fatalf("hp bonus = %d, want %d (addValue 2000 × addition 2.0)", got, want)
	}
	if got, want := bonuses.Flat[domainchar.PropAttack], 250; got != want {
		t.Fatalf("attack bonus = %d, want %d (addValue 250 × addition 1.0)", got, want)
	}
}

func TestAggregatePetBonusesAppliesTalentAndStoneState(t *testing.T) {
	repo := &testRepository{
		petState: []*domainfeature.PetFeatureState{
			{PetID: 5, FeatureKey: domainfeature.FeaturePetTalent, State: map[string]interface{}{"slots": map[string]interface{}{"1": map[string]interface{}{"tid": 1}}}},
			{PetID: 5, FeatureKey: domainfeature.FeaturePetStone, State: map[string]interface{}{"slots": map[string]interface{}{"1": map[string]interface{}{"id": 7}}}},
		},
	}

	service := NewService(repo, zap.NewNop())
	service.SetGameDataManager(loadTestManager(t, map[string][]map[string]interface{}{
		models.TablePetTalent: {
			{"id": 1, "prop_type": 4, "prop_val": 25},
		},
		models.TablePetStone: {
			{"id": 7, "prop_type": 11, "prop_num": 134},
		},
	}))

	_, skillBonuses := service.AggregatePetBonuses(context.Background(), 5)

	if got, want := skillBonuses.Direct[4], float64(25); got != want {
		t.Fatalf("talent direct attack = %v, want %v", got, want)
	}
	if got, want := skillBonuses.Direct[11], float64(134); got != want {
		t.Fatalf("stone direct speed = %v, want %v", got, want)
	}
}

func loadTestManager(t *testing.T, tables map[string][]map[string]interface{}) *gamedata.Manager {
	t.Helper()

	manager := gamedata.NewManager(nil, zap.NewNop())
	for tableName, rows := range tables {
		payloads := make([]json.RawMessage, 0, len(rows))
		for _, row := range rows {
			raw, err := json.Marshal(row)
			if err != nil {
				t.Fatalf("json.Marshal(%s) error = %v", tableName, err)
			}
			payloads = append(payloads, raw)
		}
		if err := manager.GetCache().LoadTable(tableName, payloads); err != nil {
			t.Fatalf("LoadTable(%s) error = %v", tableName, err)
		}
	}

	return manager
}
