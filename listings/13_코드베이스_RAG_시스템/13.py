class ContextReader:
    def read_from_sources(self, query: str) -> dict:
        context = {}
        # 벡터 DB에서 유사 문서 검색
        context["documents"] = self.vector_db.search(query)
        # 메모리에서 관련 정보 조회
        context["memory"] = self.memory.recall(query)
        # 도구 실행 결과
        context["tool_results"] = self.execute_tools(query)
        return context
