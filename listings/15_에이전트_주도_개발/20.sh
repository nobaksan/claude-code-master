# CI 실패 패턴 및 해결책 (엔지니어링 가이드라인)
이 문서는 이전의 CI 실패 사례를 분석한 것이다. 코드 작성 및 리뷰 시 이 패턴들을 반드시 사전에 체크한다.
패턴 1: 시간 단위 불일치 (Time Unit Confusion)
- 증상: Expected/Received 값이 1000배 차이 나는 테스트 실패
- 원인: 초(s)와 밀리초(ms)의 혼용
- 예방 (강제 규칙): 시간 관련 변수나 함수에는 반드시 단위를 명시할 것 (예: getTimeout() 대신 getTimeoutMs(), SESSION_LIMIT_SEC)
패턴 2: 환경변수 누락 (Missing Environment Variables)
- 증상: undefined의 속성을 읽을 수 없다는 타입 에러
- 원인: 로컬에는 .env가 있으나 CI/CD 환경에는 해당 Secret 설정이 누락됨
- 예방 (강제 규칙): 새로운 환경변수 추가 시 src/env.ts (Zod 등 활용)에 스키마를 정의하고, 런타임 시작 시 유효성 검사를 강제할 것
패턴 3: 비동기 타이밍 이슈 (Flaky Tests)
- 증상: 동일한 테스트가 어떨 때는 통과하고 어떨 때는 실패 (간헐적 실패)
- 원인: 렌더링이나 API 응답을 기다리지 않는 Race Condition 발생
- 예방 (강제 규칙): setTimeout으로 하드코딩된 대기를 금지하고, waitFor나 findByRole 등 명시적인 상태 변화를 대기하는 API를 사용할 것
