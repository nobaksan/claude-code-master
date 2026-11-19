## 에러 핸들링 패턴
class AppError extends Error {
constructor(
message: string,
public code: string,
public statusCode: number
) {
super(message);
this.name = 'AppError';
}
}
