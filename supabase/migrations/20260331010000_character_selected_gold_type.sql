ALTER TABLE player.characters
ADD COLUMN IF NOT EXISTS selected_gold_type INTEGER NOT NULL DEFAULT 3;

UPDATE player.characters
SET selected_gold_type = CASE
	WHEN selected_money_type IN (3, 4) THEN selected_money_type
	WHEN selected_gold_type NOT IN (3, 4) THEN 3
	ELSE selected_gold_type
END,
	selected_money_type = CASE
		WHEN selected_money_type IN (1, 2) THEN selected_money_type
		ELSE 1
	END;