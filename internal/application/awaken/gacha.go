// Open-sourced by BaoLT

// Awakening ("Giác Tỉnh") probabilistic level-up gacha. Serves the awakening(autoBuy)
// and ensureBuyAwaken() RPCs (the AwakenPanel.as "Giác Ngộ" button + its auto-buy
// confirm). Reads data_tbl_awakening[awakenLevel+1] (TBL_AWAKENING, 77 rows, key =
// target level) for the per-attempt cost (item 4913 x item_num + money silver), the
// success rate, the granted points and the req_level gate.
//
// Flow per attempt: validate awakenLevel < AwakenEdge(77) and char.Level >= req_level;
// ensure the bag holds item_num of item 4913 (auto-buy with gold when allowed, else
// reply {needGold}); deduct money silver + consume the item (consume-then-credit), then
// roll a single Bernoulli vs (rate + awakenAdd). On HIT: awakenLevel++ in
// character_progression (the single source the combat bonus + login both read) AND grant
// points to the feature pool, reset awakenAdd to 0, reply {success:true, ...}. On MISS:
// accrue awakenAdd by AwakenPityStepPercent (pity), reply {success:false, itemNum, awakenAdd}.
//
// DOCUMENTED ASSUMPTION (calibration gap — neither in DB nor client constants):
//
//	AwakenPityStepPercent  — additive rate (in %) granted per miss, reset on hit.
//	AwakenBuyGoldPerItem   — premium-gold price per unit of item 4913 for the auto-buy.
//
// Both are single named constants so the live-log can recalibrate them later.
package awaken

import (
	"context"
	"errors"
	"fmt"

	"mcgame-server/internal/domain/character"
	domainitem "mcgame-server/internal/domain/item"

	"go.uber.org/zap"
)

const (
	AwakenItemID = 4913
	AwakenEdge   = 77

	AwakenPityStepPercent = 1
	AwakenBuyGoldPerItem  = 10
)

var (
	ErrServiceNotConfigured = errors.New("giác tỉnh: dịch vụ chưa cấu hình")
	ErrCharacterMissing     = errors.New("giác tỉnh: không tìm thấy nhân vật")
	ErrMaxAwakenLevel       = errors.New("giác tỉnh: đã đạt cấp giác tỉnh tối đa")
	ErrAwakenRowMissing     = errors.New("giác tỉnh: thiếu dữ liệu cấp giác tỉnh")
	ErrReqLevelNotMet       = errors.New("giác tỉnh: chưa đủ cấp nhân vật")
	ErrInsufficientMoney    = errors.New("giác tỉnh: không đủ bạc")
	ErrInsufficientGold     = errors.New("giác tỉnh: không đủ vàng để mua vật phẩm")
	ErrConsumeFailed        = errors.New("giác tỉnh: tiêu hao vật phẩm thất bại")
)

type ItemPort interface {
	CountCarriedItemsByTemplateID(ctx context.Context, charID int64, templateID int) (int, error)
	ConsumeItemsByTemplateID(ctx context.Context, charID int64, templateID int, count int) (bool, error)
	AddItemWithBind(ctx context.Context, charID int64, templateID int, itemType domainitem.ItemType, stackCount int, isBound bool) (*domainitem.Item, error)
}

type ProgressionWriter interface {
	UpsertCharacterAwakenProgression(ctx context.Context, charID int64, awakenLevel int, awakenPoints int, awakenPointsUsed int) error
}

func (s *Service) Awaken(ctx context.Context, charID int64, autoBuy bool) (map[string]interface{}, error) {
	return s.attempt(ctx, charID, autoBuy)
}

func (s *Service) EnsureBuyAwaken(ctx context.Context, charID int64) (map[string]interface{}, error) {
	return s.attempt(ctx, charID, true)
}

func (s *Service) attempt(ctx context.Context, charID int64, autoBuy bool) (map[string]interface{}, error) {
	if s.charRepo == nil || s.items == nil || s.progress == nil {
		return nil, ErrServiceNotConfigured
	}

	char, err := s.charRepo.FindByID(ctx, charID)
	if err != nil {
		return nil, fmt.Errorf("awaken: load character: %w", err)
	}
	if char == nil {
		return nil, ErrCharacterMissing
	}
	if char.AwakenLevel >= AwakenEdge {
		return nil, ErrMaxAwakenLevel
	}

	targetLevel := char.AwakenLevel + 1
	row := s.gameData.GetAwakening(targetLevel)
	if row == nil {
		return nil, ErrAwakenRowMissing
	}
	if char.Level < int(row.ReqLevel) {
		return nil, ErrReqLevelNotMet
	}

	itemNeed := int(row.ItemNum)
	moneyCost := int64(row.Money)

	have, err := s.items.CountCarriedItemsByTemplateID(ctx, charID, AwakenItemID)
	if err != nil {
		return nil, fmt.Errorf("awaken: count item %d: %w", AwakenItemID, err)
	}

	missing := itemNeed - have
	if missing > 0 {
		if !autoBuy {
			return map[string]interface{}{"needGold": missing * AwakenBuyGoldPerItem}, nil
		}
		if err := s.buyItem(ctx, char, missing); err != nil {
			return nil, err
		}
	}

	state, err := s.loadState(ctx, charID)
	if err != nil {
		return nil, err
	}

	if err := s.consumeCost(ctx, char, moneyCost, itemNeed); err != nil {
		return nil, err
	}

	remaining, err := s.items.CountCarriedItemsByTemplateID(ctx, charID, AwakenItemID)
	if err != nil {
		s.logger.Warn("awaken: post-consume recount failed; deriving remaining arithmetically",
			zap.Int64("char_id", charID), zap.Error(err))
		remaining = have - itemNeed
		if missing > 0 {
			remaining = 0
		}
		if remaining < 0 {
			remaining = 0
		}
	}

	rate := row.Rate + float64(state.AwakenAdd)
	if s.rng.Float64()*100.0 < rate {
		return s.onHit(ctx, charID, char, state, int(row.Points), targetLevel)
	}
	return s.onMiss(ctx, charID, state, remaining)
}

func (s *Service) buyItem(ctx context.Context, char *character.Character, missing int) error {
	price := int64(missing) * int64(AwakenBuyGoldPerItem)
	if char.Gold < price {
		return ErrInsufficientGold
	}
	char.Gold -= price
	if err := s.charRepo.Update(ctx, char); err != nil {
		return fmt.Errorf("awaken: deduct gold for auto-buy: %w", err)
	}
	if _, err := s.items.AddItemWithBind(ctx, char.ID, AwakenItemID, domainitem.ItemTypeConsumable, missing, false); err != nil {
		s.logger.Error("awaken: gold deducted but auto-buy item grant failed",
			zap.Int64("char_id", char.ID), zap.Int("missing", missing), zap.Error(err))
		return fmt.Errorf("awaken: grant auto-buy item: %w", err)
	}
	return nil
}

func (s *Service) consumeCost(ctx context.Context, char *character.Character, moneyCost int64, itemNeed int) error {
	if char.Money < moneyCost {
		return ErrInsufficientMoney
	}
	if moneyCost > 0 {
		char.Money -= moneyCost
		if err := s.charRepo.Update(ctx, char); err != nil {
			return fmt.Errorf("awaken: deduct money: %w", err)
		}
	}
	if itemNeed > 0 {
		ok, err := s.items.ConsumeItemsByTemplateID(ctx, char.ID, AwakenItemID, itemNeed)
		if err != nil {
			s.logger.Error("awaken: money deducted but item consume errored",
				zap.Int64("char_id", char.ID), zap.Int("item_need", itemNeed), zap.Error(err))
			return fmt.Errorf("awaken: consume item %d: %w", AwakenItemID, err)
		}
		if !ok {
			s.logger.Error("awaken: money deducted but item missing at consume",
				zap.Int64("char_id", char.ID), zap.Int("item_need", itemNeed))
			return ErrConsumeFailed
		}
	}
	return nil
}

func (s *Service) onHit(ctx context.Context, charID int64, char *character.Character, state *State, points, targetLevel int) (map[string]interface{}, error) {
	newPoint := state.Point + points
	if err := s.progress.UpsertCharacterAwakenProgression(ctx, charID, targetLevel, newPoint, state.PointUsed); err != nil {
		s.logger.Error("awaken: cost consumed but progression write failed",
			zap.Int64("char_id", charID), zap.Int("target_level", targetLevel), zap.Error(err))
		return nil, fmt.Errorf("awaken: write progression: %w", err)
	}

	state.Point = newPoint
	state.AwakenAdd = 0
	if err := s.saveState(ctx, charID, state); err != nil {
		s.logger.Error("awaken: progression bumped but feature pool save failed",
			zap.Int64("char_id", charID), zap.Int("target_level", targetLevel), zap.Error(err))
		return nil, fmt.Errorf("awaken: save feature pool: %w", err)
	}

	char.AwakenLevel = targetLevel
	char.AwakenPoints = newPoint

	return map[string]interface{}{
		"success":     true,
		"awakenLevel": targetLevel,
		"awakenPoint": newPoint,
		"awakenAdd":   0,
	}, nil
}

func (s *Service) onMiss(ctx context.Context, charID int64, state *State, remaining int) (map[string]interface{}, error) {
	state.AwakenAdd += AwakenPityStepPercent
	if err := s.saveState(ctx, charID, state); err != nil {
		return nil, fmt.Errorf("awaken: save pity: %w", err)
	}
	return map[string]interface{}{
		"success":   false,
		"itemNum":   remaining,
		"awakenAdd": state.AwakenAdd,
	}, nil
}
