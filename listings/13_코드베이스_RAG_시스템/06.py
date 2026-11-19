def structure_based_chunk(markdown_text: str):
    sections = markdown_text.split('\n## ')  # H2 기준 분할
    chunks = []
    for section in sections:
        if len(section) > MAX_CHUNK_SIZE:
            # 하위 섹션으로 추가 분할
            subsections = section.split('\n### ')
            chunks.extend(subsections)
        else:
            chunks.append(section)
    return chunks
