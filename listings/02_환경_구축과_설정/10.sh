# 프로젝트 구조
my-project/
├── .claude/
│ ├── settings.json # Git 추적 - 팀 공유
│ └── settings.local.json # Git 제외 - 개인용
├── .gitignore
└── ...

# .gitignore에 추가 (Claude Code가 만든 파일은 자동으로 제외되지만 손으로 만든 경우를 대비)
.claude/settings.local.json
