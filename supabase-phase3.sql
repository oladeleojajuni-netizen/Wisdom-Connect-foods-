-- Run AFTER supabase.sql. Admins must be granted manually in SQL editor.
create table if not exists public.recipe_admins (user_id uuid primary key references auth.users(id) on delete cascade);
alter table public.recipe_admins enable row level security;
drop policy if exists "Admin can view own role" on public.recipe_admins;
create policy "Admin can view own role" on public.recipe_admins for select to authenticated using (user_id=(select auth.uid()));
create table if not exists public.custom_recipes (id bigint generated always as identity primary key, recipe jsonb not null, video_url text, created_at timestamptz default now());
alter table public.custom_recipes enable row level security;
drop policy if exists "Anyone can read recipes" on public.custom_recipes;
create policy "Anyone can read recipes" on public.custom_recipes for select to anon,authenticated using (true);
drop policy if exists "Admins can insert recipes" on public.custom_recipes;
create policy "Admins can insert recipes" on public.custom_recipes for insert to authenticated with check (exists(select 1 from public.recipe_admins where user_id=(select auth.uid())));
drop policy if exists "Admins can update recipes" on public.custom_recipes;
create policy "Admins can update recipes" on public.custom_recipes for update to authenticated using (exists(select 1 from public.recipe_admins where user_id=(select auth.uid()))) with check (exists(select 1 from public.recipe_admins where user_id=(select auth.uid())));
-- Grant admin role ONLY from trusted SQL editor, never from the client:
-- insert into public.recipe_admins(user_id) values ('YOUR_AUTH_USER_UUID');
