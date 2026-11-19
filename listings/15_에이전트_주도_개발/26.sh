# 현재 저장소를 대상으로 클라우드 세션을 새로 만든다 (--remote는 폐기된 별칭)
claude --cloud "src/auth/login.ts의 인증 버그를 고쳐줘"
# 세션마다 따로 돌므로 여러 개를 동시에 띄울 수 있다
claude --cloud "auth.spec.ts의 불안정한 테스트를 고쳐줘"
claude --cloud "API 문서를 갱신해줘"
# 돌고 있는 클라우드 세션에 후속 지시를 넣고 바로 빠져나온다
claude -p "테스트도 추가해줘" --cloud <세션 ID>
