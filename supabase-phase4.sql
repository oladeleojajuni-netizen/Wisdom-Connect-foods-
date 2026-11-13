-- Run after supabase.sql and supabase-phase3.sql.
-- Public readers only see published recipes. Admins can see drafts.
alter table public.custom_recipes add column if not exists image_url text;
alter table public.custom_recipes add column if not exists published boolean not null default false;
drop policy if exists "Anyone can read recipes" on public.custom_recipes;
create policy "Read published or own admin drafts" on public.custom_recipes for select to anon,authenticated
using (published = true or exists(select 1 from public.recipe_admins where user_id=(select auth.uid())));
drop policy if exists "Admins can delete recipes" on public.custom_recipes;
create policy "Admins can delete recipes" on public.custom_recipes for delete to authenticated
using (exists(select 1 from public.recipe_admins where user_id=(select auth.uid())));
-- Existing Phase 3 drafts remain unpublished until reviewed.
-- Never grant admin access from client-side code.
