// load-test.js
import http from 'k6/http';
import { sleep, check } from 'k6';
export const options = {
stages: [
{ duration: '1m', target: 10 }, // 1분 동안 10명으로 증가
{ duration: '3m', target: 10 }, // 3분 유지
{ duration: '1m', target: 50 }, // 50명으로 급증
{ duration: '2m', target: 50 }, // 부하 유지
{ duration: '1m', target: 0 }, // 부하 해제
],
};
export default function () {
const res = http.post('http://localhost:8000/analyze',
JSON.stringify({ code: 'def hello(): return "world"' }),
{ headers: { 'Content-Type': 'application/json' } }
);
check(res, {
'응답 200': (r) => r.status === 200,
'응답 시간 30초 미만': (r) => r.timings.duration < 30000,
'응답 형식 올바름': (r) => JSON.parse(r.body).analysis !== undefined,
});
sleep(1);
}
