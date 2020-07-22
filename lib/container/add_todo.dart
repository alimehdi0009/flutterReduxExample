import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_todo_practice/models.dart';
import 'package:redux_todo_practice/redux/actions.dart';

class _ViewModel {
  final AddTotoFunction onPressed;

  _ViewModel({this.onPressed});

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      other is _ViewModel && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

class AddTodo extends StatefulWidget {
  AddTodo({Key key}) : super(key: key);

  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
      converter: (Store<TodoState> store) => _ViewModel(
          onPressed: (String title) =>
              store.dispatch(AddTodoAction(text: title))),
      builder: (BuildContext context, viewModel) => TextField(
        controller: _todoController,
        keyboardType: TextInputType.text,
        onSubmitted: (String title) {
          viewModel.onPressed(title);
          _todoController.clear();
        },
        decoration: InputDecoration(hintText: 'add a todo'),
      ),
    );
  }
}
