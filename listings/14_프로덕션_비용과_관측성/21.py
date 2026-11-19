from fastapi import FastAPI, HTTPException
from anthropic import Anthropic
import asyncio
app = FastAPI()
client = Anthropic()
@app.post("/analyze")
async def analyze_code(code: str):
    """코드 분석 엔드포인트"""
    try:
        # 타임아웃 설정 필수
        response = await asyncio.wait_for(
            asyncio.get_event_loop().run_in_executor(
                None,
                lambda: client.messages.create(
                    model="claude-sonnet-5-5",
                    max_tokens=1024,
                    messages=[{"role": "user", "content": f"코드 분석:\n{code}"}]
                )
            ),
            timeout=25.0 # 25초 타임아웃
        )
        return {"analysis": response.content[0].text}
    except asyncio.TimeoutError:
        raise HTTPException(status_code=504, detail="분석 시간 초과")
