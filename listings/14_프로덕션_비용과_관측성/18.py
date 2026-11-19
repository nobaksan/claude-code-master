def sanitize_user_input(user_input: str) -> str:
    """위험한 프롬프트 패턴 필터링"""
    dangerous_patterns = [
        "ignore previous instructions",
        "ignore all instructions",
        "disregard your instructions",
        "new system prompt",
        "you are now",
        "pretend you are",
    ]
    lower_input = user_input.lower()
    for pattern in dangerous_patterns:
        if pattern in lower_input:
            raise ValueError("Potential prompt injection detected")
    return user_input
def build_safe_request(system: str, user_input: str) -> dict:
    """시스템 지시와 사용자 입력을 분리한다. Anthropic API 는 system 이 별도 인자다."""
    sanitized = sanitize_user_input(user_input)
    return {
        "system": system,
        "messages": [{"role": "user", "content": f"<user_input>{sanitized}</user_input>"}],
    }
