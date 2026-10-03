
  create table "data"."data_tbl_activity" (
    "id" integer not null,
    "name" text,
    "style_name" text,
    "panel_key" text,
    "feature_key" text,
    "sort_type" integer not null default 0,
    "enable" integer not null default 1,
    "type" integer not null default 0,
    "flag" integer not null default 1,
    "note" text
      );


alter table "data"."data_tbl_activity" enable row level security;

CREATE UNIQUE INDEX data_tbl_activity_pkey ON data.data_tbl_activity USING btree (id);

alter table "data"."data_tbl_activity" add constraint "data_tbl_activity_pkey" PRIMARY KEY using index "data_tbl_activity_pkey";

alter table "data"."data_tbl_activity" add constraint "data_tbl_activity_enable_check" CHECK ((enable = ANY (ARRAY[0, 1]))) not valid;

alter table "data"."data_tbl_activity" validate constraint "data_tbl_activity_enable_check";

alter table "data"."data_tbl_activity" add constraint "data_tbl_activity_id_range" CHECK (((id >= 0) AND (id <= 83))) not valid;

alter table "data"."data_tbl_activity" validate constraint "data_tbl_activity_id_range";

grant delete on table "data"."data_tbl_activity" to "service_role";

grant insert on table "data"."data_tbl_activity" to "service_role";

grant references on table "data"."data_tbl_activity" to "service_role";

grant select on table "data"."data_tbl_activity" to "service_role";

grant trigger on table "data"."data_tbl_activity" to "service_role";

grant truncate on table "data"."data_tbl_activity" to "service_role";

grant update on table "data"."data_tbl_activity" to "service_role";
