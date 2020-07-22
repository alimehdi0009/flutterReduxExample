import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_todo_practice/models.dart';
import 'package:redux_todo_practice/redux/actions.dart';
import 'package:redux_todo_practice/components/link.dart';

class _ViewModel {
  final bool active;
  final VoidCallback onPressed;

  _ViewModel({this.active, this.onPressed});

  @override
  bool operator ==(Object other) =>
      identical(other, this) ||
      other is _ViewModel &&
          other.active == this.active &&
          other.runtimeType == runtimeType;

  int get hashCode => active.hashCode;
}

class FooterLink extends StatelessWidget {
  final String text;
  final TodoVisibility visibility;

  const FooterLink({Key key, this.text, this.visibility}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<TodoState, _ViewModel>(
        converter: (Store<TodoState> store) => _ViewModel(
            active: visibility == store.state.todoVisibility,
            onPressed:
                store.dispatch(SetVisibilityAction(visibility: visibility))),
        builder: (BuildContext context, viewModel) => Link(
            active: viewModel.active,
            onPressed: viewModel.onPressed,
            text: text));
  }
}
