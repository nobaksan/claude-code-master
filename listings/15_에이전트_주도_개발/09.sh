# Claude Code 출력:
GitHub Issue #234 생성 완료
제목: [Bug] 세션 만료 시간이 의도보다 짧게 설정됨
분석 결과:
- config/session.ts에서 SESSION_LIFETIME이 300초(5분)로 설정
- 프로덕션 환경변수 SESSION_LIFETIME_HOURS가 무시되고 있음
- 원인: 환경변수 파싱 시 기본값 폴백 로직 버그
관련 파일:
- config/session.ts (line 23-27)
- lib/auth/token.ts (line 45)
