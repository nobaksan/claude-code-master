class ModelFallbackChain:
    """모델 폴백 체인: Sonnet → Haiku → 로컬 LLM"""
    MODELS = [
        ("claude-sonnet-5-5", "primary"),
        ("claude-haiku-5-5", "fallback"),
        ("local-llama", "emergency"),
    ]
    def generate(self, prompt: str) -> str:
        for model, tier in self.MODELS:
            try:
                if model.startswith("local"):
                    return self._call_local_model(prompt)
                return self._call_claude(model, prompt)
            except Exception as e:
                print(f"[{tier}] {model} failed: {e}")
                continue
        # 모든 모델 실패 시 정적 응답
        return self._static_fallback(prompt)
    def _static_fallback(self, prompt: str) -> str:
        """최후의 수단: 사전 정의된 응답"""
        return "죄송합니다. 현재 서비스가 일시적으로 불안정합니다. 잠시 후 다시 시도해 주세요."
