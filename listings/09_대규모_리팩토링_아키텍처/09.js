// React 클라이언트의 SSE 스트림 연동
useEffect(() => {
  const eventSource = new EventSource('/api/monitor/stream');

  eventSource.onmessage = (event) => {
    const payload = JSON.parse(event.data);
    setAgentStates((prev) => ({
      ...prev,
      [payload.agentId]: payload
    }));
  };

  eventSource.onerror = () => {
    eventSource.close();
  };

  return () => {
    eventSource.close();
  };
}, []);
