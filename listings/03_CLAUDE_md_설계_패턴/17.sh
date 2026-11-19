## 로깅
- console.log 대신 lib/logger 사용
- 디버깅용 로그는 PR 전 제거

## 타입 안전성
- any 대신 unknown + 타입 가드
- 불가피한 경우 // @ts-expect-error: [이유] 주석 필수
