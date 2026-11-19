# 결제 시스템 리팩터링 진행상황
## 목표
기존의 거대한 PaymentService 클래스를 전략 패턴으로 리팩터링하여
결제 수단별로 독립적인 테스트와 확장이 가능하게 만들기.

## 완료된 작업
1. 기존 PaymentService.ts 코드 분석 완료
- 총 1,200줄, 5개 결제 수단이 하나의 클래스에 혼재
- 테스트 커버리지: 23% (불충분)
2. PaymentStrategy 인터페이스 정의
- src/payment/strategies/PaymentStrategy.ts
- processPayment(), refund(), getStatus() 메서드 정의
3. StripePayment 전략 구현
- src/payment/strategies/StripePayment.ts
- 테스트 작성 완료 (src/payment/__tests__/StripePayment.test.ts)

## 진행 중인 작업
PayPalPayment 전략 구현 중
- src/payment/strategies/PayPalPayment.ts
- processPayment() 완료
- refund() ← 여기서 중단됨
- PayPal API의 refund 응답 형식 확인 필요
- 참고: https://developer.paypal.com/docs/api/payments/v2/
- getStatus() 미구현

## 중요 결정사항
1. API 응답 규칙: null 대신 항상 빈 배열 반환 (프론트엔드 호환성)
2. 에러 처리: PaymentError 커스텀 예외 사용, 원본 에러는 cause로 래핑
3. 로깅: structured logging 사용, PII 절대 로깅 금지
4. 재시도 정책: 네트워크 오류 시 최대 3회 재시도, exponential backoff

## 다음 단계
1. PayPalPayment.refund() 구현 완료
2. PayPalPayment.getStatus() 구현
3. PayPalPayment 테스트 작성
4. 나머지 결제 수단 (KakaoPay, NaverPay) 구현
5. 기존 PaymentService를 새 전략들을 사용하도록 마이그레이션

## 주의사항
- PayPal sandbox 환경에서만 테스트할 것 (프로덕션 API 키 사용 금지)
- 기존 PaymentService 삭제는 마이그레이션 완료 후에
- 결제 관련 코드는 반드시 코드 리뷰 필수
