import anthropic
client = anthropic.Anthropic()
# 도구 정의: Tool Search Tool과 defer_loading 사용
tools = [
# 1. Tool Search Tool 자체 - 항상 로드
{
"type": "tool_search_tool_regex_20251119",
"name": "tool_search_tool_regex"
},
# 2. 핵심 도구는 항상 로드 (defer_loading 없음)
# 자주 쓰는 3-5개는 검색 없이 바로 사용 가능하게
{
"name": "github.createPullRequest",
"description": "GitHub 저장소에 풀 리퀘스트(PR)를 생성합니다.",
"input_schema": {
"type": "object",
"properties": {
"repo": {"type": "string", "description": "owner/name 형식의 저장소 이름"},
"title": {"type": "string", "description": "PR 제목"},
"body": {"type": "string", "description": "PR 상세 내용"},
"base": {"type": "string", "description": "대상 브랜치 (예: main)"},
"head": {"type": "string", "description": "수정사항이 포함된 브랜치"}
},
"required": ["repo", "title", "base", "head"]
}
},
# 3. 드물게 사용하는 도구는 defer_loading으로 검색 전용
{
"name": "sentry.getIssueDetails",
"description": "Sentry 이슈의 스택트레이스, 빈도, 발생 시간 등 상세 정보를 조회합니다. 프로덕션 에러 디버깅 시 사용하세요.",
"input_schema": {
"type": "object",
"properties": {
"issue_id": {"type": "string", "description": "Sentry 이슈 ID"},
"include_stacktrace": {"type": "boolean", "default": True}
},
"required": ["issue_id"]
},
"defer_loading": True # 검색 시에만 로드
},
{
"name": "grafana.queryMetrics",
"description": "Grafana에서 시계열 메트릭 데이터를 쿼리합니다. 성능 모니터링 및 용량 산정에 사용하세요.",
"input_schema": {
"type": "object",
"properties": {
"dashboard_id": {"type": "string"},
"panel_id": {"type": "string"},
"time_from": {"type": "string", "description": "시작 시간 (ISO 8601 또는 'now-1h')"},
"time_to": {"type": "string", "description": "종료 시간 ('now' 등)"}
},
"required": ["dashboard_id", "panel_id"]
},
"defer_loading": True
}
# ... 수십 개의 다른 도구들 (모두 defer_loading: true)
]
# API 호출
response = client.messages.create(
model="claude-sonnet-5-5",
max_tokens=4096,
tools=tools,
messages=[{
"role": "user",
"content": "지난 1시간 동안 발생한 Sentry 에러를 확인하고 요약 리포트를 만들어줘."
}]
)
