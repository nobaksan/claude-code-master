import anthropic
client = anthropic.Anthropic()
# 모든 고급 기능을 활용한 최적화된 에이전트 구성
response = client.messages.create(
model="claude-opus-5-5",
max_tokens=8192,
tools=[
# 레이어 1: 도구 검색 (관제탑)
{"type": "tool_search_tool_regex_20251119", "name": "tool_search_tool_regex"},
# 레이어 2: 코드 실행 환경 (실행 엔진)
{"type": "code_execution_20260120", "name": "code_execution"},
# 레이어 3: 상시 로드 핵심 도구 (자주 쓰는 도구)
{"name": "file_read", "description": "파일 내용을 읽습니다.", ...},
{"name": "slack.sendMessage", "description": "메시지를 전송합니다.", ...},
# 레이어 4: 검색 전용 도구 (예시와 PTC 권한 포함)
{
"name": "sentry.get_issues",
"description": "최근 발생한 에러 이슈들을 대량 조회합니다.",
"defer_loading": True,
"allowed_callers": ["code_execution_20260120"],
"input_examples": [
{"project": "backend", "limit": 100, "environment": "production"}
]
},
{
"name": "github.create_pr",
"description": "새로운 Pull Request를 생성합니다.",
"defer_loading": True,
"input_examples": [
{"repo": "org/repo", "title": "feat: Update API", "base": "main", "head": "dev"}
]
}
],
messages=[{"role": "user", "content": "최근 Sentry 이슈 50개를 분석해서 요약하고 슬랙으로 보고해줘."}]
)
