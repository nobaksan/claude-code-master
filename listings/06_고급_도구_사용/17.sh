# 로그에서 도구 사용 빈도 분석
usage_stats = analyze_tool_usage_logs()
# 상위 3-5개는 항상 로드, 나머지는 defer_loading
core_tools = usage_stats.top(5)
searchable_tools = usage_stats.rest()
