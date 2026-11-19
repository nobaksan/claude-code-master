{
"name": "create_ticket",
"description": "트래킹 시스템을 위한 support 티켓 생성",
"input_schema": {...},
"input_examples": [
// 예시 1: 긴급 프로덕션 버그 - 모든 필드 사용
{
"title": "Login page returns 500 error",
"priority": "critical",
"labels": ["bug", "authentication", "production"],
"reporter": {"id": "USR-12345", "name": "Jane Smith"},
"due_date": "2024-11-06",
"escalation": {
"level": 2,
"notify_manager": true,
"sla_hours": 4
}
},
// 예시 2: 기능 요청 - 중간 수준
{
"title": "Add dark mode support",
"priority": "medium",
"labels": ["feature-request", "ui"],
"reporter": {"id": "USR-67890", "name": "Alex Chen"}
},
// 예시 3: 내부 작업 - 최소한의 필드
{
"title": "Update API documentation",
"priority": "low"
}
]
}
