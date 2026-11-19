import anthropic
client = anthropic.Anthropic()
tools = [
# 1. 코드 실행 도구 활성화
{
"type": "code_execution_20260120",
"name": "code_execution"
},
# 2. PTC로 호출 가능한 도구에 allowed_callers 추가
{
"name": "get_team_members",
"description": """Fetch team member list for a department.
Args:
department (str): Department name (e.g., 'engineering', 'sales')
Returns:
List of member objects:
- id (str): Employee ID (e.g., 'E001')
- name (str): Full name
- email (str): Corporate email
- level (str): 'junior' | 'senior' | 'lead' | 'manager'
""",
"input_schema": {
"type": "object",
"properties": {
"department": {"type": "string"}
},
"required": ["department"]
},
# 이 도구는 코드 실행 환경에서 호출 가능
"allowed_callers": ["code_execution_20260120"]
},
{
"name": "get_expenses",
"description": """Fetch expense reports for a team member.
Args:
employee_id (str): Employee ID
quarter (str): Quarter (e.g., 'Q1', 'Q2', 'Q3', 'Q4')
Returns:
List of expense objects:
- id (str): Expense ID
- amount (float): Amount in USD
- category (str): 'travel' | 'equipment' | 'software' | 'other'
- date (str): ISO date (YYYY-MM-DD)
- description (str): Expense description
- receipt_url (str): Link to receipt image
""",
"input_schema": {
"type": "object",
"properties": {
"employee_id": {"type": "string"},
"quarter": {"type": "string"}
},
"required": ["employee_id", "quarter"]
},
"allowed_callers": ["code_execution_20260120"]
}
]
response = client.messages.create(
model="claude-sonnet-5-5",
max_tokens=8192,
tools=tools,
messages=[{
"role": "user",
"content": "엔지니어링 팀에서 Q3 출장 예산을 초과한 사람이 있는지 확인해줘"
}]
)
