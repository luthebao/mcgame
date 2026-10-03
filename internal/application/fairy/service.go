// Open-sourced by BaoLT

// Fairy (Tiểu Tinh Linh) application service. Persists the per-character fairy
// roster (feature_key='fairy') and skin unlock state (feature_key='fairy_skin')
// and serves the FairyManagerPanel RPCs:
//
//	responder-result: initCharFairy, fairyGrowUp, fairyRaise, addFairyExp, onSkill,
//	                  upFairySkill, getFairyResAndList, setFairyRes, setFairyResList
//	push (null responder): changeFairyState, delFairy, fairySkillConfigChange
//
// Fruits / skill-books / raise-materials are consumed from the normal item bag via
// ItemPort. Currency deductions (Money silver, Gold) mutate char + charRepo.Update
// without a separate currency push, matching stoneseal/soul/mount; the client
// reconciles on its next sync. Template stats for fairy templates are not looked up;
// all stat fields come from the persisted instance, which is the shape initCharFairy
// serves. Skill upgrade data (TBL_SKILL chains) are resolved via FairySkillData,
// injected after construction via SetSkillData; if nil, UpSkill degrades safely.
package fairy

import (
	"context"
	"errors"
	"fmt"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"
	domainfeature "mcgame-server/internal/domain/statfeature"
	"mcgame-server/internal/gamedata"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const (
	rosterFeatureKey = domainfeature.FeatureFairy
	skinFeatureKey   = domainfeature.FeatureFairySkin

	dailyCultivations = 10
	dailyFruitFeeds   = 10
)

var (
	ErrCharacterMissing  = errors.New("tinh linh: không tìm thấy nhân vật")
	ErrFairyMissing      = errors.New("tinh linh: không tìm thấy tinh linh")
	ErrItemNotFound      = errors.New("tinh linh: không tìm thấy vật phẩm")
	ErrMaxLevel          = errors.New("tinh linh: đã đạt cấp cao nhất")
	ErrMaxGrowLevel      = errors.New("tinh linh: trưởng thành đã tối đa")
	ErrNoCultivations    = errors.New("tinh linh: hết lần nuôi dưỡng hôm nay")
	ErrNoFeeds           = errors.New("tinh linh: hết lần cho ăn hôm nay")
	ErrSatietyFull       = errors.New("tinh linh: độ no đã đầy")
	ErrInsufficientGold  = errors.New("tinh linh: không đủ vàng")
	ErrInsufficientMoney = errors.New("tinh linh: không đủ bạc")
	ErrInvalidGrowType   = errors.New("tinh linh: loại nuôi dưỡng không hợp lệ")
	ErrSkillDuplicate    = errors.New("tinh linh: đã học kỹ năng này")
	ErrSkillFailed       = errors.New("tinh linh: học kỹ năng thất bại")
	ErrSkinNotOwned      = errors.New("tinh linh: chưa sở hữu ngoại hình")
	ErrSkinOwned         = errors.New("tinh linh: đã sở hữu ngoại hình")
)

type ItemPort interface {
	GetItemByID(ctx context.Context, charID int64, itemID int64) (*domainitem.Item, error)
	ConsumeItemStackByID(ctx context.Context, charID int64, itemID int64, count int) (*domainitem.Item, bool, error)
	ConsumeItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) (bool, error)
	AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error)
	IsDiamondItem(templateID int) bool
}

type FairySkillData interface {
	GetSkill(id int) *models.SkillTemplate
	GetAllSkills() []*models.SkillTemplate
}

type Clock interface {
	Now() time.Time
}

type systemClock struct{}

func (systemClock) Now() time.Time { return time.Now() }

type Service struct {
	featureRepo domainfeature.Repository
	charRepo    domainchar.Repository
	items       ItemPort
	gameData    *gamedata.Manager
	skillData   FairySkillData
	clock       Clock
	logger      *zap.Logger
}

func NewService(featureRepo domainfeature.Repository, charRepo domainchar.Repository, items ItemPort, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{
		featureRepo: featureRepo,
		charRepo:    charRepo,
		items:       items,
		gameData:    gameData,
		clock:       systemClock{},
		logger:      logger,
	}
}

func (s *Service) SetSkillData(sd FairySkillData) {
	if s == nil || sd == nil {
		return
	}
	s.skillData = sd
}

func (s *Service) loadState(ctx context.Context, charID int64) (*State, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("fairy: load feature states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == rosterFeatureKey {
			return stateFromMap(st.State), nil
		}
	}
	return defaultState(), nil
}

func (s *Service) saveState(ctx context.Context, charID int64, state *State) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  rosterFeatureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) loadSkinState(ctx context.Context, charID int64) (*SkinState, error) {
	states, err := s.featureRepo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("fairy: load skin states: %w", err)
	}
	for _, st := range states {
		if st != nil && st.FeatureKey == skinFeatureKey {
			return skinStateFromMap(st.State), nil
		}
	}
	return defaultSkinState(), nil
}

func (s *Service) saveSkinState(ctx context.Context, charID int64, state *SkinState) error {
	return s.featureRepo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  skinFeatureKey,
		State:       state.toPersist(),
	})
}

func (s *Service) loadChar(ctx context.Context, charID int64) (*domainchar.Character, error) {
	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("fairy: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	return char, nil
}

func (s *Service) Roster(ctx context.Context, charID int64) (map[string]interface{}, error) {
	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}
	changed := false
	for _, f := range state.Fairies {
		if s.refreshDaily(f) {
			changed = true
		}
	}
	if changed {
		if err := s.saveState(ctx, charID, state); err != nil {
			return nil, err
		}
	}
	return state.toRoster(), nil
}

func (s *Service) today() string {
	return s.clock.Now().UTC().Format("2006-01-02")
}

func (s *Service) refreshDaily(f *Fairy) bool {
	today := s.today()
	if f.ResetDay == today {
		return false
	}
	f.ResetDay = today
	f.Gnum = dailyCultivations
	f.En = dailyFruitFeeds
	return true
}

func deductGold(char *domainchar.Character, amount int) error {
	if amount <= 0 {
		return nil
	}
	if char.Gold < int64(amount) {
		return ErrInsufficientGold
	}
	char.Gold -= int64(amount)
	return nil
}

func deductMoney(char *domainchar.Character, amount int) error {
	if amount <= 0 {
		return nil
	}
	if char.Money < int64(amount) {
		return ErrInsufficientMoney
	}
	char.Money -= int64(amount)
	return nil
}
