class QueryRewriteAgent:
    def rewrite(self, query: str) -> list[str]:
        """하나의 쿼리를 여러 검색 쿼리로 확장"""
        prompt = f"""
        다음 질문을 검색에 최적화된 3개의 쿼리로 변환한다:
        원본: {query}
        출력 형식:
        1. [첫 번째 쿼리]
        2. [두 번째 쿼리]
        3. [세 번째 쿼리]
        """
        return self.llm.generate(prompt)
