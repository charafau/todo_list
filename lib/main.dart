import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';
import 'package:todo_list/reducers/reducers.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:todo_list/widgets/home_screen.dart';

main() => runApp(new TodoApp());

class TodoApp extends StatefulWidget {

  final store = new Store<AppState, AppStateBuilder, AppActions>(
    reducerBuilder.build(),
    new AppState.init(),
    new AppActions(),
    middleware: []
  );

  @override
  _TodoAppState createState() => new _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {

  Store<AppState, AppStateBuilder, AppActions> store;


  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ReduxProvider(
      store: store,
      child: new MaterialApp(
        home: new HomeScreen(),
      ),
    );
  }
}
