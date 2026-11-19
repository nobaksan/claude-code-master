# API 서버
## WHAT
주문 처리 API 서버. Node.js 18 + Express + MongoDB.

## WHY
- Express: 팀 숙련도, 빠른 개발
- MongoDB: 주문 데이터 스키마 유연성
- Jest: 팀 표준 테스트 프레임워크

## HOW
- 실행: pnpm dev (nodemon)
- 테스트: pnpm test (coverage 포함)
- 린트: pnpm lint:fix (ESLint + Prettier)

## 핵심 규칙
1. 모든 라우트에 Zod 스키마 검증 필수
2. 에러: lib/AppError 클래스 사용
3. 로그: lib/logger 사용 (console 금지)
4. DB: Mongoose 직접 쿼리 금지, repository 패턴 사용
