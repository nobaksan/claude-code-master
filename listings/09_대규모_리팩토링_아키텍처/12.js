// 복원력을 갖춘 에이전트 실행 래퍼 함수
const MAX_RETRY_COUNT = 3;

async function executeAgentWithResilience(agentId, taskPayload) {
  let attempt = 0;
  
  while (attempt < MAX_RETRY_COUNT) {
    try {
      attempt++;
      return await invokeAgentProcess(agentId, taskPayload);
    } catch (error) {
      console.error(`[${agentId}] 실행 실패 (${attempt}/${MAX_RETRY_COUNT}): ${error.message}`);
      
      if (attempt >= MAX_RETRY_COUNT) {
        // 서킷 브레이커 발동: 파이프라인 일시 중지 및 관리자 알림
        await notifyCircuitBreakerTriggered(agentId, error);
        throw new Error(`에이전트 [${agentId}] 연속 실패로 파이프라인 정지`);
      }
      
      // 세션 상태 초기화 및 지수 백오프 대기 (5초, 15초, 45초)
      await resetAgentSession(agentId);
      const backoffDelay = 5000 * Math.pow(3, attempt - 1);
      await new Promise(resolve => setTimeout(resolve, backoffDelay));
    }
  }
}
