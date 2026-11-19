리뷰가 완료되었다. 다음 단계를 수행해줘:
/reviews/pr-142/consolidated-review.md 파일을 읽어줘.
해당 내용을 GitHub PR 리뷰 코멘트 형식에 맞게 정리한다.
gh CLI를 사용하여 다음 명령어로 코멘트를 게시한다:
gh pr review 142 --comment --body-file /tmp/review-comment.md
만약 통합 보고서의 최종 결론(Final Verdict)이 REQUEST_CHANGES라면, --comment 대신 --request-changes를 사용하여 리뷰를 게시한다.
