#!/usr/bin/env bash
set -euo pipefail

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')

if [ -z "$FILE_PATH" ] || [ ! -f "$FILE_PATH" ]; then
  exit 0
fi

STATUS=""

case "$FILE_PATH" in
  *.ts|*.tsx|*.js|*.jsx)
    npx eslint --fix "$FILE_PATH" > /dev/null 2>&1 || true
    npx prettier --write "$FILE_PATH" > /dev/null 2>&1 || true
    STATUS="TypeScript/JavaScript 코드 표준 포맷팅 적용 완료"
    ;;
  *.py)
    black --quiet "$FILE_PATH" 2>/dev/null || true
    isort --quiet "$FILE_PATH" 2>/dev/null || true
    STATUS="Python Black 및 isort 정돈 완료"
    ;;
  *.go)
    gofmt -w "$FILE_PATH" 2>/dev/null || true
    STATUS="Go fmt 정돈 완료"
    ;;
  *.json)
    jq . "$FILE_PATH" > "$FILE_PATH.tmp" && mv "$FILE_PATH.tmp" "$FILE_PATH"
    STATUS="JSON 스키마 정렬 완료"
    ;;
esac

if [ -n "$STATUS" ]; then
  jq -n --arg msg "$STATUS: $FILE_PATH" \
    '{hookSpecificOutput: {hookEventName: "PostToolUse", additionalContext: $msg}}'
fi
exit 0
