-- Set security_invoker on existing views flagged by Supabase advisor
-- (security_definer_view lint). Migra does not detect view reloptions
-- changes, so this migration is hand-written as a justified exception.

alter view "player"."characters_full" set (security_invoker = on);
alter view "public"."vw_item_source" set (security_invoker = on);
