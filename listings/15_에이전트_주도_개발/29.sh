# worktree 생성과 tmux 세션 생성을 한 번에
claude -w work-234 --tmux
claude -w work-235 --tmux
# 직접 관리하던 예전 방식 (지금도 동작한다)
tmux new-session -d -s main "cd ../project && claude"
# tmux 단축키(Ctrl+B, S)를 통해 세션 간 컨텍스트 스위칭을 1초 만에 수행한다.
