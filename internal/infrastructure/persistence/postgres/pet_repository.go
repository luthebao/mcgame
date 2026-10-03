// Open-sourced by BaoLT

// PostgreSQL implementation of pet repository.
// Handles pet CRUD with JSON property storage for skills and cultivation.
// Supports follow state management and character pet queries.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"time"

	"mcgame-server/internal/domain/pet"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type PetRepository struct {
	db *Database
}

func NewPetRepository(db *Database) *PetRepository {
	return &PetRepository{db: db}
}

func (r *PetRepository) Save(ctx context.Context, p *pet.Pet) error {
	if p.ID == 0 {
		return r.create(ctx, p)
	}
	return r.update(ctx, p)
}

func (r *PetRepository) create(ctx context.Context, p *pet.Pet) error {
	propertyJSON, err := json.Marshal(p.Property)
	if err != nil {
		propertyJSON = []byte("{}")
	}

	now := time.Now()
	p.CreatedAt = now
	p.UpdatedAt = now

	err = r.db.pool.QueryRow(ctx,
		"select player.create_character_pet($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27::jsonb, $28, $29, $30, $31, $32, $33)",
		p.CharacterID, p.TemplateID, p.Name, p.Level, p.Experience,
		p.AptStrength, p.AptAgility, p.AptStamina, p.AptIntelligence, p.AptEnergy,
		p.AptStrengthEx, p.AptAgilityEx, p.AptStaminaEx, p.AptIntelligenceEx, p.AptEnergyEx,
		p.GrowRate, p.GrowRateAdd, p.UpgradeNum, p.EvolutionLv, p.Element,
		p.CurrentHP, p.CurrentMP, p.MaxHP, p.MaxMP,
		p.IsFollowing, p.IsMounting, propertyJSON, p.CreatedAt, p.UpdatedAt,
		p.AttrPoints, p.MaxAttrPoints, p.DistributedAttrPoints, p.Life,
	).Scan(&p.ID)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create pet")
	}

	return nil
}

func (r *PetRepository) update(ctx context.Context, p *pet.Pet) error {
	propertyJSON, err := json.Marshal(p.Property)
	if err != nil {
		propertyJSON = []byte("{}")
	}

	p.UpdatedAt = time.Now()

	var updated bool
	err = r.db.pool.QueryRow(ctx,
		"select player.update_character_pet($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $20, $21, $22, $23, $24, $25, $26, $27::jsonb, $28, $29, $30, $31, $32)",
		p.ID,
		p.TemplateID, p.Name, p.Level, p.Experience,
		p.AptStrength, p.AptAgility, p.AptStamina, p.AptIntelligence, p.AptEnergy,
		p.AptStrengthEx, p.AptAgilityEx, p.AptStaminaEx, p.AptIntelligenceEx, p.AptEnergyEx,
		p.GrowRate, p.GrowRateAdd, p.UpgradeNum, p.EvolutionLv, p.Element,
		p.CurrentHP, p.CurrentMP, p.MaxHP, p.MaxMP,
		p.IsFollowing, p.IsMounting, propertyJSON, p.UpdatedAt,
		p.AttrPoints, p.MaxAttrPoints, p.DistributedAttrPoints, p.Life,
	).Scan(&updated)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to update pet")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *PetRepository) FindByID(ctx context.Context, id int64) (*pet.Pet, error) {
	p := &pet.Pet{}
	var propertyJSON []byte
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_pet_by_id($1)", id).Scan(
		&p.ID, &p.CharacterID, &p.TemplateID, &p.Name, &p.Level, &p.Experience,
		&p.AptStrength, &p.AptAgility, &p.AptStamina, &p.AptIntelligence, &p.AptEnergy,
		&p.AptStrengthEx, &p.AptAgilityEx, &p.AptStaminaEx, &p.AptIntelligenceEx, &p.AptEnergyEx,
		&p.GrowRate, &p.GrowRateAdd, &p.UpgradeNum, &p.EvolutionLv, &p.Element,
		&p.CurrentHP, &p.CurrentMP, &p.MaxHP, &p.MaxMP,
		&p.IsFollowing, &p.IsMounting, &propertyJSON, &p.CreatedAt, &p.UpdatedAt,
		&p.AttrPoints, &p.MaxAttrPoints, &p.DistributedAttrPoints, &p.Life,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find pet by ID")
	}

	if len(propertyJSON) > 0 {
		if err := json.Unmarshal(propertyJSON, &p.Property); err != nil {
			p.Property = make(map[string]interface{})
		}
	} else {
		p.Property = make(map[string]interface{})
	}

	return p, nil
}

func (r *PetRepository) FindByCharacterID(ctx context.Context, characterID int64) ([]*pet.Pet, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_pets_by_character($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find pets by character ID")
	}
	defer rows.Close()

	return r.scanPets(rows)
}

func (r *PetRepository) FindFollowingPet(ctx context.Context, characterID int64) (*pet.Pet, error) {
	p := &pet.Pet{}
	var propertyJSON []byte
	err := r.db.pool.QueryRow(ctx, "select * from player.get_following_character_pet($1)", characterID).Scan(
		&p.ID, &p.CharacterID, &p.TemplateID, &p.Name, &p.Level, &p.Experience,
		&p.AptStrength, &p.AptAgility, &p.AptStamina, &p.AptIntelligence, &p.AptEnergy,
		&p.AptStrengthEx, &p.AptAgilityEx, &p.AptStaminaEx, &p.AptIntelligenceEx, &p.AptEnergyEx,
		&p.GrowRate, &p.GrowRateAdd, &p.UpgradeNum, &p.EvolutionLv, &p.Element,
		&p.CurrentHP, &p.CurrentMP, &p.MaxHP, &p.MaxMP,
		&p.IsFollowing, &p.IsMounting, &propertyJSON, &p.CreatedAt, &p.UpdatedAt,
		&p.AttrPoints, &p.MaxAttrPoints, &p.DistributedAttrPoints, &p.Life,
	)

	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to find following pet")
	}

	if len(propertyJSON) > 0 {
		if err := json.Unmarshal(propertyJSON, &p.Property); err != nil {
			p.Property = make(map[string]interface{})
		}
	} else {
		p.Property = make(map[string]interface{})
	}

	return p, nil
}

func (r *PetRepository) Delete(ctx context.Context, id int64) error {
	var deleted bool
	if err := r.db.pool.QueryRow(ctx, "select player.delete_character_pet($1)", id).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete pet")
	}

	if !deleted {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *PetRepository) Count(ctx context.Context, characterID int64) (int, error) {
	var count int
	err := r.db.pool.QueryRow(ctx, "select player.count_character_pets($1)", characterID).Scan(&count)
	if err != nil {
		return 0, pkgerrors.Wrap(err, "failed to count pets")
	}

	return count, nil
}

func (r *PetRepository) UpdateFollowState(ctx context.Context, petID int64, isFollowing bool) error {
	var updated bool
	if err := r.db.pool.QueryRow(ctx, "select player.set_pet_follow_state($1, $2, $3)", petID, isFollowing, time.Now()).Scan(&updated); err != nil {
		return pkgerrors.Wrap(err, "failed to update pet follow state")
	}

	if !updated {
		return pkgerrors.ErrNotFound
	}

	return nil
}

func (r *PetRepository) ClearFollowing(ctx context.Context, characterID int64) error {
	_, err := r.db.pool.Exec(ctx, "select player.clear_character_following_pets($1, $2)", characterID, time.Now())
	if err != nil {
		return pkgerrors.Wrap(err, "failed to clear following pets")
	}

	return nil
}

func (r *PetRepository) scanPets(rows pgx.Rows) ([]*pet.Pet, error) {
	var pets []*pet.Pet
	for rows.Next() {
		p := &pet.Pet{}
		var propertyJSON []byte
		err := rows.Scan(
			&p.ID, &p.CharacterID, &p.TemplateID, &p.Name, &p.Level, &p.Experience,
			&p.AptStrength, &p.AptAgility, &p.AptStamina, &p.AptIntelligence, &p.AptEnergy,
			&p.AptStrengthEx, &p.AptAgilityEx, &p.AptStaminaEx, &p.AptIntelligenceEx, &p.AptEnergyEx,
			&p.GrowRate, &p.GrowRateAdd, &p.UpgradeNum, &p.EvolutionLv, &p.Element,
			&p.CurrentHP, &p.CurrentMP, &p.MaxHP, &p.MaxMP,
			&p.IsFollowing, &p.IsMounting, &propertyJSON, &p.CreatedAt, &p.UpdatedAt,
			&p.AttrPoints, &p.MaxAttrPoints, &p.DistributedAttrPoints, &p.Life,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan pet row")
		}

		if len(propertyJSON) > 0 {
			if err := json.Unmarshal(propertyJSON, &p.Property); err != nil {
				p.Property = make(map[string]interface{})
			}
		} else {
			p.Property = make(map[string]interface{})
		}

		pets = append(pets, p)
	}

	return pets, nil
}
