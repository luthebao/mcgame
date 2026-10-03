// Open-sourced by BaoLT

package character

import (
	"context"
	"encoding/json"
	"errors"
	"sort"
	"testing"

	appskill "mcgame-server/internal/application/skill"
	domainchar "mcgame-server/internal/domain/character"
	domainskill "mcgame-server/internal/domain/skill"
	"mcgame-server/internal/gamedata"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"go.uber.org/zap"
)

type stubCharacterRepo struct {
	char      *domainchar.Character
	err       error
	exists    bool
	existsErr error
	createErr error
	created   *domainchar.Character
}

func (s *stubCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if s.err != nil {
		return nil, s.err
	}
	if s.char == nil || s.char.ID != id {
		return nil, errors.New("character not found")
	}
	return s.char, nil
}

func (s *stubCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (s *stubCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (s *stubCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (s *stubCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	if character.ID == 0 {
		character.ID = 101
	}
	s.char = character
	s.created = character
	if s.createErr != nil {
		return s.createErr
	}
	return nil
}

func (s *stubCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (s *stubCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (s *stubCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	if s.existsErr != nil {
		return false, s.existsErr
	}
	return s.exists, nil
}

func (s *stubCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (s *stubCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type stubGameDataRepo struct {
	tables map[string][]json.RawMessage
}

type skillLearnCall struct {
	charID  int64
	skillID int
}

type stubSkillLearner struct {
	calls      []skillLearnCall
	err        error
	errBySkill map[int]error
}

func (s *stubSkillLearner) LearnStarterSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	s.calls = append(s.calls, skillLearnCall{
		charID:  charID,
		skillID: skillID,
	})
	if err := s.errBySkill[skillID]; err != nil {
		return nil, err
	}
	if s.err != nil {
		return nil, s.err
	}
	return domainskill.NewCharacterSkill(charID, skillID), nil
}

func (s *stubGameDataRepo) GetByTableAndID(ctx context.Context, tableName string, recordID int) (json.RawMessage, error) {
	records := s.tables[tableName]
	for _, rec := range records {
		var obj map[string]interface{}
		if err := json.Unmarshal(rec, &obj); err != nil {
			continue
		}
		if idValue, ok := obj["id"]; ok {
			switch v := idValue.(type) {
			case float64:
				if int(v) == recordID {
					return rec, nil
				}
			case int:
				if v == recordID {
					return rec, nil
				}
			}
		}
	}
	return nil, errors.New("record not found")
}

func (s *stubGameDataRepo) GetAllByTable(ctx context.Context, tableName string) ([]json.RawMessage, error) {
	return s.tables[tableName], nil
}

func (s *stubGameDataRepo) Upsert(ctx context.Context, tableName string, recordID int, data json.RawMessage) error {
	return nil
}

func (s *stubGameDataRepo) UpsertBatch(ctx context.Context, tableName string, records []gamedata.Record) error {
	return nil
}

func (s *stubGameDataRepo) DeleteByTableAndID(ctx context.Context, tableName string, recordID int) error {
	return nil
}

func (s *stubGameDataRepo) DeleteAllByTable(ctx context.Context, tableName string) error {
	return nil
}

func (s *stubGameDataRepo) CountByTable(ctx context.Context, tableName string) (int, error) {
	return len(s.tables[tableName]), nil
}

func (s *stubGameDataRepo) GetTableNames(ctx context.Context) ([]string, error) {
	names := make([]string, 0, len(s.tables))
	for name := range s.tables {
		names = append(names, name)
	}
	return names, nil
}

func mustNewGameDataManagerWithClass(t *testing.T, classJSON string) *gamedata.Manager {
	t.Helper()

	return mustNewGameDataManagerWithTables(t, map[string][]string{
		"TBL_CLASS": {classJSON},
	})
}

func mustNewGameDataManagerWithTables(t *testing.T, rawTables map[string][]string) *gamedata.Manager {
	t.Helper()

	tables := make(map[string][]json.RawMessage, len(rawTables))
	for tableName, records := range rawTables {
		tables[tableName] = make([]json.RawMessage, 0, len(records))
		for _, record := range records {
			tables[tableName] = append(tables[tableName], json.RawMessage(record))
		}
	}

	repo := &stubGameDataRepo{tables: tables}
	gm := gamedata.NewManager(repo, zap.NewNop())
	if err := gm.LoadAll(context.Background()); err != nil {
		t.Fatalf("LoadAll failed: %v", err)
	}
	return gm
}

type inMemorySkillRepo struct {
	nextID int64
	skills map[int64]*domainskill.CharacterSkill
}

func newInMemorySkillRepo(skills ...*domainskill.CharacterSkill) *inMemorySkillRepo {
	repo := &inMemorySkillRepo{
		nextID: 1,
		skills: make(map[int64]*domainskill.CharacterSkill),
	}
	for _, skill := range skills {
		clone := *skill
		if clone.ID == 0 {
			clone.ID = repo.nextID
			repo.nextID++
		}
		if clone.ID >= repo.nextID {
			repo.nextID = clone.ID + 1
		}
		repo.skills[clone.ID] = &clone
	}
	return repo
}

func (r *inMemorySkillRepo) FindByID(ctx context.Context, id int64) (*domainskill.CharacterSkill, error) {
	if skill, ok := r.skills[id]; ok {
		clone := *skill
		return &clone, nil
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *inMemorySkillRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainskill.CharacterSkill, error) {
	result := make([]*domainskill.CharacterSkill, 0)
	for _, skill := range r.skills {
		if skill.CharacterID != charID {
			continue
		}
		clone := *skill
		result = append(result, &clone)
	}
	sort.Slice(result, func(i, j int) bool {
		return result[i].SkillID < result[j].SkillID
	})
	return result, nil
}

func (r *inMemorySkillRepo) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	for _, skill := range r.skills {
		if skill.CharacterID == charID && skill.SkillID == skillID {
			clone := *skill
			return &clone, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *inMemorySkillRepo) FindBySlot(ctx context.Context, charID int64, slot int) (*domainskill.CharacterSkill, error) {
	for _, skill := range r.skills {
		if skill.CharacterID == charID && skill.SlotPosition != nil && *skill.SlotPosition == slot {
			clone := *skill
			return &clone, nil
		}
	}
	return nil, pkgerrors.ErrNotFound
}

func (r *inMemorySkillRepo) Create(ctx context.Context, skill *domainskill.CharacterSkill) error {
	clone := *skill
	if clone.ID == 0 {
		clone.ID = r.nextID
		r.nextID++
	}
	skill.ID = clone.ID
	r.skills[clone.ID] = &clone
	return nil
}

func (r *inMemorySkillRepo) Update(ctx context.Context, skill *domainskill.CharacterSkill) error {
	if _, ok := r.skills[skill.ID]; !ok {
		return pkgerrors.ErrNotFound
	}
	clone := *skill
	r.skills[clone.ID] = &clone
	return nil
}

func (r *inMemorySkillRepo) Delete(ctx context.Context, id int64) error {
	if _, ok := r.skills[id]; !ok {
		return pkgerrors.ErrNotFound
	}
	delete(r.skills, id)
	return nil
}

func (r *inMemorySkillRepo) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	skill, ok := r.skills[id]
	if !ok {
		return pkgerrors.ErrNotFound
	}
	skill.SlotPosition = slot
	return nil
}

func (r *inMemorySkillRepo) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	if _, ok := r.skills[id]; !ok {
		return pkgerrors.ErrNotFound
	}
	return nil
}

func (r *inMemorySkillRepo) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	for _, skill := range r.skills {
		if skill.CharacterID == charID && skill.SkillID == skillID {
			return true, nil
		}
	}
	return false, nil
}

func TestBuildViewPropertiesFromBase_UsesBaseCharacterValues(t *testing.T) {
	svc := NewService(nil, zap.NewNop())

	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.Level = 10
	char.Strength = 30
	char.Agility = 18
	char.Stamina = 20
	char.Intelligence = 15
	char.Spirit = 12
	char.AttrPoints = 4
	char.FinalHp = 999999
	char.FinalAttack = 888888
	char.LastPoint = ""
	char.Spirituality = ""
	char.GuideLog = map[int]bool{12: true}

	props := svc.BuildViewPropertiesFromBase(char)

	if got := props["finalHp"]; got != 156 {
		t.Fatalf("finalHp = %v, want 156", got)
	}
	if got := props["finalMp"]; got != 108 {
		t.Fatalf("finalMp = %v, want 108", got)
	}
	if got := props["finalSp"]; got != 150 {
		t.Fatalf("finalSp = %v, want 150", got)
	}
	if got := props["finalAttack"]; got != 52 {
		t.Fatalf("finalAttack = %v, want 52", got)
	}
	if got := props["finalMAttack"]; got != 29 {
		t.Fatalf("finalMAttack = %v, want 29", got)
	}
	if got := props["finalDefence"]; got != 53 {
		t.Fatalf("finalDefence = %v, want 53", got)
	}
	if got := props["finalMDefence"]; got != 76 {
		t.Fatalf("finalMDefence = %v, want 76", got)
	}
	if got := props["finalHit"]; got != 101 {
		t.Fatalf("finalHit = %v, want 101", got)
	}
	if got := props["finalCritical"]; got != 1 {
		t.Fatalf("finalCritical = %v, want 1", got)
	}
	if got := props["finalDodge"]; got != 1 {
		t.Fatalf("finalDodge = %v, want 1", got)
	}
	if got := props["finalSpeed"]; got != 124 {
		t.Fatalf("finalSpeed = %v, want 124", got)
	}
	if got := props["finalStrength"]; got != 30 {
		t.Fatalf("finalStrength = %v, want 30", got)
	}
	if got := props["finalAgility"]; got != 18 {
		t.Fatalf("finalAgility = %v, want 18", got)
	}
	if got := props["finalStamina"]; got != 20 {
		t.Fatalf("finalStamina = %v, want 20", got)
	}
	if got := props["finalIntelligence"]; got != 15 {
		t.Fatalf("finalIntelligence = %v, want 15", got)
	}
	if got := props["finalEnergy"]; got != 12 {
		t.Fatalf("finalEnergy = %v, want 12", got)
	}
	if got := props["attLastPoint"]; got != 4 {
		t.Fatalf("attLastPoint = %v, want 4", got)
	}
	if got := props["lastPoint"]; got != "4" {
		t.Fatalf("lastPoint = %v, want 4", got)
	}
	if got := props["spirituality"]; got != "0" {
		t.Fatalf("spirituality = %v, want 0", got)
	}

	guideFlag, ok := props["guideFlag"].(map[string]bool)
	if !ok {
		t.Fatalf("guideFlag type = %T, want map[string]bool", props["guideFlag"])
	}
	if !guideFlag["12"] {
		t.Fatalf("guideFlag missing key 12")
	}
}

func TestGetCharacterAttributes_UsesBaseCharacterViewProperties(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 99
	char.Level = 5
	char.Strength = 12
	char.Agility = 14
	char.Stamina = 16
	char.Intelligence = 18
	char.Spirit = 20
	char.AttrPoints = 3
	char.FinalHp = 123456
	char.FinalAttack = 654321

	repo := &stubCharacterRepo{char: char}
	svc := NewService(repo, zap.NewNop())

	attrs, err := svc.GetCharacterAttributes(context.Background(), 99)
	if err != nil {
		t.Fatalf("GetCharacterAttributes returned error: %v", err)
	}

	if got := attrs["finalHp"]; got != 128 {
		t.Fatalf("finalHp = %v, want 128", got)
	}
	if got := attrs["finalMp"]; got != 155 {
		t.Fatalf("finalMp = %v, want 155", got)
	}
	if got := attrs["finalAttack"]; got != 23 {
		t.Fatalf("finalAttack = %v, want 23", got)
	}
	if got := attrs["finalDefence"]; got != 41 {
		t.Fatalf("finalDefence = %v, want 41", got)
	}
	if got := attrs["attLastPoint"]; got != 3 {
		t.Fatalf("attLastPoint = %v, want 3", got)
	}
	if got := attrs["lastPoint"]; got != "3" {
		t.Fatalf("lastPoint = %v, want 3", got)
	}
}

func TestCreate_UsesClassDefaultStatsFromGameData(t *testing.T) {
	repo := &stubCharacterRepo{}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"att_strength":15,"att_agility":10,"att_stamina":15,"att_intelligence":5,"att_energy":5}`))

	_, err := svc.Create(context.Background(), &CreateRequest{
		AccountID: uuid.New(),
		Name:      "new-char",
		ClassID:   1,
		Gender:    0,
	})
	if err != nil {
		t.Fatalf("Create returned error: %v", err)
	}
	if repo.created == nil {
		t.Fatalf("expected repo.Create to be called")
	}

	if got := repo.created.Strength; got != 15 {
		t.Fatalf("Strength = %d, want 15", got)
	}
	if got := repo.created.Agility; got != 10 {
		t.Fatalf("Agility = %d, want 10", got)
	}
	if got := repo.created.Stamina; got != 15 {
		t.Fatalf("Stamina = %d, want 15", got)
	}
	if got := repo.created.Intelligence; got != 5 {
		t.Fatalf("Intelligence = %d, want 5", got)
	}
	if got := repo.created.Spirit; got != 5 {
		t.Fatalf("Spirit = %d, want 5", got)
	}
	if got := repo.created.BagSlotNum; got != 1 {
		t.Fatalf("BagSlotNum = %d, want 1", got)
	}
	if got := repo.created.BankSlotNum; got != 1 {
		t.Fatalf("BankSlotNum = %d, want 1", got)
	}
	if got := repo.created.MaxBagSlots(); got != 30 {
		t.Fatalf("MaxBagSlots() = %d, want 30", got)
	}
	if got := repo.created.MaxBankSlots(); got != 30 {
		t.Fatalf("MaxBankSlots() = %d, want 30", got)
	}

	if got := repo.created.MaxHP; got != 122 {
		t.Fatalf("MaxHP = %d, want 122", got)
	}
	if got := repo.created.MaxMP; got != 44 {
		t.Fatalf("MaxMP = %d, want 44", got)
	}
	if got := repo.created.MaxSP; got != 150 {
		t.Fatalf("MaxSP = %d, want 150", got)
	}
	if got := repo.created.CurrentHP; got != 122 {
		t.Fatalf("CurrentHP = %d, want 122", got)
	}
	if got := repo.created.CurrentMP; got != 44 {
		t.Fatalf("CurrentMP = %d, want 44", got)
	}
	if got := repo.created.CurrentSP; got != 150 {
		t.Fatalf("CurrentSP = %d, want 150", got)
	}
	if got := repo.created.Attack; got != 26 {
		t.Fatalf("Attack = %d, want 26", got)
	}
	if got := repo.created.MagicAttack; got != 10 {
		t.Fatalf("MagicAttack = %d, want 10", got)
	}
	if got := repo.created.Defense; got != 36 {
		t.Fatalf("Defense = %d, want 36", got)
	}
	if got := repo.created.MagicDefense; got != 28 {
		t.Fatalf("MagicDefense = %d, want 28", got)
	}
	if got := repo.created.Speed; got != 113 {
		t.Fatalf("Speed = %d, want 113", got)
	}
	if got := repo.created.Hit; got != 100 {
		t.Fatalf("Hit = %d, want 100", got)
	}
	if got := repo.created.Dodge; got != 0 {
		t.Fatalf("Dodge = %d, want 0", got)
	}
	if got := repo.created.Critical; got != 0 {
		t.Fatalf("Critical = %d, want 0", got)
	}

	props := svc.BuildViewPropertiesWithEquipment(repo.created, domainchar.EquipmentStatBonuses{})
	if got := props["finalStrength"]; got != 15 {
		t.Fatalf("finalStrength = %v, want 15 (fresh class-1 char with no equipment)", got)
	}
	if got := props["finalAgility"]; got != 10 {
		t.Fatalf("finalAgility = %v, want 10", got)
	}
	if got := props["finalStamina"]; got != 15 {
		t.Fatalf("finalStamina = %v, want 15", got)
	}
	if got := props["finalIntelligence"]; got != 5 {
		t.Fatalf("finalIntelligence = %v, want 5", got)
	}
	if got := props["finalEnergy"]; got != 5 {
		t.Fatalf("finalEnergy = %v, want 5", got)
	}
}

func TestCreate_SeedsClassStarterSkills(t *testing.T) {
	repo := &stubCharacterRepo{}
	learner := &stubSkillLearner{}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"start_skill":"1010|1086"}`))
	svc.SetSkillLearner(learner)

	created, err := svc.Create(context.Background(), &CreateRequest{
		AccountID: uuid.New(),
		Name:      "starter-skill-char",
		ClassID:   1,
		Gender:    0,
	})
	if err != nil {
		t.Fatalf("Create returned error: %v", err)
	}
	if created == nil {
		t.Fatalf("Create returned nil character")
	}
	if len(learner.calls) != 2 {
		t.Fatalf("starter skill learn calls = %d, want 2", len(learner.calls))
	}
	if learner.calls[0] != (skillLearnCall{charID: created.ID, skillID: 1010}) {
		t.Fatalf("first learn call = %#v, want charID %d skill 1010", learner.calls[0], created.ID)
	}
	if learner.calls[1] != (skillLearnCall{charID: created.ID, skillID: 1086}) {
		t.Fatalf("second learn call = %#v, want charID %d skill 1086", learner.calls[1], created.ID)
	}
}

func TestCreate_NoStarterSkillsWhenClassFieldEmpty(t *testing.T) {
	repo := &stubCharacterRepo{}
	learner := &stubSkillLearner{}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"start_skill":""}`))
	svc.SetSkillLearner(learner)

	_, err := svc.Create(context.Background(), &CreateRequest{
		AccountID: uuid.New(),
		Name:      "no-starter-skill-char",
		ClassID:   1,
		Gender:    0,
	})
	if err != nil {
		t.Fatalf("Create returned error: %v", err)
	}
	if len(learner.calls) != 0 {
		t.Fatalf("starter skill learn calls = %d, want 0", len(learner.calls))
	}
}

func TestCreate_MalformedStartSkillIgnoresBadTokens(t *testing.T) {
	repo := &stubCharacterRepo{}
	learner := &stubSkillLearner{}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"start_skill":"|1010|abc|1086|"}`))
	svc.SetSkillLearner(learner)

	created, err := svc.Create(context.Background(), &CreateRequest{
		AccountID: uuid.New(),
		Name:      "malformed-starter-skill-char",
		ClassID:   1,
		Gender:    0,
	})
	if err != nil {
		t.Fatalf("Create returned error: %v", err)
	}
	if len(learner.calls) != 2 {
		t.Fatalf("starter skill learn calls = %d, want 2", len(learner.calls))
	}
	if learner.calls[0] != (skillLearnCall{charID: created.ID, skillID: 1010}) {
		t.Fatalf("first learn call = %#v, want charID %d skill 1010", learner.calls[0], created.ID)
	}
	if learner.calls[1] != (skillLearnCall{charID: created.ID, skillID: 1086}) {
		t.Fatalf("second learn call = %#v, want charID %d skill 1086", learner.calls[1], created.ID)
	}
}

func TestCreate_LearnErrorDoesNotAbortCharacterCreation(t *testing.T) {
	repo := &stubCharacterRepo{}
	learner := &stubSkillLearner{
		errBySkill: map[int]error{
			1086: errors.New("boom"),
		},
	}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"start_skill":"1010|1086"}`))
	svc.SetSkillLearner(learner)

	created, err := svc.Create(context.Background(), &CreateRequest{
		AccountID: uuid.New(),
		Name:      "starter-skill-error-char",
		ClassID:   1,
		Gender:    0,
	})
	if err != nil {
		t.Fatalf("Create returned error: %v", err)
	}
	if created == nil {
		t.Fatalf("Create returned nil character")
	}
	if len(learner.calls) != 2 {
		t.Fatalf("starter skill learn calls = %d, want 2", len(learner.calls))
	}
}

func TestCreate_SeedsConfiguredStarterSkillsThatExceedNewCharacterLevel(t *testing.T) {
	repo := &stubCharacterRepo{}
	skillRepo := newInMemorySkillRepo()
	gameData := mustNewGameDataManagerWithTables(t, map[string][]string{
		"TBL_CLASS": {
			`{"id":1,"start_skill":"1010|1086"}`,
		},
		"TBL_SKILL": {
			`{"id":1010,"name":"Khai Son Chi Luc","level":1,"req_level":1,"req_class":"|1|","code_name":"SKILL111001","kind":1,"type":1}`,
			`{"id":1086,"name":"Nang Thuan","level":1,"req_level":5,"req_class":"|1|","code_name":"SKILL111011","kind":2,"type":11}`,
		},
	})

	skillService := appskill.NewService(skillRepo, zap.NewNop())
	skillService.SetCharacterRepository(repo)
	skillService.SetGameDataManager(gameData)

	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(gameData)
	svc.SetSkillLearner(skillService)

	created, err := svc.Create(context.Background(), &CreateRequest{
		AccountID: uuid.New(),
		Name:      "real-starter-skill-char",
		ClassID:   1,
		Gender:    0,
	})
	if err != nil {
		t.Fatalf("Create returned error: %v", err)
	}

	has1010, err := skillRepo.HasSkill(context.Background(), created.ID, 1010)
	if err != nil {
		t.Fatalf("HasSkill(1010) error: %v", err)
	}
	if !has1010 {
		t.Fatalf("expected character %d to learn starter skill 1010", created.ID)
	}

	has1086, err := skillRepo.HasSkill(context.Background(), created.ID, 1086)
	if err != nil {
		t.Fatalf("HasSkill(1086) error: %v", err)
	}
	if !has1086 {
		t.Fatalf("expected character %d to learn starter skill 1086", created.ID)
	}
}

func TestApplyClassDefaultStats_AssignsClassAttAndProfileAptitude(t *testing.T) {
repo := &stubCharacterRepo{}
svc := NewService(repo, zap.NewNop())
svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"att_strength":15,"att_agility":10,"att_stamina":15,"att_intelligence":5,"att_energy":5,"apt_strength":20,"apt_agility":15,"apt_stamina":25,"apt_intelligence":10,"apt_energy":12}`))

_, err := svc.Create(context.Background(), &CreateRequest{
AccountID: uuid.New(),
Name:      "apt-class-char",
ClassID:   1,
Gender:    0,
})
if err != nil {
t.Fatalf("Create returned error: %v", err)
}
if repo.created == nil {
t.Fatalf("expected repo.Create to be called")
}

if got := repo.created.ClassAptStrength; got != 20 {
t.Fatalf("ClassAptStrength = %d, want 20", got)
}
if got := repo.created.ClassAptAgility; got != 15 {
t.Fatalf("ClassAptAgility = %d, want 15", got)
}
if got := repo.created.ClassAptStamina; got != 25 {
t.Fatalf("ClassAptStamina = %d, want 25", got)
}
if got := repo.created.ClassAptIntelligence; got != 10 {
t.Fatalf("ClassAptIntelligence = %d, want 10", got)
}
if got := repo.created.ClassAptEnergy; got != 12 {
t.Fatalf("ClassAptEnergy = %d, want 12", got)
}

if repo.created.AptStrength != 0 {
t.Fatalf("distributed AptStrength = %d, want 0 (class apt must not pollute distributed points)", repo.created.AptStrength)
}

aptCharMaxHP := repo.created.MaxHP
noAptRepo := &stubCharacterRepo{}
noAptSvc := NewService(noAptRepo, zap.NewNop())
noAptSvc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"att_strength":15,"att_agility":10,"att_stamina":15,"att_intelligence":5,"att_energy":5}`))
_, err = noAptSvc.Create(context.Background(), &CreateRequest{
AccountID: uuid.New(),
Name:      "noaptclass",
ClassID:   1,
Gender:    0,
})
if err != nil {
t.Fatalf("Create no-apt returned error: %v", err)
}
noAptMaxHP := noAptRepo.created.MaxHP
if aptCharMaxHP <= noAptMaxHP {
t.Fatalf("MaxHP with class apt (%d) should exceed MaxHP without (%d)", aptCharMaxHP, noAptMaxHP)
}
}

func TestSelect_RestoresClassAptitudeFromGameData(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "loaded-char", 1, 0)
	char.ID = 42
	char.Strength = 30
	char.Agility = 20
	char.ClassAptStrength = 0
	char.ClassAptAgility = 0
	char.ClassAptStamina = 0
	char.ClassAptIntelligence = 0
	char.ClassAptEnergy = 0

	repo := &stubCharacterRepo{char: char}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"apt_strength":20,"apt_agility":15,"apt_stamina":25,"apt_intelligence":10,"apt_energy":12}`))

	loaded, err := svc.Select(context.Background(), &SelectRequest{
		AccountID:   char.AccountID,
		CharacterID: 42,
	})
	if err != nil {
		t.Fatalf("Select returned error: %v", err)
	}

	if got := loaded.ClassAptStrength; got != 20 {
		t.Fatalf("ClassAptStrength = %d, want 20 (must be restored on load)", got)
	}
	if got := loaded.ClassAptAgility; got != 15 {
		t.Fatalf("ClassAptAgility = %d, want 15 (must be restored on load)", got)
	}
	if got := loaded.ClassAptStamina; got != 25 {
		t.Fatalf("ClassAptStamina = %d, want 25 (must be restored on load)", got)
	}
	if got := loaded.ClassAptIntelligence; got != 10 {
		t.Fatalf("ClassAptIntelligence = %d, want 10 (must be restored on load)", got)
	}
	if got := loaded.ClassAptEnergy; got != 12 {
		t.Fatalf("ClassAptEnergy = %d, want 12 (must be restored on load)", got)
	}

	if got := loaded.Strength; got != 30 {
		t.Fatalf("Strength = %d, want 30 (player-allocated points must not be overwritten)", got)
	}
	if got := loaded.Agility; got != 20 {
		t.Fatalf("Agility = %d, want 20 (player-allocated points must not be overwritten)", got)
	}
}

func TestGetByID_RestoresClassAptitudeFromGameData(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "getbyid-char", 1, 0)
	char.ID = 55
	char.Strength = 45
	char.ClassAptStrength = 0
	char.ClassAptEnergy = 0

	repo := &stubCharacterRepo{char: char}
	svc := NewService(repo, zap.NewNop())
	svc.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"apt_strength":20,"apt_agility":15,"apt_stamina":25,"apt_intelligence":10,"apt_energy":12}`))

	loaded, err := svc.GetByID(context.Background(), 55)
	if err != nil {
		t.Fatalf("GetByID returned error: %v", err)
	}

	if got := loaded.ClassAptStrength; got != 20 {
		t.Fatalf("ClassAptStrength = %d, want 20 (must be restored by GetByID)", got)
	}
	if got := loaded.ClassAptEnergy; got != 12 {
		t.Fatalf("ClassAptEnergy = %d, want 12 (must be restored by GetByID)", got)
	}

	if got := loaded.Strength; got != 45 {
		t.Fatalf("Strength = %d, want 45 (player points must be preserved)", got)
	}
}

func TestSelect_ClassAptitudeEnablesMultiplierInRecalculate(t *testing.T) {
	charNoLoad := domainchar.NewCharacter(uuid.New(), "no-load", 1, 0)
	charNoLoad.ID = 10
	charNoLoad.ClassAptStrength = 0

	charFromLoad := domainchar.NewCharacter(uuid.New(), "from-load", 1, 0)
	charFromLoad.ID = 11
	charFromLoad.ClassAptStrength = 0

	repoNoLoad := &stubCharacterRepo{char: charNoLoad}
	svcNoLoad := NewService(repoNoLoad, zap.NewNop())

	repoFromLoad := &stubCharacterRepo{char: charFromLoad}
	svcFromLoad := NewService(repoFromLoad, zap.NewNop())
	svcFromLoad.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"apt_strength":50,"apt_agility":50,"apt_stamina":50,"apt_intelligence":50,"apt_energy":50}`))

	loadedNoApt, err := svcNoLoad.Select(context.Background(), &SelectRequest{
		AccountID:   charNoLoad.AccountID,
		CharacterID: 10,
	})
	if err != nil {
		t.Fatalf("Select (no apt svc) error: %v", err)
	}
	loadedNoApt.RecalculateStats()

	loadedWithApt, err := svcFromLoad.Select(context.Background(), &SelectRequest{
		AccountID:   charFromLoad.AccountID,
		CharacterID: 11,
	})
	if err != nil {
		t.Fatalf("Select (with apt svc) error: %v", err)
	}
	loadedWithApt.RecalculateStats()

	if loadedWithApt.MaxHP <= loadedNoApt.MaxHP {
		t.Fatalf("MaxHP with restored class apt (%d) should exceed MaxHP without (%d); class aptitude multiplier is dead on load path", loadedWithApt.MaxHP, loadedNoApt.MaxHP)
	}
}

func TestGetCharacterAttributes_RestoresClassAptitudeBeforeStatCalc(t *testing.T) {
	charWithApt := domainchar.NewCharacter(uuid.New(), "apt-attrs-char", 1, 0)
	charWithApt.ID = 77
	charWithApt.ClassAptStrength = 0
	charWithApt.ClassAptAgility = 0
	charWithApt.ClassAptStamina = 0
	charWithApt.ClassAptIntelligence = 0
	charWithApt.ClassAptEnergy = 0

	charNoApt := domainchar.NewCharacter(uuid.New(), "noapt-attrs-char", 1, 0)
	charNoApt.ID = 77
	charNoApt.ClassAptStrength = 0
	charNoApt.ClassAptAgility = 0
	charNoApt.ClassAptStamina = 0
	charNoApt.ClassAptIntelligence = 0
	charNoApt.ClassAptEnergy = 0

	repoWithApt := &stubCharacterRepo{char: charWithApt}
	svcWithApt := NewService(repoWithApt, zap.NewNop())
	svcWithApt.SetGameDataManager(mustNewGameDataManagerWithClass(t, `{"id":1,"apt_strength":50,"apt_agility":50,"apt_stamina":50,"apt_intelligence":50,"apt_energy":50}`))

	repoNoApt := &stubCharacterRepo{char: charNoApt}
	svcNoApt := NewService(repoNoApt, zap.NewNop())

	attrsWithApt, err := svcWithApt.GetCharacterAttributes(context.Background(), 77)
	if err != nil {
		t.Fatalf("GetCharacterAttributes (with game data) error: %v", err)
	}

	attrsNoApt, err := svcNoApt.GetCharacterAttributes(context.Background(), 77)
	if err != nil {
		t.Fatalf("GetCharacterAttributes (no game data) error: %v", err)
	}

	hpWithApt, ok := attrsWithApt["finalHp"].(int)
	if !ok {
		t.Fatalf("finalHp type = %T, want int", attrsWithApt["finalHp"])
	}
	hpNoApt, ok := attrsNoApt["finalHp"].(int)
	if !ok {
		t.Fatalf("finalHp type = %T, want int", attrsNoApt["finalHp"])
	}

	if hpWithApt <= hpNoApt {
		t.Fatalf("finalHp with class apt restored (%d) must exceed finalHp with zero apt (%d); GetCharacterAttributes is not calling restoreClassAptitude", hpWithApt, hpNoApt)
	}
}
