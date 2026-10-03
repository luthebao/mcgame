// Open-sourced by BaoLT

// Level-up event listener that pushes a refreshed startedActList to the
// online client. Hooks into the events.Bus LevelUpListener contract; on
// fire, sends updateActivityList only when the level-up actually crosses
// an activity gate (type=2 row's flag threshold). Heavy work runs in a
// goroutine so the source RPC's _result is never blocked.
package activity

import (
	"context"

	"go.uber.org/zap"
)

const cbUpdateActivityList = "updateActivityList"

type LevelUpBroadcaster interface {
	BroadcastToCharacter(characterID int64, method string, payload interface{}) error
}

type LevelUpActivityPusher struct {
	startedActSvc *StartedActivityService
	broadcaster   LevelUpBroadcaster
	logger        *zap.Logger
}

func NewLevelUpActivityPusher(startedActSvc *StartedActivityService, broadcaster LevelUpBroadcaster, logger *zap.Logger) *LevelUpActivityPusher {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &LevelUpActivityPusher{startedActSvc: startedActSvc, broadcaster: broadcaster, logger: logger}
}

func (p *LevelUpActivityPusher) OnLevelUp(ctx context.Context, charID int64, oldLevel, newLevel int) error {
	if p == nil || p.startedActSvc == nil || p.broadcaster == nil {
		return nil
	}
	if newLevel <= oldLevel {
		return nil
	}
	go p.dispatch(context.WithoutCancel(ctx), charID, oldLevel, newLevel)
	return nil
}

func (p *LevelUpActivityPusher) dispatch(ctx context.Context, charID int64, oldLevel, newLevel int) {
	payload, crossed, err := p.startedActSvc.BuildStartedActListIfLevelGateCrossed(ctx, oldLevel, newLevel)
	if err != nil {
		p.logger.Warn("LevelUpActivityPusher: gate check failed",
			zap.Int64("character_id", charID),
			zap.Int("old_level", oldLevel),
			zap.Int("new_level", newLevel),
			zap.Error(err))
		return
	}
	if !crossed {
		return
	}
	if cbErr := p.broadcaster.BroadcastToCharacter(charID, cbUpdateActivityList, payload); cbErr != nil {
		p.logger.Warn("LevelUpActivityPusher: broadcast failed",
			zap.Int64("character_id", charID),
			zap.Error(cbErr))
	}
}
