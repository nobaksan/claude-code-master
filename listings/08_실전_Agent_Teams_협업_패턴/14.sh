# /debug/investigation-log.md - WebSocket 연결 해제 문제 근본 원인 분석 일지
## 1단계: 초기 증거 제시 (Round 1: Initial Evidence)
* 조사관 1 (WebSocket 가설):
* 첫 `send()` 직후 `WebSocket.onclose`가 코드 1006 (Abnormal Closure, 비정상적인 연결 종료)과 함께 발생했음을 확인. 연결이 강제로 끊겼음을 시사함.
* 조사관 3 (서버 인프라 가설):
* Nginx `proxy_read_timeout`이 60초로 설정되어 있으나, WebSocket 핑(ping) 간격이 90초임을 발견. 핑이 없는 틈 동안 연결이 끊겼을 가능성을 제기함.
* 조사관 2 (인증 가설):
* 서버 로그 확인 결과, 연결이 끊긴 시점에 인증 토큰은 유효했으며 세션도 활성 상태였으므로 인증은 원인이 아님을 확정.
---
## 2단계: 상호 검증 및 가설 정제 (Round 2: Cross-Examination)
* 조사관 1 → 조사관 3 (도전):
* "타임아웃 이론은 연결이 끊기는 이유(WHY)는 설명하지만, 왜 첫 메시지 직후에 끊기는지(WHEN)를 설명하지 못함. 단순 타임아웃이라면 60초 비활성 상태 후에 발생해야 함."
* 조사관 3 (가설 정제):
* 첫 메시지를 보낼 때 `socket.setKeepAlive()`가 호출되어 연결 상태를 리셋함을 발견. Nginx 타임아웃(60초) 설정과 결합되어, 이 리셋이 Nginx가 연결을 즉시 닫게 만드는 '복합적 원인'임을 밝혀냄.
---
## 3단계: 최종 합의 (Round 3: Consensus)
최종 근본 원인 (Root Cause):
Nginx 설정과 클라이언트 코드 로직의 상호작용으로 인한 복합적인 문제.
1. Nginx `proxy_read_timeout` = 60s (너무 짧게 설정됨)
2. 첫 메시지 전송 시 `socket.setKeepAlive()` 호출 (Nginx 타이머 상태 리셋 유발)
3. WebSocket 핑 간격 = 90s (타임아웃을 상쇄시키지 못함)
반증된 가설:
* 조사관 2 (인증): 원인 아님. 증거: 인증/세션 정상 작동 확인.
* 조사관 5 (레이스 컨디션): 원인 아님. 증거: 비동기 코드 문제 없음 확인.
권장 수정 사항 (RECOMMENDED FIX):
* 단기: WebSocket 핑 간격을 30s로 줄인다.
* 장기: Nginx `proxy_read_timeout`을 120s로 설정하고 `setKeepAlive` 사용법을 재검토한다.
---
# /debug/root-cause-analysis.md (최종 보고서)
