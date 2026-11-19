{
"name": "create_ticket",
"description": "지원 티켓 생성",
"input_schema": {
"type": "object",
"properties": {
"title": {"type": "string"},
"priority": {"type": "string", "enum": ["low", "medium", "high", "critical"]},
"due_date": {"type": "string"},
"reporter": {
"type": "object",
"properties": { "id": {"type": "string"}, "name": {"type": "string"} }
}
}
}
}
