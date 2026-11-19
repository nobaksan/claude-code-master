def chunk_code_file(code: str, language: str):
    """함수/클래스 단위로 청킹"""
    if language == "python":
        # AST 파싱으로 함수/클래스 추출
        tree = ast.parse(code)
        chunks = []
        for node in ast.walk(tree):
            if isinstance(node, (ast.FunctionDef, ast.ClassDef)):
                chunks.append(ast.unparse(node))
        return chunks
