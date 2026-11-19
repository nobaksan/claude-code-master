PR #142(feat: add user authentication)를 검토할 에이전트 팀을 구성해줘.
이 기능은 보안, 성능, 그리고 테스트에 중요한 핵심 기능이므로, 다음 세 명의 전문 리뷰어를 생성한다.
REVIEWER 1 - 보안 분석가 (Security Analyst):
당신의 유일한 목표는 보안이다. 침투 테스터(penetration tester)라고 가정하고 코드를 무너뜨리려고 시도한다.
검토 항목:
- 인증 우회 가능성 (Authentication bypass possibilities)
- SQL 인젝션 벡터 (ORM 사용 여부와 무관하게)
- 사용자에게 표시되는 데이터에서의 XSS(교차 사이트 스크립팅) 위험
- 상태 변경 작업에서의 CSRF(교차 사이트 요청 위조) 취약점
- 안전하지 않은 토큰 생성 또는 저장 방식
- 비교 연산에서의 타이밍 공격(Timing attacks) 가능성
- 속도 제한(Rate Limiting)의 허점
발견된 각 문제에 대해 다음을 제공한다:
- 위험도 (Critical/High/Medium/Low)
- 정확한 파일:줄 위치
- 공격 시나리오 시연 (간략하게)
- 권장 수정 사항
산출물: /reviews/pr-142/security-review.md
REVIEWER 2 - 성능 엔지니어 (Performance Engineer):
당신의 유일한 목표는 성능이다. 이 코드가 10,000명의 동시 사용자를 처리한다고 가정한다.
검토 항목:
- N+1 데이터베이스 쿼리 문제
- 쿼리 열에 누락된 데이터베이스 인덱스
- 루프 내에서 발생하는 비용이 많이 드는 작업
- 메모리 누수 (이벤트 리스너, 클로저, 캐시)
- 메인 스레드에서의 블로킹 작업
- 비효율적인 데이터 구조
발견된 각 문제에 대해 다음을 제공한다:
- 영향 예측 (응답 시간 증가, 메모리 사용량)
- 정확한 파일:줄 위치
- 벤치마크 제안
- 최적화된 대안
산출물: /reviews/pr-142/performance-review.md
REVIEWER 3 - QA 엔지니어 (QA Engineer):
당신의 유일한 목표는 테스트 커버리지와 품질이다. 이 코드를 프로덕션 환경에 인증해야 한다고 가정한다.
검토 항목:
- 테스트되지 않은 코드 경로 (커버리지 보고서 확인)
- 누락된 엣지 케이스 테스트 (null, empty, 경계값)
- 불안정한 테스트 패턴 (시간 종속성, 무작위 데이터)
- 컴포넌트 간 흐름에 대한 통합 테스트 누락
- 테스트되지 않은 에러 처리 로직
- 실제 문제를 숨기는 Mock된 의존성
발견된 각 부족한 점에 대해 다음을 제공한다:
- 테스트되지 않을 경우의 위험
- 추가해야 할 특정 테스트 케이스
- 테스트 코드 스켈레톤
산출물: /reviews/pr-142/test-review.md
COORDINATION RULES (협력 규칙):
- 각 리뷰어는 먼저 독립적으로 작업한다 (30분).
- 이후 팀 메일박스를 통해 서로의 발견 사항을 공유하고 토론한다.
- 한 리뷰어의 발견 사항이 다른 리뷰어의 영역에 영향을 미치는 경우, 토론한다.
- 토론 후, /reviews/pr-142/consolidated-review.md에 통합 보고서를 작성한다.
통합 보고서에는 다음 내용이 포함되어야 한다:
1. 요약 (Executive Summary, 3줄)
2. 심각한 결함 (Critical Issues, 병합 전 반드시 수정 필요)
3. 우선순위 높은 문제 (High Priority Issues, 수정해야 함)
4. 제안 사항 (Suggestions, 있으면 좋은 내용)
5. 최종 결론 (Final Verdict: APPROVE / REQUEST_CHANGES / NEEDS_DISCUSSION)
