claude "알림 마이크로서비스를 설계해줘. ultrathink
요구사항:
- 이메일, 푸시, SMS, 슬랙 지원
- 분당 10만 건 처리
- 사용자별 채널 선호도 관리
- 알림 템플릿 시스템
- 발송 실패 시 재시도
- 중복 발송 방지
고려사항:
- Message queue 선택 (Kafka vs RabbitMQ vs SQS)
- 데이터 모델
- API 설계
- 장애 대응
- 모니터링"
