// Open-sourced by BaoLT

// Marriage service builds client-compatible panel payloads.
package marriage

import (
	"context"
	"errors"
	"fmt"
	"sort"
	"time"

	domainchar "mcgame-server/internal/domain/character"
	domainmarriage "mcgame-server/internal/domain/marriage"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

const coupleRankPageSize = 20

type OnlineChecker interface {
	IsCharacterOnline(characterID string) bool
}

type Service struct {
	characterRepo domainchar.Repository
	repo          domainmarriage.Repository
	store         domainmarriage.Store
	onlineCheck   OnlineChecker
	logger        *zap.Logger
}

func NewService(
	characterRepo domainchar.Repository,
	repo domainmarriage.Repository,
	store domainmarriage.Store,
	logger *zap.Logger,
) *Service {
	return &Service{
		characterRepo: characterRepo,
		repo:          repo,
		store:         store,
		logger:        logger,
	}
}

func (s *Service) SetOnlineChecker(checker OnlineChecker) {
	s.onlineCheck = checker
}

func (s *Service) InitPanel(ctx context.Context, characterID int64) ([]map[string]interface{}, []map[string]interface{}, error) {
	seekingList, err := s.buildSeekingList(ctx)
	if err != nil {
		return nil, nil, err
	}

	charMarriageList, err := s.buildCharacterMarriageList(ctx, characterID)
	if err != nil {
		return nil, nil, err
	}

	return seekingList, charMarriageList, nil
}

func (s *Service) UpdateSeeking(ctx context.Context, characterID int64, introduce string, flag int) error {
	char, err := s.characterRepo.FindByID(ctx, characterID)
	if err != nil {
		return err
	}
	if char == nil {
		return pkgerrors.ErrCharacterNotFound
	}

	if err := s.ensureNotMarried(ctx, characterID); err != nil {
		return err
	}

	entry := &domainmarriage.SeekingEntry{
		CharacterID: characterID,
		Content:     introduce,
		Flag:        flag,
		AddDate:     time.Now().UnixMilli(),
	}

	return s.store.SaveSeeking(ctx, entry)
}

func (s *Service) CreateRequest(ctx context.Context, characterID, targetID int64, targetName, introduce string) error {
	if characterID == targetID {
		return pkgerrors.ErrInvalidInput
	}

	requester, err := s.characterRepo.FindByID(ctx, characterID)
	if err != nil {
		return err
	}
	if requester == nil {
		return pkgerrors.ErrCharacterNotFound
	}

	target, err := s.characterRepo.FindByID(ctx, targetID)
	if err != nil {
		return err
	}
	if target == nil {
		return pkgerrors.ErrCharacterNotFound
	}

	if targetName != "" && target.Name != targetName {
		s.logger.Warn("CreateRequest: target name mismatch",
			zap.Int64("target_id", targetID),
			zap.String("expected_name", targetName),
			zap.String("actual_name", target.Name))
	}

	if err := s.ensureNotMarried(ctx, characterID); err != nil {
		return err
	}
	if err := s.ensureNotMarried(ctx, targetID); err != nil {
		return err
	}

	existing, err := s.store.ListRequestsForCharacter(ctx, characterID)
	if err == nil {
		for _, request := range existing {
			if request.FromID == characterID && request.ToID == targetID && request.Flag == 0 {
				return nil
			}
		}
	}

	requestID, err := s.store.NextRequestID(ctx)
	if err != nil {
		return err
	}

	entry := &domainmarriage.RequestEntry{
		ID:      requestID,
		FromID:  characterID,
		ToID:    targetID,
		Content: introduce,
		Flag:    0,
		AddDate: time.Now().UnixMilli(),
	}

	return s.store.SaveRequest(ctx, entry)
}

func (s *Service) RespondRequest(ctx context.Context, characterID, requestID int64, response int) error {
	request, err := s.store.GetRequest(ctx, requestID)
	if err != nil {
		return err
	}
	if request == nil {
		return pkgerrors.ErrNotFound
	}
	if request.ToID != characterID {
		return pkgerrors.ErrUnauthorized
	}
	if request.Flag != 0 {
		return nil
	}
	if response != 1 && response != 2 {
		return pkgerrors.ErrInvalidInput
	}

	if response == 1 {
		if err := s.ensureNotMarried(ctx, request.FromID); err != nil {
			return err
		}
		if err := s.ensureNotMarried(ctx, request.ToID); err != nil {
			return err
		}

		record := &domainmarriage.MarriageRecord{
			Partner1ID: request.FromID,
			Partner2ID: request.ToID,
			RingType:   1,
			Intimacy:   0,
		}
		if err := s.repo.Create(ctx, record); err != nil {
			return err
		}

		if err := s.store.DeleteSeeking(ctx, request.FromID); err != nil {
			s.logger.Warn("RespondRequest: failed to delete requester seeking",
				zap.Int64("character_id", request.FromID),
				zap.Error(err))
		}
		if err := s.store.DeleteSeeking(ctx, request.ToID); err != nil {
			s.logger.Warn("RespondRequest: failed to delete target seeking",
				zap.Int64("character_id", request.ToID),
				zap.Error(err))
		}
	}

	request.Flag = response
	request.ReplyDate = time.Now().UnixMilli()

	return s.store.SaveRequest(ctx, request)
}

func (s *Service) CancelSeeking(ctx context.Context, characterID int64) error {
	return s.store.DeleteSeeking(ctx, characterID)
}

func (s *Service) GetCoupleRank(ctx context.Context, page int) ([]map[string]interface{}, error) {
	if page < 0 {
		page = 0
	}

	ranks, err := s.repo.ListRanks(ctx, page*coupleRankPageSize, coupleRankPageSize)
	if err != nil {
		return nil, err
	}

	result := make([]map[string]interface{}, 0, len(ranks))
	for _, rank := range ranks {
		result = append(result, map[string]interface{}{
			"id":         rank.ID,
			"partner1":   rank.Partner1Name,
			"partner1Id": rank.Partner1ID,
			"partner2":   rank.Partner2Name,
			"partner2Id": rank.Partner2ID,
			"intimacy":   rank.Intimacy,
			"ringType":   rank.RingType,
			"marriedAt":  rank.MarriedAt.UnixMilli(),
		})
	}

	return result, nil
}

func (s *Service) buildSeekingList(ctx context.Context) ([]map[string]interface{}, error) {
	entries, err := s.store.ListSeeking(ctx, 100)
	if err != nil {
		return nil, err
	}

	result := make([]map[string]interface{}, 0, len(entries))
	for _, entry := range entries {
		dto, dtoErr := s.seekingDTO(ctx, entry)
		if dtoErr != nil {
			s.logger.Warn("buildSeekingList: failed to build DTO",
				zap.Int64("character_id", entry.CharacterID),
				zap.Error(dtoErr))
			continue
		}
		result = append(result, dto)
	}

	sort.SliceStable(result, func(i, j int) bool {
		leftFlag, _ := result[i]["flag"].(int)
		rightFlag, _ := result[j]["flag"].(int)
		if leftFlag != rightFlag {
			return leftFlag > rightFlag
		}

		leftDate, _ := result[i]["addDate"].(int64)
		rightDate, _ := result[j]["addDate"].(int64)
		return leftDate > rightDate
	})

	return result, nil
}

func (s *Service) buildCharacterMarriageList(ctx context.Context, characterID int64) ([]map[string]interface{}, error) {
	result := make([]map[string]interface{}, 0)

	seeking, err := s.store.GetSeeking(ctx, characterID)
	if err != nil {
		return nil, err
	}
	if seeking != nil {
		result = append(result, map[string]interface{}{
			"type":    0,
			"cid":     seeking.CharacterID,
			"content": seeking.Content,
			"flag":    seeking.Flag,
			"addDate": seeking.AddDate,
		})
	}

	requests, err := s.store.ListRequestsForCharacter(ctx, characterID)
	if err != nil {
		return nil, err
	}

	for _, request := range requests {
		dto, dtoErr := s.requestDTO(ctx, request)
		if dtoErr != nil {
			s.logger.Warn("buildCharacterMarriageList: failed to build request DTO",
				zap.Int64("request_id", request.ID),
				zap.Error(dtoErr))
			continue
		}
		result = append(result, dto)
	}

	sort.SliceStable(result, func(i, j int) bool {
		leftDate, _ := result[i]["addDate"].(int64)
		rightDate, _ := result[j]["addDate"].(int64)
		return leftDate > rightDate
	})

	return result, nil
}

func (s *Service) seekingDTO(ctx context.Context, entry *domainmarriage.SeekingEntry) (map[string]interface{}, error) {
	char, err := s.characterRepo.FindByID(ctx, entry.CharacterID)
	if err != nil {
		return nil, err
	}
	if char == nil {
		return nil, pkgerrors.ErrCharacterNotFound
	}

	return map[string]interface{}{
		"cid":     char.ID,
		"name":    char.Name,
		"classId": char.ClassID,
		"gender":  char.Gender,
		"exp":     char.CumulativeExpCapped(),
		"online":  s.isOnline(char.ID),
		"flag":    entry.Flag,
		"content": entry.Content,
		"addDate": entry.AddDate,
		"pop":     0,
	}, nil
}

func (s *Service) requestDTO(ctx context.Context, entry *domainmarriage.RequestEntry) (map[string]interface{}, error) {
	fromChar, err := s.characterRepo.FindByID(ctx, entry.FromID)
	if err != nil {
		return nil, err
	}
	if fromChar == nil {
		return nil, pkgerrors.ErrCharacterNotFound
	}

	toChar, err := s.characterRepo.FindByID(ctx, entry.ToID)
	if err != nil {
		return nil, err
	}
	if toChar == nil {
		return nil, pkgerrors.ErrCharacterNotFound
	}

	return map[string]interface{}{
		"id":       entry.ID,
		"type":     1,
		"cid":      entry.FromID,
		"targetId": entry.ToID,
		"name":     fmt.Sprintf("%s|%s", fromChar.Name, toChar.Name),
		"classId":  fromChar.ClassID,
		"gender":   fromChar.Gender,
		"exp":      fromChar.CumulativeExpCapped(),
		"online":   s.isOnline(fromChar.ID),
		"content":  entry.Content,
		"addDate":  entry.AddDate,
		"flag":     entry.Flag,
	}, nil
}

func (s *Service) ensureNotMarried(ctx context.Context, characterID int64) error {
	_, err := s.repo.FindByPartner(ctx, characterID)
	if err == nil {
		return pkgerrors.ErrAlreadyExists
	}
	if errors.Is(err, pkgerrors.ErrNotFound) {
		return nil
	}
	return err
}

func (s *Service) isOnline(characterID int64) bool {
	if s.onlineCheck == nil {
		return false
	}
	return s.onlineCheck.IsCharacterOnline(fmt.Sprintf("%d", characterID))
}
