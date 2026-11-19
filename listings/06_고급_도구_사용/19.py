# 자주 실패하는 도구에 예시 추가
error_logs = get_tool_error_logs()
problematic_tools = error_logs.group_by_tool().filter(error_rate > 0.1)
for tool in problematic_tools:
    tool["input_examples"] = generate_examples_from_successful_calls(tool)
