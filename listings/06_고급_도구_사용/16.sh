# 현재 도구 현황 파악
total_tools = len(all_tools)
total_tokens = sum(estimate_tokens(tool) for tool in all_tools)
print(f"도구 수: {total_tools}, 예상 토큰: {total_tokens}")
# 10개 이상, 10K 토큰 이상이면 Tool Search Tool 도입 권장
