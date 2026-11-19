response = client.beta.messages.create(
    model="claude-opus-5-5",
    max_tokens=16000,
    betas=["server-side-fallback-2026-07-01"],
    fallbacks="default",
    messages=[...],
)

if response.stop_reason == "refusal":
    category = response.stop_details.category
    # 사유를 기록하고 사용자에게 알린다
