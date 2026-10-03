// Open-sourced by BaoLT

// Social service handles friend and relationship use cases.
// Provides relationship lists, friend lists, and blacklist management.
// Integrates with online checker for real-time status updates.
package social

import (
	"context"
	"fmt"
	"time"

	"mcgame-server/internal/domain/social"
	pkgerrors "mcgame-server/pkg/errors"

	"go.uber.org/zap"
)

type OnlineChecker interface {
	IsCharacterOnline(characterID string) bool
}

type CharacterInfoProvider interface {
	GetCharacterBasicInfo(ctx context.Context, characterID int64) (*social.CharacterOnlineData, error)
	GetCharacterIDByName(ctx context.Context, name string) (int64, string, error) // Returns ID and exact Name
	GetCharacterNameByID(ctx context.Context, characterID int64) (string, error)
}

type Service struct {
	repo         social.Repository
	infoProvider CharacterInfoProvider
	onlineCheck  OnlineChecker
	logger       *zap.Logger
}

func NewService(repo social.Repository, infoProvider CharacterInfoProvider, logger *zap.Logger) *Service {
	return &Service{
		repo:         repo,
		infoProvider: infoProvider,
		logger:       logger,
	}
}

func (s *Service) SetOnlineChecker(checker OnlineChecker) {
	s.onlineCheck = checker
}

func (s *Service) GetRelationshipList(ctx context.Context, characterID int64) ([]map[string]any, error) {
	relationships, err := s.repo.FindByCharacterID(ctx, characterID)
	if err != nil {
		s.logger.Error("Failed to get relationships",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make([]map[string]any, 0, len(relationships))
	for _, rel := range relationships {
		var onlineData *social.CharacterOnlineData

		if s.onlineCheck != nil && s.onlineCheck.IsCharacterOnline(fmt.Sprintf("%d", rel.OtherID)) {
			onlineData, err = s.infoProvider.GetCharacterBasicInfo(ctx, rel.OtherID)
			if err != nil {
				s.logger.Warn("Failed to get character info for online friend",
					zap.Int64("friend_id", rel.OtherID),
					zap.Error(err))
				onlineData = nil
			}
		}

		result = append(result, rel.ToDTO(onlineData))
	}

	s.logger.Debug("Retrieved relationship list",
		zap.Int64("character_id", characterID),
		zap.Int("count", len(result)))

	return result, nil
}

func (s *Service) GetFriendList(ctx context.Context, characterID int64) ([]map[string]any, error) {
	friends, err := s.repo.FindFriends(ctx, characterID)
	if err != nil {
		s.logger.Error("Failed to get friends",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make([]map[string]any, 0, len(friends))
	for _, rel := range friends {
		var onlineData *social.CharacterOnlineData

		if s.onlineCheck != nil && s.onlineCheck.IsCharacterOnline(fmt.Sprintf("%d", rel.OtherID)) {
			onlineData, err = s.infoProvider.GetCharacterBasicInfo(ctx, rel.OtherID)
			if err != nil {
				s.logger.Warn("Failed to get character info for online friend",
					zap.Int64("friend_id", rel.OtherID),
					zap.Error(err))
				onlineData = nil
			}
		}

		result = append(result, rel.ToDTO(onlineData))
	}

	return result, nil
}

func (s *Service) GetBlacklist(ctx context.Context, characterID int64) ([]map[string]any, error) {
	blacklist, err := s.repo.FindBlacklist(ctx, characterID)
	if err != nil {
		s.logger.Error("Failed to get blacklist",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make([]map[string]any, 0, len(blacklist))
	for _, rel := range blacklist {
		result = append(result, rel.ToDTO(nil))
	}

	return result, nil
}

func (s *Service) GetBlacklistForLogin(ctx context.Context, characterID int64) ([]interface{}, error) {
	blacklist, err := s.repo.FindBlacklist(ctx, characterID)
	if err != nil {
		s.logger.Error("Failed to get blacklist for login",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make([]interface{}, 0, len(blacklist))
	for _, rel := range blacklist {
		result = append(result, rel.ToBlacklistDTO(characterID))
	}

	return result, nil
}

func (s *Service) IsCharacterOnline(characterID int64) bool {
	if s.onlineCheck == nil {
		return false
	}
	return s.onlineCheck.IsCharacterOnline(fmt.Sprintf("%d", characterID))
}

func (s *Service) GetCharacterName(ctx context.Context, characterID int64) (string, error) {
	return s.infoProvider.GetCharacterNameByID(ctx, characterID)
}

func (s *Service) AddRelationshipByName(ctx context.Context, characterID int64, otherName string, relType int) (map[string]any, error) {
	otherID, exactName, err := s.infoProvider.GetCharacterIDByName(ctx, otherName)
	if err != nil {
		return nil, err
	}

	if characterID == otherID {
		return nil, fmt.Errorf("cannot add yourself")
	}

	exists, err := s.repo.Exists(ctx, characterID, otherID, relType)
	if err != nil {
		return nil, err
	}
	if exists {
		return nil, fmt.Errorf("relationship already exists")
	}

	rel := &social.Relationship{
		CharacterID: characterID,
		OtherID:     otherID,
		OtherName:   exactName,
		Type:        relType,
		CreatedAt:   time.Now(),
	}

	if err := s.repo.Create(ctx, rel); err != nil {
		return nil, err
	}

	var onlineData *social.CharacterOnlineData
	if s.onlineCheck != nil && s.onlineCheck.IsCharacterOnline(fmt.Sprintf("%d", otherID)) {
		onlineData, _ = s.infoProvider.GetCharacterBasicInfo(ctx, otherID)
	}

	return rel.ToDTO(onlineData), nil
}

func (s *Service) DeleteRelationship(ctx context.Context, characterID, otherID int64, relType int) error {
	return s.repo.Delete(ctx, characterID, otherID, relType)
}

func (s *Service) DeleteRelationshipByID(ctx context.Context, characterID int64, relationshipID int64) error {
	rel, err := s.repo.FindByID(ctx, relationshipID)
	if err != nil {
		return err
	}
	if rel.CharacterID != characterID {
		return pkgerrors.ErrUnauthorized
	}
	return s.repo.DeleteByID(ctx, characterID, relationshipID, rel.Type)
}

func (s *Service) GetTeacherStudentList(ctx context.Context, characterID int64) ([]map[string]any, error) {
	students, err := s.repo.FindByCharacterAndType(ctx, characterID, social.RelationshipTypeTutor)
	if err != nil {
		s.logger.Error("Failed to get students",
			zap.Int64("character_id", characterID),
			zap.Error(err))
		return nil, err
	}

	result := make([]map[string]any, 0, len(students))
	for _, rel := range students {
		ll := "0|0"
		honor := rel.Intimacy

		onlineData, onlineErr := s.infoProvider.GetCharacterBasicInfo(ctx, rel.OtherID)
		if onlineErr == nil && onlineData != nil {
			ll = fmt.Sprintf("%d|0", onlineData.Exp)
		}

		result = append(result, map[string]any{
			"id":    rel.OtherID,
			"name":  rel.OtherName,
			"ll":    ll,
			"honor": honor,
		})
	}

	return result, nil
}

func (s *Service) FindTeacher(ctx context.Context, characterID int64, teacherName string) (map[string]any, error) {
	teacherID, exactName, err := s.infoProvider.GetCharacterIDByName(ctx, teacherName)
	if err != nil {
		return map[string]any{"t": 2, "f": 1}, nil // Player not found
	}

	if teacherID == characterID {
		return map[string]any{"t": 2, "f": 7}, nil
	}

	// Check if already has a teacher
	existingTeacher, err := s.repo.FindByCharacterAndType(ctx, characterID, social.RelationshipTypeTutor)
	if err == nil && len(existingTeacher) > 0 {
		// Check if this teacher is already the teacher (reverse relationship)
		for _, rel := range existingTeacher {
			if rel.OtherID == teacherID {
				return map[string]any{"t": 2, "f": 2}, nil // Already has this teacher
			}
		}
		return map[string]any{"t": 2, "f": 3}, nil // Already has a teacher
	}

	// Check if teacher already has too many students (limit to 5 for example)
	teacherStudents, err := s.repo.FindByCharacterAndType(ctx, teacherID, social.RelationshipTypeTutor)
	if err == nil && len(teacherStudents) >= 5 {
		return map[string]any{"t": 2, "f": 4}, nil // Teacher has too many students
	}

	// Check level requirements (teacher must be higher level)
	teacherInfo, err := s.infoProvider.GetCharacterBasicInfo(ctx, teacherID)
	if err != nil {
		return map[string]any{"t": 2, "f": 5}, nil // Cannot get teacher info
	}

	charInfo, err := s.infoProvider.GetCharacterBasicInfo(ctx, characterID)
	if err != nil {
		return map[string]any{"t": 2, "f": 5}, nil // Cannot get character info
	}

	if teacherInfo.Exp <= charInfo.Exp {
		return map[string]any{"t": 2, "f": 6}, nil // Teacher level too low
	}

	// Return success - client will handle the actual relationship creation
	return map[string]any{
		"t": 1,
		"i": teacherID,
		"n": exactName,
	}, nil
}

func (s *Service) FindStudent(ctx context.Context, characterID int64, studentName string) (map[string]any, error) {
	studentID, exactName, err := s.infoProvider.GetCharacterIDByName(ctx, studentName)
	if err != nil {
		return map[string]any{"t": 2, "f": 1}, nil // Player not found
	}

	if studentID == characterID {
		return map[string]any{"t": 1, "f": 8}, nil
	}

	// Check if character already has a teacher
	existingTeacher, err := s.repo.FindByCharacterAndType(ctx, studentID, social.RelationshipTypeTutor)
	if err == nil && len(existingTeacher) > 0 {
		return map[string]any{"t": 2, "f": 2}, nil // Student already has a teacher
	}

	// Check if already has this student
	existingStudents, err := s.repo.FindByCharacterAndType(ctx, characterID, social.RelationshipTypeTutor)
	if err == nil {
		for _, rel := range existingStudents {
			if rel.OtherID == studentID {
				return map[string]any{"t": 2, "f": 3}, nil // Already has this student
			}
		}
	}

	// Check student limit
	if len(existingStudents) >= 5 {
		return map[string]any{"t": 2, "f": 4}, nil // Too many students
	}

	// Check level requirements
	teacherInfo, err := s.infoProvider.GetCharacterBasicInfo(ctx, characterID)
	if err != nil {
		return map[string]any{"t": 2, "f": 5}, nil
	}

	studentInfo, err := s.infoProvider.GetCharacterBasicInfo(ctx, studentID)
	if err != nil {
		return map[string]any{"t": 2, "f": 5}, nil
	}

	if teacherInfo.Exp <= studentInfo.Exp {
		return map[string]any{"t": 2, "f": 5}, nil // Teacher level too low
	}

	// Return success
	return map[string]any{
		"t": 1,
		"i": studentID,
		"n": exactName,
	}, nil
}

func (s *Service) DeleteStudent(ctx context.Context, characterID, studentID int64) (map[string]any, error) {
	// Get relationship first to get student name
	relationships, err := s.repo.FindByCharacterAndType(ctx, characterID, social.RelationshipTypeTutor)
	if err != nil {
		return map[string]any{"t": 2}, nil
	}

	var studentName string
	for _, rel := range relationships {
		if rel.OtherID == studentID {
			studentName = rel.OtherName
			break
		}
	}

	err = s.repo.Delete(ctx, characterID, studentID, social.RelationshipTypeTutor)
	if err != nil {
		return map[string]any{"t": 2}, nil
	}

	return map[string]any{
		"t": 1,
		"i": studentID,
		"n": studentName,
	}, nil
}

func (s *Service) ReportTeacherStudentProgress(ctx context.Context, characterID int64) (map[string]any, error) {
	// Get teacher-student relationships
	relationships, err := s.repo.FindByCharacterAndType(ctx, characterID, social.RelationshipTypeTutor)
	if err != nil {
		return nil, err
	}

	// For now, return basic progress info
	// In a full implementation, this would calculate actual progress
	result := map[string]any{
		"t":  1,
		"tp": 0, // teacher points
	}

	// Add student progress
	for _, rel := range relationships {
		// In real implementation, would calculate level/exp progress
		result["ll"] = rel.Intimacy // Use intimacy as progress for now
		break                       // Just return first student's progress for now
	}

	return result, nil
}
