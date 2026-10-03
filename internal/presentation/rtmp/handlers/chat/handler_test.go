// Open-sourced by BaoLT

package chat

import (
	"context"
	"errors"
	"net"
	"strconv"
	"testing"
	"time"

	appchar "mcgame-server/internal/application/character"
	appskill "mcgame-server/internal/application/skill"
	domainchar "mcgame-server/internal/domain/character"
	domainskill "mcgame-server/internal/domain/skill"
	infrartmp "mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
	"go.uber.org/zap/zaptest"
)

type chatStubNetConn struct{}

func (s *chatStubNetConn) Read(b []byte) (n int, err error)  { return 0, nil }
func (s *chatStubNetConn) Write(b []byte) (n int, err error) { return len(b), nil }
func (s *chatStubNetConn) Close() error                      { return nil }
func (s *chatStubNetConn) LocalAddr() net.Addr               { return nil }
func (s *chatStubNetConn) RemoteAddr() net.Addr {
	return &net.TCPAddr{IP: net.ParseIP("127.0.0.1"), Port: 1935}
}
func (s *chatStubNetConn) SetDeadline(t time.Time) error      { return nil }
func (s *chatStubNetConn) SetReadDeadline(t time.Time) error  { return nil }
func (s *chatStubNetConn) SetWriteDeadline(t time.Time) error { return nil }

type chatTestCharacterRepo struct {
	char       *domainchar.Character
	updateCall int
	findErr    error
	updateErr  error
}

func (f *chatTestCharacterRepo) FindByID(ctx context.Context, id int64) (*domainchar.Character, error) {
	if f.findErr != nil {
		return nil, f.findErr
	}
	if f.char == nil || f.char.ID != id {
		return nil, errors.New("character not found")
	}
	return f.char, nil
}

func (f *chatTestCharacterRepo) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*domainchar.Character, error) {
	return nil, nil
}

func (f *chatTestCharacterRepo) FindByMapID(ctx context.Context, mapID int) ([]*domainchar.Character, error) {
	return nil, nil
}

func (f *chatTestCharacterRepo) FindByName(ctx context.Context, name string) (*domainchar.Character, error) {
	return nil, nil
}

func (f *chatTestCharacterRepo) Create(ctx context.Context, character *domainchar.Character) error {
	return nil
}

func (f *chatTestCharacterRepo) Update(ctx context.Context, character *domainchar.Character) error {
	f.updateCall++
	if f.updateErr != nil {
		return f.updateErr
	}
	f.char = character
	return nil
}

func (f *chatTestCharacterRepo) Delete(ctx context.Context, id int64) error {
	return nil
}

func (f *chatTestCharacterRepo) ExistsByName(ctx context.Context, name string) (bool, error) {
	return false, nil
}

func (f *chatTestCharacterRepo) UpdatePosition(ctx context.Context, id int64, pos domainchar.Position) error {
	return nil
}

func (f *chatTestCharacterRepo) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	return nil
}

type chatCallbackCall struct {
	method string
	args   []interface{}
}

type chatTestSkillRepo struct {
	skills []*domainskill.CharacterSkill
}

func (r *chatTestSkillRepo) FindByID(ctx context.Context, id int64) (*domainskill.CharacterSkill, error) {
	for _, skill := range r.skills {
		if skill.ID == id {
			return skill, nil
		}
	}
	return nil, errors.New("skill not found")
}

func (r *chatTestSkillRepo) FindByCharacterID(ctx context.Context, charID int64) ([]*domainskill.CharacterSkill, error) {
	result := make([]*domainskill.CharacterSkill, 0, len(r.skills))
	for _, skill := range r.skills {
		if skill.CharacterID == charID {
			result = append(result, skill)
		}
	}
	return result, nil
}

func (r *chatTestSkillRepo) FindByCharacterAndSkill(ctx context.Context, charID int64, skillID int) (*domainskill.CharacterSkill, error) {
	for _, skill := range r.skills {
		if skill.CharacterID == charID && skill.SkillID == skillID {
			return skill, nil
		}
	}
	return nil, errors.New("skill not found")
}

func (r *chatTestSkillRepo) FindBySlot(ctx context.Context, charID int64, slot int) (*domainskill.CharacterSkill, error) {
	for _, skill := range r.skills {
		if skill.CharacterID != charID || skill.SlotPosition == nil {
			continue
		}
		if *skill.SlotPosition == slot {
			return skill, nil
		}
	}
	return nil, errors.New("skill not found")
}

func (r *chatTestSkillRepo) Create(ctx context.Context, skill *domainskill.CharacterSkill) error {
	r.skills = append(r.skills, skill)
	return nil
}

func (r *chatTestSkillRepo) Update(ctx context.Context, skill *domainskill.CharacterSkill) error {
	for i, existing := range r.skills {
		if existing.ID == skill.ID {
			r.skills[i] = skill
			return nil
		}
	}
	r.skills = append(r.skills, skill)
	return nil
}

func (r *chatTestSkillRepo) Delete(ctx context.Context, id int64) error {
	filtered := r.skills[:0]
	for _, skill := range r.skills {
		if skill.ID != id {
			filtered = append(filtered, skill)
		}
	}
	r.skills = filtered
	return nil
}

func (r *chatTestSkillRepo) UpdateSlot(ctx context.Context, id int64, slot *int) error {
	for _, skill := range r.skills {
		if skill.ID == id {
			skill.SlotPosition = slot
			return nil
		}
	}
	return errors.New("skill not found")
}

func (r *chatTestSkillRepo) UpdateCooldown(ctx context.Context, id int64, cooldownEnd *string) error {
	return nil
}

func (r *chatTestSkillRepo) HasSkill(ctx context.Context, charID int64, skillID int) (bool, error) {
	for _, skill := range r.skills {
		if skill.CharacterID == charID && skill.SkillID == skillID {
			return true, nil
		}
	}
	return false, nil
}

func newChatSayTestContext(t *testing.T, char *domainchar.Character) (*Handler, *chatTestCharacterRepo, *infrartmp.RPCContext, *[]chatCallbackCall) {
	t.Helper()

	logger := zaptest.NewLogger(t)
	repo := &chatTestCharacterRepo{char: char}
	charService := appchar.NewService(repo, logger)
	skillService := appskill.NewService(&chatTestSkillRepo{
		skills: []*domainskill.CharacterSkill{
			{
				ID:          1,
				CharacterID: char.ID,
				SkillID:     1086,
				Level:       1,
			},
		},
	}, logger)
	sceneManager := infrartmp.NewSceneManager()
	handler := NewHandler(charService, nil, sceneManager, nil, nil, logger)
	handler.SetSkillService(skillService)

	calls := make([]chatCallbackCall, 0, 8)
	handler.sendCallbackFn = func(_ *infrartmp.Connection, method string, args ...interface{}) error {
		calls = append(calls, chatCallbackCall{method: method, args: args})
		return nil
	}

	conn := infrartmp.NewConnection(1, &chatStubNetConn{}, nil, logger)
	ctx := &infrartmp.RPCContext{
		Context:     context.Background(),
		CharacterID: strconv.FormatInt(char.ID, 10),
		Connection:  conn,
	}

	return handler, repo, ctx, &calls
}

func findCallback(calls []chatCallbackCall, method string) (chatCallbackCall, bool) {
	for _, c := range calls {
		if c.method == method {
			return c, true
		}
	}
	return chatCallbackCall{}, false
}

func TestSay_StatCurrencyFields_IncrementAndPersist(t *testing.T) {
	cases := []struct {
		name         string
		command      string
		expectedKey  string
		expectedAmt  float64
		assertTotals func(t *testing.T, char *domainchar.Character)
	}{
		{
			name:        "money",
			command:     "/stat money 100",
			expectedKey: "money",
			expectedAmt: 100,
			assertTotals: func(t *testing.T, char *domainchar.Character) {
				t.Helper()
				if char.Money != 150 {
					t.Fatalf("expected money=150, got %d", char.Money)
				}
			},
		},
		{
			name:        "moneybind",
			command:     "/stat moneybind 100",
			expectedKey: "moneyBind",
			expectedAmt: 100,
			assertTotals: func(t *testing.T, char *domainchar.Character) {
				t.Helper()
				if char.MoneyBind != 175 {
					t.Fatalf("expected moneyBind=175, got %d", char.MoneyBind)
				}
			},
		},
		{
			name:        "gold",
			command:     "/stat gold 10",
			expectedKey: "gold",
			expectedAmt: 10,
			assertTotals: func(t *testing.T, char *domainchar.Character) {
				t.Helper()
				if char.Gold != 17 {
					t.Fatalf("expected gold=17, got %d", char.Gold)
				}
			},
		},
		{
			name:        "goldbind",
			command:     "/stat goldbind 10",
			expectedKey: "goldBind",
			expectedAmt: 10,
			assertTotals: func(t *testing.T, char *domainchar.Character) {
				t.Helper()
				if char.GoldBind != 14 {
					t.Fatalf("expected goldBind=14, got %d", char.GoldBind)
				}
			},
		},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Experience: 0, Money: 50, MoneyBind: 75, Gold: 7, GoldBind: 4, GMLevel: 5}
			handler, repo, ctx, calls := newChatSayTestContext(t, char)

			_, err := handler.Say(ctx, []any{1, 2, 0, tc.command})
			if err != nil {
				t.Fatalf("expected no error, got %v", err)
			}

			if repo.updateCall != 1 {
				t.Fatalf("expected updateCall=1, got %d", repo.updateCall)
			}

			tc.assertTotals(t, char)

			onAddMoney, ok := findCallback(*calls, "onAddMoney")
			if !ok {
				t.Fatalf("expected onAddMoney callback")
			}
			if len(onAddMoney.args) != 4 {
				t.Fatalf("expected onAddMoney args len=4, got %d", len(onAddMoney.args))
			}
			if key, ok := onAddMoney.args[1].(string); !ok || key != tc.expectedKey {
				t.Fatalf("expected onAddMoney key=%s, got %#v", tc.expectedKey, onAddMoney.args[1])
			}
			if amt, ok := onAddMoney.args[2].(float64); !ok || amt != tc.expectedAmt {
				t.Fatalf("expected onAddMoney amount=%v, got %#v", tc.expectedAmt, onAddMoney.args[2])
			}

			onUPP, ok := findCallback(*calls, "onUPP")
			if !ok {
				t.Fatalf("expected onUPP callback")
			}
			if len(onUPP.args) != 1 {
				t.Fatalf("expected onUPP args len=1, got %d", len(onUPP.args))
			}
			uppMap, ok := onUPP.args[0].(map[string]interface{})
			if !ok {
				t.Fatalf("expected onUPP payload map, got %T", onUPP.args[0])
			}
			if _, ok := uppMap[tc.expectedKey]; !ok {
				t.Fatalf("expected onUPP payload key=%s", tc.expectedKey)
			}

			if _, ok := findCallback(*calls, "onSystemMidMsgOrNote"); !ok {
				t.Fatalf("expected onSystemMidMsgOrNote callback")
			}
		})
	}
}

func TestSay_StatExp_AppliesExperienceAndPersists(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Experience: 0, AttrPoints: 0, GMLevel: 5}
	handler, repo, ctx, calls := newChatSayTestContext(t, char)

	_, err := handler.Say(ctx, []any{1, 2, 0, "/stat exp 73"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if repo.updateCall != 1 {
		t.Fatalf("expected updateCall=1, got %d", repo.updateCall)
	}
	if char.Level != 2 {
		t.Fatalf("expected level=2, got %d", char.Level)
	}
	if char.Experience != 0 {
		t.Fatalf("expected exp=0, got %d", char.Experience)
	}
	if char.AttrPoints != 5 {
		t.Fatalf("expected attr points=5, got %d", char.AttrPoints)
	}

	onUPP, ok := findCallback(*calls, "onUPP")
	if !ok {
		t.Fatalf("expected onUPP callback")
	}
	if len(onUPP.args) != 1 {
		t.Fatalf("expected onUPP args len=1, got %d", len(onUPP.args))
	}
	uppMap, ok := onUPP.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("expected onUPP payload map, got %T", onUPP.args[0])
	}
	if uppMap["expSkill"] != int64(0) {
		t.Fatalf("expected expSkill=0 (delta after level up), got %#v", uppMap["expSkill"])
	}
	if uppMap["level"] != 2 {
		t.Fatalf("expected onUPP level=2, got %#v", uppMap["level"])
	}
	if uppMap["finalHp"] != 148 {
		t.Fatalf("expected onUPP finalHp=148, got %#v", uppMap["finalHp"])
	}
	if uppMap["finalMp"] != 79 {
		t.Fatalf("expected onUPP finalMp=79, got %#v", uppMap["finalMp"])
	}
	if uppMap["hpMax"] != 148 {
		t.Fatalf("expected onUPP hpMax=148, got %#v", uppMap["hpMax"])
	}
	if uppMap["attLastPoint"] != 5 {
		t.Fatalf("expected onUPP attLastPoint=5, got %#v", uppMap["attLastPoint"])
	}
	if uppMap["lastPoint"] != "5" {
		t.Fatalf("expected onUPP lastPoint=5, got %#v", uppMap["lastPoint"])
	}
	propMap, ok := uppMap["property"].(map[string]interface{})
	if !ok {
		t.Fatalf("expected onUPP property payload map, got %T", uppMap["property"])
	}
	if propMap["finalHp"] != 148 {
		t.Fatalf("expected onUPP property.finalHp=148, got %#v", propMap["finalHp"])
	}
	if propMap["finalMp"] != 79 {
		t.Fatalf("expected onUPP property.finalMp=79, got %#v", propMap["finalMp"])
	}
	if propMap["lastPoint"] != "5" {
		t.Fatalf("expected onUPP property.lastPoint=5, got %#v", propMap["lastPoint"])
	}

	onPlayerLevelUp, ok := findCallback(*calls, "onPlayerLevelUp")
	if !ok {
		t.Fatalf("expected onPlayerLevelUp callback")
	}
	if len(onPlayerLevelUp.args) != 1 {
		t.Fatalf("expected onPlayerLevelUp args len=1, got %d", len(onPlayerLevelUp.args))
	}
	lvlMap, ok := onPlayerLevelUp.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("expected onPlayerLevelUp payload map, got %T", onPlayerLevelUp.args[0])
	}
	if lvlMap["id"] != "1" {
		t.Fatalf("expected id=1, got %#v", lvlMap["id"])
	}
	if lvlMap["exp"] != int64(73) {
		t.Fatalf("expected exp=73 (cumulative capped), got %#v", lvlMap["exp"])
	}
	if lvlMap["lp"] != "5" {
		t.Fatalf("expected lp=5, got %#v", lvlMap["lp"])
	}
	if lvlMap["level"] != 2 {
		t.Fatalf("expected level=2, got %#v", lvlMap["level"])
	}

	if _, ok := findCallback(*calls, "lvUp"); !ok {
		t.Fatalf("expected lvUp callback")
	}
	if _, ok := findCallback(*calls, "onSystemMidMsgOrNote"); !ok {
		t.Fatalf("expected onSystemMidMsgOrNote callback")
	}
}

func TestSay_StatExp_LevelUpRefreshesSkillCallbacks(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Experience: 0, AttrPoints: 0, GMLevel: 5}
	handler, _, ctx, calls := newChatSayTestContext(t, char)

	_, err := handler.Say(ctx, []any{1, 2, 0, "/stat exp 73"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if _, ok := findCallback(*calls, "onSkillUpdate"); !ok {
		t.Fatalf("expected onSkillUpdate callback after level up")
	}
	if _, ok := findCallback(*calls, "onMWeaponSkillUpdate"); !ok {
		t.Fatalf("expected onMWeaponSkillUpdate callback after level up")
	}
}

func TestSay_GMCommands_RequireGMLevel(t *testing.T) {
	commands := []string{"/stat money 1", "/add 719 1"}

	for _, command := range commands {
		t.Run(command, func(t *testing.T) {
			char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, GMLevel: 4}
			handler, repo, ctx, calls := newChatSayTestContext(t, char)

			_, err := handler.Say(ctx, []any{1, 2, 0, command})
			if err != nil {
				t.Fatalf("expected no error, got %v", err)
			}
			if repo.updateCall != 0 {
				t.Fatalf("expected updateCall=0, got %d", repo.updateCall)
			}

			note, ok := findCallback(*calls, "onSystemMidMsgOrNote")
			if !ok {
				t.Fatalf("expected onSystemMidMsgOrNote callback")
			}
			if len(note.args) != 1 || note.args[0] != "Bạn cần gmLevel >= 5 để dùng lệnh GM" {
				t.Fatalf("expected gm permission note, got %#v", note.args)
			}
		})
	}
}

func TestSay_StatLevel_RaisesTargetLevelAndPersists(t *testing.T) {
	char := domainchar.NewCharacter(uuid.New(), "tester", 1, 0)
	char.ID = 1
	char.GMLevel = 5
	handler, repo, ctx, calls := newChatSayTestContext(t, char)

	_, err := handler.Say(ctx, []any{1, 2, 0, "/stat level 5"})
	if err != nil {
		t.Fatalf("expected no error, got %v", err)
	}

	if repo.updateCall != 1 {
		t.Fatalf("expected updateCall=1, got %d", repo.updateCall)
	}
	if char.Level != 5 {
		t.Fatalf("expected level=5, got %d", char.Level)
	}
	if char.Experience != 0 {
		t.Fatalf("expected exp=0, got %d", char.Experience)
	}
	if char.AttrPoints != 20 {
		t.Fatalf("expected attr points=20, got %d", char.AttrPoints)
	}

	onUPP, ok := findCallback(*calls, "onUPP")
	if !ok {
		t.Fatalf("expected onUPP callback")
	}
	uppMap, ok := onUPP.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("expected onUPP payload map, got %T", onUPP.args[0])
	}
	if uppMap["level"] != 5 {
		t.Fatalf("expected onUPP level=5, got %#v", uppMap["level"])
	}
	if uppMap["hpMax"] != 319 {
		t.Fatalf("expected onUPP hpMax=319, got %#v", uppMap["hpMax"])
	}
	if uppMap["attLastPoint"] != 20 {
		t.Fatalf("expected onUPP attLastPoint=20, got %#v", uppMap["attLastPoint"])
	}

	onPlayerLevelUp, ok := findCallback(*calls, "onPlayerLevelUp")
	if !ok {
		t.Fatalf("expected onPlayerLevelUp callback")
	}
	lvlMap, ok := onPlayerLevelUp.args[0].(map[string]interface{})
	if !ok {
		t.Fatalf("expected onPlayerLevelUp payload map, got %T", onPlayerLevelUp.args[0])
	}
	if lvlMap["level"] != 5 {
		t.Fatalf("expected onPlayerLevelUp level=5, got %#v", lvlMap["level"])
	}
	if lvlMap["lp"] != "20" {
		t.Fatalf("expected onPlayerLevelUp lp=20, got %#v", lvlMap["lp"])
	}

	if _, ok := findCallback(*calls, "lvUp"); !ok {
		t.Fatalf("expected lvUp callback")
	}
	if _, ok := findCallback(*calls, "onSystemMidMsgOrNote"); !ok {
		t.Fatalf("expected onSystemMidMsgOrNote callback")
	}
}

func TestSay_StatValidation_DoesNotPersistInvalidInputs(t *testing.T) {
	inputs := []string{"/stat", "/stat money", "/stat money 1 extra", "/stat money abc", "/stat money 0", "/stat money -1", "/stat unknown 10"}

	for _, input := range inputs {
		t.Run(input, func(t *testing.T) {
			char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Experience: 0, Money: 50, MoneyBind: 75, Gold: 7, GoldBind: 4, GMLevel: 5}
			handler, repo, ctx, calls := newChatSayTestContext(t, char)

			_, err := handler.Say(ctx, []any{1, 2, 0, input})
			if err != nil {
				t.Fatalf("expected no error for invalid input, got %v", err)
			}
			if repo.updateCall != 0 {
				t.Fatalf("expected updateCall=0, got %d", repo.updateCall)
			}
			if char.Money != 50 || char.MoneyBind != 75 || char.Gold != 7 || char.GoldBind != 4 || char.Experience != 0 || char.Level != 1 {
				t.Fatalf("expected character stats unchanged, got %+v", char)
			}

			note, ok := findCallback(*calls, "onSystemMidMsgOrNote")
			if !ok {
				t.Fatalf("expected onSystemMidMsgOrNote callback")
			}
			if input == "/stat" {
				if len(note.args) != 1 || note.args[0] != "Cú pháp: /stat <field> <amount>" {
					t.Fatalf("expected syntax note for /stat, got %#v", note.args)
				}
			}
		})
	}
}

func TestSay_Stat_GetCharacterError_ReturnsErrorAndDoesNotPersist(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, GMLevel: 5}
	handler, repo, ctx, calls := newChatSayTestContext(t, char)
	repo.findErr = errors.New("get by id failed")

	_, err := handler.Say(ctx, []any{1, 2, 0, "/stat money 1"})
	if err == nil {
		t.Fatalf("expected non-nil error")
	}
	if repo.updateCall != 0 {
		t.Fatalf("expected updateCall=0, got %d", repo.updateCall)
	}
	if _, ok := findCallback(*calls, "onSystemMidMsgOrNote"); ok {
		t.Fatalf("expected no success note callback when get character fails")
	}
}

func TestSay_Stat_SaveError_ReturnsErrorAndDoesNotSendSuccessMessage(t *testing.T) {
	char := &domainchar.Character{ID: 1, Name: "tester", Level: 1, Money: 10, GMLevel: 5}
	handler, repo, ctx, calls := newChatSayTestContext(t, char)
	repo.updateErr = errors.New("save failed")

	_, err := handler.Say(ctx, []any{1, 2, 0, "/stat money 1"})
	if err == nil {
		t.Fatalf("expected non-nil error")
	}
	if repo.updateCall != 1 {
		t.Fatalf("expected updateCall=1, got %d", repo.updateCall)
	}
	if _, ok := findCallback(*calls, "onSystemMidMsgOrNote"); ok {
		t.Fatalf("expected no success note callback when save fails")
	}
}
