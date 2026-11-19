# 세션 안에서 — 현재 모델에 대해 저장하고 이 세션에도 적용
/autocompact 500k
/autocompact auto        # 모델에 맞춰 조정된 기본 창으로 되돌린다
# 이번 실행에만
claude --autocompact 300k
# 스크립트나 클라우드 환경에서 — 명령·플래그·설정보다 우선한다
export CLAUDE_CODE_AUTO_COMPACT_WINDOW=200000
