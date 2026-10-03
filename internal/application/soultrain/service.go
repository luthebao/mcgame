// Open-sourced by BaoLT

// Soul training service implements the trainSoul RPC economy mutation.
// On each invocation it loads current soul progression from the DB,
// deducts a fixed mysteryCrystal cost, adds soul exp, applies level-ups
// while the cumulative exp threshold is met, persists soul state via
// SaveSoulProgression (writing to player.character_progression), and
// returns the updated soulLvl/soulExp pair.
//
// Currency deduction guard: DeductCurrency returns an error when the balance
// is insufficient, so no crystal is spent and no soul state is touched on the
// rejection path. Known forward-path deviation: if chars.Save (the deduction
// persist) succeeds but the subsequent SaveSoulProgression fails, the crystal
// is debited while the soul advancement is not. A future atomic DB function
// covering both mutations in one transaction will close this gap.
//
// FOR-UPDATE semantics: the single-connection-per-player session model means
// competing soul writes from the Flash client are serialised by the connection
// goroutine. Admin-initiated mutations are a known limitation documented as an
// open deviation; a future atomic DB function can close the gap when needed.
package soultrain

import (
	"context"
	"errors"
	"fmt"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
)

const (
	TrainCostMysteryCrystal = 4700
	TrainExpGain            = 10000
)

var (
	ErrInsufficientCrystal = errors.New("soultrain: not enough mysteryCrystal")
	ErrMaxSoulLevel        = errors.New("soultrain: soul is at maximum level")
)

type CharacterAccessor interface {
	GetByID(ctx context.Context, characterID int64) (*domainchar.Character, error)
	Save(ctx context.Context, char *domainchar.Character) error
}

type ProgressionAccessor interface {
	GetSoulProgression(ctx context.Context, charID int64) (soulLevel int, soulExp int64, err error)
	SaveSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error
}

type TrainResult struct {
	SoulLvl int
	SoulExp int64
}

type Service struct {
	chars       CharacterAccessor
	progression ProgressionAccessor
	gameData    *gamedata.Manager
}

func NewService(chars CharacterAccessor, progression ProgressionAccessor, gameData *gamedata.Manager) *Service {
	return &Service{chars: chars, progression: progression, gameData: gameData}
}

func (s *Service) Train(ctx context.Context, charID int64) (TrainResult, error) {
	soulLevel, soulExp, err := s.progression.GetSoulProgression(ctx, charID)
	if err != nil {
		return TrainResult{}, fmt.Errorf("soultrain: load soul progression: %w", err)
	}

	if s.isAtMaxLevel(soulLevel) {
		return TrainResult{}, ErrMaxSoulLevel
	}

	char, err := s.chars.GetByID(ctx, charID)
	if err != nil {
		return TrainResult{}, fmt.Errorf("soultrain: load character: %w", err)
	}
	if char == nil {
		return TrainResult{}, errors.New("soultrain: character not found")
	}

	if char.MysteryCrystal < TrainCostMysteryCrystal {
		return TrainResult{}, ErrInsufficientCrystal
	}

	if err := char.DeductCurrency(domainchar.CurrencyMysteryCrystal, TrainCostMysteryCrystal); err != nil {
		return TrainResult{}, ErrInsufficientCrystal
	}

	soulExp += TrainExpGain
	soulLevel = s.applyLevelUps(soulLevel, soulExp)

	if err := s.chars.Save(ctx, char); err != nil {
		return TrainResult{}, fmt.Errorf("soultrain: save character currency: %w", err)
	}

	if err := s.progression.SaveSoulProgression(ctx, charID, soulLevel, soulExp); err != nil {
		return TrainResult{}, fmt.Errorf("soultrain: save soul progression: %w", err)
	}

	return TrainResult{
		SoulLvl: soulLevel,
		SoulExp: soulExp,
	}, nil
}

func (s *Service) applyLevelUps(startLevel int, currentExp int64) int {
	if s.gameData == nil {
		return startLevel
	}
	level := startLevel
	for {
		nextLevel := level + 1
		tmpl := s.gameData.GetSoul(nextLevel)
		if tmpl == nil {
			break
		}
		if currentExp < int64(tmpl.RequireNum) {
			break
		}
		level = nextLevel
	}
	return level
}

func (s *Service) isAtMaxLevel(level int) bool {
	if s.gameData == nil {
		return false
	}
	return s.gameData.GetSoul(level+1) == nil
}
