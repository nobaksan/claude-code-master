# 프로젝트: E-Commerce Platform
## WHAT
Next.js 14 + TypeScript + Prisma 기반 이커머스 플랫폼.
모노레포 구조: apps/web, apps/admin, packages/shared.

## WHY
- Server Components: SEO + 초기 로딩 최적화
- 모노레포: 공통 로직 재사용, 독립 배포
- Prisma: 타입 안전성 + 팀 생산성

## HOW
- 개발: pnpm dev --filter=web
- 테스트: pnpm test (모든 패키지)
- 빌드: pnpm build (Turbo 캐시 활용)

## 핵심 규칙
- 새 API 추가 시 packages/shared/types에 타입 정의
- 컴포넌트는 components/[domain]/[ComponentName].tsx 패턴
- 상태 관리는 Zustand 사용 (Redux 금지)
