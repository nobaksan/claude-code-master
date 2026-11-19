# 방법 1: 요청 최상위 자동 캐싱 (권장 출발점)
response = client.messages.create(
    model="claude-sonnet-5-5",
    max_tokens=1024,
    cache_control={"type": "ephemeral"},  # 기본 5분 유지
    system=SYSTEM_PROMPT,  # 방대한 가이드라인, 매뉴얼 등 고정된 시스템 프롬프트
    messages=[...],
)

# 방법 2: 블록 단위로 지정, 1시간 캐시
response = client.messages.create(
    model="claude-sonnet-5-5",
    max_tokens=1024,
    system=[
        {
            "type": "text",
            "text": SYSTEM_PROMPT,
            "cache_control": {"type": "ephemeral", "ttl": "1h"},  # 쓰기 2배, 1시간 유지
        }
    ],
    messages=[...],
)
