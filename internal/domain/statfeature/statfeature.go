// Open-sourced by BaoLT

// Stat feature domain models describe persisted player state for systems that modify character or pet stats.
package statfeature

import (
	"context"
	"errors"
)

var ErrPPVEMaxFloor = errors.New("ppve: already at max floor")
var ErrPPVENoFreeChallenges = errors.New("ppve: no free challenges remaining")

const (
	FeatureAwakening       = "awakening"
	FeatureSoul            = "soul"
	FeatureMagicArray      = "magic_array"
	FeatureHeiyaoshi       = "heiyaoshi"
	FeaturePMDailyBuff     = "pm_daily_buff"
	FeatureStoneSeal       = "stone_seal"
	FeaturePRS             = "prs"
	FeatureMedal           = "medal"
	FeatureExplorerMedal   = "explorer_medal"
	FeatureWarSprite       = "war_sprite"
	FeatureMonsterHeart    = "monster_heart"
	FeatureActivePet       = "active_pet"
	FeatureContractPet     = "contract_pet"
	FeaturePetTalent       = "pet_talent"
	FeaturePetStone        = "pet_stone"
	FeatureMagicCrystal    = "magic_crystal"
	FeatureStars           = "stars"
	FeatureRune            = "rune"
	FeatureRuneChip        = "rune_chip"
	FeaturePetPVE          = "pet_pve"
	FeatureDecoHole        = "deco_hole"
	FeatureMysteryTreasure = "mystery_treasure"
	FeatureMount           = "mount"
	FeaturePetSoul         = "pet_soul"
	FeatureLotto           = "lotto"
	FeaturePraBuff         = "pra_buff"
	FeatureFairy           = "fairy"
	FeatureFairySkin       = "fairy_skin"
	FeaturePetStoneInlay   = "pet_stone_inlay"
)

type CharacterProgression struct {
	CharacterID      int64
	AwakenLevel      int
	AwakenPoints     int
	AwakenPointsUsed int
	SoulLevel        int
	SoulExp          int64
	SoulPoints       int64
}

type CharacterFeatureState struct {
	CharacterID int64
	FeatureKey  string
	State       map[string]interface{}
}

type PetFeatureState struct {
	PetID      int64
	FeatureKey string
	State      map[string]interface{}
}

type ActiveMount struct {
	CharacterID int64
	MountID     int
	Level       int
	Experience  int64
	IsActive    bool
}

type PPVEChallengeResult struct {
	NewFloor     int
	FreeTime     int
	TodayFloor   int
	LastResetDay string
}

type PPVERankRow struct {
	CID      string
	Name     string
	ClassID  string
	Level    int
	FloorNum int
}

type PPVERankResult struct {
	Entries []PPVERankRow
	MyRank  int
}

type Repository interface {
	GetCharacterProgression(ctx context.Context, charID int64) (*CharacterProgression, error)
	UpsertCharacterSoulProgression(ctx context.Context, charID int64, soulLevel int, soulExp int64) error
	ListCharacterFeatureStates(ctx context.Context, charID int64) ([]*CharacterFeatureState, error)
	UpsertCharacterFeatureState(ctx context.Context, state *CharacterFeatureState) error
	ListPetFeatureStates(ctx context.Context, petID int64) ([]*PetFeatureState, error)
	UpsertPetFeatureState(ctx context.Context, state *PetFeatureState) error
	GetActiveMount(ctx context.Context, charID int64) (*ActiveMount, error)
	PPVEChallengeNextFloor(ctx context.Context, charID int64, maxFloor int, freeChallenges int, today string) (*PPVEChallengeResult, error)
}
