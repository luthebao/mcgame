// Open-sourced by BaoLT

// Marriage domain contracts for panel state and persisted couples.
package marriage

import (
	"context"
	"time"
)

type SeekingEntry struct {
	CharacterID int64 `json:"characterId"`
	Content     string `json:"content"`
	Flag        int    `json:"flag"`
	AddDate     int64  `json:"addDate"`
}

type RequestEntry struct {
	ID        int64  `json:"id"`
	FromID    int64  `json:"fromId"`
	ToID      int64  `json:"toId"`
	Content   string `json:"content"`
	Flag      int    `json:"flag"`
	AddDate   int64  `json:"addDate"`
	ReplyDate int64  `json:"replyDate"`
}

type MarriageRecord struct {
	ID         int64
	Partner1ID int64
	Partner2ID int64
	RingType   int
	Intimacy   int
	MarriedAt  time.Time
}

type CoupleRank struct {
	ID           int64
	Partner1ID   int64
	Partner1Name string
	Partner2ID   int64
	Partner2Name string
	RingType     int
	Intimacy     int
	MarriedAt    time.Time
}

type Repository interface {
	FindByPartner(ctx context.Context, characterID int64) (*MarriageRecord, error)
	Create(ctx context.Context, record *MarriageRecord) error
	ListRanks(ctx context.Context, offset, limit int) ([]*CoupleRank, error)
}

type Store interface {
	SaveSeeking(ctx context.Context, entry *SeekingEntry) error
	GetSeeking(ctx context.Context, characterID int64) (*SeekingEntry, error)
	DeleteSeeking(ctx context.Context, characterID int64) error
	ListSeeking(ctx context.Context, limit int64) ([]*SeekingEntry, error)
	NextRequestID(ctx context.Context) (int64, error)
	SaveRequest(ctx context.Context, entry *RequestEntry) error
	GetRequest(ctx context.Context, requestID int64) (*RequestEntry, error)
	ListRequestsForCharacter(ctx context.Context, characterID int64) ([]*RequestEntry, error)
}
