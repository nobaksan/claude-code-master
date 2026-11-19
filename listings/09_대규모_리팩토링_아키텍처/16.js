export const meta = {
  name: 'todo-pipeline',
  description: '요구사항부터 리뷰까지 TODO 앱을 단계별로 만든다',
}

phase('설계')
const spec = await agent('요구사항을 분석해 docs/requirements.md를 쓰고 핵심 항목을 목록으로 돌려줘.', {
  schema: { type: 'object', required: ['items'], properties: { items: { type: 'array', items: { type: 'string' } } } },
})
await parallel([
  agent('docs/requirements.md를 읽고 UX 설계를 docs/ux-design.md에 쓴다.'),
  agent('docs/requirements.md를 읽고 아키텍처를 docs/architecture.md에 쓴다.'),
])

phase('구현과 검증')
const results = await pipeline(spec.items, item =>
  agent(`요구 항목 "${item}"을 TDD로 구현하고 테스트 결과를 요약해줘.`, { label: item }),
)

phase('리뷰')
const review = await agent('구현 전체를 리뷰해 결함을 위험도별로 정리해줘.')
return { done: results.filter(Boolean).length, review }
