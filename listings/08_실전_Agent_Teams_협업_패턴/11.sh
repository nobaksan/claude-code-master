#!/bin/bash
# .claude/hooks/check-review.sh — TaskCompleted 훅
INPUT=$(cat)
TEAMMATE=$(echo "$INPUT" | jq -r '.teammate_name // empty')
SUBJECT=$(echo "$INPUT" | jq -r '.task_subject')

# 리뷰 작업이 아니면 통과
case "$TEAMMATE" in
  security*) REVIEW_FILE="reviews/pr-142/security-review.md" ;;
  performance*) REVIEW_FILE="reviews/pr-142/performance-review.md" ;;
  qa*) REVIEW_FILE="reviews/pr-142/test-review.md" ;;
  *) exit 0 ;;
esac
REVIEW_FILE="$CLAUDE_PROJECT_DIR/$REVIEW_FILE"

# 파일이 실제로 생성되었는지 확인
if [ ! -f "$REVIEW_FILE" ]; then
  echo "'$SUBJECT' 완료 불가: $REVIEW_FILE 이 없다. 리뷰 파일을 먼저 작성한다." >&2
  exit 2
fi

# 필수 섹션 확인
for section in "## Summary" "## Issues Found" "## Recommendations"; do
  if ! grep -q "$section" "$REVIEW_FILE"; then
    echo "'$SUBJECT' 완료 불가: 필수 섹션 '$section' 이 빠졌다." >&2
    exit 2
  fi
done

# 분량과 심각도 등급 확인
WORD_COUNT=$(wc -w < "$REVIEW_FILE")
if [ "$WORD_COUNT" -lt 200 ]; then
  echo "'$SUBJECT' 완료 불가: 리뷰가 ${WORD_COUNT}단어로 너무 짧다. 근거를 보강한다." >&2
  exit 2
fi
if ! grep -qE "(Critical|High|Medium|Low)" "$REVIEW_FILE"; then
  echo "'$SUBJECT' 완료 불가: 위험도 등급(Critical/High/Medium/Low)이 없다." >&2
  exit 2
fi
exit 0
