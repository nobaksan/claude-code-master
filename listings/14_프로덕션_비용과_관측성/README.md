# 14_프로덕션_비용과_관측성

본문에 실린 순서대로 코드 블록 25개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.py](01.py) | 컨텍스트 최소화 전략 | python | `# 나쁜 예: 전체 코드베이스를 컨텍스트에 포함` |
| [02.py](02.py) | 컨텍스트 최소화 전략 | python | `def compress_context(file_content: str, max_lines: int = 100` |
| [03.py](03.py) | 컨텍스트 최소화 전략 | python | `class ConversationManager:` |
| [04.py](04.py) | 출력 토큰 제어 | python | `# 시스템 프롬프트에서 명시적으로 행동 규칙을 제한` |
| [05.py](05.py) | 캐싱 전략 | python | `# 방법 1: 요청 최상위 자동 캐싱 (권장 출발점)` |
| [06.py](06.py) | 작업 예산으로 폭주를 막는다 | python | `with client.beta.messages.stream(` |
| [07.py](07.py) | 속도를 돈으로 사는 Fast mode | python | `response = client.messages.create(` |
| [08.py](08.py) | 견고한 재시도 로직 | python | `import time` |
| [09.py](09.py) | 폴백 체인 패턴 | python | `class ModelFallbackChain:` |
| [10.py](10.py) | 거부(refusal)에 대비한다 | python | `response = client.beta.messages.create(` |
| [11.py](11.py) | 그레이스풀 디그레이데이션 (Graceful Degradation, 우아한 저하) | python | `class GracefulDegradation:` |
| [12.py](12.py) | 구조화된 로깅 (Structured Logging) | python | `import json` |
| [13.sh](13.sh) | 핵심 메트릭 (Core Metrics) | bash | `from prometheus_client import Counter, Histogram, Gauge` |
| [14.sh](14.sh) | 알림 설정 | bash | `# alertmanager 설정 예시` |
| [15.sh](15.sh) | OpenTelemetry로 지표와 이벤트 내보내기 | bash | `# 1. 텔레메트리 켜기 (필수)` |
| [16.json](16.json) | 조직 전체에 강제하기 | json | `{` |
| [17.sh](17.sh) | API 키 관리 | bash | `# 절대 금지: 코드에 키 하드코딩` |
| [18.py](18.py) | 프롬프트 인젝션 방어 | python | `def sanitize_user_input(user_input: str) -> str:` |
| [19.py](19.py) | 출력 검증 | python | `import ast` |
| [20.py](20.py) | 민감 데이터 마스킹 | python | `import re` |
| [21.py](21.py) | 패턴 1: 사용자 직접 요청형 (Synchronous) | python | `from fastapi import FastAPI, HTTPException` |
| [22.py](22.py) | 패턴 2: 비동기 작업 큐 (Asynchronous Queue) | python | `# 작업 제출` |
| [23.py](23.py) | 패턴 3: 스트리밍 응답 (Streaming) | python | `from fastapi.responses import StreamingResponse` |
| [24.sh](24.sh) | k6를 이용한 부하 테스트 | bash | `// load-test.js` |
| [25.py](25.py) | 비용 추정 모델 | python | `# 1M 토큰당 USD — 14.1절 단가표 기준 (2026-11-15 platform.claude.com ` |
