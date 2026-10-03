// Open-sourced by BaoLT

// Event bus dispatches synchronous cross-feature character events.
package events

import (
	"context"

	"go.uber.org/zap"
)

type MonsterKilledListener interface {
	OnMonsterKilled(ctx context.Context, charID, creatureID int64, count int) error
}

type ItemAcquiredListener interface {
	OnItemAcquired(ctx context.Context, charID, itemID int64, qty int) error
}

type ItemUsedListener interface {
	OnItemUsed(ctx context.Context, charID, itemID int64, qty int) error
}

type LevelUpListener interface {
	OnLevelUp(ctx context.Context, charID int64, oldLevel, newLevel int) error
}

type BattleEndedListener interface {
	OnBattleEnded(ctx context.Context, charID int64, battleType int, won bool) error
}

type QuestFinishedListener interface {
	OnQuestFinished(ctx context.Context, charID, questID int64) error
}

type GearStrengthenedListener interface {
	OnGearStrengthened(ctx context.Context, charID int64, slot, level int) error
}

type LoginListener interface {
	OnLogin(ctx context.Context, charID int64) error
}

type Bus struct {
	logger                 *zap.Logger
	monsterKilledListeners []MonsterKilledListener
	itemAcquiredListeners  []ItemAcquiredListener
	itemUsedListeners      []ItemUsedListener
	levelUpListeners       []LevelUpListener
	battleEndedListeners   []BattleEndedListener
	questFinishedListeners []QuestFinishedListener
	gearStrengthListeners  []GearStrengthenedListener
	loginListeners         []LoginListener
}

func NewBus(logger *zap.Logger) *Bus {
	if logger == nil {
		logger = zap.NewNop()
	}

	return &Bus{logger: logger}
}

func (b *Bus) Register(listener interface{}) {
	if b == nil || listener == nil {
		return
	}

	if typed, ok := listener.(MonsterKilledListener); ok {
		b.monsterKilledListeners = append(b.monsterKilledListeners, typed)
	}
	if typed, ok := listener.(ItemAcquiredListener); ok {
		b.itemAcquiredListeners = append(b.itemAcquiredListeners, typed)
	}
	if typed, ok := listener.(ItemUsedListener); ok {
		b.itemUsedListeners = append(b.itemUsedListeners, typed)
	}
	if typed, ok := listener.(LevelUpListener); ok {
		b.levelUpListeners = append(b.levelUpListeners, typed)
	}
	if typed, ok := listener.(BattleEndedListener); ok {
		b.battleEndedListeners = append(b.battleEndedListeners, typed)
	}
	if typed, ok := listener.(QuestFinishedListener); ok {
		b.questFinishedListeners = append(b.questFinishedListeners, typed)
	}
	if typed, ok := listener.(GearStrengthenedListener); ok {
		b.gearStrengthListeners = append(b.gearStrengthListeners, typed)
	}
	if typed, ok := listener.(LoginListener); ok {
		b.loginListeners = append(b.loginListeners, typed)
	}
}

func (b *Bus) EmitMonsterKilled(ctx context.Context, charID, creatureID int64, count int) {
	if b == nil {
		return
	}

	for _, listener := range b.monsterKilledListeners {
		if err := listener.OnMonsterKilled(ctx, charID, creatureID, count); err != nil {
			b.logError("monster_killed", charID, err)
		}
	}
}

func (b *Bus) EmitItemAcquired(ctx context.Context, charID, itemID int64, qty int) {
	if b == nil {
		return
	}

	for _, listener := range b.itemAcquiredListeners {
		if err := listener.OnItemAcquired(ctx, charID, itemID, qty); err != nil {
			b.logError("item_acquired", charID, err)
		}
	}
}

func (b *Bus) EmitItemUsed(ctx context.Context, charID, itemID int64, qty int) {
	if b == nil {
		return
	}

	for _, listener := range b.itemUsedListeners {
		if err := listener.OnItemUsed(ctx, charID, itemID, qty); err != nil {
			b.logError("item_used", charID, err)
		}
	}
}

func (b *Bus) EmitLevelUp(ctx context.Context, charID int64, oldLevel, newLevel int) {
	if b == nil {
		return
	}

	for _, listener := range b.levelUpListeners {
		if err := listener.OnLevelUp(ctx, charID, oldLevel, newLevel); err != nil {
			b.logError("level_up", charID, err)
		}
	}
}

func (b *Bus) EmitBattleEnded(ctx context.Context, charID int64, battleType int, won bool) {
	if b == nil {
		return
	}

	for _, listener := range b.battleEndedListeners {
		if err := listener.OnBattleEnded(ctx, charID, battleType, won); err != nil {
			b.logError("battle_ended", charID, err)
		}
	}
}

func (b *Bus) EmitQuestFinished(ctx context.Context, charID, questID int64) {
	if b == nil {
		return
	}

	for _, listener := range b.questFinishedListeners {
		if err := listener.OnQuestFinished(ctx, charID, questID); err != nil {
			b.logError("quest_finished", charID, err)
		}
	}
}

func (b *Bus) EmitGearStrengthened(ctx context.Context, charID int64, slot, level int) {
	if b == nil {
		return
	}

	for _, listener := range b.gearStrengthListeners {
		if err := listener.OnGearStrengthened(ctx, charID, slot, level); err != nil {
			b.logError("gear_strengthened", charID, err)
		}
	}
}

func (b *Bus) EmitLogin(ctx context.Context, charID int64) {
	if b == nil {
		return
	}

	for _, listener := range b.loginListeners {
		if err := listener.OnLogin(ctx, charID); err != nil {
			b.logError("login", charID, err)
		}
	}
}

func (b *Bus) logError(event string, charID int64, err error) {
	logger := b.logger
	if logger == nil {
		logger = zap.NewNop()
	}

	logger.Warn("Event listener failed",
		zap.String("event", event),
		zap.Int64("character_id", charID),
		zap.Error(err))
}
