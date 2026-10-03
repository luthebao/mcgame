alter table "player"."characters" add constraint "characters_account_id_fkey" FOREIGN KEY (account_id) REFERENCES public.accounts(id) ON DELETE CASCADE not valid;

alter table "player"."characters" validate constraint "characters_account_id_fkey";


