import time
import random
from anthropic import APIError, RateLimitError, APIStatusError
class RobustClaudeClient:
    def __init__(self, client, max_retries: int = 3):
        self.client = client
        self.max_retries = max_retries
    def create_message(self, **kwargs) -> dict:
        last_exception = None
        for attempt in range(self.max_retries):
            try:
                return self.client.messages.create(**kwargs)
            except RateLimitError as e:
                # Rate limit: 지수 백오프 + 지터
                # 1초, 2초, 4초... 단위로 대기 시간이 기하급수적으로 늘어나며,
                # random.uniform을 통해 재시도 충돌을 방지한다.
                wait_time = (2 ** attempt) + random.uniform(0, 1)
                print(f"Rate limited. Waiting {wait_time:.1f}s...")
                time.sleep(wait_time)
                last_exception = e
            except APIStatusError as e:
                if e.status_code >= 500:
                    # 서버 에러: 짧은 대기 후 재시도 (주로 일시적인 네트워크 순단)
                    time.sleep(1)
                    last_exception = e
                else:
                    # 클라이언트 에러(400, 401 등): 즉시 실패
                    raise
            except APIError as e:
                # 네트워크 에러: 재시도
                time.sleep(1)
                last_exception = e
        # 최대 재시도 횟수를 초과하면 최종 예외를 발생시킨다.
        raise last_exception
