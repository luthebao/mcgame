ALTER TABLE player.character_attributes
    ADD COLUMN IF NOT EXISTS max_attr_points integer NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS distributed_attr_points integer NOT NULL DEFAULT 0;

ALTER TABLE player.character_pets
    ADD COLUMN IF NOT EXISTS attr_points integer NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS max_attr_points integer NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS distributed_attr_points integer NOT NULL DEFAULT 0;
