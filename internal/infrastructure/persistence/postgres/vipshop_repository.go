// Open-sourced by BaoLT

// PostgreSQL persistence for the VIP shop: shared rotation, per-character override,
// sold-out markers, and the daily refresh counter. All queries call schema-qualified
// shop.* functions or use parameterized SQL against shop.* tables.
package postgres

import (
	"context"
	"errors"
	"time"

	appshop "mcgame-server/internal/application/shop"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type VIPShopRepository struct {
	db *Database
}

func NewVIPShopRepository(db *Database) *VIPShopRepository {
	return &VIPShopRepository{db: db}
}

func (r *VIPShopRepository) GetOrSeedRotation(
	ctx context.Context,
	epoch int64,
	startsAt, endsAt time.Time,
	seed int64,
	slotIDs []int32,
) (*appshop.VIPShopRotation, error) {
	const query = `
		SELECT rotation_epoch, starts_at, ends_at, shop_slot_ids, seed, reseeded
		FROM shop.fn_get_or_seed_rotation($1, $2, $3, $4, $5)
	`

	row := &appshop.VIPShopRotation{}
	err := r.db.pool.QueryRow(ctx, query, epoch, startsAt, endsAt, seed, slotIDs).Scan(
		&row.RotationEpoch,
		&row.StartsAt,
		&row.EndsAt,
		&row.ShopSlotIDs,
		&row.Seed,
		&row.Reseeded,
	)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to get or seed vip shop rotation")
	}
	return row, nil
}

func (r *VIPShopRepository) GetCharacterOverride(ctx context.Context, characterID int64) (*appshop.VIPShopOverride, error) {
	const query = `
		SELECT rotation_epoch, override_slot_ids, refreshed_at
		FROM shop.vip_shop_character_override
		WHERE character_id = $1
	`

	row := &appshop.VIPShopOverride{}
	err := r.db.pool.QueryRow(ctx, query, characterID).Scan(
		&row.RotationEpoch,
		&row.SlotIDs,
		&row.RefreshedAt,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to load vip shop character override")
	}
	return row, nil
}

func (r *VIPShopRepository) GetCharacterPurchaseSlotIDs(ctx context.Context, characterID, rotationEpoch int64) ([]int32, error) {
	const query = `
		SELECT shop_slot_id
		FROM shop.vip_shop_character_purchase
		WHERE character_id = $1
		  AND rotation_epoch = $2
	`

	rows, err := r.db.pool.Query(ctx, query, characterID, rotationEpoch)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to load vip shop character purchases")
	}
	defer rows.Close()

	var ids []int32
	for rows.Next() {
		var id int32
		if err := rows.Scan(&id); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan vip shop purchase row")
		}
		ids = append(ids, id)
	}
	if err := rows.Err(); err != nil {
		return nil, pkgerrors.Wrap(err, "failed iterating vip shop purchase rows")
	}
	return ids, nil
}

func (r *VIPShopRepository) RecordPurchase(
	ctx context.Context,
	characterID, rotationEpoch int64,
	slotID, amount int32,
) (bool, error) {
	const query = `SELECT shop.fn_record_purchase($1, $2, $3, $4)`

	var inserted bool
	err := r.db.pool.QueryRow(ctx, query, characterID, rotationEpoch, slotID, amount).Scan(&inserted)
	if err != nil {
		return false, pkgerrors.Wrap(err, "failed to record vip shop purchase")
	}
	return inserted, nil
}

func (r *VIPShopRepository) GetRefreshCount(ctx context.Context, characterID int64, dayBucket time.Time) (int32, error) {
	const query = `
		SELECT refresh_count
		FROM shop.vip_shop_refresh_counter
		WHERE character_id = $1
		  AND day_bucket   = $2
	`

	var count int32
	err := r.db.pool.QueryRow(ctx, query, characterID, dayBucket).Scan(&count)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return 0, nil
		}
		return 0, pkgerrors.Wrap(err, "failed to load vip shop refresh count")
	}
	return count, nil
}

func (r *VIPShopRepository) ApplyPersonalRefresh(
	ctx context.Context,
	characterID, rotationEpoch int64,
	slotIDs []int32,
	dayBucket time.Time,
	maxPerDay int32,
) (bool, int32, error) {
	const query = `
		SELECT allowed, new_count
		FROM shop.fn_apply_personal_refresh($1, $2, $3, $4, $5)
	`

	var (
		allowed  bool
		newCount int32
	)
	err := r.db.pool.QueryRow(ctx, query, characterID, rotationEpoch, slotIDs, dayBucket, maxPerDay).Scan(&allowed, &newCount)
	if err != nil {
		return false, 0, pkgerrors.Wrap(err, "failed to apply vip shop personal refresh")
	}
	return allowed, newCount, nil
}

var _ appshop.VIPShopRepository = (*VIPShopRepository)(nil)
