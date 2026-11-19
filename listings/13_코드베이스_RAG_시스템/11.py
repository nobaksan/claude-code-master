class AnswerValidatorAgent:
    def validate(self, query: str, context: str, answer: str) -> bool:
        prompt = f"""
        다음 답변이 질문에 적절하고 컨텍스트에 근거하는지 평가한다.
        질문: {query}
        컨텍스트: {context}
        답변: {answer}
        평가 기준:
        1. 답변이 질문에 직접 답하는가?
        2. 답변이 컨텍스트의 정보에 근거하는가?
        3. 환각(hallucination)이 없는가?
        결과: [VALID/INVALID]
        이유: [설명]
        """
        return "VALID" in self.llm.generate(prompt)
