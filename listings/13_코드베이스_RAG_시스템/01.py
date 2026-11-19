# 접근법 선택 의사결정 함수 예시
def choose_approach(
    external_knowledge_needed: bool,
    behavior_change_needed: bool,
    budget: str, # "low", "medium", "high"
    update_frequency: str # "static", "daily", "realtime"
) -> str:
    if not external_knowledge_needed and not behavior_change_needed:
        return "prompting"
    if external_knowledge_needed and not behavior_change_needed:
        return "rag"
    if behavior_change_needed and not external_knowledge_needed:
        return "fine_tuning"
    if budget == "high" and update_frequency != "realtime":
        return "rag_plus_fine_tuning"
    # 예산 제약 시 RAG 우선
    return "rag"
