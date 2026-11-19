#!/usr/bin/env bash
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

if echo "$COMMAND" | grep -qiE '(prod|production)[-_]?db|DATABASE_URL.*production'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "운영 데이터베이스 접근 명령은 수동 승인 파이프라인을 거쳐야 합니다."
    }
  }'
  exit 0
fi

exit 0
