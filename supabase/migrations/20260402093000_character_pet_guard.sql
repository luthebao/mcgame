alter table player.characters
add column if not exists pet_guard_data jsonb not null default '{"lvData":{},"petData":{}}'::jsonb;
