# 결제 서비스
## WHAT
마이크로서비스 중 결제 처리 담당. Python 3.11 + FastAPI + PostgreSQL.

## WHY
- FastAPI: async 지원, 자동 OpenAPI 문서
- Alembic: DB 마이그레이션 관리
- Celery: 결제 비동기 처리

## HOW
- 실행: uvicorn main:app --reload
- 테스트: pytest -v --cov
- 마이그레이션: alembic upgrade head

## 중요 규칙
1. 결제 관련 로직은 반드시 services/payment.py에 집중
2. 외부 API 호출은 clients/ 레이어를 통해서만
3. 환경변수: config.py에서 Pydantic Settings로 관리
4. 트랜잭션: 결제 완료/실패는 반드시 이벤트 발행 (events/)
