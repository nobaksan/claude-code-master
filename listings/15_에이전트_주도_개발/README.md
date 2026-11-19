# 15_에이전트_주도_개발

본문에 실린 순서대로 코드 블록 30개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.sh](01.sh) | Git Worktree를 활용한 병렬 개발 | bash | `# 메인 저장소에서 여러 worktree 생성` |
| [02.sh](02.sh) | Git Worktree를 활용한 병렬 개발 | bash | `# 터미널 1: 인증 기능 개발 (Claude가 멈추지 않고 생각하도록 둔다)` |
| [03.sh](03.sh) | Git Worktree를 활용한 병렬 개발 | bash | `# 위의 네 줄과 같은 일을 Claude Code가 직접 한다` |
| [04.sh](04.sh) | 15.2 스킬로 만드는 팀 명령어 설계 | bash | `.claude/` |
| [05.sh](05.sh) | /issues 명령어 설계: AI를 QA 엔지니어로 활용하기 | bash | `# GitHub Issue 생성` |
| [06.sh](06.sh) | /work 명령어 설계: 자율 주행 개발 파이프라인 | bash | `# Issue 구현 및 PR 생성` |
| [07.sh](07.sh) | /review 명령어 설계: 깐깐한 시니어 리뷰어 | bash | `# PR 리뷰 및 개선` |
| [08.sh](08.sh) | 실전 시나리오: 버그 수정 자동화 | bash | `# 사용자 리포트: "로그인 후 세션이 5분마다 만료됨"` |
| [09.sh](09.sh) | 실전 시나리오: 버그 수정 자동화 | bash | `# Claude Code 출력:` |
| [10.sh](10.sh) | 실전 시나리오: 버그 수정 자동화 | bash | `/work 234` |
| [11.sh](11.sh) | 실전 시나리오: 버그 수정 자동화 | bash | `/review 235` |
| [12.sh](12.sh) | 실전 시나리오: 버그 수정 자동화 | bash | `PR #235 리뷰 완료` |
| [13.sh](13.sh) | 병렬 파이프라인 운영 (Parallel Pipeline Operations) | bash | `# 터미널 1 (로그인 버그 대응)` |
| [14.sh](14.sh) | 병렬 파이프라인 운영 (Parallel Pipeline Operations) | bash | `# 이슈 세 개를 백그라운드 세션으로 맡긴다` |
| [15.sh](15.sh) | CI 실패의 자동 분석(/fix-ci) | bash | `# CI 실패 자동 수정` |
| [16.sh](16.sh) | 실제 활용 예시: 단위 불일치 버그 해결 | bash | `# 개발자가 CI 실패 상태를 확인한다.` |
| [17.sh](17.sh) | 실제 활용 예시: 단위 불일치 버그 해결 | bash | `[Claude Code 작업 로그]` |
| [18.sh](18.sh) | CI 모니터링 완전 자동화 (Non-interactive Mode) | bash | `# .github/workflows/auto-fix.yml` |
| [19.yml](19.yml) | CI 모니터링 완전 자동화 (Non-interactive Mode) | yaml | `- name: Analyze and Fix with Claude Code` |
| [20.sh](20.sh) | 학습 루프: 반복되는 실패 패턴 기록 | bash | `# CI 실패 패턴 및 해결책 (엔지니어링 가이드라인)` |
| [21.sh](21.sh) | Claude Code 온보딩 CLAUDE.md 작성 | bash | `# 신규 팀원을 위한 가이드` |
| [22.sh](22.sh) | 온보딩 자동화 (환경 구축의 고통 없애기) | bash | `# /setup-dev 명령어` |
| [23.sh](23.sh) | 지식 이전 자동화(암묵지의 명시화와 능동적 가드레일) | bash | `함정 주의 (신규 팀원 필독)` |
| [24.sh](24.sh) | 상세한 인수인계 문서 자동화 (/handoff) | bash | `# 작업 인수인계 문서 생성` |
| [25.sh](25.sh) | Pull Request 설명 자동 생성 (/pr-description) | bash | `# PR 설명 자동 생성` |
| [26.sh](26.sh) | 클라우드 세션: claude --cloud와 --teleport | bash | `# 현재 저장소를 대상으로 클라우드 세션을 새로 만든다 (--remote는 폐기된 별칭)` |
| [27.sh](27.sh) | Remote Control: 내 컴퓨터의 세션을 휴대전화에서 이어 간다 | bash | `# 터미널에서 대화형 세션을 열면서 원격 접속도 연다` |
| [28.py](28.py) | 권한, 훅, 서브에이전트를 코드로 정의한다 | python | `# fix_ci_agent.py — CI 실패를 고치는 에이전트를 코드로 정의한다` |
| [29.sh](29.sh) | 실무에서 통하는 세 가지 관행 | bash | `# worktree 생성과 tmux 세션 생성을 한 번에` |
| [30.sh](30.sh) | 도입 초기에 겪기 쉬운 실수 넷 | bash | `# 작업이 끝난 워크트리를 안전하게 삭제` |
