import 'package:redux_todo_practice/models.dart';
import 'package:flutter/foundation.dart';

abstract class TodoAction {
  @override
  String toString() {
    return '$runtimeType';
  }
}

class AddTodoAction extends TodoAction {
  static int _id = 0;
  final String text;

  AddTodoAction({@required this.text}) {
    _id++;
  }

  int get id => _id;
}

class SetVisibilityAction extends TodoAction {
  final TodoVisibility visibility;
  SetVisibilityAction({this.visibility});
}

class ToggleTodoAction extends TodoAction {
  final int id;
  ToggleTodoAction({this.id});
}
