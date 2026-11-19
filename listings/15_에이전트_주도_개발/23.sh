함정 주의 (신규 팀원 필독)
1. DB 마이그레이션
- 절대로 prisma db push 사용 금지 (데이터 손실 위험)
- 반드시 prisma migrate dev 사용
- 프로덕션 마이그레이션은 반드시 팀장 리뷰 후 진행
2. 환경 변수
- NEXT_PUBLIC_ 접두사 = 클라이언트 노출됨. 비밀값 절대 금지
- 새 환경변수 추가 시 .env.example도 반드시 업데이트
3. 테스트 데이터
- seed.ts의 admin 계정: admin@test.com / password123
- 이 데이터는 로컬/스테이징 전용. 프로덕션 절대 사용 금지
