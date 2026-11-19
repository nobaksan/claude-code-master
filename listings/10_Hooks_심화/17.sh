#!/usr/bin/env bash
ENV=${DEPLOY_ENV:-development}
INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')

case "$ENV" in
  "production")
    if echo "$COMMAND" | grep -qE "DROP|TRUNCATE|DELETE FROM|terraform destroy"; then
      echo "[보안 거버넌스] 운영 환경에서 파괴적 인프라 및 DB 명령 실행은 엄격히 차단됩니다." >&2
      exit 2
    fi
    ;;
  "staging")
    if echo "$COMMAND" | grep -qE "DROP|TRUNCATE"; then
      echo "[경고] 스테이징 데이터 변경 명령이 감지되었습니다. 사전에 백업 여부를 확인하세요." >&2
      exit 1  # 비차단 오류: 알림만 남기고 통과
    fi
    ;;
  "development")
    exit 0
    ;;
esac
exit 0
