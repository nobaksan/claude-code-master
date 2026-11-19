// mcp-rag-server/src/index.ts
import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StdioServerTransport } from "@modelcontextprotocol/sdk/server/stdio.js";
import { z } from "zod";
import { readFile } from "node:fs/promises";
import { ChromaClient } from "chromadb";
import { chunkByStrategy } from "./chunking.js"; // 13.3절의 청킹 전략 구현

const server = new McpServer({ name: "codebase-rag", version: "1.0.0" });
const chroma = new ChromaClient();

server.registerTool(
  "search_codebase",
  {
    description: "코드베이스에서 질문과 의미가 가까운 코드 조각을 찾는다",
    inputSchema: {
      query: z.string().describe("검색 쿼리"),
      top_k: z.number().int().default(5),
    },
  },
  async ({ query, top_k }) => {
    const collection = await chroma.getCollection({ name: "codebase" });
    const results = await collection.query({
      queryTexts: [query],
      nResults: top_k,
    });
    const hits = results.documents[0].map((doc, i) => ({
      content: doc,
      metadata: results.metadatas[0][i],
      score: results.distances[0][i],
    }));
    return { content: [{ type: "text", text: JSON.stringify(hits, null, 2) }] };
  }
);

server.registerTool(
  "index_file",
  {
    description: "파일을 청킹해 벡터 DB에 인덱싱한다",
    inputSchema: {
      file_path: z.string(),
      chunk_strategy: z.enum(["fixed", "semantic", "ast"]).default("ast"),
    },
  },
  async ({ file_path, chunk_strategy }) => {
    const content = await readFile(file_path, "utf-8");
    const chunks = await chunkByStrategy(content, chunk_strategy);
    const collection = await chroma.getOrCreateCollection({ name: "codebase" });
    await collection.add({
      documents: chunks.map((c) => c.content),
      metadatas: chunks.map((c) => ({
        file: file_path,
        type: c.type,
        start_line: c.startLine,
      })),
      ids: chunks.map((_, i) => `${file_path}:${i}`),
    });
    return { content: [{ type: "text", text: `indexed ${chunks.length} chunks` }] };
  }
);

await server.connect(new StdioServerTransport());
