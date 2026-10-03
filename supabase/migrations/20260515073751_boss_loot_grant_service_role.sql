grant select, insert, update, delete on table "data"."data_tbl_schedule_boss" to "service_role";

grant select, insert, update, delete on table "data"."data_tbl_boss_loot" to "service_role";

grant usage, select on sequence "data"."data_tbl_boss_loot_id_seq" to "service_role";
