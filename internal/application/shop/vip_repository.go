// Open-sourced by BaoLT

// VIPShopRepository abstracts persistence for the shared rotation, per-character
// override, sold-out markers, and the daily refresh counter. The infra implementation
// lives in internal/infrastructure/persistence/postgres/vipshop_repository.go.
package shop

import (
	"context"
	"time"
)

type VIPShopRotation struct {
	RotationEpoch int64
	StartsAt      time.Time
	EndsAt        time.Time
	ShopSlotIDs   []int32
	Seed          int64
	Reseeded      bool
}

type VIPShopOverride struct {
	RotationEpoch int64
	SlotIDs       []int32
	RefreshedAt   time.Time
}

type VIPShopRepository interface {
	GetOrSeedRotation(
		ctx context.Context,
		epoch int64,
		startsAt, endsAt time.Time,
		seed int64,
		slotIDs []int32,
	) (*VIPShopRotation, error)

	GetCharacterOverride(ctx context.Context, characterID int64) (*VIPShopOverride, error)

	GetCharacterPurchaseSlotIDs(ctx context.Context, characterID, rotationEpoch int64) ([]int32, error)

	RecordPurchase(
		ctx context.Context,
		characterID, rotationEpoch int64,
		slotID, amount int32,
	) (bool, error)

	GetRefreshCount(ctx context.Context, characterID int64, dayBucket time.Time) (int32, error)

	ApplyPersonalRefresh(
		ctx context.Context,
		characterID, rotationEpoch int64,
		slotIDs []int32,
		dayBucket time.Time,
		maxPerDay int32,
	) (bool, int32, error)
}
