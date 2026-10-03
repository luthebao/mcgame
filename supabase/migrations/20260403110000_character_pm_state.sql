ALTER TABLE player.characters
    ADD COLUMN IF NOT EXISTS pm_exp bigint DEFAULT 0 NOT NULL,
    ADD COLUMN IF NOT EXISTS pm_process_data jsonb DEFAULT '{}'::jsonb NOT NULL,
    ADD COLUMN IF NOT EXISTS pm_findback boolean DEFAULT false NOT NULL;

UPDATE player.characters
SET
    pm_exp = COALESCE(pm_exp, 0),
    pm_process_data = COALESCE(pm_process_data, '{}'::jsonb),
    pm_findback = COALESCE(pm_findback, false);
