class ConversationManager:
    def __init__(self, max_turns: int = 10):
        self.max_turns = max_turns
        self.history = []
    def add_turn(self, user_msg: str, assistant_msg: str):
        self.history.append({"user": user_msg, "assistant": assistant_msg})
        # 히스토리가 너무 길어지면 앞부분을 요약
        if len(self.history) > self.max_turns:
            summary = self._summarize_old_turns()
            self.history = [{"summary": summary}] + self.history[-5:]
    def _summarize_old_turns(self) -> str:
        old_turns = self.history[:-5]
        # 별도 API 호출로 요약 생성 (저렴한 모델 사용)
        return summarize_with_haiku(old_turns)
