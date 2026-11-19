# 실전 설정 예시
core_tools = [
# 항상 로드 - defer_loading 없음
{"name": "file_read", "description": "콘텐츠 파일 읽기", ...},
{"name": "file_write", "description": "파일 쓰기", ...},
{"name": "shell_execute", "description": "shell 커맨드 실행하기", ...},
{"name": "github.createPullRequest", ...}, # 가장 자주 쓰는 외부 도구
]
searchable_tools = [
# 검색으로 로드 - defer_loading: true
{"name": "aws_s3_upload", ..., "defer_loading": True},
{"name": "aws_s3_download", ..., "defer_loading": True},
{"name": "slack_send_message", ..., "defer_loading": True},
{"name": "slack_create_channel", ..., "defer_loading": True},
{"name": "sentry_get_issues", ..., "defer_loading": True},
# ... 나머지 모든 도구
]
