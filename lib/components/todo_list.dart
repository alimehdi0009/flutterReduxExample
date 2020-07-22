import 'package:flutter/material.dart';
import 'package:redux_todo_practice/components/todo_tile.dart';
import 'package:redux_todo_practice/models.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  final OnTodoTapFunction onTap;
  TodoList({Key key, this.todos, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: todos.map((todo) {
      return TodoTile(key: Key(todo.id.toString()), todo: todo);
    }).toList());
  }
}
