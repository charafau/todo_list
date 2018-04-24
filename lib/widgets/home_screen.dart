import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Todo List'),
      ),
      body: new Text('hello'),
    );
  }


}
