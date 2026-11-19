# 12_Skills와_Plugins_생태계

본문에 실린 순서대로 코드 블록 28개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.sh](01.sh) | 표준 스킬 디렉터리 구조 | bash | `skills/` |
| [02.md](02.md) | 마크다운 본문 (실행 가이드) | markdown | `---` |
| [03.txt](03.txt) | 마크다운 본문 (실행 가이드) | - | `### 크기 검증` |
| [04.txt](04.txt) | 마크다운 본문 (실행 가이드) | - | `## 최적화 팁` |
| [05.py](05.py) | scripts/ 디렉터리: 실제 실행 동력 | python | `# scripts/create_gif.py` |
| [06.sh](06.sh) | 1단계: Discovery (발견) - "무엇이 있는지 스캔하기" | bash | `---` |
| [07.sh](07.sh) | 3단계: Execution (실행) - "도구 조립 및 가동" | bash | `# Claude가 생성한 코드` |
| [08.md](08.md) | 인자 받기: $ARGUMENTS와 0부터 세는 위치 인자 | markdown | `---` |
| [09.md](09.md) | 실전 예제: /deploy 스킬 | markdown | `---` |
| [10.txt](10.txt) | 실전 예제: /deploy 스킬 | - | `### Production` |
| [11.txt](11.txt) | 실전 예제: /deploy 스킬 | - | `## 롤백` |
| [12.sh](12.sh) | 실전 통합 예제: 지능형 PR 리뷰어 | bash | `---` |
| [13.md](13.md) | MCP vs CLI: 유연한 대안 선택 | markdown | `---` |
| [14.txt](14.txt) | MCP vs CLI: 유연한 대안 선택 | - | `### PR 리뷰 제출` |
| [15.txt](15.txt) | MCP vs CLI: 유연한 대안 선택 | - | `### 이슈 생성` |
| [16.txt](16.txt) | MCP vs CLI: 유연한 대안 선택 | - | `Claude는 gh --help로 사용법을 파악할 수 있으므로,` |
| [17.sh](17.sh) | Plugin 구조: 체계적인 자산 관리 | bash | `my-awesome-plugin/` |
| [18.sh](18.sh) | plugin.json 작성: 플러그인의 설계도 | bash | `{` |
| [19.sh](19.sh) | 만들고 확인하고 배포하는 흐름 | bash | `# 배포 전 검사` |
| [20.sh](20.sh) | 플러그인 평가: claude plugin eval | bash | `# 플러그인 루트에서: Claude가 대화로 케이스와 채점기를 제안하고 파일을 쓴다` |
| [21.md](21.md) | 플러그인 평가: claude plugin eval | markdown | `---` |
| [22.md](22.md) | 플러그인 평가: claude plugin eval | markdown | `---` |
| [23.json](23.json) | 마켓플레이스 생성: .claude-plugin/marketplace.json | json | `{` |
| [24.json](24.json) | 마켓플레이스 운영 베스트 프랙티스 | json | `{` |
| [25.sh](25.sh) | 공식·커뮤니티 마켓플레이스 활용 및 관리 | bash | `# 세션 안에서: 마켓플레이스 추가, 브라우징, 설치` |
| [26.sh](26.sh) | 실전 심화: 프로덕션급 전문 스킬 개발 | bash | `---` |
| [27.sh](27.sh) | 실전 심화: 프로덕션급 전문 스킬 개발 | bash | `# scripts/create_pr.sh` |
| [28.sh](28.sh) | 실전 심화: 프로덕션급 전문 스킬 개발 | bash | `---` |
