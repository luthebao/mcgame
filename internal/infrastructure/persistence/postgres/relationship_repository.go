// Open-sourced by BaoLT

// PostgreSQL implementation of relationship repository.
// Handles friends and blacklist with separate tables.
// Supports online status data for friend list display.
package postgres

import (
	"context"
	"errors"

	"mcgame-server/internal/domain/character"
	"mcgame-server/internal/domain/social"
	pkgerrors "mcgame-server/pkg/errors"

	"github.com/jackc/pgx/v5"
)

type RelationshipRepository struct {
	db *Database
}

func NewRelationshipRepository(db *Database) *RelationshipRepository {
	return &RelationshipRepository{db: db}
}

func (r *RelationshipRepository) FindByCharacterID(ctx context.Context, characterID int64) ([]*social.Relationship, error) {
	friends, err := r.FindFriends(ctx, characterID)
	if err != nil {
		return nil, err
	}

	blacklist, err := r.FindBlacklist(ctx, characterID)
	if err != nil {
		return nil, err
	}

	result := append(friends, blacklist...)
	return result, nil
}

func (r *RelationshipRepository) FindByCharacterAndType(ctx context.Context, characterID int64, relationshipType int) ([]*social.Relationship, error) {
	switch relationshipType {
	case social.RelationshipTypeFriend:
		return r.FindFriends(ctx, characterID)
	case social.RelationshipTypeBlack:
		return r.FindBlacklist(ctx, characterID)
	case social.RelationshipTypeEnemy,
		social.RelationshipTypeCouple,
		social.RelationshipTypeTutor,
		social.RelationshipTypeBrother:
		return r.findTypedRelationships(ctx, characterID, relationshipType)
	default:
		return []*social.Relationship{}, nil
	}
}

func (r *RelationshipRepository) findTypedRelationships(ctx context.Context, characterID int64, relationshipType int) ([]*social.Relationship, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_typed_relationships($1, $2::smallint)", characterID, relationshipType)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find typed relationships")
	}
	defer rows.Close()

	var relationships []*social.Relationship
	for rows.Next() {
		rel := &social.Relationship{Type: relationshipType}
		err := rows.Scan(
			&rel.ID, &rel.CharacterID, &rel.OtherID, &rel.OtherName,
			&rel.GroupID, &rel.Nickname, &rel.Intimacy, &rel.CreatedAt,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan typed relationship row")
		}
		relationships = append(relationships, rel)
	}

	return relationships, rows.Err()
}

func (r *RelationshipRepository) FindFriends(ctx context.Context, characterID int64) ([]*social.Relationship, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_friend_relationships($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find friends")
	}
	defer rows.Close()

	var relationships []*social.Relationship
	for rows.Next() {
		rel := &social.Relationship{
			Type: social.RelationshipTypeFriend,
		}
		err := rows.Scan(
			&rel.ID, &rel.CharacterID, &rel.OtherID, &rel.OtherName,
			&rel.GroupID, &rel.Nickname, &rel.Intimacy, &rel.CreatedAt,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan friend row")
		}
		relationships = append(relationships, rel)
	}

	return relationships, nil
}

func (r *RelationshipRepository) FindBlacklist(ctx context.Context, characterID int64) ([]*social.Relationship, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_blacklist_relationships($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to find blacklist")
	}
	defer rows.Close()

	var relationships []*social.Relationship
	for rows.Next() {
		rel := &social.Relationship{
			Type: social.RelationshipTypeBlack,
		}
		err := rows.Scan(
			&rel.ID, &rel.CharacterID, &rel.OtherID, &rel.OtherName, &rel.CreatedAt,
		)
		if err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan blacklist row")
		}
		relationships = append(relationships, rel)
	}

	return relationships, nil
}

func (r *RelationshipRepository) Create(ctx context.Context, rel *social.Relationship) error {
	switch rel.Type {
	case social.RelationshipTypeFriend:
		return r.createFriend(ctx, rel)
	case social.RelationshipTypeBlack:
		return r.createBlock(ctx, rel)
	default:
		return pkgerrors.ErrInvalidInput
	}
}

func (r *RelationshipRepository) createFriend(ctx context.Context, rel *social.Relationship) error {
	err := r.db.pool.QueryRow(ctx, "select * from player.create_friend_relationship($1, $2, $3, $4, $5)",
		rel.CharacterID, rel.OtherID, rel.GroupID, rel.Nickname, rel.Intimacy,
	).Scan(&rel.ID, &rel.CreatedAt)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create friend")
	}
	return nil
}

func (r *RelationshipRepository) createBlock(ctx context.Context, rel *social.Relationship) error {
	err := r.db.pool.QueryRow(ctx, "select * from player.create_block_relationship($1, $2, $3)",
		rel.CharacterID, rel.OtherID, rel.Nickname,
	).Scan(&rel.ID, &rel.CreatedAt)

	if err != nil {
		return pkgerrors.Wrap(err, "failed to create block")
	}
	return nil
}

func (r *RelationshipRepository) ListByCharacterAll(ctx context.Context, characterID int64) ([]*social.Relationship, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.get_character_relationships($1)", characterID)
	if err != nil {
		return nil, pkgerrors.Wrap(err, "failed to list character relationships")
	}
	defer rows.Close()

	var relationships []*social.Relationship
	for rows.Next() {
		rel := &social.Relationship{}
		var typ int16
		var groupID *int
		var intimacy *int
		if err := rows.Scan(
			&rel.ID, &rel.CharacterID, &rel.OtherID, &rel.OtherName,
			&typ, &groupID, &rel.Nickname, &intimacy, &rel.CreatedAt,
		); err != nil {
			return nil, pkgerrors.Wrap(err, "failed to scan relationship row")
		}
		rel.Type = int(typ)
		if groupID != nil {
			rel.GroupID = *groupID
		}
		if intimacy != nil {
			rel.Intimacy = *intimacy
		}
		relationships = append(relationships, rel)
	}

	return relationships, rows.Err()
}

func (r *RelationshipRepository) CreateTyped(ctx context.Context, rel *social.Relationship) error {
	err := r.db.pool.QueryRow(ctx,
		"select * from player.create_typed_relationship($1, $2, $3::smallint, $4, $5, $6)",
		rel.CharacterID, rel.OtherID, rel.Type, rel.GroupID, rel.Nickname, rel.Intimacy,
	).Scan(&rel.ID, &rel.CreatedAt)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to create typed relationship")
	}
	return nil
}

func (r *RelationshipRepository) UpdateIntimacy(ctx context.Context, id int64, intimacy int) error {
	return r.updateBool(ctx, "select player.update_relationship_intimacy($1, $2)", "failed to update relationship intimacy", id, intimacy)
}

func (r *RelationshipRepository) UpdateNickname(ctx context.Context, id int64, nickname string) error {
	return r.updateBool(ctx, "select player.update_relationship_nickname($1, $2)", "failed to update relationship nickname", id, nickname)
}

func (r *RelationshipRepository) UpdateGroup(ctx context.Context, id int64, groupID int) error {
	return r.updateBool(ctx, "select player.update_relationship_group($1, $2)", "failed to update relationship group", id, groupID)
}

func (r *RelationshipRepository) ChangeType(ctx context.Context, id int64, newType int) error {
	return r.updateBool(ctx, "select player.change_relationship_type($1, $2::smallint)", "failed to change relationship type", id, newType)
}

func (r *RelationshipRepository) DeleteByIDAny(ctx context.Context, id int64) error {
	return r.updateBool(ctx, "select player.delete_relationship_by_id_any($1)", "failed to delete relationship", id)
}

func (r *RelationshipRepository) updateBool(ctx context.Context, query, wrapMsg string, args ...interface{}) error {
	var ok bool
	if err := r.db.pool.QueryRow(ctx, query, args...).Scan(&ok); err != nil {
		return pkgerrors.Wrap(err, wrapMsg)
	}
	if !ok {
		return pkgerrors.ErrNotFound
	}
	return nil
}

func (r *RelationshipRepository) FindByID(ctx context.Context, relationshipID int64) (*social.Relationship, error) {
	rel := &social.Relationship{
		Type: social.RelationshipTypeFriend,
	}
	err := r.db.pool.QueryRow(ctx, "select * from player.get_friend_relationship_by_id($1)", relationshipID).Scan(
		&rel.ID, &rel.CharacterID, &rel.OtherID, &rel.OtherName,
		&rel.GroupID, &rel.Nickname, &rel.Intimacy, &rel.CreatedAt,
	)
	if err == nil {
		return rel, nil
	}
	if !errors.Is(err, pgx.ErrNoRows) {
		return nil, pkgerrors.Wrap(err, "failed to find relationship by ID")
	}

	rel = &social.Relationship{
		Type: social.RelationshipTypeBlack,
	}
	err = r.db.pool.QueryRow(ctx, "select * from player.get_blacklist_relationship_by_id($1)", relationshipID).Scan(
		&rel.ID, &rel.CharacterID, &rel.OtherID, &rel.OtherName, &rel.CreatedAt,
	)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, pkgerrors.ErrNotFound
		}
		return nil, pkgerrors.Wrap(err, "failed to find relationship by ID")
	}

	return rel, nil
}

func (r *RelationshipRepository) Delete(ctx context.Context, characterID, otherID int64, relationshipType int) error {
	switch relationshipType {
	case social.RelationshipTypeFriend, social.RelationshipTypeBlack:
	default:
		return pkgerrors.ErrInvalidInput
	}

	_, err := r.db.pool.Exec(ctx,
		"select player.delete_relationship($1, $2, $3::smallint)",
		characterID, otherID, relationshipType,
	)
	if err != nil {
		return pkgerrors.Wrap(err, "failed to delete relationship")
	}
	return nil
}

func (r *RelationshipRepository) DeleteByID(ctx context.Context, characterID int64, relationshipID int64, relationshipType int) error {
	switch relationshipType {
	case social.RelationshipTypeFriend, social.RelationshipTypeBlack:
	default:
		return pkgerrors.ErrInvalidInput
	}

	var deleted bool
	if err := r.db.pool.QueryRow(ctx,
		"select player.delete_relationship_by_id($1, $2, $3::smallint)",
		relationshipID, characterID, relationshipType,
	).Scan(&deleted); err != nil {
		return pkgerrors.Wrap(err, "failed to delete relationship by ID")
	}

	if !deleted {
		return pkgerrors.ErrNotFound
	}
	return nil
}

func (r *RelationshipRepository) Exists(ctx context.Context, characterID, otherID int64, relationshipType int) (bool, error) {
	switch relationshipType {
	case social.RelationshipTypeFriend, social.RelationshipTypeBlack:
	default:
		return false, pkgerrors.ErrInvalidInput
	}

	var exists bool
	err := r.db.pool.QueryRow(ctx,
		"select player.relationship_exists($1, $2, $3::smallint)",
		characterID, otherID, relationshipType,
	).Scan(&exists)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return false, nil
		}
		return false, pkgerrors.Wrap(err, "failed to check relationship existence")
	}
	return exists, nil
}

func (r *RelationshipRepository) GetCharacterBasicInfo(ctx context.Context, characterID int64) (*social.CharacterOnlineData, error) {
	var level int
	var classID int
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_social_info($1)", characterID).Scan(&level, &classID)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, pkgerrors.Wrap(err, "failed to get character info")
	}

	return &social.CharacterOnlineData{
		Exp:     character.PlayerLevelCumulativeExp(level),
		ClassID: classID,
	}, nil
}

func (r *RelationshipRepository) GetCharacterIDByName(ctx context.Context, name string) (int64, string, error) {
	var id int64
	var exactName string
	err := r.db.pool.QueryRow(ctx, "select * from player.get_character_id_by_name($1)", name).Scan(&id, &exactName)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return 0, "", pkgerrors.ErrCharacterNotFound
		}
		return 0, "", pkgerrors.Wrap(err, "failed to get character ID by name")
	}

	return id, exactName, nil
}

func (r *RelationshipRepository) GetCharacterNameByID(ctx context.Context, characterID int64) (string, error) {
	var name *string
	err := r.db.pool.QueryRow(ctx, "select player.get_character_name_by_id($1)", characterID).Scan(&name)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return "", pkgerrors.ErrCharacterNotFound
		}
		return "", pkgerrors.Wrap(err, "failed to get character name by id")
	}
	if name == nil {
		return "", pkgerrors.ErrCharacterNotFound
	}
	return *name, nil
}
