// Open-sourced by BaoLT

package auth

import (
	"context"
	"time"

	appactivity "mcgame-server/internal/application/activity"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/infrastructure/rtmp"

	"github.com/google/uuid"
)

func (h *Handler) syncCharacterPremiumState(ctx context.Context, char *domainchar.Character) error {
	if h == nil || char == nil || h.charService == nil {
		return nil
	}

	now := time.Now()
	if char.NormalizeVIP(now) {
		if err := h.charService.Update(ctx, char); err != nil {
			return err
		}
	}

	if h.accountRepo == nil || char.AccountID == uuid.Nil {
		return nil
	}

	account, err := h.accountRepo.FindByID(ctx, char.AccountID)
	if err != nil {
		return err
	}

	level := char.CurrentPMLevel(now)
	if account.VIPLevel == level {
		return nil
	}

	account.VIPLevel = level
	return h.accountRepo.Update(ctx, account)
}

func (h *Handler) grantDailyPMLoginReward(ctx context.Context, char *domainchar.Character) (*appactivity.PMExpChange, *domainchar.Character, error) {
	if h == nil || h.premiumService == nil || h.charService == nil || char == nil {
		return nil, char, nil
	}

	change, err := h.premiumService.GrantDailyLoginPMExp(ctx, char.ID)
	if err != nil || change == nil {
		return change, char, err
	}

	updatedChar, err := h.charService.GetByID(ctx, char.ID)
	if err != nil {
		return nil, char, err
	}

	return change, updatedChar, nil
}

func (h *Handler) pushPMExpChangeCallbacks(ctx *rtmp.RPCContext, change *appactivity.PMExpChange) {
	if h == nil || ctx == nil || ctx.Connection == nil || change == nil {
		return
	}

	_ = ctx.Connection.SendCallback("addOrMinusPmExp", map[string]interface{}{
		"type":    pmExpCallbackType(change.Delta),
		"pnt":     pmExpDeltaMagnitude(change.Delta),
		"pmLevel": change.PMLevel,
		"nExp":    change.PMExp,
	})

	if change.PMLevel != change.PreviousPMLevel {
		_ = ctx.Connection.SendCallback("updateScenePmLevel", map[string]interface{}{
			"cid":     change.CharacterID,
			"pmLevel": change.PMLevel,
		})
	}
}

func pmExpCallbackType(delta int64) int {
	if delta >= 0 {
		return 1
	}
	return 2
}

func pmExpDeltaMagnitude(delta int64) int64 {
	if delta < 0 {
		return -delta
	}
	return delta
}
