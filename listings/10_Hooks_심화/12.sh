#!/usr/bin/env bash
CHANGED_FILES=$(git diff --name-only HEAD 2>/dev/null || true)

if echo "$CHANGED_FILES" | grep -qE '\.(ts|tsx|js|jsx)$'; then
  # Jest의 findRelatedTests 옵션으로 변경 파일 관련 테스트만 고속 실행
  npx jest --findRelatedTests $CHANGED_FILES --passWithNoTests 2>&1
  if [ $? -ne 0 ]; then
    echo "변경된 모듈에서 회귀 결함이 발견되었습니다. 코드를 보완하세요." >&2
    exit 2
  fi
fi
exit 0
