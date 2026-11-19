#!/usr/bin/env bash
# .claude/hooks/ledger-context.sh — PostToolBatch 훅
INPUT=$(cat)
if echo "$INPUT" | jq -e '[.tool_calls[] | .tool_input.file_path // ""] | any(test("/ledger/"))' > /dev/null; then
  jq -n '{hookSpecificOutput: {hookEventName: "PostToolBatch",
    additionalContext: "ledger 모듈 파일을 읽었다. 이 모듈을 고치면 작업 완료 전에 pytest tests/ledger를 실행한다."}}'
fi
exit 0
