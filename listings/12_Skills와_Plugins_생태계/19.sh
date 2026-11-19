# 배포 전 검사
claude plugin validate .
# Git 저장소로 배포
git init
git add .
git commit -m "Initial plugin release"
git remote add origin https://github.com/username/my-marketplace
git push -u origin main
# 사용자가 설치 — 마켓플레이스를 등록한 뒤 플러그인을 고른다
/plugin marketplace add username/my-marketplace
/plugin install my-awesome-plugin@my-marketplace
