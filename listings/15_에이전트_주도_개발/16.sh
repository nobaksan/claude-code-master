# 개발자가 CI 실패 상태를 확인한다.
$ gh pr checks 235
NAME STATUS CONCLUSION
TypeScript Check success
ESLint success
Unit Tests X failure
E2E Tests success
# 로그를 뒤지는 대신 Claude Code를 호출한다.
$ claude
/fix-ci 235
