input_examples = [
# Minimal: 필수 필드만
{"title": "Fix typo in readme"},
# Partial: 일부 선택 필드
{"title": "Add export feature", "priority": "medium", "labels": ["feature"]},
# Full: 모든 필드 사용
{"title": "Critical security vulnerability", "priority": "critical",
"labels": ["security", "urgent"], "due_date": "2024-11-06", ...}
]
