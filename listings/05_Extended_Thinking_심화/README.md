# 05_Extended_Thinking_심화

본문에 실린 순서대로 코드 블록 26개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.sh](01.sh) | 세 가지 경로 | bash | `# 세션 안에서` |
| [02.sh](02.sh) | 세 가지 경로 | bash | `# 이번 실행에만` |
| [03.json](03.json) | 세 가지 경로 | json | `{` |
| [04.sh](04.sh) | 위치를 가리지 않는 낱말 하나 | bash | `# 셋 다 같게 동작한다 — ultrathink 는 위치를 가리지 않는다` |
| [05.sh](05.sh) | 실제 사용 예시 | bash | `claude --effort low "이 정렬 함수를 구현해줘"` |
| [06.sh](06.sh) | 실제 사용 예시 | bash | `claude "이 이커머스 시스템에 가장 적합한 데이터베이스 스키마를 제안해줘"` |
| [07.sh](07.sh) | 실제 사용 예시 | bash | `claude "ultrathink 이 동시성 코드에서 발생 가능한 모든 경쟁 조건(race condition` |
| [08.sh](08.sh) | 깊은 사고가 필요한 상황 | bash | `claude "초당 10,000건의 트랜잭션(10,000 TPS)을 처리하며 결과적 일관성(Eventual ` |
| [09.sh](09.sh) | 깊은 사고가 필요한 상황 | bash | `claude "이 테스트가 로컬에서는 통과하지만 CI 환경에서는 실패하는 이유를 찾아줘. ultrathink` |
| [10.sh](10.sh) | 깊은 사고가 필요한 상황 | bash | `claude "이 결제 검증 로직에서 발생할 수 있는 모든 예외 상황(Edge Cases)을 분석해줘. ul` |
| [11.sh](11.sh) | 깊은 사고가 필요한 상황 | bash | `claude "CSRF, XSS, 타이밍 공격(Timing attacks), 세션 고정(Session fix` |
| [12.sh](12.sh) | 기본값(medium)이나 high로 충분한 상황 | bash | `claude "이 500줄짜리 함수를 테스트 가능한 더 작은 단위들로 리팩터링하는 방법을 제안해줘"` |
| [13.sh](13.sh) | 기본값(medium)이나 high로 충분한 상황 | bash | `claude "이 사용자 관리 모듈을 위한 RESTful API를 설계해줘"` |
| [14.sh](14.sh) | 기본값(medium)이나 high로 충분한 상황 | bash | `claude "이 결제(Billing) 모듈에 어떤 테스트 케이스가 필요한지 정리해줘"` |
| [15.sh](15.sh) | 비용 최적화 전략 | bash | `# Step 1: 기본 effort 로 시도` |
| [16.sh](16.sh) | 비용 최적화 전략 | bash | `# 한 번에 몰아서 — 사고량이 커진다` |
| [17.sh](17.sh) | 비용 최적화 전략 | bash | `# 컨텍스트 부족 — 사고량을 올려도 추측만 늘어난다` |
| [18.sh](18.sh) | 실전 워크플로 예시 | bash | `claude "이 중복 결제 이슈를 분석해줘:` |
| [19.sh](19.sh) | 실전 워크플로 예시 | bash | `claude --effort xhigh "위 제안들을 모두 확인했지만 해결되지 않았다.` |
| [20.sh](20.sh) | 실전 워크플로 예시 | bash | `claude --effort max "이 결제 중복 발생 건을 시스템 전체 수준에서 분석해줘:` |
| [21.sh](21.sh) | 실전 워크플로 예시 | bash | `claude "알림 마이크로서비스를 설계해줘. ultrathink` |
| [22.py](22.py) | adaptive thinking과 output_config.effort | python | `import anthropic` |
| [23.py](23.py) | 스트리밍과 사고 | python | `prompt = "이 결제 모듈의 동시성 문제를 분석해줘"` |
| [24.py](24.py) | 사고 요약 분석 | python | `def analyze_thinking_quality(response) -> dict:` |
| [25.py](25.py) | 사고량별 품질 비교 실험 | python | `import time` |
| [26.py](26.py) | 품질 평가 루브릭 | python | `def score_response_quality(response: str) -> float:` |
