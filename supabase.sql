-- Run in the Supabase SQL editor. RLS restricts each account to its own data.
create table if not exists public.user_data (
 user_id uuid primary key references auth.users(id) on delete cascade,
 plan jsonb not null default '{}'::jsonb,
 shopping jsonb not null default '[]'::jsonb,
 updated_at timestamptz not null default now()
);
alter table public.user_data enable row level security;
create policy "Read own user data" on public.user_data for select to authenticated using ((select auth.uid()) = user_id);
create policy "Insert own user data" on public.user_data for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "Update own user data" on public.user_data for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
