import 'package:flutter/material.dart';
import 'package:redux_todo_practice/models.dart';

class TodoTile extends StatelessWidget {
  final Key key;
  final Todo todo;
  final OnTodoTapFunction onTap;

  const TodoTile({@required this.key, @required this.todo, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      onTap: () => onTap(todo.id),
    );
  }
}
