SET session_replication_role = replica;

INSERT INTO "data"."daily_signin_lucky_tiers" ("year", "month", "week_index", "point_threshold", "gold_amount", "note") VALUES
    (2026, 5, 1,   499,   500, 'week 1 baseline (Vietnamese rule sheet 499)'),
    (2026, 5, 2,   999,  1000, 'week 2'),
    (2026, 5, 3,  1999,  2000, 'week 3'),
    (2026, 5, 4,  4999,  5000, 'week 4'),
    (2026, 5, 5,  9999, 10000, 'week 5')
ON CONFLICT (year, month, week_index) DO NOTHING;

SET session_replication_role = DEFAULT;
