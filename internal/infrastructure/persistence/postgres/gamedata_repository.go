// Open-sourced by BaoLT

// PostgreSQL implementation of game data repository.
// Loads static game data from data.data_tbl_* tables into memory.
// Uses snake_case keys matching the database column names.
package postgres

import (
	"context"
	"encoding/json"
	"errors"
	"fmt"

	"github.com/jackc/pgx/v5"

	"mcgame-server/internal/gamedata"
)

var tableNameMapping = map[string]string{
	"TBL_CLASS":           "data.data_tbl_class",
	"TBL_CREATURE":        "data.data_tbl_creature",
	"TBL_CREATURE_LOOT":   "data.data_tbl_creature_loot",
	"TBL_CREATURE_SKILL":  "data.data_tbl_creature_skill",
	"TBL_EQUIPT_TEMPLATE": "data.data_tbl_equipt_template",
	"TBL_ITEM_TEMPLATE":   "data.data_tbl_item_template", // Added this line

	"TBL_MAP":                 "data.data_tbl_map",
	"TBL_MAP_CREATURE":        "data.data_tbl_map_creature",
	"TBL_NPC":                 "data.data_tbl_npc",
	"TBL_NPC_CREATURE":        "data.data_tbl_npc_creature",
	"TBL_NPC_SKILL":           "data.data_tbl_npc_skill",
	"TBL_SKILL":               "data.data_tbl_skill",
	"TBL_QUEST":               "data.data_tbl_quest",
	"TBL_QUEST_AWARD":         "data.data_tbl_quest_award",
	"TBL_QUEST_REQUIRE":       "data.data_tbl_quest_require",
	"TBL_QUEST_LOOP":          "data.data_tbl_quest_loop",
	"TBL_QUEST_PRE":           "data.data_tbl_quest_pre",
	"TBL_SCENEITEM_INSTANCE":  "data.data_tbl_sceneitem_instance",
	"TBL_SCENEITEM_TEMPLATE":  "data.data_tbl_sceneitem_template",
	"TBL_SHOP":                "data.data_tbl_shop",
	"TBL_SHOP_SLOT":           "data.data_tbl_shop_slot",
	"TBL_SKILL_KIND":          "data.data_tbl_skill_kind",
	"TBL_SKILL_POOL":          "data.data_tbl_skill_pool",
	"TBL_SKILL_TYPE":          "data.data_tbl_skill_type",
	"TBL_BUFF":                "data.data_tbl_buff",
	"TBL_EQUIPT_SUIT":         "data.data_tbl_equipt_suit",
	"TBL_PLAN":                "data.data_tbl_plan",
	"TBL_TITLE":               "data.data_tbl_title",
	"TBL_ACHIEVEMENT":         "data.data_tbl_achievement",
	"TBL_ACHIEVEMENT_REQUIRE": "data.data_tbl_achievement_require",
	"TBL_GUIDE":               "data.data_tbl_guide",
	"TBL_PET_SOUL":            "data.data_tbl_pet_soul",
	"TBL_PET_TALENT":          "data.data_tbl_pet_talent",
	"TBL_PET_CONTRACT":        "data.data_tbl_pet_contract",
	"TBL_PET_GUARD":           "data.data_tbl_pet_guard",
	"TBL_PET_STONE":           "data.data_tbl_pet_stone",
	"TBL_CREATURE_HANDBOOK":   "data.data_tbl_creature_handbook",
	"TBL_MOUNT":               "data.data_tbl_mount",
	"TBL_MOUNT_DRESS":         "data.data_tbl_mount_dress",
	"TBL_MAP_CELL":            "data.data_tbl_map_cell",
	"TBL_ANSWER":              "data.data_tbl_answer",
	"TBL_FEAST":               "data.data_tbl_feast",
	"TBL_BUILDING":            "data.data_tbl_building",
	"TBL_EXTEND_POSITION":     "data.data_tbl_extend_position",
	"TBL_NAME_LIB":            "data.data_tbl_name_lib",
	"TBL_MINERAL_TEMPLATE":    "data.data_tbl_mineral_template",
	"TBL_DIARY":               "data.data_tbl_diary",
	"TBL_FAIRY_TEMPALTE":      "data.data_tbl_fairy_tempalte",
	"TBL_STARS_TEMPLATE":      "data.data_tbl_stars_template",
	"TBL_WAR_MAP":             "data.data_tbl_war_map",
	"TBL_PM_RIGHT":            "data.data_tbl_pm_right",
	"TBL_MEDAL":               "data.data_tbl_medal",
	"TBL_MAZE":                "data.data_tbl_maze",
	"TBL_ARTIFACT":            "data.data_tbl_artifact",
	"TBL_DRESS":               "data.data_tbl_dress",
	"TBL_RECIPE":              "data.data_tbl_recipe",
	"TBL_RECIPE_PLAN":         "data.data_tbl_recipe_plan",
	"TBL_CREDIT":              "data.data_tbl_credit",
	"TBL_SUBLIMATION":         "data.data_tbl_sublimation",
	"TBL_SUBLIMATION_PET":     "data.data_tbl_sublimation_pet",
	"TBL_AWAKENING":           "data.data_tbl_awakening",
	"TBL_AWAKENING_SKILL":     "data.data_tbl_awakening_skill",
	"TBL_RECYCLING":           "data.data_tbl_recycling",
	"TBL_SOUL":                "data.data_tbl_soul",
	"TBL_DECO_HOLE":           "data.data_tbl_deco_hole",
	"TBL_DECO_RUNE":           "data.data_tbl_deco_rune",
	"TBL_DECO_SHOW":           "data.data_tbl_deco_show",
	"TBL_MYSTRE_RECIPE":       "data.data_tbl_mystre_recipe",
	"TBL_MYSTRE":              "data.data_tbl_mystre",
	"TBL_RUNE_CHIP":           "data.data_tbl_rune_chip",
	"TBL_PRS_TREE":            "data.data_tbl_prs_tree",
	"TBL_PRS_SHOW":            "data.data_tbl_prs_show",
	"TBL_PRS_CHIP":            "data.data_tbl_prs_chip",
	"TBL_MEVENT_MAP":          "data.data_tbl_mevent_map",
	"TBL_MEVENT_TYPE":         "data.data_tbl_mevent_type",
	"TBL_WAR_SPRITE":          "data.data_tbl_war_sprite",
	"TBL_CREATUREH_HEART":     "data.data_tbl_creatureh_heart",
	"TBL_CREATUREH_COMBINE":   "data.data_tbl_creatureh_combine",
	"TBL_CREATUREH_CONTAIN":   "data.data_tbl_creatureh_contain",
	"TBL_CREATUREH_POINT":     "data.data_tbl_creatureh_point",
	"TBL_EXPLORER_MEDAL":      "data.data_tbl_explorer_medal",
	"TBL_CARVE":               "data.data_tbl_carve",
	"TBL_CARVE_AWARD":         "data.data_tbl_carve_award",
	"TBL_CARVE_MASTER":        "data.data_tbl_carve_master",
	"TBL_MYTC_SUIT":               "data.data_tbl_mytc_suit",
	"TBL_MYTC_DETAIL":             "data.data_tbl_mytc_detail",
	"TBL_ITEM_AWARD":              "data.data_tbl_item_award",
	"TBL_HEIYAOSHI_POINT":         "data.data_tbl_heiyaoshi_point",
	"TBL_HEIYAOSHI_POINT_LINK":    "data.data_tbl_heiyaoshi_point_link",
	"TBL_HEIYAOSHI_AREA":          "data.data_tbl_heiyaoshi_area",
	"TBL_HEIYAOSHI_AREA_ATTRIBUTE": "data.data_tbl_heiyaoshi_area_attribute",
	"TBL_HEIYAOSHI_FULL_BUFF":     "data.data_tbl_heiyaoshi_full_buff",
}

type GameDataRepository struct {
	db *Database
}

func NewGameDataRepository(db *Database) *GameDataRepository {
	return &GameDataRepository{db: db}
}

func (r *GameDataRepository) GetByTableAndID(ctx context.Context, tableName string, recordID int) (json.RawMessage, error) {
	// Special handling for TBL_PET - query from player.character_pets
	if tableName == "TBL_PET" {
		return r.getPetByID(ctx, int64(recordID))
	}
	if tableName == "TBL_ITEM_INSTANCE" || tableName == "TBL_EQUIPT_INSTANCE" {
		return r.getItemInstanceByID(ctx, int64(recordID), tableName)
	}

	dbTable, ok := tableNameMapping[tableName]
	if !ok {
		return nil, fmt.Errorf("unknown table: %s", tableName)
	}

	var data json.RawMessage
	err := r.db.pool.QueryRow(ctx, "select player.get_game_data_row($1, $2)", dbTable, recordID).Scan(&data)
	if err != nil {
		if errors.Is(err, pgx.ErrNoRows) {
			return nil, nil
		}
		return nil, err
	}
	if len(data) == 0 || string(data) == "null" {
		return nil, nil
	}

	return data, nil
}

func (r *GameDataRepository) GetAllByTable(ctx context.Context, tableName string) ([]json.RawMessage, error) {
	// Special handling for TBL_PET - query from player.character_pets
	if tableName == "TBL_PET" {
		return r.getAllPets(ctx)
	}

	dbTable, ok := tableNameMapping[tableName]
	if !ok {
		return nil, fmt.Errorf("unknown table: %s", tableName)
	}

	rows, err := r.db.pool.Query(ctx, "select player.list_game_data_rows($1)", dbTable)
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var results []json.RawMessage
	for rows.Next() {
		var data json.RawMessage
		if err := rows.Scan(&data); err != nil {
			return nil, err
		}
		results = append(results, data)
	}

	return results, rows.Err()
}

func (r *GameDataRepository) Upsert(ctx context.Context, tableName string, recordID int, data json.RawMessage) error {
	_, err := r.db.pool.Exec(ctx,
		"select player.upsert_game_data_template($1, $2, $3::jsonb)",
		tableName, recordID, data,
	)
	return err
}

func (r *GameDataRepository) UpsertBatch(ctx context.Context, tableName string, records []gamedata.Record) error {
	if len(records) == 0 {
		return nil
	}

	batch := &pgx.Batch{}
	for _, rec := range records {
		batch.Queue("select player.upsert_game_data_template($1, $2, $3::jsonb)", tableName, rec.ID, rec.Data)
	}

	results := r.db.pool.SendBatch(ctx, batch)
	defer results.Close()

	for range records {
		if _, err := results.Exec(); err != nil {
			return err
		}
	}

	return nil
}

func (r *GameDataRepository) DeleteByTableAndID(ctx context.Context, tableName string, recordID int) error {
	_, err := r.db.pool.Exec(ctx, "select player.delete_game_data_template($1, $2)", tableName, recordID)
	return err
}

func (r *GameDataRepository) DeleteAllByTable(ctx context.Context, tableName string) error {
	_, err := r.db.pool.Exec(ctx, "select player.delete_game_data_templates_by_table($1)", tableName)
	return err
}

func (r *GameDataRepository) CountByTable(ctx context.Context, tableName string) (int, error) {
	dbTable, ok := tableNameMapping[tableName]
	if !ok {
		return 0, fmt.Errorf("unknown table: %s", tableName)
	}

	var count int
	err := r.db.pool.QueryRow(ctx, "select player.count_game_data_rows($1)", dbTable).Scan(&count)
	return count, err
}

func (r *GameDataRepository) GetTableNames(ctx context.Context) ([]string, error) {
	names := make([]string, 0, len(tableNameMapping)) //+1
	for name := range tableNameMapping {
		names = append(names, name)
	}
	return names, nil
}

// getPetByID queries a pet from player.character_pets via player.get_pet_client
// and returns the client-formatted JSON payload.
func (r *GameDataRepository) getPetByID(ctx context.Context, petID int64) (json.RawMessage, error) {
	var data json.RawMessage
	err := r.db.pool.QueryRow(ctx, "select player.get_pet_client($1)", petID).Scan(&data)
	if err != nil {
		if err == pgx.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}
	if len(data) == 0 || string(data) == "null" {
		return nil, nil
	}

	return data, nil
}

// getAllPets returns every pet in client-formatted JSON.
func (r *GameDataRepository) getAllPets(ctx context.Context) ([]json.RawMessage, error) {
	rows, err := r.db.pool.Query(ctx, "select * from player.list_pet_clients()")
	if err != nil {
		return nil, err
	}
	defer rows.Close()

	var results []json.RawMessage
	for rows.Next() {
		var data json.RawMessage
		if err := rows.Scan(&data); err != nil {
			return nil, err
		}
		results = append(results, data)
	}

	return results, rows.Err()
}

// getItemInstanceByID calls player.get_item_instance_client to fetch a single
// item/equip instance shaped for the Flash client protocol.
func (r *GameDataRepository) getItemInstanceByID(ctx context.Context, itemID int64, tableName string) (json.RawMessage, error) {
	clientType := 28
	if tableName == "TBL_EQUIPT_INSTANCE" {
		clientType = 18
	}

	var data json.RawMessage
	err := r.db.pool.QueryRow(ctx, "select player.get_item_instance_client($1, $2)", itemID, clientType).Scan(&data)
	if err != nil {
		if err == pgx.ErrNoRows {
			return nil, nil
		}
		return nil, err
	}
	if len(data) == 0 || string(data) == "null" {
		return nil, nil
	}

	return data, nil
}
