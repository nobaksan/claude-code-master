class SourceSelectionAgent:
    def select_sources(self, query: str) -> list[str]:
        """쿼리에 적합한 데이터 소스 선택"""
        sources = {
            "vector_db": "내부 문서, 과거 데이터",
            "web_search": "최신 정보, 뉴스",
            "api_tools": "실시간 데이터, 계산",
            "knowledge_graph": "관계, 엔티티 추론"
        }
        # LLM이 쿼리 분석 후 적합한 소스 선택
        selected = self.llm.select(query, sources)
        return selected
