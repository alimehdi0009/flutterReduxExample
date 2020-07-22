import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_todo_practice/redux/reducers.dart';
import 'models.dart';
import 'package:redux_todo_practice/components/app.dart';

void main() {
  Store<TodoState> store =
      Store<TodoState>(todoReducer, initialState: TodoState.initialState());
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<TodoState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: App(),
      ),
    );
  }
}
