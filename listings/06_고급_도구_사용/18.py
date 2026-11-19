# 대량 데이터를 다루는 도구 식별
for tool in all_tools:
    if returns_large_data(tool):
        tool["allowed_callers"] = ["code_execution_20260120"]
