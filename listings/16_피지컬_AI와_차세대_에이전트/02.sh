# 미래의 통합 로보틱스 개발 (개념적 예시)
from physical_ai_platform import FoundationModel, Environment

# 1. 범용 피지컬 AI 모델 로드 (동작의 '뇌')
core_brain = FoundationModel.from_pretrained("physical-ai/universal-v2")

# 2. 휴머노이드 로봇으로 배포
# "창고 환경에서 물건을 분류하라"
humanoid_agent = core_brain.deploy(
    target_hardware="figure-03",
    environment=Environment.WAREHOUSE
)

# 3. 동일한 모델을 자율주행 트럭으로 배포
# "도로 환경에서 안전하게 운행하라"
truck_agent = core_brain.deploy(
    target_hardware="drive-thor",
    environment=Environment.HIGHWAY
)

# 4. 동일한 모델을 배송 드론으로 배포
# "하늘에서 목적지까지 최단 경로로 날아가라"
drone_agent = core_brain.deploy(
    target_hardware="jetson-agx",
    environment=Environment.AERIAL
)
