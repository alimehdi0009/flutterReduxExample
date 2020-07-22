import 'package:flutter/foundation.dart';

enum TodoVisibility { SHOW_ALL, SHOW_ACTIVE, SHOW_COMPLETED }

class Todo {
  final int id;
  final String title;
  final bool completed;

  Todo({@required this.id, @required this.title, this.completed});

  Todo copyWith({int id, String text, bool isCompleted}) {
    return Todo(
        id: id ?? this.id,
        title: text ?? this.title,
        completed: isCompleted ?? this.completed);
  }

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      other is Todo &&
          other.runtimeType == this.runtimeType &&
          other.id == this.id &&
          other.completed == this.completed &&
          other.title == this.title;

  int get hashCode => id.hashCode ^ title.hashCode ^ completed.hashCode;
}

class TodoState {
  final List<Todo> todos;
  final TodoVisibility todoVisibility;

  const TodoState({@required this.todos, @required this.todoVisibility});

  TodoState.initialState()
      : todos = <Todo>[],
        todoVisibility = TodoVisibility.SHOW_ALL;
}

typedef void AddTotoFunction(String text);
typedef void OnTodoTapFunction(int id);
typedef void SetVisibilityFilterFunction(TodoVisibility visibility);
