# 13_코드베이스_RAG_시스템

본문에 실린 순서대로 코드 블록 18개를 그대로 옮겼다.

| 파일 | 절 | 언어 | 첫 줄 |
|---|---|---|---|
| [01.py](01.py) | 상황별 의사결정 시나리오 | python | `# 접근법 선택 의사결정 함수 예시` |
| [02.py](02.py) | 2. HyDE (Hypothetical Document Embedding) | python | `def hyde_search(query: str, llm, embedder, vector_db):` |
| [03.py](03.py) | 6. Hybrid RAG | python | `def hybrid_search(query: str, vector_db, keyword_index, know` |
| [04.py](04.py) | 1. 고정 크기 청킹 (Fixed-size Chunking) | python | `def fixed_size_chunk(text: str, chunk_size: int = 512, overl` |
| [05.py](05.py) | 2. 시맨틱 청킹 (Semantic Chunking) | python | `def semantic_chunk(text: str, embedder, threshold: float = 0` |
| [06.py](06.py) | 4. 문서 구조 기반 청킹 (Structure-aware Chunking) | python | `def structure_based_chunk(markdown_text: str):` |
| [07.py](07.py) | 4. 문서 구조 기반 청킹 (Structure-aware Chunking) | python | `def chunk_code_file(code: str, language: str):` |
| [08.py](08.py) | 5. LLM 기반 청킹 (LLM-based Chunking) | python | `def llm_based_chunk(text: str, llm):` |
| [09.py](09.py) | 실전 코드 패턴: 에이전트의 의사결정 | python | `class QueryRewriteAgent:` |
| [10.py](10.py) | 실전 코드 패턴: 에이전트의 의사결정 | python | `class SourceSelectionAgent:` |
| [11.py](11.py) | 실전 코드 패턴: 에이전트의 의사결정 | python | `class AnswerValidatorAgent:` |
| [12.py](12.py) | 1. Write Context (컨텍스트 기록) | python | `class ContextWriter:` |
| [13.py](13.py) | 2. Read Context (컨텍스트 읽기) | python | `class ContextReader:` |
| [14.py](14.py) | 3. Compress Context (컨텍스트 압축) | python | `class ContextCompressor:` |
| [15.py](15.py) | 4. Isolate Context (컨텍스트 격리) | python | `class ContextIsolator:` |
| [16.ts](16.ts) | 시스템 작동 시나리오 | typescript | `// mcp-rag-server/src/index.ts` |
| [17.sh](17.sh) | 시스템 작동 시나리오 | bash | `npm install @modelcontextprotocol/sdk zod chromadb @chroma-c` |
| [18.sh](18.sh) | 시스템 작동 시나리오 | bash | `npx tsc` |
