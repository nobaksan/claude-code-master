class ContextWriter:
    def __init__(self, long_term_memory, short_term_memory):
        self.long_term = long_term_memory # 세션 간 유지
        self.short_term = short_term_memory # 세션 내 유지
    def write_to_memory(self, key: str, value: str, memory_type: str):
        if memory_type == "long_term":
            # 사용자 선호, 프로젝트 컨텍스트 등
            self.long_term.store(key, value)
        else:
            # 현재 대화 컨텍스트
            self.short_term.store(key, value)
