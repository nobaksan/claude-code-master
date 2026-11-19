# 작업 제출
@app.post("/tasks")
async def submit_task(task: TaskRequest):
    task_id = str(uuid.uuid4())
    # Redis 큐에 작업 추가
    await redis.lpush("claude_tasks", json.dumps({
        "id": task_id,
        "type": task.type,
        "payload": task.payload,
        "created_at": datetime.utcnow().isoformat()
    }))
    return {"task_id": task_id, "status": "queued"}
# 상태 확인
@app.get("/tasks/{task_id}")
async def get_task_status(task_id: str):
    result = await redis.get(f"task_result:{task_id}")
    if not result:
        return {"status": "processing"}
    return {"status": "completed", "result": json.loads(result)}
# 워커 프로세스
async def worker():
    while True:
        _, task_json = await redis.brpop("claude_tasks")
        task = json.loads(task_json)
        try:
            result = await process_with_claude(task)
            await redis.setex(
                f"task_result:{task['id']}",
                3600, # 1시간 TTL
                json.dumps(result)
            )
        except Exception as e:
            await redis.setex(
                f"task_result:{task['id']}",
                3600,
                json.dumps({"error": str(e)})
            )
