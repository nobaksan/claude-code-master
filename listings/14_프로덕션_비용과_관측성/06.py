with client.beta.messages.stream(
    model="claude-opus-5-5",
    max_tokens=128000,
    output_config={
        "effort": "high",
        "task_budget": {"type": "tokens", "total": 64000},
    },
    betas=["task-budgets-2026-03-13"],
    messages=[...],
    tools=[...],
) as stream:
    response = stream.get_final_message()
