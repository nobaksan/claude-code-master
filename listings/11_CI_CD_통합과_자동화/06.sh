프롬프트 예시: "이 기능을 PR로 만들어줘. CI 전체 통과하면 자동으로 squash merge 해주고, 머지 후에는 브랜치를 삭제해서 깔끔하게 유지해줘."

# GitHub CLI로 Auto-merge 활성화
gh pr merge 234 --auto --squash
# 또는 특정 조건 충족 시 머지
gh pr merge 234 --auto --merge --delete-branch
