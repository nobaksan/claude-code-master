// 작업 복잡도 및 예산 소진율에 따른 동적 모델 전환 전략
function resolveModelForTask(agentRole, taskComplexity, budgetUsageRatio) {
  // 예산 80% 초과 시 비상 비용 절감 모드로 강제 다운그레이드
  if (budgetUsageRatio > 0.8) {
    if (agentRole === 'developer') return 'claude-haiku-5-5';
    return 'claude-sonnet-5-5';
  }

  // 표준 역할 기반 모델 매핑
  const defaultModels = {
    requirement: 'claude-opus-5-5',
    architect: 'claude-opus-5-5',
    reviewer: 'claude-opus-5-5',
    planner: 'claude-sonnet-5-5',
    ux: 'claude-sonnet-5-5',
    tester: 'claude-sonnet-5-5',
    developer: 'claude-sonnet-5-5',
    documenter: 'claude-haiku-5-5'
  };

  // 작업 복잡도가 단순 유틸리티 수준인 경우 동적 다운그레이드
  if (agentRole === 'developer' && taskComplexity === 'low') {
    return 'claude-haiku-5-5';
  }

  return defaultModels[agentRole] || 'claude-sonnet-5-5';
}
