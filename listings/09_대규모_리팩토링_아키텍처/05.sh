#!/usr/bin/env bash
# 에이전트 메시지 수신 및 소비 루프
INBOX_DIR=".agents/architect/inbox"
PROCESSED_DIR=".agents/architect/processed"

while true; do
  for msg in "$INBOX_DIR"/*.json; do
    [ -f "$msg" ] || continue
    
    # 메시지 파싱 및 에이전트 작업 실행
    echo "[$(date)] 새 메시지 수신: $msg"
    node handle_task.js "$msg"
    
    # 처리 완료 후 아카이브 디렉터리로 원자적 이동
    mv "$msg" "$PROCESSED_DIR/"
  done
  
  # 시스템 자원 과부하 방지 및 적정 반응성을 고려한 2초 대기
  sleep 2
done
