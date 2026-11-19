def semantic_chunk(text: str, embedder, threshold: float = 0.7):
    sentences = split_sentences(text)
    embeddings = [embedder.embed(s) for s in sentences]
    chunks = []
    current_chunk = [sentences[0]]
    for i in range(1, len(sentences)):
        similarity = cosine_similarity(embeddings[i-1], embeddings[i])
        if similarity >= threshold:
            current_chunk.append(sentences[i])
        else:
            chunks.append(" ".join(current_chunk))
            current_chunk = [sentences[i]]
    chunks.append(" ".join(current_chunk))
    return chunks
