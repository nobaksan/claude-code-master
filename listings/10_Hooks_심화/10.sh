#!/usr/bin/env bash
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')

if [[ "$FILE_PATH" =~ \.(ts|tsx)$ ]]; then
  TSC_OUTPUT=$(npx tsc --noEmit --pretty false 2>&1 || true)
  
  if echo "$TSC_OUTPUT" | grep -q "error TS"; then
    ERROR_SUMMARY=$(echo "$TSC_OUTPUT" | grep "error TS" | head -n 8)
    jq -n --arg details "$ERROR_SUMMARY" \
      '{hookSpecificOutput: {hookEventName: "PostToolUse",
        additionalContext: ("타입 검사 실패. 다음 오류를 교정한다:\n" + $details)}}'
  fi
fi
exit 0
