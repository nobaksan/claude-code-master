# curl로 API 직접 호출 테스트
curl -v -X POST https://api.anthropic.com/v1/messages \
-H "x-api-key: $ANTHROPIC_API_KEY" \
-H "content-type: application/json" \
-H "anthropic-version: 2026-10-21" \
-d '{
"model": "claude-haiku-5-5",
"max_tokens": 10,
"messages": [{"role": "user", "content": "Hi"}]
}'
