order_tool = {
"name": "create_order",
"description": "이커머스 시스템에 새 주문을 생성합니다.",
"input_schema": { ... },
"input_examples": [
# 예시 1: 일반 B2C 주문 (표준 패턴)
{
"customer_id": "CUST-2024-0892",
"items": [{"sku": "LAPTOP-PRO-15", "quantity": 1}],
"shipping": {"method": "standard", "address_id": "ADDR-001"}
},
# 예시 2: 선물 주문 (배송 메모와 선물 메시지 처리)
{
"customer_id": "CUST-2024-5678",
"items": [{"sku": "HEADPHONES-BT", "quantity": 1}],
"shipping": {"method": "standard", "address_id": "ADDR-002", "instructions": "문 앞에 놓아주세요"},
"gift_wrap": True,
"gift_message": "생일 축하해! "
},
# 예시 3: B2B 대량 주문 (특별 단가 적용 케이스)
{
"customer_id": "CORP-ACME-001",
"items": [{"sku": "MONITOR-27", "quantity": 50, "price_override": 349.00}],
"shipping": {"method": "freight", "address_id": "ADDR-003"}
}
]
}
