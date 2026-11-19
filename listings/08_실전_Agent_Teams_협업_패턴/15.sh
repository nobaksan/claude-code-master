# 인터페이스 계약 우선 개발 (Contract-First) 개요: 사용자 프로필 이미지 업로드 기능 구현
## 0단계: 계약 협상 (PHASE 0 - CONTRACT NEGOTIATION)
- 목표: 실제 구현 전에 모든 팀원이 API 계약 및 컴포넌트 인터페이스에 합의.
- 주요 합의 내용:
- API 계약: POST /api/users/{userId}/avatar의 요청/응답 형식, 필수 필드(avatarUrl, thumbnailUrl 등), 에러 코드 상세 정의.
- 컴포넌트 인터페이스: ImageUploadProps의 인자(userId, onSuccess, onError 등) 정의.
- 산출물: 합의된 계약은 /docs/contracts/avatar-upload.md에 저장되며, 세 명 모두 승인 후 구현 시작.
---
## 1단계: 병렬 구현 (PHASE 1 - PARALLEL IMPLEMENTATION)
| 역할 | 소유권 (Write 권한) | 주요 임무 |
|---|---|---|
| FRONTEND ENGINEER | /src/components/*, /src/hooks/* | ImageUpload.tsx 컴포넌트 생성. 이미지 미리보기, 크롭, 진행률 표시, 에러 처리 구현. Mock Service Worker(MSW)를 사용하여 백엔드 없이 계약 기반으로 개발. |
| BACKEND ENGINEER | /src/api/*, /src/services/* | POST /api/users/:userId/avatar 엔드포인트 생성, 파일 파싱/검증, S3 통합, 썸네일 생성. 프론트엔드의 빠른 연동을 위해 엔드포인트 스텁(Stub)을 즉시 제공. |
| TEST ENGINEER | /tests/* | 계약을 기반으로 유닛/통합 테스트, 모든 에러 시나리오에 대한 테스트 케이스 작성. 구현 전에 테스트 골격(Skeleton)을 먼저 준비하여 TDD 접근. |
---
## 2단계: 통합 및 검증 (PHASE 2 - INTEGRATION)
1. Frontend는 MSW Mock을 끄고 실제 Backend와 연결.
2. Test Engineer가 전체 통합 테스트 실행.
3. 계약 불일치 발생 시 즉시 해결.
4. 세 명 모두 /docs/contracts/avatar-upload.md 파일에 "IMPLEMENTATION VERIFIED"로 최종 서명해야 Merge 가능.
---
## 핵심 파일 소유권 규칙 (CRITICAL FILE OWNERSHIP RULES)
- Frontend는 절대 /src/api/*를 수정할 수 없다.
- Backend는 절대 /src/components/*를 수정할 수 없다.
- Test Engineer는 모든 파일을 읽을 수 있으나, 오직 /tests/*에만 작성한다.
- 계약 파일(/docs/contracts/avatar-upload.md)은 변경 시 세 명 모두의 동의를 필요로 한다.
