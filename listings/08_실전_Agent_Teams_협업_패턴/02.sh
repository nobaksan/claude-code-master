TODO 추적 CLI 도구를 설계하기 위한 Agent Team을 구성해줘. 이 팀은 세 명의 전문 에이전트로 구성되며, 각 에이전트는 독립적으로 분석한 후 최종적으로 협의를 거쳐 합의된 설계안을 작성해야 한다.
시나리오:
개발자들이 코드베이스 전반의 TODO 주석을 추적하는 데 도움이 되는 CLI 도구를 설계해야 한다.
Teammate 1 - UX Designer:
- 주요 목표: 개발자 경험(Developer Experience, DX)에 중점을 두고 분석한다.
- 분석 내용:
- CLI 인터페이스가 사용자에게 어떤 느낌을 주어야 하는가?
- 어떤 명령어가 가장 직관적이고 사용하기 편리한가?
- 터미널 출력(결과)이 개발자가 쉽게 이해하고 조치할 수 있도록 어떻게 구성되어야 하는가?
- 산출물: /docs/design-notes/ux-analysis.md
Teammate 2 - Technical Architect:
- 주요 목표: 구현 아키텍처와 성능에 중점을 두고 분석한다.
- 분석 내용:
- 대규모 코드베이스를 효율적으로 파싱(Parsing)하는 전략은 무엇인가?
- 어떤 데이터 구조가 TODO 추적 및 관리에 가장 최적화되어 있는가?
- 설계에 따른 기술적 부채(Technical Debt)는 무엇이며 어떻게 관리해야 하는가?
- 산출물: /docs/design-notes/architecture.md
Teammate 3 - Devil's Advocate:
- 주요 목표: 모든 가설과 전제에 의문을 제기하고 비판적인 관점을 제시한다.
- 분석 내용:
- 설계 과정에서 발생할 수 있는 잠재적인 문제점(What could go wrong?)은 무엇인가?
- 이미 존재하는 TODO 추적 도구(예: Todo-tree 등)와 비교했을 때, 이 도구가 더 나은 점은 무엇이며 차별화 요소가 있는가?
- 각 팀원의 초기 설계 가정에 대해 비판적 검토를 수행하고 논리적 오류를 지적한다.
- 산출물: /docs/design-notes/concerns.md
최종 협의 및 보고:
- 모든 Teammate가 개별 분석을 완료한 후, 팀 메일박스 등을 통해 서로의 발견 사항을 공유하고 토론하여 의견을 조율한다.
- 토론을 거쳐 도출된 최종 합의된 설계안을 하나의 문서로 /docs/design-notes/synthesis.md에 작성해줘.
