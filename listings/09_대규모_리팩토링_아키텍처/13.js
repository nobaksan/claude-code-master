// 에이전트 맞춤형 컨텍스트 필터링 및 요약 함수
function prepareOptimizedContext(targetRole, artifactPaths) {
  let assembledContext = '';

  for (const filePath of artifactPaths) {
    const rawContent = fs.readFileSync(filePath, 'utf-8');
    
    // 타겟 에이전트에게 필요한 섹션만 필터링하거나 대용량 문서는 요약본 추출
    if (rawContent.length > 30000) {
      assembledContext += `
## ${path.basename(filePath)} (핵심 요약)
`;
      assembledContext += extractDomainSpecificSummary(rawContent, targetRole);
    } else {
      assembledContext += `
## ${path.basename(filePath)}
${rawContent}
`;
    }
  }

  return assembledContext;
}
