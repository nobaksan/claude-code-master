from prometheus_client import Counter, Histogram, Gauge
# 요청 카운터
api_requests_total = Counter(
'claude_api_requests_total',
'Total API requests',
['model', 'status']
)
# 레이턴시 히스토그램
api_latency_seconds = Histogram(
'claude_api_latency_seconds',
'API call latency',
['model'],
buckets=[0.5, 1.0, 2.5, 5.0, 10.0, 30.0]
)
# 토큰 사용량
tokens_used = Counter(
'claude_tokens_total',
'Tokens consumed',
['model', 'type'] # type: input/output
)
# 비용 추적
daily_cost_usd = Gauge(
'claude_daily_cost_usd',
'Estimated daily cost in USD'
)
