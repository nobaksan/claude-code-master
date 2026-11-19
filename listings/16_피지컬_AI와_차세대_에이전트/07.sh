# 최신 Isaac Sim 이미지 다운로드
docker pull nvcr.io/nvidia/isaac-sim:4.2.0

# GPU 가속을 포함하여 실행
docker run --gpus all \
  -e "PRIVACY_CONSENT=yes" \
  -e "ACCEPT_EULA=Y" \
  -v ~/isaac-sim:/root/isaac-sim \
  -p 8211:8211 \
  nvcr.io/nvidia/isaac-sim:4.2.0 \
  ./runheadless.native.sh
