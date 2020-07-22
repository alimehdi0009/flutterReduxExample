import 'package:redux_todo_practice/models.dart';
import 'actions.dart';

List<Todo> addTodoReducer(List<Todo> state, action) {
  if (action is AddTodoAction) {
    return <Todo>[]
      ..addAll(state)
      ..add(Todo(id: action.id, title: action.text));
  } else if (action is ToggleTodoAction) {
    state.map((todo) {
      todo.id == action.id
          ? todo.copyWith(isCompleted: !todo.completed)
          : todo.completed;
    });
  }
  return state;
}

TodoVisibility todoVisibilityReducer(TodoVisibility state, action) {
  if (action is SetVisibilityAction) {
    return action.visibility;
  }
  return state;
}

TodoState todoReducer(TodoState state, action) {
  return TodoState(
      todos: addTodoReducer(state.todos, action),
      todoVisibility: todoVisibilityReducer(state.todoVisibility, action));
}
