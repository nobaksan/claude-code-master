# 기본 대화형 실행
claude
# 단일 프롬프트 모드 - 자동화의 핵심
claude -p "모든 Python 파일에서 print를 logging으로 교체해줘"
# 파이프라인과 연동 - Unix 철학의 실현
cat error.log | claude -p "이 에러 분석하고 해결책 제시해줘"
# 병렬 대규모 작업 - 수십 개 디렉터리를 동시에 처리
find . -type d -name "src" | parallel 'cd {} && claude -p "이 디렉터리의 코드를 문서화해줘"'
