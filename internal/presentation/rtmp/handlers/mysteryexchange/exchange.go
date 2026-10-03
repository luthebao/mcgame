// Open-sourced by BaoLT

// Mystery Furnace exchange RPC implementations.
//
// MysteryExchangeItem: client submits {itemInstanceId:true} dict + md5pass.
// Server verifies password, re-validates each item is owned and not equipped/bound,
// deletes the items from inventory, then credits mysteryCrystal. Reply: currency snapshot.
// Order: validate -> delete items -> credit crystal. Items are deleted (committed) before
// crystal is credited and saved. If chars.Save fails after deletion the player loses the
// exchanged items with no crystal — a known non-atomic forward-loss window, NOT a
// duplication exploit. True atomicity is deferred to a future single-transaction PG function.
//
// MysteryExchangeScore: client submits {scoreType:count} dict + md5pass.
// Server verifies password, re-validates each (scoreType, count) against the feature
// state Scores map, deducts and persists scores first, then credits mysteryCrystal.
// Order: validate -> deductScores -> mysService.Save -> AddCurrency -> chars.Save.
// Scores are deducted and saved (committed) before crystal is credited. If chars.Save
// fails after the score deduction the player loses the scores with no crystal — a known
// non-atomic forward-loss window, NOT a duplication exploit. True atomicity is deferred
// to a future single-transaction PG function.
//
// Secondary-password gate: both RPCs call account.CheckSecondaryPassword consistent with
// all other secondary-password sinks in the codebase. Accounts still using
// DefaultSecondaryPasswordMD5 (the "123456" default) pass the gate — this is the
// pre-existing platform-wide F4 issue (see cmd/secpoc/f4_default_secondary) and is
// intentionally NOT special-cased here; it must be fixed at the account layer.
//
// OPEN QUESTION (economic stubs):
// MysteryExchangeItem crystal yield per item: no server-side table exists yet.
// Using exchangeItemCrystalPerUnit=1 as a conservative placeholder.
// MysteryExchangeScore crystal yield per score unit: no server-side table exists yet.
// Using exchangeScoreCrystalPerUnit=1 as a conservative placeholder.
// Both must be replaced once actual conversion rates are confirmed from game data.
//
// Read-modify-write is serialized per-connection (single goroutine per RTMP conn).
package mysteryexchange

import (
	"strconv"

	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

func (h *Handler) authorizeExchange(ctx *rtmp.RPCContext, args []interface{}, rpcName string) (map[string]interface{}, int64, error) {
	if ctx.CharacterID == "" || ctx.AccountID == "" {
		return nil, 0, pkgerrors.ErrUnauthorized
	}

	if len(args) < 2 {
		h.logger.Warn(rpcName+": insufficient args",
			zap.Int("count", len(args)))
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	md5pass, ok := args[1].(string)
	if !ok {
		h.logger.Warn(rpcName + ": md5pass not a string")
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	if err := validateMD5Pass(md5pass); err != nil {
		h.logger.Warn(rpcName + ": md5pass input hardening failed")
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	rawDict, ok := args[0].(map[string]interface{})
	if !ok {
		h.logger.Warn(rpcName + ": dict not an object")
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	if len(rawDict) > maxExchangeDictSize {
		h.logger.Warn(rpcName+": dict exceeds cap",
			zap.Int("size", len(rawDict)))
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	accountID, ok := accountIDFromCtx(ctx)
	if !ok {
		return nil, 0, pkgerrors.ErrUnauthorized
	}

	if h.accountRepo == nil {
		h.logger.Error(rpcName+": accountRepo not wired",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, 0, pkgerrors.ErrSystemError
	}

	account, err := h.accountRepo.FindByID(ctx.Context, accountID)
	if err != nil {
		h.logger.Warn(rpcName+": account lookup failed",
			zap.String("account_id", ctx.AccountID))
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	if !account.CheckSecondaryPassword(md5pass) {
		h.logger.Warn(rpcName+": secondary password check failed",
			zap.Uint32("conn_id", ctx.ConnID))
		return nil, 0, pkgerrors.ErrInvalidInput
	}

	charID, parseErr := strconv.ParseInt(ctx.CharacterID, 10, 64)
	if parseErr != nil {
		return nil, 0, pkgerrors.ErrUnauthorized
	}

	return rawDict, charID, nil
}

func (h *Handler) ExchangeItem(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MysteryExchangeItem called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	rawDict, charID, authErr := h.authorizeExchange(ctx, args, "MysteryExchangeItem")
	if authErr != nil {
		return nil, authErr
	}

	itemIDs, err := parseItemDict(rawDict)
	if err != nil {
		h.logger.Warn("MysteryExchangeItem: itemDict parse failed", zap.Error(err))
		return nil, pkgerrors.ErrInvalidInput
	}

	if h.inventory == nil || h.chars == nil {
		h.logger.Error("MysteryExchangeItem: services not wired",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	inventory, invErr := h.inventory.GetInventory(ctx.Context, charID)
	if invErr != nil {
		h.logger.Error("MysteryExchangeItem: inventory load failed",
			zap.Int64("char_id", charID),
			zap.Error(invErr))
		return nil, pkgerrors.ErrSystemError
	}

	validCount, ownerErr := validateItemOwnership(inventory, itemIDs)
	if ownerErr != nil {
		h.logger.Warn("MysteryExchangeItem: ownership validation failed",
			zap.Int64("char_id", charID),
			zap.Error(ownerErr))
		return nil, pkgerrors.ErrInvalidInput
	}

	if validCount == 0 {
		h.logger.Warn("MysteryExchangeItem: no valid items to exchange",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrInvalidInput
	}

	deletedCount := 0
	for _, id := range itemIDs {
		if delErr := h.inventory.ConsumeItemByID(ctx.Context, charID, id); delErr != nil {
			h.logger.Error("MysteryExchangeItem: item delete failed",
				zap.Int64("char_id", charID),
				zap.Int64("item_id", id),
				zap.Error(delErr))
			return nil, pkgerrors.ErrSystemError
		}
		deletedCount++
	}

	char, charErr := h.chars.GetByID(ctx.Context, charID)
	if charErr != nil || char == nil {
		h.logger.Error("MysteryExchangeItem: character load failed",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	crystalGain := deletedCount * exchangeItemCrystalPerUnit
	if addErr := char.AddCurrency(domainchar.CurrencyMysteryCrystal, crystalGain); addErr != nil {
		h.logger.Error("MysteryExchangeItem: AddCurrency failed",
			zap.Int64("char_id", charID),
			zap.Error(addErr))
		return nil, pkgerrors.ErrSystemError
	}

	newCrystal := char.MysteryCrystal

	if saveErr := h.chars.Save(ctx.Context, char); saveErr != nil {
		h.logger.Error("MysteryExchangeItem: save character failed",
			zap.Int64("char_id", charID),
			zap.Error(saveErr))
		return nil, pkgerrors.ErrSystemError
	}

	h.logger.Info("MysteryExchangeItem: success",
		zap.Int64("char_id", charID),
		zap.Int("items_exchanged", deletedCount),
		zap.Int("crystal_gained", crystalGain),
		zap.Int("new_crystal", newCrystal))

	return map[string]interface{}{
		"num":            float64(newCrystal),
		"mysteryCrystal": float64(newCrystal),
	}, nil
}

func (h *Handler) ExchangeScore(ctx *rtmp.RPCContext, args []interface{}) (interface{}, error) {
	h.logger.Info("MysteryExchangeScore called",
		zap.Uint32("conn_id", ctx.ConnID),
		zap.String("character_id", ctx.CharacterID))

	rawDict, charID, authErr := h.authorizeExchange(ctx, args, "MysteryExchangeScore")
	if authErr != nil {
		return nil, authErr
	}

	scoreEntries, err := parseScoreDict(rawDict)
	if err != nil {
		h.logger.Warn("MysteryExchangeScore: scoreDict parse failed", zap.Error(err))
		return nil, pkgerrors.ErrInvalidInput
	}

	if h.mysService == nil || h.chars == nil {
		h.logger.Error("MysteryExchangeScore: services not wired",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	st, loadErr := h.mysService.Load(ctx.Context, charID)
	if loadErr != nil {
		h.logger.Error("MysteryExchangeScore: load mystery state failed",
			zap.Int64("char_id", charID),
			zap.Error(loadErr))
		return nil, pkgerrors.ErrSystemError
	}

	totalUnits, validateErr := validateAndTallyScores(st, scoreEntries)
	if validateErr != nil {
		h.logger.Warn("MysteryExchangeScore: score validation failed",
			zap.Int64("char_id", charID),
			zap.Error(validateErr))
		return nil, pkgerrors.ErrInvalidInput
	}

	char, charErr := h.chars.GetByID(ctx.Context, charID)
	if charErr != nil || char == nil {
		h.logger.Error("MysteryExchangeScore: character load failed",
			zap.Int64("char_id", charID))
		return nil, pkgerrors.ErrSystemError
	}

	if totalUnits > 0 {
		crystalGain := totalUnits * exchangeScoreCrystalPerUnit

		deductScores(st, scoreEntries)
		if saveErr := h.mysService.Save(ctx.Context, charID, st); saveErr != nil {
			h.logger.Error("MysteryExchangeScore: save mystery state failed",
				zap.Int64("char_id", charID),
				zap.Error(saveErr))
			return nil, pkgerrors.ErrSystemError
		}

		if addErr := char.AddCurrency(domainchar.CurrencyMysteryCrystal, crystalGain); addErr != nil {
			h.logger.Error("MysteryExchangeScore: AddCurrency failed",
				zap.Int64("char_id", charID),
				zap.Error(addErr))
			return nil, pkgerrors.ErrSystemError
		}

		if saveErr := h.chars.Save(ctx.Context, char); saveErr != nil {
			h.logger.Error("MysteryExchangeScore: save character failed",
				zap.Int64("char_id", charID),
				zap.Error(saveErr))
			return nil, pkgerrors.ErrSystemError
		}

		h.logger.Info("MysteryExchangeScore: success",
			zap.Int64("char_id", charID),
			zap.Int("total_units", totalUnits),
			zap.Int("crystal_gained", crystalGain),
			zap.Int("new_crystal", char.MysteryCrystal))
	}

	return map[string]interface{}{"num": float64(char.MysteryCrystal)}, nil
}
