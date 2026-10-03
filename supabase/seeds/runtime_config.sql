--
-- Seed runtime config tables with sensible defaults.
-- One-time bootstrap; subsequent operator edits flow through the admin dashboard.
-- Idempotent: on conflict do nothing on gateway_config (preserves operator edits),
-- and the key/value helpers leave existing rows untouched (description = coalesce).
--

INSERT INTO "public"."gateway_config" ("id","name","url","max_clients","auction","guild","status","sort_order") VALUES
    (0::smallint, 'Channel 1', 'rtmp://127.0.0.1:1935/line/0', 1000, false, false, 'online', 0::smallint),
    (1::smallint, 'Channel 2', 'rtmp://127.0.0.1:1935/line/1', 1000, false, true,  'online', 1::smallint),
    (2::smallint, 'Channel 3', 'rtmp://127.0.0.1:1935/line/2', 1000, true,  false, 'online', 2::smallint)
ON CONFLICT ("id") DO NOTHING;

INSERT INTO "public"."server_settings" ("key","value","description") VALUES
    ('maintenance_mode',    'false'::jsonb, 'Block all logins when true'),
    ('login_enabled',       'true'::jsonb,  'Master login gate'),
    ('announcement_banner', '""'::jsonb,    'Banner shown on login (empty = none)'),
    ('global_max_players',  '0'::jsonb,     '0 means no global cap')
ON CONFLICT ("key") DO NOTHING;

INSERT INTO "public"."game_tuning" ("key","value","category","description") VALUES
    ('exp_multiplier',             '1.0'::jsonb,  'rates',    'EXP gain multiplier'),
    ('drop_multiplier',            '1.0'::jsonb,  'rates',    'Item drop rate multiplier'),
    ('gold_multiplier',            '1.0'::jsonb,  'rates',    'Gold drop multiplier'),
    ('schedule_boss_enabled',      'true'::jsonb, 'events',   'Scheduled world boss spawner'),
    ('schedule_boss_tick_seconds', '30'::jsonb,   'events',   'Tick interval in seconds'),
    ('feature_pk_enabled',         'true'::jsonb, 'features', 'Enable open PK'),
    ('feature_marriage_enabled',   'true'::jsonb, 'features', 'Enable marriage system')
ON CONFLICT ("key") DO NOTHING;

INSERT INTO "public"."gm_settings" ("key","value","description") VALUES
    ('audit_retention_days',   '90'::jsonb, 'Days to keep GM audit rows'),
    ('login_lockout_attempts', '5'::jsonb,  'Failed-login lockout threshold'),
    ('login_lockout_minutes',  '15'::jsonb, 'Lockout window in minutes')
ON CONFLICT ("key") DO NOTHING;
