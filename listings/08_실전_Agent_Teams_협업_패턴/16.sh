FILE OWNERSHIP DECLARATION (파일 소유권 선언):
Frontend Engineer (프론트엔드 엔지니어):
WRITE (쓰기 권한): /src/components/, /src/hooks/, /src/styles/
READ (읽기 권한): /src/api/, /src/types/
Backend Engineer (백엔드 엔지니어):
WRITE (쓰기 권한): /src/api/, /src/services/, /src/db/
READ (읽기 권한): /src/types/
Test Engineer (테스트 엔지니어):
WRITE (쓰기 권한): /tests/, /mocks/
READ (읽기 권한): /src/ (모든 소스 파일)
SHARED FILES (공유 파일 - 조정 필요):
- /src/types/api.ts (API 타입 정의)
- /package.json (의존성 관리)
- /tsconfig.json (컴파일러 설정)
RULE (공유 파일 수정 규칙):
자신이 소유하지 않은 파일을 수정해야 할 경우, 반드시 다음 절차를 따른다:
1. 팀 메일박스를 통해 파일 소유자에게 수정 의도를 전달한다.
2. 소유자의 승인(acknowledgment)을 기다린다.
3. 소유자가 직접 변경하도록 하거나, 명시적인 허가를 받아 변경한다.
4. 작업 완료 후, 다른 팀원들이 최신 코드를 가져갈 수 있도록 알린다.
