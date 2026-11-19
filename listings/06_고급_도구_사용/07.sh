{
"name": "get_orders",
"description": """고객의 주문 정보를 상세 조회한다. PTC(코드 실행) 환경에서 안전하게 사용 가능하다.
Args:
customer_id (str): 'CUST-'로 시작하는 고객 고유 번호 (예: 'CUST-1234')
status (str, optional): 필터링할 상태값 ('pending', 'shipped', 'delivered')
Returns:
List[dict]: 각 주문 정보가 담긴 딕셔너리 리스트
- order_id (str): 'ORD-YYYY-NNNN' 형식
- total (float): USD 단위 결제 총액 (산술 연산 가능)
- status (str): 현재 배송 상태
- items (List[dict]): {sku: str, quantity: int, price: float} 구조의 상품 목록
- created_at (str): ISO 8601 형식 (YYYY-MM-DDTHH:mm:ss)
Example Return:
[
{
"order_id": "ORD-2024-0001",
"total": 150.50,
"status": "shipped",
"created_at": "2024-11-20T10:30:00"
}
]
"""
}
