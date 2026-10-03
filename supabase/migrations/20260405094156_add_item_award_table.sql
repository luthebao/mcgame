CREATE TABLE IF NOT EXISTS "data"."data_tbl_item_award" (
    "id"        integer NOT NULL,
    "item_id"   numeric NOT NULL,
    "award_id"  numeric NOT NULL,
    "type"      numeric NOT NULL DEFAULT 29,
    "count"     numeric DEFAULT 1,
    "rate"      numeric DEFAULT 100,
    "bound"     numeric DEFAULT 0,
    "quality"   numeric DEFAULT 0,
    PRIMARY KEY ("id")
);
