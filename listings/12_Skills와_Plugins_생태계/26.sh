---
name: github-workflow
description: >
Pull Request 생성부터 CI 모니터링, 코드 리뷰까지 GitHub 워크플로를 자동화하는 스킬.
사용자가 PR 만들어, CI 확인해, 리뷰해 줘라고 말할 때 쓴다.
---
# GitHub Workflow Automation
필요한 도구: gh (GitHub CLI)
## 사용법
- PR 생성 — 현재 브랜치로 PR 생성
- PR 리뷰 [번호] — PR 코드 리뷰
- CI 확인 [PR번호] — CI 상태 확인 및 실패 분석
## 핵심 스크립트
scripts/create_pr.sh: 브랜치 분석 → PR 제목/본문 생성 → gh pr create
scripts/review_pr.sh: diff 분석 → 품질 체크 → 리뷰 코멘트
scripts/check_ci.sh: gh run view → 실패 로그 추출 → 원인 분석
