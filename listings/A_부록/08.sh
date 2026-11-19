#!/bin/bash
COMMAND=$(jq -r '.tool_input.command')
if echo "$COMMAND" | grep -qE 'rm\s+-rf|rm\s+-fr|rmdir'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "파괴적 명령어가 Hook에 의해 차단됨"
    }
  }'
  exit 0
fi
exit 0
