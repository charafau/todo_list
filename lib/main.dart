import 'package:built_redux/built_redux.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';
import 'package:todo_list/reducers/reducers.dart';

main() => runApp(new HomePage());

//class HomePage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new MaterialApp(
//      home: new Scaffold(
//        body: new Center(
//          child: new Text('hello'),
//        ),
//      ),
//    );
//  }
//}

class HomePage extends StatefulWidget {

  final store = new Store<AppState, AppStateBuilder, AppActions>(
    reducerBuilder.build(),
    new AppState.init(),
    new AppActions(),
    middleware: []
  );

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Store<AppState, AppStateBuilder, AppActions> store;


  @override
  void initState() {
    store = widget.store;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('hello'),
        ),
      ),
    );
  }
}
