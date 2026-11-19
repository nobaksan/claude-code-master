response = client.messages.create(
    model="claude-opus-5-5",
    max_tokens=4096,
    speed="fast",
    messages=[{"role": "user", "content": "이 모듈을 의존성 주입 방식으로 리팩터링해줘"}],
)
print(response.usage.speed)  # "fast" 또는 "standard"
