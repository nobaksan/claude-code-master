공유 파일 수정 프로토콜 (Shared File Protocol)
Step 1 - 의도 선언 (Announce Intent):
- [개발자 → 팀 메일박스]
- 예시: "의존성 추가를 위해 `zod` 패키지를 `package.json`에 추가해야 합니다."
Step 2 - 승인 대기 (Wait for Clear):
- 모든 팀원이 "OK"로 응답하거나 우려 사항을 제기할 때까지 기다린다.
- 현재 해당 파일을 사용 중인 팀원이 있다면, 작업이 완료될 때까지 기다린다.
Step 3 - 변경 사항 적용 (Make Change):
- 명확하고 설명적인 커밋 메시지와 함께 파일을 수정한다:
- 예시: "chore(deps): 런타임 유효성 검사를 위한 zod 추가"
Step 4 - 완료 알림 (Notify Completion):
- [개발자 → 팀 메일박스]
- 예시: "완료되었습니다. `package.json`이 업데이트되었습니다. 동기화를 위해 'npm install'을 실행해 주세요."
EMERGENCY OVERRIDE (긴급 재정의):
- 팀원이 10분 이상 응답하지 않고 해당 변경 사항이 작업을 막고 있는 경우, 팀 리더(Team Lead)가 재정의를 승인할 수 있다.
- 재정의 기록은 `/logs/team-decisions.md`에 문서화해야 한다.
