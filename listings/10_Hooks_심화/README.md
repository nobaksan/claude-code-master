# 10_Hooks_심화

본문에 실린 순서대로 코드 블록 21개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.txt](01.txt) | 훅 설정 계층과 핸들러 유형 | text | `~/.claude/settings.json        # 전역 설정 (개인 머신의 모든 프로젝트에 적용)` |
| [02.json](02.json) | Matcher 패턴을 활용한 정밀 타격 | json | `{` |
| [03.json](03.json) | `if` 필드: 권한 규칙 문법으로 한 번 더 거른다 | json | `{` |
| [04.sh](04.sh) | 실전 보안 가드레일 스크립팅 | bash | `#!/usr/bin/env bash` |
| [05.sh](05.sh) | 실전 보안 가드레일 스크립팅 | bash | `#!/usr/bin/env bash` |
| [06.json](06.json) | 훅이 고장 나도 막아야 할 때: `onFailure` | json | `{` |
| [07.json](07.json) | 거부(Deny)를 넘어선 입력 재정의(Override) 전략 | json | `{` |
| [08.json](08.json) | 파일 수정 감지 기반 자동 린팅 핸들러 | json | `{` |
| [09.sh](09.sh) | 실전 다국어 자동 포맷팅 스크립트 (.claude/hooks/auto-lint.sh) | bash | `#!/usr/bin/env bash` |
| [10.sh](10.sh) | Fail-Fast 컴파일 및 타입 검증 (.claude/hooks/typecheck.sh) | bash | `#!/usr/bin/env bash` |
| [11.sh](11.sh) | 테스트 통과 강제 스크립트 (.claude/hooks/require-tests.sh) | bash | `#!/usr/bin/env bash` |
| [12.sh](12.sh) | Git 변경 감지 기반 지능형 테스트 선별 실행 | bash | `#!/usr/bin/env bash` |
| [13.json](13.json) | TeammateIdle 결합을 통한 멀티에이전트 관리 | json | `{` |
| [14.json](14.json) | 실무 권장: 하이브리드 계층 방어 가이드라인 | json | `{` |
| [15.json](15.json) | Prompt 훅: LLM 한 번으로 정성적 위험 판단 | json | `{` |
| [16.json](16.json) | Agent 훅: 도구를 쓰는 검증 에이전트(실험) | json | `{` |
| [17.sh](17.sh) | 실전 고급 패턴: 환경 인식형 보안 분기 (.claude/hooks/env-aware.sh) | bash | `#!/usr/bin/env bash` |
| [18.sh](18.sh) | PostToolBatch: 병렬 호출 묶음이 끝난 뒤 한 번 | bash | `#!/usr/bin/env bash` |
| [19.sh](19.sh) | MessageDisplay: 화면에만 적용되는 출력 변환 | bash | `#!/usr/bin/env bash` |
| [20.sh](20.sh) | PreModelSwitch와 PostModelSwitch: 모델 전환 전후 | bash | `#!/usr/bin/env bash` |
| [21.txt](21.txt) | `/goal`: 완료 조건을 명령 하나로 | text | `/goal test/auth 의 모든 테스트가 통과하고 lint 단계가 깨끗하다. 다른 테스트 파일은 고치지` |
