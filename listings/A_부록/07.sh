{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",              // 정확히 Bash 도구
        "hooks": [/* ... */]
      },
      {
        "matcher": "Edit|Write",         // Edit 또는 Write
        "hooks": [/* ... */]
      },
      {
        "matcher": "mcp__.*",            // 모든 MCP 도구
        "hooks": [/* ... */]
      },
      {
        "matcher": "mcp__db__write.*",   // db 서버의 write 계열
        "hooks": [/* ... */]
      }
    ]
  }
}
