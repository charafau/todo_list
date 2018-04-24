import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/middlewares/middleware.dart';
import 'package:todo_list/model/models.dart';
import 'package:todo_list/reducers/reducers.dart';
import 'package:todo_list/repositories/firebase_todo_repository.dart';

main() async {
  runApp(new TodoApp());
}

class TodoApp extends StatelessWidget {
  Store<AppState> store = new Store<AppState>(
    appStateReducer,
    initialState: new AppState.init(),
    middleware: createStoreTodosMiddleware(
      new FirebaseTodoRepository(FirebaseDatabase.instance),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: store,
      child: new MaterialApp(
        title: 'Hello',
        theme: new ThemeData(primarySwatch: Colors.green),
        home: new HomePage(title: 'Hello'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder(
        builder: (BuildContext context, Store<AppState> store) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("hello"),
        ),
        body: new Center(
          child: new Text("todo here"),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            store.dispatch(new AddTodoAction());
          },
          child: new Icon(Icons.add),
        ),
      );
    });
  }
}
