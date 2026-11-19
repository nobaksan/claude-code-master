# 메인 저장소
/projects/my-app/
# Worktree 생성
git worktree add ../my-app-feature-a feature/user-dashboard
git worktree add ../my-app-feature-b feature/api-optimization
git worktree add ../my-app-feature-c feature/payment-refactor
git worktree add ../my-app-bugfix bugfix/login-issue
# 결과 디렉터리 구조
/projects/my-app/ # main 브랜치
/projects/my-app-feature-a/ # feature/user-dashboard 브랜치
/projects/my-app-feature-b/ # feature/api-optimization 브랜치
/projects/my-app-feature-c/ # feature/payment-refactor 브랜치
/projects/my-app-bugfix/ # bugfix/login-issue 브랜치
