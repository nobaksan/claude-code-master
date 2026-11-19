def hybrid_search(query: str, vector_db, keyword_index, knowledge_graph):
    # 세 가지 검색 결과를 가중 결합
    vector_results = vector_db.search(query, top_k=10)
    keyword_results = keyword_index.search(query, top_k=10)
    graph_results = knowledge_graph.traverse(query, hops=2)
    # Reciprocal Rank Fusion으로 결합
    combined = reciprocal_rank_fusion([
        (vector_results, 0.5),
        (keyword_results, 0.3),
        (graph_results, 0.2)
    ])
    return combined[:5]
