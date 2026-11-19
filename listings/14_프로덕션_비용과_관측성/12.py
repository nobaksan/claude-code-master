import json
import logging
from datetime import datetime
class StructuredLogger:
    def __init__(self, service_name: str):
        self.service = service_name
        self.logger = logging.getLogger(service_name)
    def log_api_call(self, model: str, input_tokens: int,
                     output_tokens: int, latency_ms: float,
                     success: bool, error: str = None):
        log_entry = {
            "timestamp": datetime.utcnow().isoformat(),
            "service": self.service,
            "event": "api_call",
            "model": model,
            "input_tokens": input_tokens,
            "output_tokens": output_tokens,
            "latency_ms": latency_ms,
            "success": success,
            "error": error,
            "cost_usd": self._estimate_cost(model, input_tokens, output_tokens)
        }
        if success:
            self.logger.info(json.dumps(log_entry))
        else:
            self.logger.error(json.dumps(log_entry))
    def _estimate_cost(self, model: str, input_t: int, output_t: int) -> float:
        # 1K 토큰당 USD — 14.1절 단가표 기준 (Haiku 5.5는 10만 토큰 이하 구간)
        rates = {
            "claude-opus-5-5": (0.004, 0.020),  # input, output per 1K
            "claude-sonnet-5-5": (0.002, 0.010),
            "claude-haiku-5-5": (0.0001, 0.0005),
        }
        input_rate, output_rate = rates.get(model, (0.002, 0.010))
        return (input_t / 1000 * input_rate) + (output_t / 1000 * output_rate)
