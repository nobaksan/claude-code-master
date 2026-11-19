# 특정 에이전트 세션의 표준 출력을 로그 파일로 실시간 복제
tmux pipe-pane -t "developer" "cat >> .logs/developer.log"
