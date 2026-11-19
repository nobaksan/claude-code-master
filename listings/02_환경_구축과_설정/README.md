# 02_환경_구축과_설정

본문에 실린 순서대로 코드 블록 37개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.sh](01.sh) | 설치 — 네이티브 설치기가 기본 | bash | `# macOS, Linux, WSL` |
| [02.sh](02.sh) | 설치 — 네이티브 설치기가 기본 | bash | `claude --version     # 버전 확인` |
| [03.sh](03.sh) | 터미널 CLI - 파워 유저의 무기 | bash | `# 기본 대화형 실행` |
| [04.py](04.py) | 터미널 CLI - 파워 유저의 무기 | python | `import subprocess` |
| [05.sh](05.sh) | 설정 파일의 위치와 우선순위 | bash | `# 사용자 전역 설정 (모든 프로젝트에 적용)` |
| [06.json](06.json) | 핵심 설정 항목 상세 해설 | json | `{` |
| [07.json](07.json) | 현행 모델 라인업과 기본 모델 | json | `{` |
| [08.json](08.json) | 환경변수 설정의 모든 것 | json | `{` |
| [09.sh](09.sh) | 환경변수 설정의 모든 것 | bash | `# ~/.bashrc 또는 ~/.zshrc에 추가` |
| [10.sh](10.sh) | 팀 협업을 위한 설정 전략 | bash | `# 프로젝트 구조` |
| [11.json](11.json) | 팀 협업을 위한 설정 전략 | json | `{` |
| [12.json](12.json) | 팀 협업을 위한 설정 전략 | json | `{` |
| [13.json](13.json) | 안전한 권한 설정 패턴 | json | `{` |
| [14.sh](14.sh) | 정기 권한 감사 | bash | `# 현재 allow 목록 확인` |
| [15.sh](15.sh) | auto 모드 — 지금의 기본 시작 모드 | bash | `claude auto-mode defaults   # 기본 environment·allow·soft_deny` |
| [16.json](16.json) | 샌드박스 Bash — 운영체제가 지키는 경계 | json | `{` |
| [17.sh](17.sh) | 구독 로그인 (OAuth) | bash | `# 구독으로 로그인 (기본값)` |
| [18.sh](18.sh) | API Key 인증 - 개발자/기업용 | bash | `# API 키 설정 (환경변수)` |
| [19.json](19.json) | 클라우드 제공업체를 통한 API 사용 | json | `{` |
| [20.json](20.json) | 클라우드 제공업체를 통한 API 사용 | json | `{` |
| [21.json](21.json) | 기업 환경 프록시 설정 | json | `{` |
| [22.sh](22.sh) | 기업 환경 프록시 설정 | bash | `export HTTPS_PROXY="http://username:password@proxy.company.c` |
| [23.sh](23.sh) | mitmproxy를 활용한 트래픽 분석 | bash | `# 1. mitmproxy 설치` |
| [24.sh](24.sh) | mitmproxy를 활용한 트래픽 분석 | bash | `# 환경변수로 프록시 설정 후 Claude Code 실행` |
| [25.sh](25.sh) | mitmproxy를 활용한 트래픽 분석 | bash | `# macOS` |
| [26.sh](26.sh) | 일반적인 연결 문제 해결 | bash | `# curl로 API 직접 호출 테스트` |
| [27.sh](27.sh) | 일반적인 연결 문제 해결 | bash | `# DNS 해석이 되는지 확인` |
| [28.sh](28.sh) | 일반적인 연결 문제 해결 | bash | `# 443 포트로 연결 가능한지 확인` |
| [29.sh](29.sh) | 일반적인 연결 문제 해결 | bash | `# 프록시 환경변수 제거 후 테스트` |
| [30.sh](30.sh) | 디버그 모드 활성화 | bash | `# 디버그 모드로 실행` |
| [31.sh](31.sh) | 디버그 모드 활성화 | bash | `# 최근 디버그 로그부터` |
| [32.sh](32.sh) | 배포 경로 | bash | `# macOS` |
| [33.json](33.json) | 무엇을 묶을 것인가 | json | `{` |
| [34.json](34.json) | 시나리오 1: 스타트업 웹 개발팀 | json | `{` |
| [35.json](35.json) | 시나리오 2: 대기업 금융 서비스팀 | json | `{` |
| [36.json](36.json) | 시나리오 3: 개인 풀스택 개발자 | json | `{` |
| [37.yml](37.yml) | GitHub Actions를 활용한 자동 코드 리뷰 | yaml | `# .github/workflows/claude-review.yml` |
