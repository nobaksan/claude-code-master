# 터미널 1 (로그인 버그 대응)
worktree-1$ /work 234
# 터미널 2 (결제 모듈 리팩터링)
worktree-2$ /work 235
# 터미널 3 (새로운 API 엔드포인트 기능 개발)
worktree-3$ /work 236
# 터미널 4 (관리자) # 위 작업들이 끝나고 3개의 PR이 올라오면, 메인 브랜치에서 일괄 리뷰를 진행한다.
main$ /review all
