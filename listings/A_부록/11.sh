# 프로젝트명

## 개요
[프로젝트의 목적과 주요 기능을 한두 문장으로 설명]

## 기술 스택
- Runtime: Node.js 20+
- Framework: Next.js 15
- Language: TypeScript 5.x
- Database: PostgreSQL 16
- ORM: Drizzle

## 프로젝트 구조
src/
├── app/          # Next.js App Router 페이지 및 레이아웃
├── components/   # 재사용 가능한 React 컴포넌트
├── lib/          # 공유 유틸리티, 스키마 및 설정
└── server/       # API 라우트, 서버 액션 및 비즈니스 로직

## 핵심 명령어
- `npm run dev`: 로컬 개발 서버 실행
- `npm run build`: 프로덕션 빌드 생성
- `npm test`: 전체 테스트 스위트 실행
- `npm run typecheck`: TypeScript 타입 검사

## 코드 컨벤션
- 컴포넌트 작성 시 `src/components/Button.tsx`의 구조와 패턴을 따를 것
- 모든 DB 쿼리는 `src/lib/db/`에 정의된 함수를 통해서만 수행
- 상세 가이드가 필요한 경우 `docs/conventions.md` 참조

## 주의사항
- `.env` 파일을 직접 수정하거나 커밋하지 말 것
- `main` 브랜치에 직접 커밋 금지 (PR 워크플로 준수)
- 모든 API 키와 비밀 정보는 반드시 환경 변수로 관리
