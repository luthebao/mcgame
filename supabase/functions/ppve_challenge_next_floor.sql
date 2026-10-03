CREATE OR REPLACE FUNCTION player.ppve_challenge_next_floor(
    p_char_id bigint,
    p_max_floor integer,
    p_free_challenges integer,
    p_today text
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY INVOKER
SET search_path TO ''
AS $$
DECLARE
    v_state       jsonb;
    v_free_time   integer;
    v_ppve_floor  integer;
    v_today_floor integer;
    v_last_reset  text;
    v_new_floor   integer;
    v_new_state   jsonb;
BEGIN
    SELECT state
    INTO v_state
    FROM "player"."character_stat_features"
    WHERE character_id = p_char_id
      AND feature_key  = 'pet_pve'
    FOR UPDATE;

    IF NOT FOUND THEN
        v_state := '{}'::jsonb;
    END IF;

    v_ppve_floor  := coalesce((v_state->>'ppvefloor')::integer, 0);
    v_today_floor := coalesce((v_state->>'todayFloor')::integer, -1);
    v_free_time   := coalesce((v_state->>'freeTime')::integer, p_free_challenges);
    v_last_reset  := coalesce(v_state->>'lastResetDay', '');

    IF v_last_reset <> p_today THEN
        v_free_time   := p_free_challenges;
        v_today_floor := -1;
        v_last_reset  := p_today;
    END IF;

    IF v_ppve_floor >= p_max_floor THEN
        RETURN jsonb_build_object('error', 'max_floor');
    END IF;

    IF v_free_time <= 0 THEN
        RETURN jsonb_build_object('error', 'no_free_challenges');
    END IF;

    v_free_time  := v_free_time - 1;
    v_new_floor  := v_ppve_floor + 1;

    v_new_state := v_state
        || jsonb_build_object(
            'ppvefloor',    v_new_floor,
            'todayFloor',   v_new_floor,
            'freeTime',     v_free_time,
            'lastResetDay', v_last_reset
        );

    INSERT INTO "player"."character_stat_features" (character_id, feature_key, state)
    VALUES (p_char_id, 'pet_pve', v_new_state)
    ON CONFLICT (character_id, feature_key)
    DO UPDATE SET
        state      = EXCLUDED.state,
        updated_at = now();

    RETURN jsonb_build_object(
        'ppvefloor',    v_new_floor,
        'todayFloor',   v_new_floor,
        'freeTime',     v_free_time,
        'lastResetDay', v_last_reset
    );
END;
$$;

REVOKE EXECUTE ON FUNCTION player.ppve_challenge_next_floor(bigint, integer, integer, text) FROM public, anon, authenticated;
GRANT  EXECUTE ON FUNCTION player.ppve_challenge_next_floor(bigint, integer, integer, text) TO service_role;
