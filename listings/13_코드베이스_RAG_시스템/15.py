class ContextIsolator:
    def isolate_for_subtask(self, main_context: dict, subtask: str) -> dict:
        """서브태스크에 필요한 컨텍스트만 추출"""
        relevant_keys = self.identify_relevant_keys(subtask, main_context)
        return {k: main_context[k] for k in relevant_keys}
