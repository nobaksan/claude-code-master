import time
from anthropic import Anthropic
from dataclasses import dataclass
from typing import List
@dataclass
class EffortExperiment:
    label: str
    effort: str | None # None = 모델 기본값(Opus 5.5 는 medium)
def run_experiment(problem: str, experiments: List[EffortExperiment]) -> dict:
    """여러 effort 레벨로 같은 문제를 풀게 하고 결과를 견준다"""
    client = Anthropic()
    results = {}
    for exp in experiments:
        start_time = time.time()
        kwargs = {
            "model": "claude-opus-5-5",
            "max_tokens": 16000,
            "thinking": {"type": "adaptive"},
            "messages": [{"role": "user", "content": problem}],
        }
        if exp.effort:
            kwargs["output_config"] = {"effort": exp.effort}
        response = client.messages.create(**kwargs)
        elapsed = time.time() - start_time
        text_response = next(
            (b.text for b in response.content if b.type == "text"), ""
        )
        results[exp.label] = {
            "response": text_response,
            "latency_sec": round(elapsed, 2),
            "input_tokens": response.usage.input_tokens,
            "output_tokens": response.usage.output_tokens,
        }
    return results

# 실험 실행 — 사고량 축은 effort 다
experiments = [
    EffortExperiment("default", None),
    EffortExperiment("low", "low"),
    EffortExperiment("medium", "medium"),
    EffortExperiment("high", "high"),
    EffortExperiment("xhigh", "xhigh"),
    EffortExperiment("max", "max"),
]

complex_problem = """
다음 시스템에서 데이터 일관성 문제를 해결하는 방법을 설계해준다:
- 마이크로서비스 3개가 각자 DB를 보유
- Saga 패턴 적용 중
- 네트워크 파티션 상황에서 eventual consistency 보장 필요
- 현재 간헐적으로 고아 레코드 발생
"""

results = run_experiment(complex_problem, experiments)
for label, data in results.items():
    print(f"\n[{label}]")
    print(f" 레이턴시: {data['latency_sec']}초")
    print(f" 출력 토큰: {data['output_tokens']}")
