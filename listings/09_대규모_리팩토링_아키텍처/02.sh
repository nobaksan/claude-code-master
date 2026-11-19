# 9개 전문 에이전트를 위한 독립 tmux 세션 초기화
tmux new-session -d -s orchestrator
tmux new-session -d -s requirement
tmux new-session -d -s ux
tmux new-session -d -s architect
tmux new-session -d -s planner
tmux new-session -d -s tester
tmux new-session -d -s developer
tmux new-session -d -s reviewer
tmux new-session -d -s documenter
