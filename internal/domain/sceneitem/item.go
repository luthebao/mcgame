// Open-sourced by BaoLT

// SceneItem entity represents items dropped or placed in the game world.
// Handles ownership-based pickup rules with time-based release.
// Supports both temporary drops and permanent static items.
package sceneitem

import (
	"fmt"
	"time"
)

type SceneItem struct {
	ID         int64
	TemplateID int
	MapID      int
	PosX       int
	PosY       int
	StackCount int
	OwnerID    *int64
	DroppedAt  time.Time
	ExpiresAt  *time.Time
	IsStatic   bool
}

func NewSceneItem(templateID, mapID, posX, posY, stackCount int, ownerID *int64) *SceneItem {
	now := time.Now()
	expiresAt := now.Add(5 * time.Minute)

	return &SceneItem{
		TemplateID: templateID,
		MapID:      mapID,
		PosX:       posX,
		PosY:       posY,
		StackCount: stackCount,
		OwnerID:    ownerID,
		DroppedAt:  now,
		ExpiresAt:  &expiresAt,
		IsStatic:   false,
	}
}

func NewStaticItem(templateID, mapID, posX, posY int) *SceneItem {
	return &SceneItem{
		TemplateID: templateID,
		MapID:      mapID,
		PosX:       posX,
		PosY:       posY,
		StackCount: 1,
		OwnerID:    nil,
		DroppedAt:  time.Now(),
		ExpiresAt:  nil,
		IsStatic:   true,
	}
}

func (s *SceneItem) IsExpired() bool {
	if s.IsStatic || s.ExpiresAt == nil {
		return false
	}
	return time.Now().After(*s.ExpiresAt)
}

func (s *SceneItem) CanPickup(charID int64) bool {
	if s.IsStatic {
		return false
	}

	if s.OwnerID != nil && *s.OwnerID != charID {
		return time.Since(s.DroppedAt) > 30*time.Second
	}

	return true
}

func (s *SceneItem) ToDTO() map[string]interface{} {
	dto := map[string]interface{}{
		"eid":        s.ID,
		"tplId":      s.TemplateID,
		"mapId":      s.MapID,
		"posX":       s.PosX,
		"posY":       s.PosY,
		"stackCount": s.StackCount,
		"isStatic":   s.IsStatic,
	}

	if s.OwnerID != nil {
		dto["ownerId"] = fmt.Sprintf("%d", *s.OwnerID)
	}

	if s.ExpiresAt != nil {
		dto["expiresAt"] = s.ExpiresAt.Unix()
	}

	return dto
}
