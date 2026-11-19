class ContextCompressor:
    def compress(self, contexts: list[str]) -> str:
        # 중복 제거
        unique_contexts = list(set(contexts))
        # 중요도 점수 계산
        scored = [(c, self.score_relevance(c)) for c in unique_contexts]
        scored.sort(key=lambda x: x[1], reverse=True)
        # 토큰 예산 내에서 선택
        compressed = []
        total_tokens = 0
        for context, score in scored:
            tokens = self.count_tokens(context)
            if total_tokens + tokens <= self.token_budget:
                compressed.append(context)
                total_tokens += tokens
        return "\n\n".join(compressed)
