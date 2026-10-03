-- Convert bag_slots / bank_slots from total-slot counts to tab counts.
-- Client expects bagSlotNum = number of bags (1-7), bankSlotNum = number of bank tabs (1-5).
-- Each tab = 30 slots.  pet_slots is already a direct count and needs no conversion.

UPDATE player.characters
SET bag_slots  = GREATEST(1, (bag_slots + 29) / 30),
    bank_slots = GREATEST(1, (bank_slots + 29) / 30);

ALTER TABLE player.characters ALTER COLUMN bag_slots SET DEFAULT 1;
ALTER TABLE player.characters ALTER COLUMN bank_slots SET DEFAULT 1;
