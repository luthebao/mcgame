// Open-sourced by BaoLT

// Public VIP shop service methods. Persistence lives behind VIPShopRepository;
// pricing through discountPercent / applyDiscount; refresh policy through nextRefresh;
// rotation math through vipShopEpochAt and selectVIPShopSlotIDs.
//
// Known limitation: gold debit + ApplyPersonalRefresh are not run inside a
// single tx with SELECT FOR UPDATE on player.characters, so a parallel update
// to the same character row could lose the deduction. Compensating refund
// path logs the failure when its own Update errors, so an operator can
// reconcile from the audit trail.
package shop

import (
	"context"
	"errors"
	"fmt"
	"slices"
	"time"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata/models"

	"go.uber.org/zap"
)

const (
	vipShopSID          = 99
	vipShopSlotCount    = 6
	vipShopDynamicLimit = 20
	shopSellTypeHide    = 5
)

var (
	ErrVIPShopRefreshCapReached    = errors.New("vip shop daily refresh cap reached")
	ErrVIPShopInsufficientGold     = errors.New("not enough gold")
	ErrVIPShopSlotNotAvailable     = errors.New("vip shop item is not currently available")
	ErrVIPShopSlotAlreadyPurchased = errors.New("vip shop item already purchased")
	ErrVIPShopMembershipRequired   = errors.New("premium membership required")
)

func (s *shopService) GetVIPShopConfig(ctx context.Context, characterID int64) (*VIPShopConfigResult, error) {
	if err := s.requireVIPShopDeps(); err != nil {
		return nil, err
	}

	char, now, err := s.requireActiveVIPCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}

	rotation, err := s.ensureRotation(ctx, now)
	if err != nil {
		return nil, err
	}

	slotIDs, err := s.effectiveSlotIDsForCharacter(ctx, characterID, rotation)
	if err != nil {
		return nil, err
	}

	purchased, err := s.vipShopRepo.GetCharacterPurchaseSlotIDs(ctx, characterID, rotation.RotationEpoch)
	if err != nil {
		return nil, err
	}

	return &VIPShopConfigResult{
		Flag:        true,
		VIPShop:     s.buildVIPShopSlotDTOs(slotIDs, purchased, char.CurrentPMLevel(now)),
		ReflashTime: rotation.EndsAt.UnixMilli(),
		ShopDynamic: s.vipShopDynamicSnapshot(),
	}, nil
}

func (s *shopService) RefreshVIPShopConfig(ctx context.Context, characterID int64) (*VIPShopConfigResult, error) {
	if err := s.requireVIPShopDeps(); err != nil {
		return nil, err
	}

	char, now, err := s.requireActiveVIPCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}

	rotation, err := s.ensureRotation(ctx, now)
	if err != nil {
		return nil, err
	}

	dayBucket := vipShopDayBucket(now)

	count, err := s.vipShopRepo.GetRefreshCount(ctx, characterID, dayBucket)
	if err != nil {
		return nil, err
	}

	decision := nextRefresh(int(count))
	if !decision.Allowed {
		return nil, ErrVIPShopRefreshCapReached
	}

	if decision.Cost > 0 {
		if char.Gold < decision.Cost {
			return nil, ErrVIPShopInsufficientGold
		}
		char.Gold -= decision.Cost
		if err := s.charRepo.Update(ctx, char); err != nil {
			return nil, err
		}
	}

	overrideSlotIDs, err := s.buildPersonalSelection(characterID, rotation, count+1)
	if err != nil {
		s.refundRefreshGold(ctx, char, decision.Cost)
		return nil, err
	}

	allowed, _, err := s.vipShopRepo.ApplyPersonalRefresh(
		ctx,
		characterID,
		rotation.RotationEpoch,
		overrideSlotIDs,
		dayBucket,
		vipShopRefreshDailyMax,
	)
	if err != nil {
		s.refundRefreshGold(ctx, char, decision.Cost)
		return nil, err
	}
	if !allowed {
		s.refundRefreshGold(ctx, char, decision.Cost)
		return nil, ErrVIPShopRefreshCapReached
	}

	return &VIPShopConfigResult{
		Flag:        true,
		VIPShop:     s.buildVIPShopSlotDTOs(overrideSlotIDs, nil, char.CurrentPMLevel(now)),
		ReflashTime: rotation.EndsAt.UnixMilli(),
		ShopDynamic: s.vipShopDynamicSnapshot(),
		SyncGold:    decision.Cost > 0,
		Gold:        char.Gold,
	}, nil
}

func (s *shopService) BuyVIPShopItem(ctx context.Context, characterID int64, shopSlotID, amount int) (*VIPShopPurchaseResult, error) {
	if amount != 1 {
		amount = 1
	}
	if err := s.requireVIPShopDeps(); err != nil {
		return nil, err
	}

	char, now, err := s.requireActiveVIPCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}

	rotation, err := s.ensureRotation(ctx, now)
	if err != nil {
		return nil, err
	}

	slotIDs, err := s.effectiveSlotIDsForCharacter(ctx, characterID, rotation)
	if err != nil {
		return nil, err
	}
	if !slices.Contains(slotIDs, int32(shopSlotID)) {
		return nil, ErrVIPShopSlotNotAvailable
	}

	purchased, err := s.vipShopRepo.GetCharacterPurchaseSlotIDs(ctx, characterID, rotation.RotationEpoch)
	if err != nil {
		return nil, err
	}
	if slices.Contains(purchased, int32(shopSlotID)) {
		return nil, ErrVIPShopSlotAlreadyPurchased
	}

	slot := s.gameDataRec.GetShopSlot(shopSlotID)
	if slot == nil {
		return nil, fmt.Errorf("shop slot %d not found", shopSlotID)
	}

	inserted, err := s.vipShopRepo.RecordPurchase(ctx, characterID, rotation.RotationEpoch, int32(shopSlotID), int32(amount))
	if err != nil {
		return nil, err
	}
	if !inserted {
		return nil, ErrVIPShopSlotAlreadyPurchased
	}

	purchase, err := s.buyVIPSlotItem(ctx, char, slot, amount, now)
	if err != nil {
		return nil, err
	}

	s.recordVIPDynamicEntry(vipShopDynamicEntry{
		CID:    char.ID,
		CName:  char.Name,
		Type:   int(slot.Type),
		ItemID: int(slot.ItemID),
		Num:    amount,
		Time:   now.UnixMilli(),
	})

	return &VIPShopPurchaseResult{
		Flag:        true,
		ShopDynamic: s.vipShopDynamicSnapshot(),
		Purchase:    purchase,
	}, nil
}

func (s *shopService) requireVIPShopDeps() error {
	if s.charRepo == nil {
		return errors.New("character repository not initialized")
	}
	if s.gameDataRec == nil {
		return errors.New("game data manager not initialized")
	}
	if s.vipShopRepo == nil {
		return errors.New("vip shop repository not initialized")
	}
	return nil
}

func (s *shopService) requireActiveVIPCharacter(ctx context.Context, characterID int64) (*character.Character, time.Time, error) {
	char, err := s.charRepo.FindByID(ctx, characterID)
	if err != nil {
		return nil, time.Time{}, err
	}

	now := time.Now()
	if char.NormalizeVIP(now) {
		if err := s.charRepo.Update(ctx, char); err != nil {
			return nil, time.Time{}, err
		}
	}

	if !char.HasActiveVIP(now) {
		return nil, time.Time{}, ErrVIPShopMembershipRequired
	}

	return char, now, nil
}

func (s *shopService) ensureRotation(ctx context.Context, now time.Time) (*VIPShopRotation, error) {
	pool, err := s.vipShopPool()
	if err != nil {
		return nil, err
	}

	epoch, startsAt, endsAt := vipShopEpochAt(now)
	seed := vipShopRotationSeed(epoch)
	slotIDs := selectVIPShopSlotIDs(pool, seed, vipShopSlotCount)
	if len(slotIDs) == 0 {
		return nil, errors.New("vip shop pool is empty")
	}

	return s.vipShopRepo.GetOrSeedRotation(ctx, epoch, startsAt, endsAt, seed, slotIDs)
}

func (s *shopService) vipShopPool() ([]*models.ShopSlotTemplate, error) {
	all := s.gameDataRec.GetShopSlotsBySid(vipShopSID)
	pool := make([]*models.ShopSlotTemplate, 0, len(all))
	for _, slot := range all {
		if slot == nil {
			continue
		}
		if int(slot.St) == shopSellTypeHide {
			continue
		}
		pool = append(pool, slot)
	}
	if len(pool) == 0 {
		return nil, errors.New("vip shop pool is empty")
	}
	return pool, nil
}

func (s *shopService) effectiveSlotIDsForCharacter(ctx context.Context, characterID int64, rotation *VIPShopRotation) ([]int32, error) {
	override, err := s.vipShopRepo.GetCharacterOverride(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if override != nil && override.RotationEpoch == rotation.RotationEpoch && len(override.SlotIDs) > 0 {
		return override.SlotIDs, nil
	}
	return rotation.ShopSlotIDs, nil
}

func (s *shopService) buildPersonalSelection(characterID int64, rotation *VIPShopRotation, refreshIndex int32) ([]int32, error) {
	pool, err := s.vipShopPool()
	if err != nil {
		return nil, err
	}
	seed := vipShopPersonalSeed(characterID, rotation.RotationEpoch, refreshIndex)
	picked := selectVIPShopSlotIDs(pool, seed, vipShopSlotCount)
	if len(picked) == 0 {
		return nil, errors.New("vip shop personal selection is empty")
	}
	return picked, nil
}

func (s *shopService) refundRefreshGold(ctx context.Context, char *character.Character, cost int64) {
	if cost <= 0 {
		return
	}
	char.Gold += cost
	if err := s.charRepo.Update(ctx, char); err != nil && s.logger != nil {
		s.logger.Error("vip shop refresh refund failed; player owed gold",
			zap.Int64("character_id", char.ID),
			zap.Int64("refund_gold", cost),
			zap.Error(err),
		)
	}
}

func vipShopDayBucket(now time.Time) time.Time {
	local := now.In(models.GameTimezone)
	return time.Date(local.Year(), local.Month(), local.Day(), 0, 0, 0, 0, models.GameTimezone)
}

