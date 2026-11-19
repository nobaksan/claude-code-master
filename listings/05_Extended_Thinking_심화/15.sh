# Step 1: 기본 effort 로 시도
claude "이 인증 모듈의 버그를 수정해줘"
# Step 2: 안 되면 세션의 effort 를 올린다
claude --effort high "왜 세션이 유지되지 않는 걸까? 가능한 원인을 모두 검토해줘"
# Step 3: 여전히 안 되면 그 턴만 ultrathink (터미널에서는 그 턴이 xhigh 로 오른다)
claude "이 세션이 유지되지 않을 수 있는 모든 이유를 분석해줘. ultrathink"
# Step 4: 최후의 수단 — max, 그리고 확인한 것을 전부 적는다
claude --effort max "쿠키, 스토리지, 타이밍, 레이스 컨디션까지 모든 각도에서 이 세션 버그를 분석해줘. 지금까지 확인한 것: [목록]"
