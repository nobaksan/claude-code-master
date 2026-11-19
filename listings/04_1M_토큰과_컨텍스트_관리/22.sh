# 특정 세션으로 돌아가기 (ID 또는 이름)
$ claude --resume abc123def
$ claude -r payment-refactor
# 원본은 그대로 두고 새 세션으로 갈라져 나온다
$ claude --resume abc123def --fork-session
# PR에 연결된 세션을 이어 간다 (PR 번호나 URL)
$ claude --from-pr 482
