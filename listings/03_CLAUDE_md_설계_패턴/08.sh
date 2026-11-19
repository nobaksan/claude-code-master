# 테스트 가이드
## 테스트 구조
- 단위 테스트: __tests__/ 디렉터리
- 통합 테스트: e2e/ 디렉터리
- 픽스처: __fixtures__/

## 테스트 작성 규칙
1. AAA 패턴: Arrange → Act → Assert
2. 테스트명: should_동작_when_조건
3. 모킹: MSW 사용 (fetch 직접 모킹 금지)

## 실행 명령
- pnpm test - 전체 실행
- pnpm test:watch - 감시 모드
- pnpm test:coverage - 커버리지 리포트
