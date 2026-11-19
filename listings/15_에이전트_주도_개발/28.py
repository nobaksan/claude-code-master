# fix_ci_agent.py — CI 실패를 고치는 에이전트를 코드로 정의한다
import asyncio

from claude_agent_sdk import (
    AgentDefinition,
    ClaudeAgentOptions,
    HookMatcher,
    ResultMessage,
    query,
)


async def protect_env(input_data, tool_use_id, context):
    """.env 파일 수정은 어떤 권한 모드에서도 막는다"""
    path = input_data["tool_input"].get("file_path", "")
    if path.endswith(".env"):
        return {
            "hookSpecificOutput": {
                "hookEventName": input_data["hook_event_name"],
                "permissionDecision": "deny",
                "permissionDecisionReason": ".env 파일은 수정하지 않는다",
            }
        }
    return {}


options = ClaudeAgentOptions(
    cwd="/work/repo",
    # Claude Code와 같은 시스템 프롬프트를 쓰려면 프리셋을 명시한다
    system_prompt={"type": "preset", "preset": "claude_code"},
    allowed_tools=["Read", "Grep", "Glob", "Edit", "Bash(npm test *)", "Agent"],
    permission_mode="dontAsk",  # 허용 목록 밖의 호출은 묻지 않고 거부
    max_turns=30,
    max_budget_usd=3.0,
    agents={
        "test-runner": AgentDefinition(
            description="테스트를 실행하고 실패 원인을 요약한다. 테스트 실행이 필요할 때 쓴다.",
            prompt="npm test를 실행하고 실패한 테스트와 원인을 짧게 보고한다.",
            tools=["Bash", "Read", "Grep"],
            model="sonnet",
        )
    },
    hooks={"PreToolUse": [HookMatcher(matcher="Write|Edit", hooks=[protect_env])]},
)


async def main():
    async for message in query(
        prompt="failure.log를 읽고 실패한 테스트를 고쳐라. 테스트는 test-runner 에이전트로 다시 돌려 확인한다.",
        options=options,
    ):
        if isinstance(message, ResultMessage):
            print(message.subtype, message.total_cost_usd)


if __name__ == "__main__":
    asyncio.run(main())
