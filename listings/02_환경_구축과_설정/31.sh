# 최근 디버그 로그부터
ls -t ~/.claude/debug/ | head
# 최근 오류만
grep -iE "error|fail" ~/.claude/debug/* | tail -30
