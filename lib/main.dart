import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/middlewares/middleware.dart';
import 'package:todo_list/model/app_state.dart';
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
        new FirebaseTodoRepository(FirebaseDatabase.instance)),
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

//
class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = new TextEditingController();

    return new StoreBuilder(
        onInit: (store) => store.dispatch(new RequestCounterDataEventsAction()),
        onDispose: (store) =>
            store.dispatch(new CancelCounterDataEventsAction()),
        builder: (BuildContext context, Store<AppState> store) {
          return new Scaffold(
            appBar: new AppBar(
              title: new Text("hello"),
            ),
            body: store.state.isLoading ? _buildLoading() : _buildList(store),
            floatingActionButton: new FloatingActionButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildTodoDialog(context, myController, store));
              },
              child: new Icon(Icons.add),
            ),
          );
        });
  }

  AlertDialog _buildTodoDialog(
      BuildContext context, TextEditingController myController, Store<AppState> store) {
    return new AlertDialog(
      content: new Row(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: myController,
              autofocus: true,
              decoration: new InputDecoration(
                  labelText: 'Todo', hintText: 'eg. buy milk'),
            ),
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            child: const Text('CANCEL'),
            onPressed: () {
              Navigator.pop(context);
            }),
        new FlatButton(
            child: const Text('ADD'),
            onPressed: () {
              store.dispatch(new AddTodoAction(
                    new Todo((b) => b..title = myController.text)));
              Navigator.pop(context);
            })
      ],
    );
  }

  ListView _buildList(Store<AppState> store) {
    return new ListView.builder(
        itemCount: store.state.todos.length,
        itemBuilder: (BuildContext context, int index) => new Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
              child: new Card(
                  child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(store.state.todos[index].title),
              )),
            ));
  }

  Widget _buildLoading() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }
}
