// 에이전트 기동 조건 검증 함수
function canStartAgent(agentName) {
  const node = advancedWorkflow[agentName];
  if (!node) return false;

  // 1. 모든 선행 의존 노드가 완료 상태인지 검사
  const isDepsCompleted = node.depends.every(dep => getAgentStatus(dep) === 'COMPLETED');
  if (!isDepsCompleted) return false;

  // 2. 선행 노드가 생산해야 할 필수 아티팩트 파일이 실제로 존재하는지 검증
  const areArtifactsReady = node.depends.every(dep => {
    const requiredFiles = advancedWorkflow[dep].artifacts || [];
    return requiredFiles.every(file => fs.existsSync(file) && fs.statSync(file).size > 0);
  });

  return isDepsCompleted && areArtifactsReady;
}
