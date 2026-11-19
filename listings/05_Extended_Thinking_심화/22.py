import anthropic
client = anthropic.Anthropic()
# 사고 내용을 함께 받으려면 display 를 지정한다. 기본값은 omitted 라 thinking 텍스트가 비어 온다.
response = client.messages.create(
    model="claude-opus-5-5",
    max_tokens=16000,
    thinking={"type": "adaptive", "display": "summarized"},
    output_config={"effort": "xhigh"},
    messages=[{
        "role": "user",
        "content": "복잡한 분산 시스템 아키텍처를 설계해줘..."
    }]
)
# thinking 블록과 응답 분리
for block in response.content:
    if block.type == "thinking":
        print(f"사고 요약 ({len(block.thinking)}자):")
        print(block.thinking[:500] + "...")
    elif block.type == "text":
        print(f"\n최종 응답:\n{block.text}")
