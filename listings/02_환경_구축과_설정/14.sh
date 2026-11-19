# 현재 allow 목록 확인
jq '.permissions.allow' .claude/settings.json
# 현재 deny 목록 확인
jq '.permissions.deny' .claude/settings.json
# 최근 세션에서 어떤 도구를 몇 번 썼는지 (세션 기록은 ~/.claude/projects/ 아래 jsonl)
grep -ho '"name":"[A-Za-z]*"' ~/.claude/projects/*/*.jsonl | sort | uniq -c | sort -rn | head
