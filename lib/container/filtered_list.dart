import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_todo_practice/components/todo_list.dart';
import 'package:redux_todo_practice/models.dart';
import 'package:redux_todo_practice/redux/actions.dart';

class _ViewModel {
  final List<Todo> todos;
  final OnTodoTapFunction onTap;

  _ViewModel({this.todos, this.onTap});

  @override
  bool operator ==(Object other) =>
      identical(other, this) &&
      other is _ViewModel &&
      new ListEquality<Todo>().equals(todos, other.todos) &&
      other.runtimeType == runtimeType;

  @override
  int get hashCode => todos.hashCode;
}

class FilteredTodos extends StatelessWidget {
  const FilteredTodos({Key key}) : super(key: key);

  getVisibleTodos(List<Todo> todos, TodoVisibility visibility) {
    switch (visibility) {
      case TodoVisibility.SHOW_ALL:
        return todos;
      case TodoVisibility.SHOW_ACTIVE:
        return todos.where((element) => !element.completed).toList();
      case TodoVisibility.SHOW_COMPLETED:
        return todos.where((element) => element.completed).toList();
      default:
        return <Todo>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
        converter: (Store<TodoState> store) => _ViewModel(
            todos:
                getVisibleTodos(store.state.todos, store.state.todoVisibility),
            onTap: (id) => store.dispatch(ToggleTodoAction(id: id))),
        builder: (BuildContext context, viewModel) {
          return TodoList(
            todos: viewModel.todos,
            onTap: viewModel.onTap,
          );
        });
  }
}
