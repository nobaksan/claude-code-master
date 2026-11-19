# 프록시 환경변수 제거 후 테스트
unset HTTPS_PROXY HTTP_PROXY
claude -p "test"
