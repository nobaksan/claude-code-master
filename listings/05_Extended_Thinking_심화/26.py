def score_response_quality(response: str) -> float:
    """0.0 ~ 1.0 품질 점수"""
    score = 0.0
    max_score = 10.0
    # 구체적인 기술 스택 언급 (+2점)
    tech_keywords = ["kafka", "redis", "postgresql", "docker", "kubernetes",
                     "saga", "outbox", "idempotency", "두단계 커밋"]
    mentions = sum(1 for k in tech_keywords if k.lower() in response.lower())
    score += min(2.0, mentions * 0.5)
    # 코드 예시 포함 (+2점)
    if "```" in response:
        score += 2.0
    # 트레이드오프 언급 (+2점)
    tradeoff_words = ["장점", "단점", "trade-off", "그러나", "반면"]
    if any(w in response for w in tradeoff_words):
        score += 2.0
    # 엣지 케이스 언급 (+2점)
    edge_words = ["예외", "edge case", "장애", "실패", "만약"]
    if sum(1 for w in edge_words if w in response) >= 2:
        score += 2.0
    # 단계별 접근 (+2점)
    step_patterns = ["1.", "Step", "단계", "먼저", "다음으로"]
    if any(p in response for p in step_patterns):
        score += 2.0
    return score / max_score
