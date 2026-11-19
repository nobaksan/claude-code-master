# 개념 스케치 — 실제 플러그인 매니페스트 형식은 12장
name: devops-toolkit
version: 1.0.0
description: 최적화된 도구 사용 기반의 DevOps 워크플로 자동화
mcp_servers:
- name: github
command: npx -y @modelcontextprotocol/server-github
tools:
- name: createPullRequest
defer_loading: false # 빈번한 작업이므로 상시 노출
input_examples:
- repo: "acme/api", title: "feat: Auth logic", base: "main", head: "dev"
- name: listIssues
defer_loading: true # 검색 시에만 로드 (비용 절감)
allowed_callers: ["code_execution_20260120"] # PTC를 통한 대량 분석 허용
- name: sentry
command: npx -y @sentry/mcp-server
tools:
- name: getIssues
defer_loading: true
allowed_callers: ["code_execution_20260120"] # 수천 개 에러 로그의 병렬 처리 위함
# 도구를 조합한 고급 워크플로 정의
slash_commands:
- name: incident
description: 장애 대응 프로토콜 시작
prompt: |
1. #incident-{{ timestamp }} 채널 생성 (Slack)
2. 최근 1시간 Sentry 에러 수집 및 분석 (PTC 활용)
3. Grafana 지표 확인 후 요약 리포트 작성
4. 심각도 'High' 이상일 경우 온콜 담당자 호출
