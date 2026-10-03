// Open-sourced by BaoLT

// Buff application service: persistence, aggregation, and Flash payload helpers.
//
// Buffs live in player.character_buffs. They feed two sinks:
//   1. AggregateCharacterStatBonuses contributes to the character bonus pipeline
//      consumed by item.Service.AggregateEquipmentStats so heal MaxHP/MaxMP and
//      stat refresh stay correct.
//   2. BuildLongBuffPayload / BuildInitLongBuffPayload produce the AMF objects
//      expected by the Flash LongBuffCanvas (initLongBuff, onAddLongBuff,
//      upLongBuff, delBuff).
package buff

import (
	"context"
	"errors"
	"time"

	domainbuff "mcgame-server/internal/domain/buff"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/gamedata"
	statfeatureapp "mcgame-server/internal/application/statfeature"

	"go.uber.org/zap"
)

var (
	ErrBuffNotFound      = errors.New("buff: not found")
	ErrBuffNotRemovable  = errors.New("buff: not user-removable")
	ErrBuffWrongOwner    = errors.New("buff: not owned by character")
	ErrUnknownBuffID     = errors.New("buff: unknown template id")
)

type Service struct {
	repo     domainbuff.Repository
	gameData *gamedata.Manager
	logger   *zap.Logger
}

func NewService(repo domainbuff.Repository, gameData *gamedata.Manager, logger *zap.Logger) *Service {
	if logger == nil {
		logger = zap.NewNop()
	}
	return &Service{repo: repo, gameData: gameData, logger: logger}
}

type AddRequest struct {
	BuffID        int
	BuffType      int
	Source        string
	Duration      time.Duration
	BattlesLeft   *int
	RoundsLeft    *int
	StackCount    int
}

func (s *Service) AddOrRefresh(ctx context.Context, characterID int64, req AddRequest) (*domainbuff.Buff, error) {
	if s == nil || s.repo == nil {
		return nil, errors.New("buff: service not initialised")
	}
	if req.BuffID <= 0 {
		return nil, ErrUnknownBuffID
	}
	if s.gameData != nil && s.gameData.GetBuff(req.BuffID) == nil {
		return nil, ErrUnknownBuffID
	}
	if req.BuffType <= 0 {
		req.BuffType = domainbuff.TypePermanent
	}

	now := time.Now()
	b := &domainbuff.Buff{
		CharacterID: characterID,
		BuffID:      req.BuffID,
		BuffType:    req.BuffType,
		Source:      req.Source,
		StackCount:  req.StackCount,
		BattlesLeft: req.BattlesLeft,
		RoundsLeft:  req.RoundsLeft,
		CreatedAt:   now,
	}
	if req.Duration > 0 {
		seconds := int(req.Duration / time.Second)
		if seconds <= 0 {
			seconds = 1
		}
		b.DurationTotal = seconds
		expiry := now.Add(req.Duration)
		b.ExpiresAt = &expiry
	}
	stored, err := s.repo.Upsert(ctx, b)
	if err != nil {
		return nil, err
	}
	return stored, nil
}

func (s *Service) ListActive(ctx context.Context, characterID int64) ([]*domainbuff.Buff, error) {
	if s == nil || s.repo == nil {
		return nil, nil
	}
	now := time.Now()
	if _, err := s.repo.DeleteExpired(ctx, characterID, now); err != nil {
		s.logger.Warn("buff: failed to purge expired", zap.Int64("character_id", characterID), zap.Error(err))
	}
	all, err := s.repo.ListByCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}
	out := all[:0]
	for _, b := range all {
		if b.IsExpired(now) {
			continue
		}
		if s.gameData != nil && s.gameData.GetBuff(b.BuffID) == nil {
			continue
		}
		out = append(out, b)
	}
	return out, nil
}

// RemoveByClient honors a delBuffClient(id) RPC. It enforces ownership and the
// TBL_BUFF.buff (removable) flag before deleting.
func (s *Service) RemoveByClient(ctx context.Context, characterID int64, id int64) (*domainbuff.Buff, error) {
	if s == nil || s.repo == nil {
		return nil, ErrBuffNotFound
	}
	b, err := s.repo.GetByID(ctx, id)
	if err != nil {
		return nil, err
	}
	if b == nil {
		return nil, ErrBuffNotFound
	}
	if b.CharacterID != characterID {
		return nil, ErrBuffWrongOwner
	}
	if !s.IsRemovable(b.BuffID) {
		return nil, ErrBuffNotRemovable
	}
	if err := s.repo.Delete(ctx, id); err != nil {
		return nil, err
	}
	return b, nil
}

// IsRemovable mirrors the client-side rule in LongBuffCanvas.buffClick: a buff
// can only be cleared when its TBL_BUFF row has buff != 0.
func (s *Service) IsRemovable(buffID int) bool {
	if s == nil || s.gameData == nil {
		return false
	}
	tpl := s.gameData.GetBuff(buffID)
	if tpl == nil {
		return false
	}
	return int(tpl.Buff) != 0
}

// AggregateCharacterStatBonuses implements item.CharacterBonusProvider so the
// buff service can be plugged into AggregateEquipmentStats alongside statfeature.
func (s *Service) AggregateCharacterStatBonuses(ctx context.Context, characterID int64) domainchar.EquipmentStatBonuses {
	bonuses := domainchar.NewEquipmentStatBonuses()
	if s == nil || s.gameData == nil {
		return bonuses
	}
	active, err := s.ListActive(ctx, characterID)
	if err != nil {
		s.logger.Warn("buff: aggregate failed", zap.Int64("character_id", characterID), zap.Error(err))
		return bonuses
	}
	for _, b := range active {
		tpl := s.gameData.GetBuff(b.BuffID)
		if tpl == nil {
			continue
		}
		statfeatureapp.ApplyBuffTemplateBonus(&bonuses, tpl)
	}
	return bonuses
}

// BuildLongBuffPayload turns a stored buff into the AMF object the Flash
// LongBuffCanvas expects on onAddLongBuff / upLongBuff.
func (s *Service) BuildLongBuffPayload(b *domainbuff.Buff) map[string]interface{} {
	if b == nil {
		return nil
	}
	payload := map[string]interface{}{
		"id":   b.ID,
		"bid":  b.BuffID,
		"type": b.BuffType,
	}
	if b.BattlesLeft != nil {
		payload["battleLeft"] = *b.BattlesLeft
	}
	if b.ExpiresAt != nil {
		now := time.Now()
		left := b.ExpiresAt.Sub(now)
		if left < 0 {
			left = 0
		}
		payload["timeAll"] = b.DurationTotal
		payload["addTime"] = b.CreatedAt.Unix()
		payload["timeLeft"] = int(left / time.Second)
		payload["ineffectiveTime"] = b.ExpiresAt.UnixMilli()
	}
	return payload
}

// BuildInitLongBuffPayload is keyed by buff id for the initLongBuff callback.
func (s *Service) BuildInitLongBuffPayload(buffs []*domainbuff.Buff) map[string]interface{} {
	out := make(map[string]interface{}, len(buffs))
	for _, b := range buffs {
		payload := s.BuildLongBuffPayload(b)
		if payload == nil {
			continue
		}
		key := encodeBuffKey(b.ID)
		out[key] = payload
	}
	return out
}

func encodeBuffKey(id int64) string {
	const digits = "0123456789"
	if id == 0 {
		return "0"
	}
	negative := id < 0
	if negative {
		id = -id
	}
	buf := make([]byte, 0, 20)
	for id > 0 {
		buf = append(buf, digits[id%10])
		id /= 10
	}
	for i, j := 0, len(buf)-1; i < j; i, j = i+1, j-1 {
		buf[i], buf[j] = buf[j], buf[i]
	}
	if negative {
		return "-" + string(buf)
	}
	return string(buf)
}
