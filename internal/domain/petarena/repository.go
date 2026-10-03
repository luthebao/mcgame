// Open-sourced by BaoLT

// Repository interface for pet arena persistence.
// Handles rankings, battles, rewards, and matchmaking queries.
// Supports seasonal leaderboards and opponent finding.
package petarena

import (
	"context"
)

type Repository interface {
	GetRanking(ctx context.Context, characterID int64, season int) (*ArenaRanking, error)
	GetOrCreateRanking(ctx context.Context, characterID int64, season int) (*ArenaRanking, error)
	SaveRanking(ctx context.Context, ranking *ArenaRanking) error
	GetTopRankings(ctx context.Context, season int, limit, offset int) ([]*ArenaRanking, error)
	GetRank(ctx context.Context, characterID int64, season int) (int, error)

	SaveBattle(ctx context.Context, battle *ArenaBattle) error
	GetBattle(ctx context.Context, battleID int64) (*ArenaBattle, error)
	GetBattleHistory(ctx context.Context, characterID int64, limit int) ([]*ArenaBattle, error)

	GetReward(ctx context.Context, characterID int64, season int) (*ArenaReward, error)
	SaveReward(ctx context.Context, reward *ArenaReward) error

	FindOpponents(ctx context.Context, characterID int64, rating int, season int, limit int) ([]*ArenaRanking, error)
	GetFightConfig(ctx context.Context, characterID int64, configKey string) (*FightConfig, error)
	SaveFightConfig(ctx context.Context, config *FightConfig) error
	GetEntry(ctx context.Context, characterID int64, season int) (*Entry, error)
	SaveEntry(ctx context.Context, entry *Entry) error
	ListEntries(ctx context.Context, season int, limit int) ([]*Entry, error)
}
