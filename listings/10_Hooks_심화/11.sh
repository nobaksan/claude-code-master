#!/usr/bin/env bash
# 단위 테스트 전체 실행
TEST_OUTPUT=$(npm test 2>&1)
TEST_STATUS=$?

if [ $TEST_STATUS -ne 0 ]; then
  # Exit 2는 답변 제출을 거부하고 문제를 강제 수정하게 만듦
  echo "전체 테스트 실패. 아래 실패 내역을 분석하여 코드를 수정한 뒤 다시 제출하세요:" >&2
  echo "$TEST_OUTPUT" | tail -n 25 >&2
  exit 2
fi

exit 0
