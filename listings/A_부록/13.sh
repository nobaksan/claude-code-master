# 테스트 가이드

## 단위 테스트
- 파일명 규칙: `*.test.ts`
- 위치: 테스트 대상 파일과 동일한 디렉터리에 위치
- 작성 예시: `src/lib/utils.test.ts`

## 테스트 실행 방법
- 전체 테스트: `npm test`
- 감시 모드: `npm test -- --watch`
- 특정 경로 테스트: `npm test src/lib/`

## 모킹(Mocking) 패턴
- DB 모킹은 `src/lib/__mocks__/db.ts`를 참조하여 작성
