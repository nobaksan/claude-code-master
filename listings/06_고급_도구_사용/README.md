# 06_고급_도구_사용

본문에 실린 순서대로 코드 블록 22개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.sh](01.sh) | 구현 코드 | bash | `import anthropic` |
| [02.sh](02.sh) | 검색 친화적인 도구 설명 작성법 | bash | `# 나쁜 예: 검색하기 어려운 설명` |
| [03.sh](03.sh) | 도구 우선순위 결정하기 | bash | `# 실전 설정 예시` |
| [04.py](04.py) | 해결책: 코드로 위임하기 | python | `# Claude가 작성하는 코드 (코드 실행 환경에서 실행됨)` |
| [05.sh](05.sh) | 해결책: 코드로 위임하기 | bash | `[` |
| [06.sh](06.sh) | PTC 구현 방법: allowed_callers 설정 | bash | `import anthropic` |
| [07.sh](07.sh) | 실제 적용 예시: 네 요소를 갖춘 도구 정의 | bash | `{` |
| [08.sh](08.sh) | 문제: JSON Schema의 침묵 — 모델이 추측하게 된다 | bash | `{` |
| [09.sh](09.sh) | 해결책: input_examples를 통한 암묵적 규칙 학습 | bash | `{` |
| [10.sh](10.sh) | 좋은 예시를 쓰는 네 원칙 | bash | `# 나쁜 예: 추상적이고 비현실적` |
| [11.sh](11.sh) | 좋은 예시를 쓰는 네 원칙 | bash | `input_examples = [` |
| [12.sh](12.sh) | 좋은 예시를 쓰는 네 원칙 | bash | `# email 필드는 예시 불필요 - 형식이 명확` |
| [13.sh](13.sh) | 실전 적용: 이커머스 주문 생성 API | bash | `order_tool = {` |
| [14.sh](14.sh) | 실전 예시: DevOps 워크플로 자동화 구성 (plugin.yaml) | bash | `# 개념 스케치 — 실제 플러그인 매니페스트 형식은 12장` |
| [15.py](15.py) | MCP 게이트웨이 패턴 구현 (Python) | python | `class MCPGateway:` |
| [16.sh](16.sh) | 단계별 적용 가이드: 4-Step 최적화 워크플로 | bash | `# 현재 도구 현황 파악` |
| [17.sh](17.sh) | 단계별 적용 가이드: 4-Step 최적화 워크플로 | bash | `# 로그에서 도구 사용 빈도 분석` |
| [18.py](18.py) | 단계별 적용 가이드: 4-Step 최적화 워크플로 | python | `# 대량 데이터를 다루는 도구 식별` |
| [19.py](19.py) | 단계별 적용 가이드: 4-Step 최적화 워크플로 | python | `# 자주 실패하는 도구에 예시 추가` |
| [20.sh](20.sh) | 통합 설정 모범 사례: All-in-One 최적화 코드 | bash | `import anthropic` |
| [21.sh](21.sh) | Code Mode: 도구 호출을 코드로 묶는다(실험) | bash | `CLAUDE_CODE_EXPERIMENTAL_CODE_MODE=1 claude` |
| [22.json](22.json) | advisor 도구: 결정 지점에서 상위 모델에 묻는다(실험) | json | `{` |
