import ast
def validate_generated_code(code: str) -> bool:
    """생성된 코드의 안전성 검증"""
    # 위험한 패턴 체크
    dangerous_imports = ['os', 'subprocess', 'eval', 'exec', 'open']
    try:
        tree = ast.parse(code)
        for node in ast.walk(tree):
            if isinstance(node, ast.Import):
                for alias in node.names:
                    if alias.name in dangerous_imports:
                        return False
            elif isinstance(node, ast.ImportFrom):
                if node.module in dangerous_imports:
                    return False
        return True
    except SyntaxError:
        return False
