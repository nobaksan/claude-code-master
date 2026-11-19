# 나쁜 예: 전체 코드베이스를 컨텍스트에 포함
context = load_entire_codebase()

# 좋은 예: 관련 파일만 선택적 로딩
def get_relevant_context(task: str) -> str:
    # 태스크 유형에 따라 필요한 파일만 로드
    if "database" in task.lower():
        return load_files(["models/", "migrations/"])
    elif "api" in task.lower():
        return load_files(["routes/", "schemas/"])
    else:
        return load_files(["src/main.py"]) # 최소한의 진입점만
