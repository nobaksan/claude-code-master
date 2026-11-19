# 11_CI_CD_통합과_자동화

본문에 실린 순서대로 코드 블록 20개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.sh](01.sh) | GitHub 연동 커맨드 | bash | `# GitHub CLI로 PR 상태 확인 (Claude Code가 내부적으로 사용)` |
| [02.sh](02.sh) | 실전 예시: 실패 유형별 자동 수정 가능성 리포트 | bash | `# Claude Code에게 PR 모니터링과 자동 수정 요청` |
| [03.sh](03.sh) | 실패 감지 및 분석 프로세스 (Step-by-Step) | bash | `gh pr checks 234 --watch --fail-fast` |
| [04.sh](04.sh) | 실패 감지 및 분석 프로세스 (Step-by-Step) | bash | `gh run view <run-id> --log-failed` |
| [05.sh](05.sh) | 실패 감지 및 분석 프로세스 (Step-by-Step) | bash | `"이 CI 로그를 분석해서 실패 원인을 파악하고 수정해줘: $(gh run view <run-id> --lo` |
| [06.sh](06.sh) | 실전 환경에서의 Auto-merge 설정 | bash | `프롬프트 예시: "이 기능을 PR로 만들어줘. CI 전체 통과하면 자동으로 squash merge 해주고, ` |
| [07.yml](07.yml) | 무분별한 Auto-merge를 방지하기 위한 설정 | yaml | `# .github/branch-protection-rules.yml (참고용 표기. 실제 설정은 GitHub` |
| [08.yml](08.yml) | 공식 통합 경로: claude-code-action@v1 | yaml | `# .github/workflows/claude.yml` |
| [09.yml](09.yml) | Claude Code CI/CD 자동화 워크플로 | yaml | `# .github/workflows/claude-review.yml` |
| [10.yml](10.yml) | Claude Code CI/CD 자동화 워크플로 | yaml | `# .github/workflows/claude-autofix.yml` |
| [11.yml](11.yml) | Claude Code CI/CD 자동화 워크플로 | yaml | `# .github/workflows/claude-maintenance.yml` |
| [12.py](12.py) | Slack Bot 설정 (Python Bolt SDK 예시) | python | `# slack_bot.py (예시)` |
| [13.yml](13.yml) | Slack Bot 설정 (Python Bolt SDK 예시) | yaml | `# .github/workflows/slack-trigger.yml` |
| [14.yml](14.yml) | Jira 이슈 기반 자동 PR 생성: 티켓이 코드가 되기까지 | yaml | `# .github/workflows/jira-to-pr.yml` |
| [15.yml](15.yml) | 실전 팁: 효과적인 CI/CD 자동화를 위한 권장 사항 | yaml | `# 자동 수정 잡(claude-autofix.yml)의 steps: 아래 맨 끝에 붙이는 단계` |
| [16.yml](16.yml) | 실전 팁: 효과적인 CI/CD 자동화를 위한 권장 사항 | yaml | `# .github/workflows/claude-conditional-review.yml` |
| [17.yml](17.yml) | 실전 팁: 효과적인 CI/CD 자동화를 위한 권장 사항 | yaml | `# .github/workflows/secure-automerge.yml` |
| [18.yml](18.yml) | 스테이징 → 프로덕션: 지능형 퀄리티 게이트 | yaml | `# .github/workflows/deploy-pipeline.yml` |
| [19.yml](19.yml) | 롤백 자동화: 자율적 장애 대응 | yaml | `# deploy-pipeline.yml 의 jobs: 아래, deploy-production 다음에 이어 붙` |
| [20.yml](20.yml) | GitLab CI/CD | yaml | `stages:` |
