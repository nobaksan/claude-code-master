def fixed_size_chunk(text: str, chunk_size: int = 512, overlap: int = 50):
    chunks = []
    for i in range(0, len(text), chunk_size - overlap):
        chunk = text[i:i + chunk_size]
        chunks.append(chunk)
    return chunks
