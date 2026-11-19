# 나쁜 예: 검색하기 어려운 설명
{
"name": "query_db_orders",
"description": "주문 쿼리 실행"
}
# 문제점:
# - "query"가 무엇을 의미하는지 불명확
# - 어떤 데이터를 반환하는지 알 수 없음
# - 언제 사용해야 하는지 맥락 없음
# 좋은 예: 키워드가 풍부한 설명
{
"name": "search_customer_orders",
"description": "고객의 주문 내역을 날짜 범위(date range), 주문 상태(status), 또는 총 결제 금액(total amount)별로 검색합니다. 응답에는 주문 상품 리스트, 배송 정보(shipping info), 결제 상태(payment status)가 포함됩니다. 이 도구는 매출 보고서 작성, 고객 지원 문의 응대, 주문 이행 상태 추적 시에 사용하세요."
}
# 장점:
# - "customer", "orders", "date", "status" 등 검색 키워드 풍부
# - 반환 데이터가 명확
# - 사용 시나리오가 구체적
