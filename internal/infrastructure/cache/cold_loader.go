// Open-sourced by BaoLT

package cache

import (
	"context"
	"encoding/json"
	"fmt"
	"time"

	"mcgame-server/internal/domain/pet"
	"mcgame-server/internal/domain/quest"
	"mcgame-server/internal/domain/skill"
	infraredis "mcgame-server/internal/infrastructure/redis"

	"go.uber.org/zap"
)

const (
	coldQuestsKey = "player:cold:quests:"
	coldSkillsKey = "player:cold:skills:"
	coldPetsKey   = "player:cold:pets:"
	coldTTL       = 2 * time.Hour
)

type ColdLoader struct {
	redisClient *infraredis.Client
	questRepo   quest.Repository
	skillRepo   skill.Repository
	petRepo     pet.Repository
	logger      *zap.Logger
}

func NewColdLoader(
	redisClient *infraredis.Client,
	questRepo quest.Repository,
	skillRepo skill.Repository,
	petRepo pet.Repository,
	logger *zap.Logger,
) *ColdLoader {
	return &ColdLoader{
		redisClient: redisClient,
		questRepo:   questRepo,
		skillRepo:   skillRepo,
		petRepo:     petRepo,
		logger:      logger,
	}
}

func (c *ColdLoader) GetQuests(ctx context.Context, charID int64) (map[int64]*quest.QuestProgress, error) {
	if c.redisClient == nil {
		return c.loadQuestsFromDB(ctx, charID)
	}

	key := fmt.Sprintf("%s%d", coldQuestsKey, charID)
	data, err := c.redisClient.GetClient().Get(ctx, key).Bytes()
	if err != nil {
		return c.loadQuestsFromDB(ctx, charID)
	}

	var quests map[int64]*quest.QuestProgress
	if err := json.Unmarshal(data, &quests); err != nil {
		c.logger.Warn("Failed to unmarshal quests from Redis, loading from DB",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return c.loadQuestsFromDB(ctx, charID)
	}

	return quests, nil
}

func (c *ColdLoader) SaveQuests(ctx context.Context, charID int64, quests map[int64]*quest.QuestProgress) error {
	if c.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", coldQuestsKey, charID)
	data, err := json.Marshal(quests)
	if err != nil {
		return err
	}

	return c.redisClient.GetClient().Set(ctx, key, data, coldTTL).Err()
}

func (c *ColdLoader) loadQuestsFromDB(ctx context.Context, charID int64) (map[int64]*quest.QuestProgress, error) {
	quests, err := c.questRepo.FindAllByCharacter(ctx, charID)
	if err != nil {
		return nil, err
	}

	result := make(map[int64]*quest.QuestProgress)
	for _, q := range quests {
		result[q.ID] = q
	}

	return result, nil
}

func (c *ColdLoader) GetSkills(ctx context.Context, charID int64) (map[int64]*skill.CharacterSkill, error) {
	if c.redisClient == nil {
		return c.loadSkillsFromDB(ctx, charID)
	}

	key := fmt.Sprintf("%s%d", coldSkillsKey, charID)
	data, err := c.redisClient.GetClient().Get(ctx, key).Bytes()
	if err != nil {
		return c.loadSkillsFromDB(ctx, charID)
	}

	var skills map[int64]*skill.CharacterSkill
	if err := json.Unmarshal(data, &skills); err != nil {
		c.logger.Warn("Failed to unmarshal skills from Redis, loading from DB",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return c.loadSkillsFromDB(ctx, charID)
	}

	return skills, nil
}

func (c *ColdLoader) SaveSkills(ctx context.Context, charID int64, skills map[int64]*skill.CharacterSkill) error {
	if c.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", coldSkillsKey, charID)
	data, err := json.Marshal(skills)
	if err != nil {
		return err
	}

	return c.redisClient.GetClient().Set(ctx, key, data, coldTTL).Err()
}

func (c *ColdLoader) loadSkillsFromDB(ctx context.Context, charID int64) (map[int64]*skill.CharacterSkill, error) {
	skills, err := c.skillRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	result := make(map[int64]*skill.CharacterSkill)
	for _, s := range skills {
		result[s.ID] = s
	}

	return result, nil
}

func (c *ColdLoader) GetPets(ctx context.Context, charID int64) (map[int64]*pet.Pet, error) {
	if c.redisClient == nil {
		return c.loadPetsFromDB(ctx, charID)
	}

	key := fmt.Sprintf("%s%d", coldPetsKey, charID)
	data, err := c.redisClient.GetClient().Get(ctx, key).Bytes()
	if err != nil {
		return c.loadPetsFromDB(ctx, charID)
	}

	var pets map[int64]*pet.Pet
	if err := json.Unmarshal(data, &pets); err != nil {
		c.logger.Warn("Failed to unmarshal pets from Redis, loading from DB",
			zap.Int64("char_id", charID),
			zap.Error(err))
		return c.loadPetsFromDB(ctx, charID)
	}

	return pets, nil
}

func (c *ColdLoader) SavePets(ctx context.Context, charID int64, pets map[int64]*pet.Pet) error {
	if c.redisClient == nil {
		return nil
	}

	key := fmt.Sprintf("%s%d", coldPetsKey, charID)
	data, err := json.Marshal(pets)
	if err != nil {
		return err
	}

	return c.redisClient.GetClient().Set(ctx, key, data, coldTTL).Err()
}

func (c *ColdLoader) loadPetsFromDB(ctx context.Context, charID int64) (map[int64]*pet.Pet, error) {
	pets, err := c.petRepo.FindByCharacterID(ctx, charID)
	if err != nil {
		return nil, err
	}

	result := make(map[int64]*pet.Pet)
	for _, p := range pets {
		result[p.ID] = p
	}

	return result, nil
}

func (c *ColdLoader) DeleteColdData(ctx context.Context, charID int64) error {
	if c.redisClient == nil {
		return nil
	}

	pipe := c.redisClient.GetClient().Pipeline()
	pipe.Del(ctx, fmt.Sprintf("%s%d", coldQuestsKey, charID))
	pipe.Del(ctx, fmt.Sprintf("%s%d", coldSkillsKey, charID))
	pipe.Del(ctx, fmt.Sprintf("%s%d", coldPetsKey, charID))

	_, err := pipe.Exec(ctx)
	return err
}
