// Open-sourced by BaoLT

// Arena entities for pet battle ranking and season management.
// ArenaRanking tracks character ratings with Elo-based matchmaking.
// Supports tickets, win streaks, and seasonal rewards.
package petarena

import (
	"fmt"
	"time"
)

type ArenaRanking struct {
	ID                int64
	CharacterID       int64
	PetID             *int64
	Rating            int
	Wins              int
	Losses            int
	WinStreak         int
	MaxWinStreak      int
	Season            int
	Tickets           int
	MaxTickets        int
	LastTicketRefresh time.Time
	LastFightAt       *time.Time
	CreatedAt         time.Time
	UpdatedAt         time.Time
}

type ArenaBattle struct {
	ID                   int64
	AttackerID           int64
	DefenderID           int64
	AttackerPetID        int64
	DefenderPetID        int64
	AttackerRatingBefore int
	DefenderRatingBefore int
	WinnerID             *int64
	RatingChange         int
	BattleLog            []BattleRound
	Season               int
	CreatedAt            time.Time
}

type ArenaReward struct {
	ID             int64
	CharacterID    int64
	Season         int
	Rank           int
	Rating         int
	RewardsClaimed map[string]interface{}
	ClaimedAt      *time.Time
	CreatedAt      time.Time
}

type ArenaConfig struct {
	Season              int
	MaxTickets          int
	TicketRefreshHours  int
	BaseRating          int
	RatingKFactor       int
	WinStreakBonusStart int
}

func DefaultArenaConfig() *ArenaConfig {
	return &ArenaConfig{
		Season:              1,
		MaxTickets:          10,
		TicketRefreshHours:  6,
		BaseRating:          1000,
		RatingKFactor:       32,
		WinStreakBonusStart: 3,
	}
}

func NewArenaRanking(characterID int64, season int) *ArenaRanking {
	now := time.Now()
	config := DefaultArenaConfig()
	return &ArenaRanking{
		CharacterID:       characterID,
		Rating:            config.BaseRating,
		Wins:              0,
		Losses:            0,
		WinStreak:         0,
		MaxWinStreak:      0,
		Season:            season,
		Tickets:           config.MaxTickets,
		MaxTickets:        config.MaxTickets,
		LastTicketRefresh: now,
		CreatedAt:         now,
		UpdatedAt:         now,
	}
}

func (r *ArenaRanking) CanFight() bool {
	return r.Tickets > 0
}

func (r *ArenaRanking) UseTicket() bool {
	if r.Tickets <= 0 {
		return false
	}
	r.Tickets--
	r.UpdatedAt = time.Now()
	return true
}

func (r *ArenaRanking) RefreshTickets() bool {
	config := DefaultArenaConfig()
	hoursSinceRefresh := time.Since(r.LastTicketRefresh).Hours()

	ticketsToAdd := int(hoursSinceRefresh) / config.TicketRefreshHours
	if ticketsToAdd <= 0 {
		return false
	}

	r.Tickets += ticketsToAdd
	if r.Tickets > r.MaxTickets {
		r.Tickets = r.MaxTickets
	}
	r.LastTicketRefresh = time.Now()
	r.UpdatedAt = time.Now()
	return true
}

func (r *ArenaRanking) RecordWin(ratingChange int) {
	r.Wins++
	r.WinStreak++
	if r.WinStreak > r.MaxWinStreak {
		r.MaxWinStreak = r.WinStreak
	}
	r.Rating += ratingChange
	now := time.Now()
	r.LastFightAt = &now
	r.UpdatedAt = now
}

func (r *ArenaRanking) RecordLoss(ratingChange int) {
	r.Losses++
	r.WinStreak = 0
	r.Rating -= ratingChange
	if r.Rating < 0 {
		r.Rating = 0
	}
	now := time.Now()
	r.LastFightAt = &now
	r.UpdatedAt = now
}

func (r *ArenaRanking) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"rating":       r.Rating,
		"wins":         r.Wins,
		"losses":       r.Losses,
		"winStreak":    r.WinStreak,
		"maxWinStreak": r.MaxWinStreak,
		"season":       r.Season,
		"tickets":      r.Tickets,
		"maxTickets":   r.MaxTickets,
	}
	if r.PetID != nil {
		dto["petId"] = *r.PetID
	}
	return dto
}

func (b *ArenaBattle) ToDTO() map[string]interface{} {
	rounds := make([]map[string]interface{}, len(b.BattleLog))
	for i, r := range b.BattleLog {
		rounds[i] = r.ToDTO()
	}

	dto := map[string]interface{}{
		"id":            b.ID,
		"attackerId":    fmt.Sprintf("%d", b.AttackerID),
		"defenderId":    fmt.Sprintf("%d", b.DefenderID),
		"attackerPetId": b.AttackerPetID,
		"defenderPetId": b.DefenderPetID,
		"ratingChange":  b.RatingChange,
		"battleLog":     rounds,
		"createdAt":     b.CreatedAt.Unix(),
	}
	if b.WinnerID != nil {
		dto["winnerId"] = fmt.Sprintf("%d", *b.WinnerID)
	}
	return dto
}
