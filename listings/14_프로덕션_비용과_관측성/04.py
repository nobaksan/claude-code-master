# 시스템 프롬프트에서 명시적으로 행동 규칙을 제한
system_prompt = """
응답 규칙:
- 인사말, 서론, 결론 등 대화형 필러(Filler)를 절대 사용하지 않는다.
- 코드 설명은 3문장 이내로 제한한다.
- 코드 블록은 수정된 핵심 부분만 작성한다 (전체 파일 재작성 금지).
- 불필요한 부연 설명 대신 "자세한 설명은 생략합니다" 패턴을 사용한다.
- 출력 형식은 오직 유효한 JSON 포맷만 사용해야 한다.
"""
# max_tokens 파라미터 활용
response = client.messages.create(
    model="claude-sonnet-5-5",  # 또는 claude-haiku-5-5
    max_tokens=1024,  # 응답 길이 하드 리밋 (안전장치 역할)
    system=system_prompt,
    messages=[...],
)
