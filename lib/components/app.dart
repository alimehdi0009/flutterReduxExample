import 'package:flutter/material.dart';
import 'package:redux_todo_practice/container/add_todo.dart';
import 'package:redux_todo_practice/components/footer.dart';
import 'package:redux_todo_practice/container/filtered_list.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo managment'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[AddTodo(), FilteredTodos(), Footer()],
        ),
      ),
    );
  }
}
