def analyze_thinking_quality(response) -> dict:
    # "사고 요약 분석" — display 가 summarized 일 때만 내용이 있다
    for block in response.content:
        if block.type != "thinking" or not block.thinking:
            continue
        thinking_text = block.thinking
        return {
            "summary_words": len(thinking_text.split()),
            "has_counterargument": "however" in thinking_text.lower() or "하지만" in thinking_text,
            "has_edge_cases": "edge case" in thinking_text.lower() or "예외" in thinking_text,
            "has_tradeoff": "tradeoff" in thinking_text.lower() or "트레이드오프" in thinking_text,
            "line_count": thinking_text.count('\n'),
        }
    return {"summary_words": 0, "line_count": 0}
