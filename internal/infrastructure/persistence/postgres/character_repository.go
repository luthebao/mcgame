// Open-sourced by BaoLT

// PostgreSQL implementation of character repository.
// Handles character CRUD across the core player.characters row and the feature-scoped
// sibling tables. Loads hydrate runtime combat stats in Go instead of persisting a
// separate character_combat_stats row.
package postgres

import (
	"context"
	"errors"
	"time"

	"mcgame-server/internal/domain/character"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/google/uuid"
	"github.com/jackc/pgx/v5"
)

type CharacterRepository struct {
	db *Database
}

func NewCharacterRepository(db *Database) *CharacterRepository {
	return &CharacterRepository{db: db}
}

func (r *CharacterRepository) FindByID(ctx context.Context, id int64) (*character.Character, error) {
	char, err := scanSelectedCharacter(r.db.pool.QueryRow(ctx, characterSelectQuery, id, nil, nil, nil))
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrCharacterNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find character by ID")
	}

	r.loadCharacterCurrencies(ctx, char)
	r.loadCharacterClassProgress(ctx, char)

	return char, nil
}

func (r *CharacterRepository) FindByAccountID(ctx context.Context, accountID uuid.UUID) ([]*character.Character, error) {
	rows, err := r.db.pool.Query(ctx, characterSelectQuery, nil, accountID, nil, nil)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find characters by account ID")
	}
	defer rows.Close()

	characters, err := scanSelectedCharacterRows(rows)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to scan character row")
	}

	for _, char := range characters {
		r.loadCharacterCurrencies(ctx, char)
		r.loadCharacterClassProgress(ctx, char)
	}

	return characters, nil
}

func (r *CharacterRepository) FindByMapID(ctx context.Context, mapID int) ([]*character.Character, error) {
	rows, err := r.db.pool.Query(ctx, characterSelectQuery, nil, nil, mapID, nil)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find characters by map ID")
	}
	defer rows.Close()

	characters, err := scanSelectedCharacterRows(rows)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to scan character row")
	}

	for _, char := range characters {
		r.loadCharacterCurrencies(ctx, char)
		r.loadCharacterClassProgress(ctx, char)
	}

	return characters, nil
}

func (r *CharacterRepository) FindByName(ctx context.Context, name string) (*character.Character, error) {
	char, err := scanSelectedCharacter(r.db.pool.QueryRow(ctx, characterSelectQuery, nil, nil, nil, name))
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrCharacterNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find character by name")
	}

	r.loadCharacterCurrencies(ctx, char)
	r.loadCharacterClassProgress(ctx, char)

	return char, nil
}

func (r *CharacterRepository) Create(ctx context.Context, char *character.Character) error {
	char.NormalizeSlotFields()
	petGuardDataJSON := marshalPetGuardData(char.PetGuardData)
	bossDailyJSON := marshalBossDaily(char.BossDaily)
	pmProcessDataJSON := marshalPMProcessData(char.PMProcessData)

	args := []any{
		char.AccountID, char.Name, char.ClassID, char.Gender,
		char.MapID, char.PosX, char.PosY, char.Direction,
		char.GuildRestoreContrib, char.GuildRestoreDonate,
		char.VIPType, char.VIPExpiresAt,
		char.DressInfo, char.GMLevel,
		char.CreatedAt, char.LastActive, char.TotalOnline,
		char.Level, char.Experience, char.RebirthLvl, char.RebirthExp,
		char.Strength, char.Agility, char.Stamina, char.Intelligence, char.Spirit, char.AttrPoints,
		char.MaxAttrPoints, char.DistributedAttrPoints,
		char.CurrentHP, char.CurrentMP, char.CurrentSP,
		char.AptStrength, char.AptAgility, char.AptStamina, char.AptIntelligence, char.AptEnergy,
		char.AptStrengthEvolution, char.AptAgilityEvolution, char.AptStaminaEvolution, char.AptIntelligenceEvolution, char.AptEnergyEvolution,
		char.Money, char.MoneyBind, char.Gold, char.GoldBind,
		int64(char.Honor), int64(0), int64(0), char.Pop,
		char.SelectedMoneyType, char.SelectedGoldType,
		char.BagSlotNum, char.BankSlotNum, char.PetMaxNum, char.TempBagSlots, char.MxTempBagSlots,
		char.CookDex, char.FishDex, char.PlantDex, char.MedicineDex, char.HerbDex,
		char.Ee, char.En, char.Ef,
		char.PMExp, pmProcessDataJSON, char.PMFindback, petGuardDataJSON, bossDailyJSON,
	}

	if err := r.db.pool.QueryRow(ctx, "select player.create_character_full("+positionalArgs(len(args))+")", args...).Scan(&char.ID); err != nil {
		return pkgerrors.Wrap(err, "failed to create character")
	}

	return nil
}

func (r *CharacterRepository) Update(ctx context.Context, char *character.Character) error {
	char.NormalizeSlotFields()
	petGuardDataJSON := marshalPetGuardData(char.PetGuardData)
	bossDailyJSON := marshalBossDaily(char.BossDaily)
	pmProcessDataJSON := marshalPMProcessData(char.PMProcessData)

	args := []any{
		char.ID,
		char.Name, char.ClassID, char.Gender,
		char.MapID, char.PosX, char.PosY, char.Direction,
		char.GuildRestoreContrib, char.GuildRestoreDonate,
		char.VIPType, char.VIPExpiresAt,
		char.DressInfo, char.GMLevel,
		char.LastActive, char.TotalOnline,
		char.Level, char.Experience, char.RebirthLvl, char.RebirthExp,
		char.Strength, char.Agility, char.Stamina, char.Intelligence, char.Spirit, char.AttrPoints,
		char.MaxAttrPoints, char.DistributedAttrPoints,
		char.CurrentHP, char.CurrentMP, char.CurrentSP,
		char.AptStrength, char.AptAgility, char.AptStamina, char.AptIntelligence, char.AptEnergy,
		char.AptStrengthEvolution, char.AptAgilityEvolution, char.AptStaminaEvolution, char.AptIntelligenceEvolution, char.AptEnergyEvolution,
		char.Money, char.MoneyBind, char.Gold, char.GoldBind,
		char.Pop, char.SelectedMoneyType, char.SelectedGoldType,
		char.BagSlotNum, char.BankSlotNum, char.PetMaxNum, char.TempBagSlots, char.MxTempBagSlots,
		char.CookDex, char.FishDex, char.PlantDex, char.MedicineDex, char.HerbDex,
		char.Ee, char.En, char.Ef,
		char.PMExp, pmProcessDataJSON, char.PMFindback, petGuardDataJSON, bossDailyJSON,
	}

	var found bool
	if err := r.db.pool.QueryRow(ctx, "select player.update_character_full("+positionalArgs(len(args))+")", args...).Scan(&found); err != nil {
		return pkgerrors.Wrap(err, "failed to update character")
	}
	if !found {
		return pkgerrors.ErrCharacterNotFound
	}

	upsertCharacterCurrencies(ctx, r.db.pool, char)
	upsertCharacterClassProgress(ctx, r.db.pool, char)

	return nil
}

func (r *CharacterRepository) Delete(ctx context.Context, id int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_character($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete character")
	}

	if !deleted {
		return pkgerrors.ErrCharacterNotFound
	}

	return nil
}

func (r *CharacterRepository) ExistsByName(ctx context.Context, name string) (bool, error) {
	var exists bool
	err := r.db.pool.QueryRow(ctx, "select player.character_exists_by_name($1)", name).Scan(&exists)
	if err != nil {
		return false, pkgerrors.Wrap(err, "failed to check character name existence")
	}

	return exists, nil
}

func (r *CharacterRepository) UpdatePosition(ctx context.Context, id int64, pos character.Position) error {
	_, err := r.db.pool.Exec(ctx,
		"select player.update_character_position($1, $2, $3, $4, $5, $6)",
		id, pos.MapID, pos.X, pos.Y, pos.Direction, time.Now(),
	)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to update character position")
	}

	return nil
}

func (r *CharacterRepository) UpdateStats(ctx context.Context, id int64, hp, mp, sp int) error {
	if _, err := r.db.pool.Exec(ctx, "select player.update_character_vitals($1, $2, $3, $4, $5)", id, hp, mp, sp, time.Now()); err != nil {
		return pkgerrors.Wrap(err, "failed to update character vitals")
	}
	return nil
}
