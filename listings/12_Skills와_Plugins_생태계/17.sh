my-awesome-plugin/
├── .claude-plugin/
│   └── plugin.json          # 플러그인 메타데이터
├── skills/                  # 스킬 = 슬래시 명령어 (12.1절 구조 그대로)
│   ├── deploy/SKILL.md      # /my-awesome-plugin:deploy
│   └── db-migration/SKILL.md
├── commands/                # 예전 형식의 명령어 파일 (계속 동작)
│   └── test.md
├── agents/                  # 서브에이전트
│   └── security-reviewer.md
├── hooks/
│   └── hooks.json           # 라이프사이클 훅 (settings.json 의 hooks 와 같은 형식)
├── .mcp.json                # MCP 서버 설정
└── README.md
