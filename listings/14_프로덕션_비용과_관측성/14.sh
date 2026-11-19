# alertmanager 설정 예시
groups:
- name: claude-alerts
rules:
- alert: HighErrorRate
expr: rate(claude_api_requests_total{status="error"}[5m]) > 0.1
for: 2m
labels:
severity: critical
annotations:
summary: "Claude API 에러율 급증"
- alert: CostSpike
expr: increase(claude_daily_cost_usd[1h]) > 50
labels:
severity: warning
annotations:
summary: "시간당 비용 $50 초과"
