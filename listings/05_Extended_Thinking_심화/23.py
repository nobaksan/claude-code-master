prompt = "이 결제 모듈의 동시성 문제를 분석해줘"
with client.messages.stream(
    model="claude-opus-5-5",
    max_tokens=64000,
    thinking={"type": "adaptive", "display": "summarized"},
    output_config={"effort": "xhigh"},
    messages=[{"role": "user", "content": prompt}]
) as stream:
    current_block_type = None
    for event in stream:
        if event.type == 'content_block_start':
            current_block_type = event.content_block.type
            if current_block_type == 'thinking':
                print(" 사고 중...", end='', flush=True)
        elif event.type == 'content_block_delta':
            if current_block_type == 'thinking':
                print('.', end='', flush=True) # 진행 표시
            elif current_block_type == 'text':
                print(event.delta.text, end='', flush=True)
