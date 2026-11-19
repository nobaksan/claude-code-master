# 디버그 모드로 실행
claude --debug
# API 호출과 훅 관련 로그만
claude --debug=api,hooks
# 특정 범주 제외
claude --debug='!hooks,!mcp'
# 로그를 파일로
claude --debug-file ./claude-debug.log
