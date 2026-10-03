// Open-sourced by BaoLT

// Pet arena service handles competitive pet battle use cases.
// Manages arena rankings, matchmaking, battles, tickets, and season rewards.
// Uses Elo-based rating system for balanced matchmaking.
package petarena

import (
	"context"
	"errors"
	"fmt"
	"time"

	"go.uber.org/zap"
	domainchar "mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/petarena"
	pkgerrors "mcgame-server/pkg/errors"
)

type Service struct {
	arenaRepo petarena.Repository
	petRepo   pet.Repository
	charRepo  CharacterRepository
	simulator *petarena.BattleSimulator
	logger    *zap.Logger
	config    *petarena.ArenaConfig
}

type CharacterRepository interface {
	FindByID(ctx context.Context, id int64) (*domainchar.Character, error)
}

func NewService(arenaRepo petarena.Repository, petRepo pet.Repository, logger *zap.Logger) *Service {
	return &Service{
		arenaRepo: arenaRepo,
		petRepo:   petRepo,
		simulator: petarena.NewBattleSimulator(),
		logger:    logger,
		config:    petarena.DefaultArenaConfig(),
	}
}

func (s *Service) SetCharacterRepository(repo CharacterRepository) {
	s.charRepo = repo
}

func (s *Service) GetArenaData(ctx context.Context, charID int64) (*petarena.ArenaRanking, int, error) {
	ranking, err := s.arenaRepo.GetOrCreateRanking(ctx, charID, s.config.Season)
	if err != nil {
		return nil, 0, err
	}

	if ranking.RefreshTickets() {
		if err := s.arenaRepo.SaveRanking(ctx, ranking); err != nil {
			s.logger.Warn("Failed to save ticket refresh", zap.Error(err))
		}
	}

	rank, err := s.arenaRepo.GetRank(ctx, charID, s.config.Season)
	if err != nil {
		rank = 0
	}

	s.logger.Debug("Arena data retrieved",
		zap.Int64("character_id", charID),
		zap.Int("rating", ranking.Rating),
		zap.Int("rank", rank))

	return ranking, rank, nil
}

func (s *Service) GetArenaRankings(ctx context.Context, page int) ([]*petarena.ArenaRanking, error) {
	limit := 20
	offset := page * limit

	rankings, err := s.arenaRepo.GetTopRankings(ctx, s.config.Season, limit, offset)
	if err != nil {
		return nil, err
	}

	return rankings, nil
}

func (s *Service) SetBattlePet(ctx context.Context, charID int64, petID int64) error {
	p, err := s.petRepo.FindByID(ctx, petID)
	if err != nil {
		return err
	}
	if p.CharacterID != charID {
		return pkgerrors.ErrNotFound
	}

	ranking, err := s.arenaRepo.GetOrCreateRanking(ctx, charID, s.config.Season)
	if err != nil {
		return err
	}

	ranking.PetID = &petID
	return s.arenaRepo.SaveRanking(ctx, ranking)
}

func (s *Service) Fight(ctx context.Context, attackerID int64, defenderID int64) (*petarena.ArenaBattle, *petarena.BattleResult, error) {
	attackerRanking, err := s.arenaRepo.GetOrCreateRanking(ctx, attackerID, s.config.Season)
	if err != nil {
		return nil, nil, err
	}

	if !attackerRanking.CanFight() {
		return nil, nil, pkgerrors.ErrInvalidInput
	}

	if attackerRanking.PetID == nil {
		return nil, nil, pkgerrors.ErrInvalidInput
	}
	attackerPet, err := s.petRepo.FindByID(ctx, *attackerRanking.PetID)
	if err != nil {
		return nil, nil, err
	}

	defenderRanking, err := s.arenaRepo.GetOrCreateRanking(ctx, defenderID, s.config.Season)
	if err != nil {
		return nil, nil, err
	}

	if defenderRanking.PetID == nil {
		return nil, nil, pkgerrors.ErrInvalidInput
	}
	defenderPet, err := s.petRepo.FindByID(ctx, *defenderRanking.PetID)
	if err != nil {
		return nil, nil, err
	}

	result := s.simulator.SimulateBattle(attackerPet, defenderPet, attackerRanking.Rating, defenderRanking.Rating)

	battle := &petarena.ArenaBattle{
		AttackerID:           attackerID,
		DefenderID:           defenderID,
		AttackerPetID:        *attackerRanking.PetID,
		DefenderPetID:        *defenderRanking.PetID,
		AttackerRatingBefore: attackerRanking.Rating,
		DefenderRatingBefore: defenderRanking.Rating,
		RatingChange:         result.AttackerRatingChange,
		BattleLog:            result.Rounds,
		Season:               s.config.Season,
		CreatedAt:            time.Now(),
	}

	if result.AttackerWon {
		battle.WinnerID = &attackerID
		attackerRanking.RecordWin(result.AttackerRatingChange)
		defenderRanking.RecordLoss(result.DefenderRatingChange)
	} else {
		battle.WinnerID = &defenderID
		attackerRanking.RecordLoss(result.AttackerRatingChange)
		defenderRanking.RecordWin(result.DefenderRatingChange)
	}

	attackerRanking.UseTicket()

	if err := s.arenaRepo.SaveBattle(ctx, battle); err != nil {
		return nil, nil, err
	}
	if err := s.arenaRepo.SaveRanking(ctx, attackerRanking); err != nil {
		s.logger.Warn("Failed to save attacker ranking", zap.Error(err))
	}
	if err := s.arenaRepo.SaveRanking(ctx, defenderRanking); err != nil {
		s.logger.Warn("Failed to save defender ranking", zap.Error(err))
	}

	s.logger.Info("Arena battle completed",
		zap.Int64("attacker_id", attackerID),
		zap.Int64("defender_id", defenderID),
		zap.Bool("attacker_won", result.AttackerWon),
		zap.Int("rating_change", result.AttackerRatingChange))

	return battle, result, nil
}

func (s *Service) GetBattleHistory(ctx context.Context, charID int64) ([]*petarena.ArenaBattle, error) {
	return s.arenaRepo.GetBattleHistory(ctx, charID, 20)
}

func (s *Service) GetBattle(ctx context.Context, battleID int64) (*petarena.ArenaBattle, error) {
	return s.arenaRepo.GetBattle(ctx, battleID)
}

func (s *Service) FindOpponents(ctx context.Context, charID int64) ([]*petarena.ArenaRanking, error) {
	ranking, err := s.arenaRepo.GetOrCreateRanking(ctx, charID, s.config.Season)
	if err != nil {
		return nil, err
	}

	return s.arenaRepo.FindOpponents(ctx, charID, ranking.Rating, s.config.Season, 10)
}

func (s *Service) GetTickets(ctx context.Context, charID int64) (int, int, error) {
	ranking, err := s.arenaRepo.GetOrCreateRanking(ctx, charID, s.config.Season)
	if err != nil {
		return 0, 0, err
	}

	if ranking.RefreshTickets() {
		s.arenaRepo.SaveRanking(ctx, ranking)
	}

	return ranking.Tickets, ranking.MaxTickets, nil
}

func (s *Service) AddTickets(ctx context.Context, charID int64, amount int) error {
	ranking, err := s.arenaRepo.GetOrCreateRanking(ctx, charID, s.config.Season)
	if err != nil {
		return err
	}

	ranking.Tickets += amount
	if ranking.Tickets > ranking.MaxTickets*2 {
		ranking.Tickets = ranking.MaxTickets * 2
	}

	return s.arenaRepo.SaveRanking(ctx, ranking)
}

func (s *Service) GetSeasonReward(ctx context.Context, charID int64) (*petarena.ArenaReward, error) {
	lastSeason := s.config.Season - 1
	if lastSeason < 1 {
		return nil, pkgerrors.ErrNotFound
	}

	return s.arenaRepo.GetReward(ctx, charID, lastSeason)
}

func (s *Service) ClaimSeasonReward(ctx context.Context, charID int64) (map[string]interface{}, error) {
	reward, err := s.GetSeasonReward(ctx, charID)
	if err != nil {
		return nil, err
	}

	if reward.ClaimedAt != nil {
		return nil, pkgerrors.ErrInvalidInput
	}

	rewards := s.calculateRewards(reward.Rank, reward.Rating)
	reward.RewardsClaimed = rewards
	now := time.Now()
	reward.ClaimedAt = &now

	if err := s.arenaRepo.SaveReward(ctx, reward); err != nil {
		return nil, err
	}

	s.logger.Info("Season reward claimed",
		zap.Int64("character_id", charID),
		zap.Int("season", reward.Season),
		zap.Int("rank", reward.Rank))

	return rewards, nil
}

func (s *Service) calculateRewards(rank, rating int) map[string]interface{} {
	rewards := map[string]interface{}{
		"gold": 0,
		"exp":  0,
	}

	switch {
	case rank <= 1:
		rewards["gold"] = 100000
		rewards["exp"] = 50000
	case rank <= 10:
		rewards["gold"] = 50000
		rewards["exp"] = 25000
	case rank <= 50:
		rewards["gold"] = 20000
		rewards["exp"] = 10000
	case rank <= 100:
		rewards["gold"] = 10000
		rewards["exp"] = 5000
	default:
		rewards["gold"] = 5000
		rewards["exp"] = 2500
	}

	ratingBonus := rating / 100
	rewards["gold"] = rewards["gold"].(int) + ratingBonus*100
	rewards["exp"] = rewards["exp"].(int) + ratingBonus*50

	return rewards
}

func (s *Service) GetConfig() *petarena.ArenaConfig {
	return s.config
}

func (s *Service) ClearCooldown(ctx context.Context, charID int64) error {
	ranking, err := s.arenaRepo.GetOrCreateRanking(ctx, charID, s.config.Season)
	if err != nil {
		return err
	}

	ranking.Tickets = ranking.MaxTickets
	ranking.LastTicketRefresh = time.Now()

	return s.arenaRepo.SaveRanking(ctx, ranking)
}

func (s *Service) GetActivityInfo(ctx context.Context) map[string]interface{} {
	return map[string]interface{}{
		"season":       s.config.Season,
		"isActive":     true,
		"seasonEnd":    time.Now().AddDate(0, 1, 0).Unix(),
		"seasonStart":  time.Now().AddDate(0, -1, 0).Unix(),
		"refreshHours": s.config.TicketRefreshHours,
	}
}

func (s *Service) GetSystemMessages(ctx context.Context) []map[string]interface{} {
	return []map[string]interface{}{
		{
			"id":      1,
			"type":    "announcement",
			"message": "Pet Arena Season " + string(rune('0'+s.config.Season)) + " is now active!",
			"time":    time.Now().Unix(),
		},
	}
}

func (s *Service) GetLastSeasonRank(ctx context.Context, charID int64) (int, int, error) {
	lastSeason := s.config.Season - 1
	if lastSeason < 1 {
		return 0, 0, nil
	}

	reward, err := s.arenaRepo.GetReward(ctx, charID, lastSeason)
	if err != nil {
		return 0, 0, nil
	}

	return reward.Rank, reward.Rating, nil
}

func (s *Service) GetPetFightConfig(ctx context.Context, charID int64, configKey string) (map[string]interface{}, error) {
	if s.arenaRepo == nil {
		return map[string]interface{}{}, nil
	}

	config, err := s.arenaRepo.GetFightConfig(ctx, charID, configKey)
	if err != nil {
		if errors.Is(err, pkgerrors.ErrNotFound) {
			return map[string]interface{}{}, nil
		}
		return nil, err
	}
	if config == nil || config.ConfData == nil {
		return map[string]interface{}{}, nil
	}
	return config.ConfData, nil
}

func (s *Service) SavePetFightConfig(ctx context.Context, charID int64, configKey string, confData map[string]interface{}) error {
	if s.arenaRepo == nil {
		return pkgerrors.ErrSystemError
	}

	config := &petarena.FightConfig{
		CharacterID: charID,
		ConfigKey:   configKey,
		ConfData:    confData,
	}
	return s.arenaRepo.SaveFightConfig(ctx, config)
}

func (s *Service) RegisterArenaEntry(ctx context.Context, charID int64, teamName string, confData map[string]interface{}) (*petarena.Entry, error) {
	entry, err := s.arenaRepo.GetEntry(ctx, charID, s.config.Season)
	if err != nil && !errors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}
	if entry == nil {
		entry = &petarena.Entry{
			CharacterID: charID,
			Season:      s.config.Season,
			MaxFights:   20,
			UsedFights:  0,
			LastRank:    -1,
		}
	}
	entry.TeamName = teamName
	entry.ConfData = map[string]interface{}{"conf1": confData}
	if entry.MaxFights <= 0 {
		entry.MaxFights = 20
	}
	if entry.LastRank == 0 {
		entry.LastRank = -1
	}
	if err := s.arenaRepo.SaveEntry(ctx, entry); err != nil {
		return nil, err
	}

	if leadPetID := firstConfiguredPetID(confData); leadPetID > 0 {
		_ = s.SetBattlePet(ctx, charID, leadPetID)
	}
	return entry, nil
}

func (s *Service) GetEnemies(ctx context.Context, charID int64) ([]map[string]interface{}, error) {
	selfRanking, rank, err := s.GetArenaData(ctx, charID)
	if err != nil {
		return nil, err
	}
	selfEntry, err := s.arenaRepo.GetEntry(ctx, charID, s.config.Season)
	if err != nil && !errors.Is(err, pkgerrors.ErrNotFound) {
		return nil, err
	}
	if selfEntry == nil {
		return nil, nil
	}

	entries, err := s.arenaRepo.ListEntries(ctx, s.config.Season, 50)
	if err != nil {
		return nil, err
	}

	result := make([]map[string]interface{}, 0, len(entries)+1)
	selfData, err := s.buildEnemySelfRow(ctx, charID, selfRanking, selfEntry, rank)
	if err != nil {
		return nil, err
	}
	result = append(result, selfData)

	for _, entry := range entries {
		if entry == nil || entry.CharacterID == charID {
			continue
		}
		enemyRanking, _ := s.arenaRepo.GetOrCreateRanking(ctx, entry.CharacterID, s.config.Season)
		enemyRank, _ := s.arenaRepo.GetRank(ctx, entry.CharacterID, s.config.Season)
		enemyData, buildErr := s.buildEnemyRow(ctx, entry, enemyRanking, enemyRank)
		if buildErr != nil {
			continue
		}
		result = append(result, enemyData)
	}

	return result, nil
}

func (s *Service) GetArenaRankPayload(ctx context.Context) (map[string]interface{}, error) {
	rankings, err := s.arenaRepo.GetTopRankings(ctx, s.config.Season, 50, 0)
	if err != nil {
		return nil, err
	}

	rRows := make([]map[string]interface{}, 0, len(rankings))
	cRows := make([]map[string]interface{}, 0, len(rankings))
	for index, ranking := range rankings {
		name := fmt.Sprintf("%d", ranking.CharacterID)
		if s.charRepo != nil {
			if ch, err := s.charRepo.FindByID(ctx, ranking.CharacterID); err == nil && ch != nil {
				name = ch.Name
			}
		}
		rRows = append(rRows, map[string]interface{}{
			"rank":  index,
			"name":  name,
			"pnt":   ranking.Rating,
			"win":   ranking.Wins,
			"total": ranking.Wins + ranking.Losses,
		})
		cRows = append(cRows, map[string]interface{}{
			"name":     name,
			"maxCombo": ranking.MaxWinStreak,
		})
	}

	return map[string]interface{}{
		"r": rRows,
		"c": cRows,
	}, nil
}

func (s *Service) buildEnemySelfRow(ctx context.Context, charID int64, ranking *petarena.ArenaRanking, entry *petarena.Entry, rank int) (map[string]interface{}, error) {
	name := fmt.Sprintf("%d", charID)
	level := 1
	if s.charRepo != nil {
		if ch, err := s.charRepo.FindByID(ctx, charID); err == nil && ch != nil {
			name = ch.Name
			level = ch.Level
		}
	}

	maxFights := 20
	usedFights := 0
	lastRank := -1
	cd := int64(0)
	teamName := ""
	if entry != nil {
		if entry.MaxFights > 0 {
			maxFights = entry.MaxFights
		}
		usedFights = entry.UsedFights
		lastRank = entry.LastRank
		cd = entry.CooldownEndsAtMS
		teamName = entry.TeamName
	}

	return map[string]interface{}{
		"name":     fmt.Sprintf("[%d]%s", level, name),
		"max":      maxFights,
		"lrank":    lastRank,
		"pnt":      ranking.Rating,
		"today":    usedFights,
		"maxCombo": ranking.MaxWinStreak,
		"cid":      charID,
		"win":      ranking.Wins,
		"tName":    teamName,
		"total":    ranking.Wins + ranking.Losses,
		"rid":      rewardTierID(rank),
		"rate":     "0",
		"rank":     max(0, rank-1),
		"cd":       cd,
	}, nil
}

func (s *Service) buildEnemyRow(ctx context.Context, entry *petarena.Entry, ranking *petarena.ArenaRanking, rank int) (map[string]interface{}, error) {
	name := fmt.Sprintf("%d", entry.CharacterID)
	level := 1
	if s.charRepo != nil {
		if ch, err := s.charRepo.FindByID(ctx, entry.CharacterID); err == nil && ch != nil {
			name = ch.Name
			level = ch.Level
		}
	}

	total := 0
	win := 0
	if ranking != nil {
		total = ranking.Wins + ranking.Losses
		win = ranking.Wins
	}
	rate := "0%"
	if total > 0 {
		rate = fmt.Sprintf("%d%%", int(float64(win*100)/float64(total)))
	}

	return map[string]interface{}{
		"name":  fmt.Sprintf("[%d]%s", level, name),
		"tName": entry.TeamName,
		"total": total,
		"rate":  rate,
		"cid":   fmt.Sprintf("%d", entry.CharacterID),
		"label": "Khiêu chiến",
		"win":   win,
		"rank":  max(0, rank-1),
	}, nil
}

func rewardTierID(rank int) int {
	switch {
	case rank <= 10:
		return 3
	case rank <= 50:
		return 2
	case rank <= 100:
		return 1
	default:
		return 0
	}
}

func firstConfiguredPetID(confData map[string]interface{}) int64 {
	if len(confData) == 0 {
		return 0
	}
	for _, key := range []string{"5", "6", "7", "8", "9"} {
		raw, ok := confData[key]
		if !ok {
			continue
		}
		entry, ok := raw.(map[string]interface{})
		if !ok {
			continue
		}
		switch pid := entry["pid"].(type) {
		case float64:
			if int64(pid) > 0 {
				return int64(pid)
			}
		case int64:
			if pid > 0 {
				return pid
			}
		case int:
			if pid > 0 {
				return int64(pid)
			}
		}
	}
	return 0
}
