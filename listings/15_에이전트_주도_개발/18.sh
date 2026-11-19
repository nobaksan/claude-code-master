# .github/workflows/auto-fix.yml
name: Auto-fix CI Failures
# 다른 CI 워크플로가 끝났을 때 트리거된다.
on:
workflow_run:
workflows: ["CI"]
types: [completed]
jobs:
auto-fix:
# 앞선 CI가 실패했을 때만 이 Job이 실행된다.
if: ${{ github.event.workflow_run.conclusion == 'failure' }}
runs-on: ubuntu-latest
steps:
- uses: actions/checkout@v6
with:
fetch-depth: 0 # 전체 히스토리를 가져와야 커밋이 가능하다.
- name: Analyze and Fix with Claude Code
env:
ANTHROPIC_API_KEY: ${{ secrets.ANTHROPIC_API_KEY }}
GH_TOKEN: ${{ secrets.GITHUB_TOKEN }}
run: |
# 1. 실패 로그를 파일로 추출
gh run view ${{ github.event.workflow_run.id }} --log-failed > failure.log
# 2. Claude Code를 '비대화형 모드(-p)'로 실행하여 자동 수정 지시
# --allowedTools 옵션으로 권한을 엄격히 통제하고, --max-turns로 무한 루프(비용 폭탄)를 방지한다.
# npx로 받는 npm 패키지는 Node.js 22 이상이 필요하다.
npx @anthropic-ai/claude-code -p "failure.log를 분석하고 수정 가능하면 파일을 고쳐줘" \
--allowedTools "Edit,Read,Bash,Grep" \
--max-turns 10 \
--max-budget-usd 2
# 3. 변경사항이 생겼다면 자동으로 커밋 및 푸시
if [ -n "$(git status --porcelain)" ]; then
git config user.name "Claude Auto-Fix Bot"
git config user.email "bot@example.com"
git add -A
git commit -m "fix(ci): auto-fix CI failures [skip ci]"
git push
fi
