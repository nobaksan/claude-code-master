import anthropic
import base64

client = anthropic.Anthropic()

def inspect_product(image_path: str) -> dict:
    """Claude Opus 5.5를 이용한 지능형 품질 검사"""
    with open(image_path, "rb") as f:
        image_data = base64.b64encode(f.read()).decode("utf-8")

    # Claude에 시각 정보 분석 요청
    response = client.messages.create(
        model="claude-opus-5-5",  # 현행 기본 모델(비전 입력 지원)
        max_tokens=1024,
        messages=[{
            "role": "user",
            "content": [
                {"type": "image", "source": {"type": "base64",
                 "media_type": "image/jpeg", "data": image_data}},
                {"type": "text", "text": """부품 불량 검사 수행:
                1. 표면 결함(스크래치, 균열) 식별
                2. 도장 상태 및 치수 이상 판단
                3. 합격 여부를 JSON 형식으로 리턴한다."""}
            ]
        }]
    )
    # 이후 JSON 파싱 로직 수행...
