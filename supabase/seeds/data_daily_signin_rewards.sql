SET session_replication_role = replica;

INSERT INTO "data"."daily_signin_rewards" ("reward_id", "inc", "item_id", "quantity", "weight", "note") VALUES
    (1, 1, 408,  1, 1, 'daily slot reward'),
    (2, 2, 4015, 1, 1, 'surprise-day pool'),
    (3, 4, 4080, 1, 1, 'crit-bonus pool')
ON CONFLICT (reward_id) DO NOTHING;

SET session_replication_role = DEFAULT;
