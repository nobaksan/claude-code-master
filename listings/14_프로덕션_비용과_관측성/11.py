class GracefulDegradation:
    def __init__(self):
        self.feature_flags = {
            "full_analysis": True,
            "code_generation": True,
            "simple_response": True,
        }
    def process_request(self, request: dict) -> str:
        # 1단계: 전체 기능 시도
        if self.feature_flags["full_analysis"]:
            try:
                return self._full_analysis(request)
            except Exception:
                self.feature_flags["full_analysis"] = False
        # 2단계: 코드 생성만
        if self.feature_flags["code_generation"]:
            try:
                return self._code_only(request)
            except Exception:
                self.feature_flags["code_generation"] = False
        # 3단계: 단순 응답
        return "기능이 제한된 상태입니다. 기본 응답만 제공합니다."
