# scripts/create_pr.sh
#!/bin/bash
# 현재 브랜치 정보
BRANCH=$(git branch --show-current)
BASE_BRANCH=${1:-main}
# 커밋 로그에서 PR 제목 생성
COMMITS=$(git log $BASE_BRANCH..HEAD --oneline | head -5)
echo "브랜치: $BRANCH"
echo "최근 커밋:"
echo "$COMMITS"
# 변경된 파일 목록
echo ""
echo "변경 파일:"
git diff --name-only $BASE_BRANCH..HEAD | head -20
