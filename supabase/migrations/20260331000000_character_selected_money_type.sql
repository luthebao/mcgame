ALTER TABLE player.characters
ADD COLUMN IF NOT EXISTS selected_money_type INTEGER NOT NULL DEFAULT 1;

UPDATE player.characters
SET selected_money_type = 1
WHERE selected_money_type IS NULL OR selected_money_type NOT BETWEEN 1 AND 4;