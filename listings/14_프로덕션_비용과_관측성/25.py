# 1M 토큰당 USD — 14.1절 단가표 기준 (2026-11-15 platform.claude.com 가격 문서)
PRICING = {
    "claude-fable-5-2": {"input": 8.0, "output": 40.0, "cache_read": 0.20},
    "claude-opus-5-5": {"input": 4.0, "output": 20.0, "cache_read": 0.20},
    "claude-sonnet-5-5": {"input": 2.0, "output": 10.0, "cache_read": 0.10},
    # Haiku 5.5는 프롬프트(캐시 포함 전체 입력)가 10만 토큰을 넘으면 비싼 단가가 붙는다
    "claude-haiku-5-5": {"input": 0.10, "output": 0.50, "cache_read": 0.01,
                         "long": {"threshold": 100_000, "input": 0.50,
                                  "output": 2.50, "cache_read": 0.05}},
}


def estimate_monthly_cost(
    daily_requests: int,
    avg_input_tokens: int,
    avg_output_tokens: int,
    model: str = "claude-sonnet-5-5",
    cached_input_tokens: int = 0,
    batch: bool = False,
) -> dict:
    """월간 예상 비용 계산 (캐시 쓰기 비용은 제외한 근사)"""
    rates = PRICING[model]
    prompt_tokens = avg_input_tokens + cached_input_tokens
    long = rates.get("long")
    if long and prompt_tokens > long["threshold"]:
        rates = long
    monthly_requests = daily_requests * 30
    discount = 0.5 if batch else 1.0  # Batch API는 입력·출력 50% 할인
    input_cost = monthly_requests * avg_input_tokens / 1_000_000 * rates["input"] * discount
    cache_cost = monthly_requests * cached_input_tokens / 1_000_000 * rates["cache_read"] * discount
    output_cost = monthly_requests * avg_output_tokens / 1_000_000 * rates["output"] * discount
    total = input_cost + cache_cost + output_cost
    return {
        "monthly_requests": monthly_requests,
        "input_cost_usd": round(input_cost, 2),
        "cache_read_cost_usd": round(cache_cost, 2),
        "output_cost_usd": round(output_cost, 2),
        "total_cost_usd": round(total, 2),
        "cost_per_request_usd": round(total / monthly_requests, 4),
    }


# 예시: 일 1만 요청, 평균 500 입력 / 1000 출력 토큰
cost = estimate_monthly_cost(10_000, 500, 1_000)
print(f"월간 예상 비용: ${cost['total_cost_usd']:,.2f}")
# 출력: 월간 예상 비용: $3,300.00
