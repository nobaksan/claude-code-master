# 절대 금지: 코드에 키 하드코딩
client = Anthropic(api_key="sk-ant-xxxxx")
# 환경 변수 사용
import os
client = Anthropic(api_key=os.environ["ANTHROPIC_API_KEY"])
# 시크릿 매니저 사용 (프로덕션 권장)
from cloud_secret_manager import get_secret
client = Anthropic(api_key=get_secret("anthropic-api-key"))
