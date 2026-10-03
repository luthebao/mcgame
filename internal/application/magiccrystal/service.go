// Open-sourced by BaoLT

package magiccrystal

import (
	"context"
	"errors"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
	domainfeature "mcgame-server/internal/domain/statfeature"

	"go.uber.org/zap"
)

const (
	PointTypePower = "1"
	PointTypeSoul  = "2"
	MaxAddPower    = 10000
)

var (
	ErrInvalidIndex      = errors.New("invalid crystal index")
	ErrInvalidAmount     = errors.New("invalid power amount")
	ErrInvalidPointType  = errors.New("invalid point type")
	ErrSlotInactive      = errors.New("slot not activated")
	ErrSlotAlreadyActive = errors.New("slot already activated")
	ErrSlotMaxLevel      = errors.New("slot at max level")
	ErrSlotFull          = errors.New("slot full")
	ErrSlotEmpty         = errors.New("slot empty")
	ErrInsufficientRec   = errors.New("not enough recovery dust")
	ErrInsufficientPre   = errors.New("not enough permanent crystal points")
	ErrInsufficientLimit = errors.New("not enough limit crystal points")
)

type CharacterAccessor interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
	Save(ctx context.Context, char *domainchar.Character) error
}

type Service struct {
	repo   domainfeature.Repository
	chars  CharacterAccessor
	logger *zap.Logger
}

func NewService(repo domainfeature.Repository, chars CharacterAccessor, logger *zap.Logger) *Service {
	return &Service{repo: repo, chars: chars, logger: logger}
}

type Crystal struct {
	Index int `json:"index"`
	A     int `json:"a"`
	Max   int `json:"max"`
	L     int `json:"l"`
	S     int `json:"s"`
	Lv    int `json:"lv"`
}

type ResourceDelta struct {
	Field    string
	NewTotal int
}

type MutationResult struct {
	Crystal Crystal
	Deltas  []ResourceDelta
}

func defaultCrystals() []Crystal {
	out := make([]Crystal, MaxSlots)
	for i := 0; i < MaxSlots; i++ {
		out[i] = Crystal{Index: i}
	}
	return out
}

func (s *Service) Load(ctx context.Context, charID int64) ([]Crystal, error) {
	if s == nil || s.repo == nil {
		return defaultCrystals(), nil
	}
	states, err := s.repo.ListCharacterFeatureStates(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("magiccrystal: load feature state: %w", err)
	}
	for _, st := range states {
		if st == nil || st.FeatureKey != domainfeature.FeatureMagicCrystal {
			continue
		}
		return decodeCrystals(st.State), nil
	}
	return defaultCrystals(), nil
}

func (s *Service) saveCrystals(ctx context.Context, charID int64, crystals []Crystal) error {
	if s == nil || s.repo == nil {
		return nil
	}
	state := encodeCrystals(crystals)
	return s.repo.UpsertCharacterFeatureState(ctx, &domainfeature.CharacterFeatureState{
		CharacterID: charID,
		FeatureKey:  domainfeature.FeatureMagicCrystal,
		State:       state,
	})
}

func (s *Service) Activate(ctx context.Context, charID int64, slot int) (MutationResult, error) {
	if !validSlot(slot) {
		return MutationResult{}, ErrInvalidIndex
	}
	cost, _ := ActivateCost(slot)

	char, err := s.loadCharacter(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}

	crystals, err := s.Load(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}
	c := &crystals[slot]
	if c.A == 1 {
		return MutationResult{}, ErrSlotAlreadyActive
	}

	if err := char.DeductCurrency(domainchar.CurrencyMagicCrystalRec, cost); err != nil {
		return MutationResult{}, ErrInsufficientRec
	}

	c.A = 1
	c.Lv = 0
	c.Max = SlotMaxAt(0)

	if err := s.persist(ctx, char, crystals); err != nil {
		return MutationResult{}, err
	}

	return MutationResult{
		Crystal: *c,
		Deltas: []ResourceDelta{
			{Field: FieldRec, NewTotal: char.MagicCrystalRec},
		},
	}, nil
}

func (s *Service) LevelUp(ctx context.Context, charID int64, slot int) (MutationResult, error) {
	if !validSlot(slot) {
		return MutationResult{}, ErrInvalidIndex
	}

	char, err := s.loadCharacter(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}

	crystals, err := s.Load(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}
	c := &crystals[slot]
	if c.A != 1 {
		return MutationResult{}, ErrSlotInactive
	}
	if c.Lv >= MaxLevel {
		return MutationResult{}, ErrSlotMaxLevel
	}

	cost, _ := LevelUpCost(slot, c.Lv)
	if cost <= 0 {
		return MutationResult{}, ErrSlotMaxLevel
	}
	if err := char.DeductCurrency(domainchar.CurrencyMagicCrystalRec, cost); err != nil {
		return MutationResult{}, ErrInsufficientRec
	}

	c.Lv++
	c.Max = SlotMaxAt(c.Lv)

	if err := s.persist(ctx, char, crystals); err != nil {
		return MutationResult{}, err
	}

	return MutationResult{
		Crystal: *c,
		Deltas: []ResourceDelta{
			{Field: FieldRec, NewTotal: char.MagicCrystalRec},
		},
	}, nil
}

func (s *Service) AddPower(ctx context.Context, charID int64, slot, amount int, pointType string) (MutationResult, error) {
	if !validSlot(slot) {
		return MutationResult{}, ErrInvalidIndex
	}
	if amount <= 0 || amount > MaxAddPower {
		return MutationResult{}, ErrInvalidAmount
	}
	if pointType != PointTypePower && pointType != PointTypeSoul {
		return MutationResult{}, ErrInvalidPointType
	}

	char, err := s.loadCharacter(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}

	crystals, err := s.Load(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}
	c := &crystals[slot]
	if c.A != 1 {
		return MutationResult{}, ErrSlotInactive
	}
	if c.Max <= 0 {
		c.Max = SlotMaxAt(c.Lv)
	}
	if c.L+c.S+amount > c.Max {
		return MutationResult{}, ErrSlotFull
	}

	var (
		deltaField string
		newTotal   int
	)
	switch pointType {
	case PointTypePower:
		if err := char.DeductCurrency(domainchar.CurrencyMagicCrystalPre, amount); err != nil {
			return MutationResult{}, ErrInsufficientPre
		}
		c.L += amount
		deltaField = FieldPre
		newTotal = char.MagicCrystalPre
	case PointTypeSoul:
		if err := char.DeductCurrency(domainchar.CurrencyMagicCrystalLimit, amount); err != nil {
			return MutationResult{}, ErrInsufficientLimit
		}
		c.S += amount
		deltaField = FieldLimit
		newTotal = char.MagicCrystalLimit
	}

	if err := s.persist(ctx, char, crystals); err != nil {
		return MutationResult{}, err
	}

	return MutationResult{
		Crystal: *c,
		Deltas: []ResourceDelta{
			{Field: deltaField, NewTotal: newTotal},
		},
	}, nil
}

func (s *Service) Recover(ctx context.Context, charID int64, slot int) (MutationResult, error) {
	if !validSlot(slot) {
		return MutationResult{}, ErrInvalidIndex
	}

	char, err := s.loadCharacter(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}

	crystals, err := s.Load(ctx, charID)
	if err != nil {
		return MutationResult{}, err
	}
	c := &crystals[slot]
	if c.A != 1 {
		return MutationResult{}, ErrSlotInactive
	}
	if c.L+c.S <= 0 {
		return MutationResult{}, ErrSlotEmpty
	}

	if err := char.DeductCurrency(domainchar.CurrencyMagicCrystalRec, RecoveryDustCost); err != nil {
		return MutationResult{}, ErrInsufficientRec
	}
	refundedL := c.L
	refundedS := c.S
	if err := char.AddCurrency(domainchar.CurrencyMagicCrystalPre, refundedL); err != nil {
		return MutationResult{}, err
	}
	if err := char.AddCurrency(domainchar.CurrencyMagicCrystalLimit, refundedS); err != nil {
		return MutationResult{}, err
	}
	c.L = 0
	c.S = 0

	if err := s.persist(ctx, char, crystals); err != nil {
		return MutationResult{}, err
	}

	return MutationResult{
		Crystal: *c,
		Deltas: []ResourceDelta{
			{Field: FieldRec, NewTotal: char.MagicCrystalRec},
			{Field: FieldPre, NewTotal: char.MagicCrystalPre},
			{Field: FieldLimit, NewTotal: char.MagicCrystalLimit},
		},
	}, nil
}

func (s *Service) loadCharacter(ctx context.Context, charID int64) (*domainchar.Character, error) {
	if s == nil || s.chars == nil {
		return nil, errors.New("magiccrystal: character accessor not configured")
	}
	char, err := s.chars.GetByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("magiccrystal: load character: %w", err)
	}
	if char == nil {
		return nil, errors.New("magiccrystal: character not found")
	}
	return char, nil
}

func (s *Service) persist(ctx context.Context, char *domainchar.Character, crystals []Crystal) error {
	if err := s.saveCrystals(ctx, char.ID, crystals); err != nil {
		return fmt.Errorf("magiccrystal: save state: %w", err)
	}
	if err := s.chars.Save(ctx, char); err != nil {
		return fmt.Errorf("magiccrystal: save character: %w", err)
	}
	return nil
}
