from fastapi.responses import StreamingResponse
@app.post("/chat/stream")
async def chat_stream(message: str):
    async def generate():
        with client.messages.stream(
            model="claude-sonnet-5-5",
            max_tokens=2048,
            messages=[{"role": "user", "content": message}]
        ) as stream:
            for text in stream.text_stream:
                # Server-Sent Events 형식
                yield f"data: {json.dumps({'text': text})}\n\n"
        yield "data: [DONE]\n\n"
    return StreamingResponse(
        generate(),
        media_type="text/event-stream",
        headers={
            "Cache-Control": "no-cache",
            "X-Accel-Buffering": "no" # Nginx 버퍼링 비활성화
        }
    )
