# 1. 텔레메트리 켜기 (필수)
export CLAUDE_CODE_ENABLE_TELEMETRY=1
# 2. 내보내기 방식 선택 (지표: otlp·prometheus·console·none / 이벤트: otlp·console·none)
export OTEL_METRICS_EXPORTER=otlp
export OTEL_LOGS_EXPORTER=otlp
# 3. OTLP 수집기 주소
export OTEL_EXPORTER_OTLP_PROTOCOL=grpc
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317
# 4. 인증이 필요하면
export OTEL_EXPORTER_OTLP_HEADERS="Authorization=Bearer your-token"
# 5. 디버깅용 짧은 간격 (기본: 지표 60000ms, 이벤트 5000ms)
export OTEL_METRIC_EXPORT_INTERVAL=10000
claude
