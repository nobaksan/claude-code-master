// 인터페이스 명세에 기반한 사전 테스트 코드 예시
describe('TodoService.addTodo', () => {
  it('공백으로 구성된 제목은 ValidationError를 발생시켜야 한다', () => {
    expect(() => todoService.addTodo({ title: '   ' })).toThrow(ValidationError);
  });

  it('정상적인 입력값에 대해 고유 식별자와 생성 일시를 부여해야 한다', () => {
    const todo = todoService.addTodo({ title: 'Claude Code 마스터' });
    expect(todo.id).toBeDefined();
    expect(todo.completed).toBe(false);
  });
});
