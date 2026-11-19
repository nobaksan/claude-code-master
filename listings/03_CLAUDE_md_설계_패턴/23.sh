# 대시보드 앱
## WHAT
B2B SaaS 관리자 대시보드. Next.js 14 + TypeScript + Prisma.

## WHY
- App Router: SEO 불필요, 서버 컴포넌트 성능
- Prisma: 타입 안전 DB 접근
- Shadcn/UI: 디자인 시스템 커스터마이징

## HOW
- 실행: pnpm dev --turbo
- DB: pnpm db:studio (Prisma Studio)
- 빌드: pnpm build && pnpm start

## 핵심 규칙
1. Server Component 기본, 상호작용 있을 때만 'use client'
2. 데이터 fetch: React Query 사용 (SWR/fetch 직접 금지)
3. 스타일: Tailwind 클래스, CSS 파일 추가 금지
4. 타입: Prisma 생성 타입 우선 사용
