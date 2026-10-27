-- Run once in the Supabase SQL editor.

create table public.tasks (
  id          uuid primary key default gen_random_uuid(),
  title       text not null check (char_length(title) between 1 and 120),
  description text check (char_length(description) <= 1000),
  submitter   text check (char_length(submitter) <= 60),
  status      text not null default 'suggested'
              check (status in ('suggested','accepted','in_progress','blocked','done','declined')),
  notes       text check (char_length(notes) <= 2000),
  eta         date,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

alter table public.tasks enable row level security;

-- Everyone can read the list.
create policy "public read" on public.tasks
  for select using (true);

-- Anyone can suggest a task, but only as a plain 'suggested' row with no notes/ETA.
create policy "public suggest" on public.tasks
  for insert to anon, authenticated
  with check (status = 'suggested' and notes is null and eta is null);

-- Only the admin account can edit or delete.
create policy "admin update" on public.tasks
  for update to authenticated
  using ((auth.jwt() ->> 'email') = 'rudlingjoe@gmail.com')
  with check ((auth.jwt() ->> 'email') = 'rudlingjoe@gmail.com');

create policy "admin delete" on public.tasks
  for delete to authenticated
  using ((auth.jwt() ->> 'email') = 'rudlingjoe@gmail.com');

create or replace function public.touch_updated_at() returns trigger as $$
begin new.updated_at = now(); return new; end;
$$ language plpgsql;

create trigger tasks_touch before update on public.tasks
  for each row execute function public.touch_updated_at();
