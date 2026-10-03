// Open-sourced by BaoLT

// Deferred rune actions for login-snapshot parity: socketing (runeSet/runeRemove),
// rune up-level (runeUpLvl), dissolve (runeResolve), and chip->rune exchange (exchangeRune).
//
// SOCKETING CROSS-STORE MODEL
// Socketing a rune does NOT mutate the rune bag's shape beyond removing a copy;
// the socketed rune lives in the dress-owned DecoHoleState (the deco_hole feature),
// in a per-decoPosition 16-slot R[] array plus an N count, echoed to the client as
// the decoInfo blob (holeToWire: r1..r16 + n). The dress package exposes no
// set/clear-rune-slot API, so this package depends on the small local
// DecoRuneSlotWriter interface (bound by main.go to an adapter over
// dress.DecoHoleService). runeSet/runeRemove are atomic consume-then-credit across
// the two stores: the bag (FeatureRune, this package) is persisted as the COST
// before the benefit, and a mid-failure refunds/re-sets so a copy is never lost or
// duplicated.
//
// CALIBRATED SLOT MAPPING (was the one documented assumption; now confirmed against
// the live client: DecoratePanel.updateDecoRuneProp reads r[(2*N)-1] for CHA and
// r[2*N] for PET, and RuneSlot.dragDropHandler passes runeChaHolePos in {1,3..15}
// and runePetHolePos in {2,4..16}). holePos is 1-BASED and indexes directly:
// holePos N -> R[N-1]. CHA runes occupy odd holePos, PET runes even holePos, all in
// the SAME shared 16-slot R[] array per decoPosition. The single tunable constant is
// runeHoleSlotBase (the 1->0 offset) below.
package rune

import (
	"context"
	"errors"
	"fmt"
	"strconv"

	"go.uber.org/zap"
)

const (
	runeHoleSlotBase = 1

	runeHolePosMin = 1
	runeHolePosMax = 16

	runeKindCha = 1
	runeKindPet = 2
)

var (
	ErrRuneNotInBag     = errors.New("rune: rune not present at bag position")
	ErrRuneInvalidHole  = errors.New("rune: invalid hole position")
	ErrRuneKindMismatch = errors.New("rune: rune kind does not match bag type")
	ErrRuneNoSlotWriter = errors.New("rune: deco-rune slot writer not configured")
	ErrRuneNoGameData   = errors.New("rune: game data provider not configured")
	ErrRuneNoCharProv   = errors.New("rune: character provider not configured")
	ErrRuneUpEmpty      = errors.New("rune: up-level hole is empty")
	ErrRuneUpMaxed      = errors.New("rune: rune is already at max level")
	ErrRuneUpNotEnough  = errors.New("rune: not enough rune exp to up-level")
)

type DecoRuneSlotWriter interface {
	SetRuneSlot(ctx context.Context, charID int64, decoPosition, slotIdx, runeID int) (map[string]interface{}, error)
	ClearRuneSlot(ctx context.Context, charID int64, decoPosition, slotIdx int) (map[string]interface{}, int, error)
	DecoInfoWire(ctx context.Context, charID int64) (map[string]interface{}, error)
}

type RuneGameData interface {
	GetDecoRune(id int) *RuneTemplate
	GetRuneChipInfo(chipID int) *RuneChipInfo
}

type RuneTemplate struct {
	ID       int
	Kind     int
	NextID   int
	Exp      int
	UpExp    int
	PropType int
	PropNum  int
}

type RuneChipInfo struct {
	ChipID int
	RuneID int
	Num    int
}

type RuneCharProvider interface {
	GetRuneExp(ctx context.Context, charID int64) (int, error)
	AddRuneExp(ctx context.Context, charID int64, amount int) error
	DeductRuneExp(ctx context.Context, charID int64, amount int) error
}

func (s *Service) SetDecoRuneSlotWriter(w DecoRuneSlotWriter) {
	if s == nil {
		return
	}
	s.slotWriter = w
}

func (s *Service) SetRuneGameData(g RuneGameData) {
	if s == nil {
		return
	}
	s.gameData = g
}

func (s *Service) SetRuneCharProvider(p RuneCharProvider) {
	if s == nil {
		return
	}
	s.charProvider = p
}

func holePosToSlotIndex(holePos int) (int, bool) {
	if holePos < runeHolePosMin || holePos > runeHolePosMax {
		return 0, false
	}
	return holePos - runeHoleSlotBase, true
}

func bagKindForType(bagType int) int {
	if bagType == BagTypePet {
		return runeKindPet
	}
	return runeKindCha
}

func (s *Service) RuneSet(ctx context.Context, charID int64, bagPos, holePos, bagType, decoPosition int) (map[string]interface{}, error) {
	if charID <= 0 {
		return nil, ErrInvalidCharacterID
	}
	if s.slotWriter == nil {
		return nil, ErrRuneNoSlotWriter
	}
	if s.gameData == nil {
		return nil, ErrRuneNoGameData
	}
	slotIdx, ok := holePosToSlotIndex(holePos)
	if !ok {
		return nil, ErrRuneInvalidHole
	}

	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return nil, err
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return nil, fmt.Errorf("rune: invalid bag type %d", bagType)
	}
	key := strconv.Itoa(bagPos)
	slot, ok := (*target)[key]
	if !ok || slot.R <= 0 || slot.N <= 0 {
		return nil, ErrRuneNotInBag
	}

	tpl := s.gameData.GetDecoRune(slot.R)
	if tpl == nil {
		return nil, ErrRuneNoGameData
	}
	if tpl.Kind != bagKindForType(bagType) {
		return nil, ErrRuneKindMismatch
	}

	runeID := slot.R
	if slot.N > 1 {
		slot.N--
		(*target)[key] = slot
	} else {
		delete(*target, key)
	}
	if saveErr := s.SaveRuneBag(ctx, charID, bag); saveErr != nil {
		return nil, fmt.Errorf("rune: persist bag before socket: %w", saveErr)
	}

	wire, setErr := s.slotWriter.SetRuneSlot(ctx, charID, decoPosition, slotIdx, runeID)
	if setErr != nil {
		s.refundRune(ctx, charID, bagType, runeID, key)
		return nil, fmt.Errorf("rune: write deco slot: %w", setErr)
	}
	return wire, nil
}

func (s *Service) RuneRemove(ctx context.Context, charID int64, holePos, bagPos, bagType, decoPosition int) (map[string]interface{}, error) {
	if charID <= 0 {
		return nil, ErrInvalidCharacterID
	}
	if s.slotWriter == nil {
		return nil, ErrRuneNoSlotWriter
	}
	slotIdx, ok := holePosToSlotIndex(holePos)
	if !ok {
		return nil, ErrRuneInvalidHole
	}

	wire, prevRuneID, clearErr := s.slotWriter.ClearRuneSlot(ctx, charID, decoPosition, slotIdx)
	if clearErr != nil {
		return nil, fmt.Errorf("rune: clear deco slot: %w", clearErr)
	}
	if prevRuneID <= 0 {
		return wire, nil
	}

	if _, addErr := s.AddRuneToBagAt(ctx, charID, bagType, bagPos, prevRuneID, 1); addErr != nil {
		if _, reAddErr := s.AddRuneToBag(ctx, charID, bagType, prevRuneID, 1); reAddErr != nil {
			s.logf("runeRemove: deco slot cleared but bag credit failed",
				zap.Int64("character_id", charID),
				zap.Int("rune_id", prevRuneID),
				zap.Error(addErr))
		}
	}

	updated, wireErr := s.slotWriter.DecoInfoWire(ctx, charID)
	if wireErr != nil {
		return wire, nil
	}
	return updated, nil
}

func (s *Service) refundRune(ctx context.Context, charID int64, bagType, runeID int, key string) {
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		s.logf("rune: refund load failed", zap.Int64("character_id", charID), zap.Error(err))
		return
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return
	}
	if slot, ok := (*target)[key]; ok && slot.R == runeID {
		slot.N++
		(*target)[key] = slot
	} else {
		pos := firstFreeBagPos(*target)
		if pos < 0 {
			s.logf("rune: refund failed, bag full", zap.Int64("character_id", charID), zap.Int("rune_id", runeID))
			return
		}
		(*target)[strconv.Itoa(pos)] = RuneSlot{N: 1, R: runeID}
	}
	if saveErr := s.SaveRuneBag(ctx, charID, bag); saveErr != nil {
		s.logf("rune: refund save failed", zap.Int64("character_id", charID), zap.Error(saveErr))
	}
}

func (s *Service) AddRuneToBagAt(ctx context.Context, charID int64, bagType, bagPos, runeID, n int) (RuneBag, error) {
	if charID <= 0 {
		return RuneBag{}, ErrInvalidCharacterID
	}
	if runeID <= 0 || n <= 0 {
		return RuneBag{}, fmt.Errorf("rune: invalid runeID %d or count %d", runeID, n)
	}
	bag, err := s.GetRuneBag(ctx, charID)
	if err != nil {
		return RuneBag{}, err
	}
	target := bagByType(&bag, bagType)
	if target == nil {
		return RuneBag{}, fmt.Errorf("rune: invalid bag type %d", bagType)
	}
	if bagPos < 0 {
		return s.AddRuneToBag(ctx, charID, bagType, runeID, n)
	}
	key := strconv.Itoa(bagPos)
	if slot, ok := (*target)[key]; ok {
		if slot.R != runeID {
			return s.AddRuneToBag(ctx, charID, bagType, runeID, n)
		}
		slot.N += n
		(*target)[key] = slot
	} else {
		(*target)[key] = RuneSlot{N: n, R: runeID}
	}
	if saveErr := s.SaveRuneBag(ctx, charID, bag); saveErr != nil {
		return RuneBag{}, saveErr
	}
	return bag, nil
}

func (s *Service) logf(msg string, fields ...zap.Field) {
	if s == nil || s.logger == nil {
		return
	}
	s.logger.Warn(msg, fields...)
}
