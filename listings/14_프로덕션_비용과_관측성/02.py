def compress_context(file_content: str, max_lines: int = 100) -> str:
    """파일을 함수 시그니처와 핵심 로직만 추출하여 압축"""
    lines = file_content.split('\n')
    compressed = []
    for line in lines:
        # 함수/클래스 정의, import, 핵심 로직만 유지
        if any([
            line.strip().startswith('def '),
            line.strip().startswith('class '),
            line.strip().startswith('import '),
            line.strip().startswith('# TODO'),
            'CRITICAL' in line,
        ]):
            compressed.append(line)
    return '\n'.join(compressed[:max_lines])
