// Express 기반 SSE 스트리밍 엔드포인트
app.get('/api/monitor/stream', (req, res) => {
  res.setHeader('Content-Type', 'text/event-stream');
  res.setHeader('Cache-Control', 'no-cache');
  res.setHeader('Connection', 'keep-alive');

  // 에이전트 상태 변경 이벤트 브로드캐스팅
  const onAgentUpdate = (data) => {
    res.write(`data: ${JSON.stringify(data)}

`);
  };

  agentEventBus.on('status_change', onAgentUpdate);

  req.on('close', () => {
    agentEventBus.off('status_change', onAgentUpdate);
  });
});
