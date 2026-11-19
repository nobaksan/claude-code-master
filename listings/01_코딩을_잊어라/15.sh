# 기능마다 worktree와 세션을 한 번에
claude -w user-dashboard
claude -w api-optimization --tmux
# 터미널을 붙잡지 않고 백그라운드로 돌린다
claude --bg "이슈 #234를 구현하고 테스트까지 통과시켜줘"
# 돌고 있는 세션 목록과 붙기
claude agents
claude attach <id>
