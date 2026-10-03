create sequence "player"."marriage_audit_log_id_seq";


  create table "player"."marriage_audit_log" (
    "id" bigint not null default nextval('player.marriage_audit_log_id_seq'::regclass),
    "marriage_id" bigint not null,
    "event" text not null,
    "actor_id" bigint,
    "partner1_id" bigint not null,
    "partner2_id" bigint not null,
    "payload" jsonb not null default '{}'::jsonb,
    "created_at" timestamp with time zone not null default CURRENT_TIMESTAMP
      );


alter sequence "player"."marriage_audit_log_id_seq" owned by "player"."marriage_audit_log"."id";

CREATE INDEX idx_marriage_audit_log_marriage ON player.marriage_audit_log USING btree (marriage_id);

CREATE INDEX idx_marriage_audit_log_partner1 ON player.marriage_audit_log USING btree (partner1_id);

CREATE INDEX idx_marriage_audit_log_partner2 ON player.marriage_audit_log USING btree (partner2_id);

CREATE UNIQUE INDEX marriage_audit_log_pkey ON player.marriage_audit_log USING btree (id);

alter table "player"."marriage_audit_log" add constraint "marriage_audit_log_pkey" PRIMARY KEY using index "marriage_audit_log_pkey";

alter table "player"."marriage_audit_log" add constraint "marriage_audit_log_event_check" CHECK ((event = ANY (ARRAY['married'::text, 'divorced'::text]))) not valid;

alter table "player"."marriage_audit_log" validate constraint "marriage_audit_log_event_check";

alter table "player"."marriage_audit_log" add constraint "marriage_audit_log_marriage_id_fkey" FOREIGN KEY (marriage_id) REFERENCES player.marriages(id) ON DELETE CASCADE not valid;

alter table "player"."marriage_audit_log" validate constraint "marriage_audit_log_marriage_id_fkey";

set check_function_bodies = off;

CREATE OR REPLACE FUNCTION player.create_marriage(p_partner1_id bigint, p_partner2_id bigint, p_ring_type integer, p_intimacy integer, p_married_at timestamp with time zone)
 RETURNS TABLE(id bigint, married_at timestamp with time zone)
 LANGUAGE plpgsql
 SET search_path TO ''
AS $function$
DECLARE
    v_marriage_id bigint;
    v_married_at timestamp with time zone;
BEGIN
    PERFORM 1 FROM player.characters WHERE characters.id IN (p_partner1_id, p_partner2_id) FOR UPDATE;

    INSERT INTO player.marriages (partner1_id, partner2_id, ring_type, intimacy, married_at)
    VALUES (p_partner1_id, p_partner2_id, p_ring_type, p_intimacy, p_married_at)
    RETURNING marriages.id, marriages.married_at
    INTO v_marriage_id, v_married_at;

    INSERT INTO player.marriage_audit_log (marriage_id, event, actor_id, partner1_id, partner2_id, payload)
    VALUES (v_marriage_id, 'married', NULL, p_partner1_id, p_partner2_id,
            jsonb_build_object('ring_type', p_ring_type, 'intimacy', p_intimacy));

    RETURN QUERY SELECT v_marriage_id, v_married_at;
END;
$function$
;


