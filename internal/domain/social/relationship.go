// Open-sourced by BaoLT

// Relationship entity represents connections between characters.
// Supports friend, blacklist, enemy, couple, tutor, and sibling types.
// Includes online status data for real-time friend list updates.
package social

import (
	"context"
	"fmt"
	"time"
)

const (
	RelationshipTypeFriend  = 0
	RelationshipTypeBlack   = 1
	RelationshipTypeEnemy   = 2
	RelationshipTypeCouple  = 3
	RelationshipTypeTutor   = 4
	RelationshipTypeBrother = 5
)

type Relationship struct {
	ID          int64
	CharacterID int64
	OtherID     int64
	OtherName   string
	Type        int
	GroupID     int
	Nickname    string
	Intimacy    int
	CreatedAt   time.Time
}

type RelationshipDTO struct {
	ID      int64       `json:"id"`
	Name    string      `json:"name"`
	OtherID int64       `json:"otherId"`
	Type    int         `json:"type"`
	Num     int         `json:"num"`
	Data    interface{} `json:"data"`
}

type CharacterOnlineData struct {
	Exp     int64 `json:"exp"`
	ClassID int   `json:"classId"`
}

func (r *Relationship) ToDTO(onlineData *CharacterOnlineData) map[string]interface{} {
	dto := map[string]interface{}{
		"id":      r.ID,
		"name":    r.OtherName,
		"otherId": r.OtherID,
		"type":    r.Type,
		"num":     r.Intimacy,
	}

	if onlineData != nil {
		dto["data"] = map[string]interface{}{
			"exp":     onlineData.Exp,
			"classId": onlineData.ClassID,
		}
	} else {
		dto["data"] = nil
	}

	return dto
}

func (r *Relationship) ToBlacklistDTO(selfID int64) map[string]interface{} {
	return map[string]interface{}{
		"id":      fmt.Sprintf("%d", r.ID),
		"name":    r.OtherName,
		"num":     "0",
		"otherId": fmt.Sprintf("%d", r.OtherID),
		"selfId":  fmt.Sprintf("%d", selfID),
		"type":    "2",
	}
}

type Repository interface {
	FindByCharacterID(ctx context.Context, characterID int64) ([]*Relationship, error)
	FindByCharacterAndType(ctx context.Context, characterID int64, relationshipType int) ([]*Relationship, error)
	FindFriends(ctx context.Context, characterID int64) ([]*Relationship, error)
	FindBlacklist(ctx context.Context, characterID int64) ([]*Relationship, error)
	FindByID(ctx context.Context, relationshipID int64) (*Relationship, error)
	Create(ctx context.Context, rel *Relationship) error
	Delete(ctx context.Context, characterID, otherID int64, relationshipType int) error
	DeleteByID(ctx context.Context, characterID int64, relationshipID int64, relationshipType int) error
	Exists(ctx context.Context, characterID, otherID int64, relationshipType int) (bool, error)
}
