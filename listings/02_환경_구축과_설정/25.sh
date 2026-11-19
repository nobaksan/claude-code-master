# macOS
security add-trusted-cert -d -r trustRoot \
-k ~/Library/Keychains/login.keychain \
~/.mitmproxy/mitmproxy-ca-cert.pem

# Linux (Ubuntu/Debian)
sudo cp ~/.mitmproxy/mitmproxy-ca-cert.pem /usr/local/share/ca-certificates/mitmproxy.crt
sudo update-ca-certificates

# npm으로 설치한 Node.js 기반 Claude Code라면 이 변수로 추가 인증서를 준다
export NODE_EXTRA_CA_CERTS=~/.mitmproxy/mitmproxy-ca-cert.pem
