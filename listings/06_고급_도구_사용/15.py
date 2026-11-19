class MCPGateway:
    """도구 검색 및 PTC가 통합된 지능형 MCP 게이트웨이"""
    def __init__(self, tool_search=True, ptc=True):
        self.servers = {}
        self.tool_search = tool_search
        self.ptc = ptc
    def get_optimized_tools(self) -> List[dict]:
        """최적화 설정이 적용된 도구 목록을 반환"""
        tools = []
        # 1. 인프라 도구 추가
        if self.tool_search:
            tools.append({"type": "tool_search_tool_regex_20251119", "name": "tool_search_tool_regex"})
        if self.ptc:
            tools.append({"type": "code_execution_20260120", "name": "code_execution"})
        # 2. 서버별 도구 가공 (Namespace 적용 및 설정 주입)
        for srv_name, config in self.servers.items():
            for t_name, t_cfg in config['tools'].items():
                tool_def = {
                    "name": f"{srv_name}.{t_name}",
                    "description": t_cfg.get("description", ""),
                    "input_schema": t_cfg.get("schema", {}),
                    "defer_loading": t_cfg.get("defer_loading", False),
                    "allowed_callers": t_cfg.get("allowed_callers"),
                    "input_examples": t_cfg.get("input_examples")
                }
                tools.append(tool_def)
        return tools
