# 시흥1동 마음배달 💌

## 바로 체험하기
`index.html` 파일을 브라우저에서 열면 설치 없이 작동합니다. 체험 모드는 메시지가 해당 브라우저의 localStorage에만 저장됩니다. 다른 사람에게 공유되지 않습니다.

## GitHub Pages 게시하기
1. GitHub에서 **New repository** → 예: `maeum-delivery` → Public → Create repository.
2. `index.html`, `schema.sql`, `README.md` 파일을 저장소 최상위에 업로드(Upload files → Commit changes).
3. **Settings → Pages → Build and deployment → Deploy from a branch → main / (root) → Save**.
4. 게시 후 GitHub Pages가 표시하는 주소를 방문합니다. 주소는 보통 `https://사용자명.github.io/maeum-delivery/` 형식입니다. 게시 전에는 해당 주소가 열리지 않습니다.

## 여러 가게가 메시지를 공유하게 만들기
1. Supabase에서 새 프로젝트를 만듭니다.
2. **SQL Editor**에서 `schema.sql`을 실행합니다.
3. 게시한 사이트의 **운영자 설정**을 열고 Project URL 및 **publishable/anon 공개용 키**를 입력합니다. service_role/secret 키는 절대 입력하지 마세요.
4. 실제 운영에서는 이 연결 설정을 각 기기마다 입력해야 합니다. QR코드로 손님에게 배포하려면 HTML 코드에 프로젝트 공개 URL/키를 고정하거나 배포 환경에서 주입하는 별도 설정이 필요합니다. **현재 제공 파일은 시범 운영을 위한 버전**입니다.
5. 손님이 응원을 보내면 Supabase `cheers` 테이블에 `approved=false`로 저장됩니다. 운영자가 Table Editor에서 적절한 메시지의 `approved`를 `true`로 변경하면 모든 기기의 응원함에서 볼 수 있습니다.

## QR코드
가게별 URL은 게시된 주소 뒤에 `?store=가게이름`을 붙여 만듭니다. 예: `https://사용자명.github.io/maeum-delivery/?store=솔커피호프` (가게 이름 URL 인코딩 권장). QR 생성 웹서비스에서 이 주소로 QR을 만드세요.

## 주의
- 실제 서비스는 공개 익명 입력을 받으므로 스팸 방지, 신고/삭제, 이용 안내, 운영자 검수 절차가 필요합니다.
- 브라우저의 관리자 설정은 비밀번호로 보호된 관리 페이지가 아닙니다. 비밀 키를 저장하지 마세요.
- 기본 점포 목록은 예시입니다. 운영 전 참여 가게의 동의를 받고 명칭을 수정하세요.
- 개인정보(실명, 전화번호 등)를 작성하지 않도록 안내하세요.
