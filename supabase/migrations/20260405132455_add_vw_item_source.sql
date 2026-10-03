create or replace view "public"."vw_item_source" as  SELECT eq.id AS item_id,
    1 AS item_type,
    19 AS template_table_id,
    'equipt_template'::text AS template_table_name,
    (COALESCE(eq.type, (0)::numeric))::integer AS template_type,
    (COALESCE(eq.use_type, (0)::numeric))::integer AS use_type,
    (COALESCE(eq.kind, (0)::numeric))::integer AS kind,
    (COALESCE(eq.bind_type, (0)::numeric))::integer AS bind_type,
    (COALESCE(eq.tradable, (0)::numeric))::integer AS tradable,
    (COALESCE(eq.item_level, (0)::numeric))::integer AS template_level,
    eq.name,
    COALESCE(NULLIF(eq.description, ''::text), eq.info, ''::text) AS description,
    (COALESCE(eq.icon_code, (0)::numeric))::bigint AS icon_id,
    (COALESCE(eq.req_level, (0)::numeric))::integer AS required_level,
    (COALESCE(eq.price, (0)::numeric))::bigint AS price,
    GREATEST((COALESCE(eq.stack_max, (1)::numeric))::integer, 1) AS max_stack,
    0 AS dungeon_id,
    jsonb_build_object('color', (COALESCE(eq.color_code, eq.color, (0)::numeric))::integer, 'quality', (COALESCE(eq.item_level, eq.color, eq.color_code, (0)::numeric))::integer, 'item_type', (COALESCE(eq."position", (0)::numeric))::integer, 'set_id', (COALESCE(eq.suit_id, (0)::numeric))::integer, 'socket_count', (COALESCE(eq.hole_num, (0)::numeric))::integer, 'bind_prop_num', (COALESCE(eq.bind_prop_num, (0)::numeric))::integer, 'endure_max', (COALESCE(eq.endure_max, (0)::numeric))::integer, 'expire_minutes', (COALESCE(eq.t, (0)::numeric))::bigint, 'active_equip_id', (COALESCE(eq.active_equip_id, (0)::numeric))::integer, 'random_quality', '', 'stat_type_1', (COALESCE(eq.main_prop1, (0)::numeric))::integer, 'stat_value_1', (COALESCE(eq.main_prop_num1, (0)::numeric))::integer, 'growth_1', 0, 'stat_type_2', (COALESCE(eq.main_prop2, (0)::numeric))::integer, 'stat_value_2', (COALESCE(eq.main_prop_num2, (0)::numeric))::integer, 'growth_2', 0, 'stat_type_3', (COALESCE(eq.prop1, (0)::numeric))::integer, 'stat_value_3', (COALESCE(eq.prop_num1, (0)::numeric))::integer, 'growth_3', 0, 'stat_type_4', (COALESCE(eq.prop2, (0)::numeric))::integer, 'stat_value_4', (COALESCE(eq.prop_num2, (0)::numeric))::integer, 'growth_4', 0, 'stat_type_5', (COALESCE(eq.active_prop_type, (0)::numeric))::integer, 'stat_value_5', (COALESCE(eq.active_prop_num, (0)::numeric))::integer, 'growth_5', 0) AS meta
   FROM data.data_tbl_equipt_template eq
UNION ALL
 SELECT it.id AS item_id,
        CASE
            WHEN ((COALESCE(it.type, (0)::numeric))::integer = 503) THEN 11
            WHEN ((COALESCE(it.type, (0)::numeric))::integer = 552) THEN 7
            WHEN ((COALESCE(it.kind, (0)::numeric))::integer = 6) THEN 3
            WHEN ((COALESCE(it.kind, (0)::numeric))::integer = 14) THEN 14
            ELSE 5
        END AS item_type,
    29 AS template_table_id,
    'item_template'::text AS template_table_name,
    (COALESCE(it.type, (0)::numeric))::integer AS template_type,
    (COALESCE(it.use_type, (0)::numeric))::integer AS use_type,
    (COALESCE(it.kind, (0)::numeric))::integer AS kind,
    (COALESCE(it.bind_type, (0)::numeric))::integer AS bind_type,
    (COALESCE(it.tradable, (0)::numeric))::integer AS tradable,
    (COALESCE(it.item_level, (0)::numeric))::integer AS template_level,
    it.name,
    COALESCE(NULLIF(it.description, ''::text), it.info, ''::text) AS description,
    (COALESCE(it.icon_code, (0)::numeric))::bigint AS icon_id,
    (COALESCE(it.req_level, (0)::numeric))::integer AS required_level,
    (COALESCE(it.price, (0)::numeric))::bigint AS price,
    GREATEST((COALESCE(it.stack_max, (1)::numeric))::integer, 1) AS max_stack,
    0 AS dungeon_id,
    jsonb_build_object('color', (COALESCE(it.color_code, it.color, (0)::numeric))::integer, 'quality', (COALESCE(it.item_level, it.color, it.color_code, (0)::numeric))::integer, 'item_type', (COALESCE(it.type, (0)::numeric))::integer, 'set_id', 0, 'socket_count', 0, 'bind_prop_num', 0, 'endure_max', 0, 'expire_minutes', (COALESCE(it.t, (0)::numeric))::bigint, 'active_equip_id', 0, 'random_quality', '', 'type', (COALESCE(it.type, (0)::numeric))::integer, 'level',
        CASE
            WHEN ((COALESCE(it.type, (0)::numeric))::integer = 503) THEN GREATEST((COALESCE(it.propl_num, (0)::numeric))::integer, (COALESCE(it.level, (0)::numeric))::integer)
            ELSE (COALESCE(it.level, (0)::numeric))::integer
        END, 'stat_1', (COALESCE(it.prop_type, (0)::numeric))::integer, 'value_1', (COALESCE(it.propl_num, (0)::numeric))::integer, 'stat_type_1', (COALESCE(it.prop_type, (0)::numeric))::integer, 'stat_value_1', (COALESCE(it.propl_num, (0)::numeric))::integer, 'growth_1', 0) AS meta
   FROM data.data_tbl_item_template it;



