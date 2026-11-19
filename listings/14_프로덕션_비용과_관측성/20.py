import re
def mask_sensitive_data(text: str) -> str:
    """민감 정보 마스킹"""
    patterns = {
        r'\b\d{3}-\d{2}-\d{4}\b': '[SSN]',            # 미국 SSN
        r'\b\d{6}-\d{7}\b': '[주민번호]',                # 한국 주민번호
        r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b': '[EMAIL]',
        r'\b\d{4}[-\s]?\d{4}[-\s]?\d{4}[-\s]?\d{4}\b': '[CARD]',
        r'sk-ant-[a-zA-Z0-9-]+': '[API_KEY]',
    }
    masked = text
    for pattern, replacement in patterns.items():
        masked = re.sub(pattern, replacement, masked, flags=re.IGNORECASE)
    return masked
