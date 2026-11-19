def hyde_search(query: str, llm, embedder, vector_db):
    # 1. 가상의 답변 생성
    hypothetical_answer = llm.generate(
        f"다음 질문에 대한 상세한 답변을 작성하세요: {query}"
    )
    # 2. 가상 답변을 임베딩
    hypo_embedding = embedder.embed(hypothetical_answer)
    # 3. 유사 문서 검색
    results = vector_db.search(hypo_embedding, top_k=5)
    return results
