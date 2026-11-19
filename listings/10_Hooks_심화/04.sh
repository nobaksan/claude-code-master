#!/usr/bin/env bash
set -euo pipefail

# stdin으로부터 도구 입력 JSON 수신
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

# 파괴적 삭제 패턴 탐지
if echo "$COMMAND" | grep -qE 'rm\s+(-[a-zA-Z]*r[a-zA-Z]*f|-[a-zA-Z]*f[a-zA-Z]*r)\s+(/|~|\$HOME|\.\.)'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "보안 위반: 루트 또는 상위 디렉터리 재귀 삭제 시도가 감지되어 차단되었습니다."
    }
  }'
  exit 0
fi

# sudo 또는 권한 상승 시도 탐지
if echo "$COMMAND" | grep -qE '^\s*sudo\s+'; then
  jq -n '{
    hookSpecificOutput: {
      hookEventName: "PreToolUse",
      permissionDecision: "deny",
      permissionDecisionReason: "보안 위반: sudo 권한을 사용하는 명령은 금지되어 있습니다."
    }
  }'
  exit 0
fi

# 안전한 명령은 그대로 통과
exit 0
