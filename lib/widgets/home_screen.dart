import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Todo List'),
      ),
      body: new TodoList(),
    );
  }
}

class TodoList extends StoreConnector<AppState, AppActions, BuiltList<Todo>> {
  @override
  Widget build(
      BuildContext context, BuiltList<Todo> state, AppActions actions) {
    if (state.isEmpty) {
      return new Center(
        child: new Text('List is empty'),
      );
    } else {
      return new Text(state[0].title);
    }
  }

  @override
  BuiltList<Todo> connect(AppState state) => state.todos;
}
