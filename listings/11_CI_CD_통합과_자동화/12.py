# slack_bot.py (예시)
@app.command("/claude")
def handle_claude_command(ack, command, client):
    ack()
    # GitHub repository_dispatch 이벤트 트리거
    requests.post(
        "https://api.github.com/repos/OWNER/REPO/dispatches",
        headers={"Authorization": f"token {GITHUB_TOKEN}"},
        json={
            "event_type": "slack-command",
            "client_payload": {
                "command": command["text"],
                "channel": command["channel_id"],
                "user": command["user_id"]
            }
        }
    )
    client.chat_postMessage(
        channel=command["channel_id"],
        text="Claude Code가 작업을 시작했습니다..."
    )
