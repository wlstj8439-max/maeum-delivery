-- Supabase SQL Editor에서 실행하세요.
-- 메시지 공개는 운영자가 Dashboard > Table Editor에서 approved=true로 변경한 후 가능합니다.
create table if not exists public.cheers (
  id bigint generated always as identity primary key,
  from_store text not null check (char_length(from_store) between 1 and 100),
  to_store text not null check (char_length(to_store) between 1 and 100),
  body text not null check (char_length(body) between 5 and 180),
  approved boolean not null default false,
  created_at timestamptz not null default now(),
  constraint different_stores check (from_store <> to_store)
);
create index if not exists cheers_public_idx on public.cheers(to_store,created_at desc) where approved = true;
alter table public.cheers enable row level security;
revoke all on public.cheers from anon, authenticated;
grant select (from_store,to_store,body,created_at,approved) on public.cheers to anon, authenticated;
grant insert (from_store,to_store,body) on public.cheers to anon, authenticated;
create policy "Public sees approved cheers" on public.cheers for select to anon, authenticated using (approved = true);
create policy "Anonymous can submit pending cheers" on public.cheers for insert to anon, authenticated with check (approved = false);
-- 공개 API로의 무제한 제출을 막으려면 운영 전 CAPTCHA, 서버 측 rate limit 등의 보호 장치를 추가하세요.
