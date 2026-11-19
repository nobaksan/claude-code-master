#!/usr/bin/env bash
# .claude/hooks/confirm-switch.sh — PreModelSwitch 훅
INPUT=$(cat)
WARM=$(echo "$INPUT" | jq -r '.prompt_cache_warm')
TOKENS=$(echo "$INPUT" | jq -r '.context_tokens')
COST=$(echo "$INPUT" | jq -r '.estimated_cache_write_usd')
if [ "$WARM" = "true" ] && [ "$TOKENS" -gt 150000 ]; then
  jq -n --arg r "지금 바꾸면 약 ${TOKENS}토큰을 새 모델에 다시 보낸다(캐시 쓰기 추정 \$${COST}). 계속할까?" \
    '{hookSpecificOutput: {hookEventName: "PreModelSwitch", permissionDecision: "ask", permissionDecisionReason: $r}}'
fi
exit 0
