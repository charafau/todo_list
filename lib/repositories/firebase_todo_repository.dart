import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/repositories/todo_repository.dart';

class FirebaseTodoRepository implements TodoRepository {
  final FirebaseDatabase firebaseDatabase;
  DatabaseReference _counterRef;

  FirebaseTodoRepository(this.firebaseDatabase);

  @override
  Stream<List<Todo>> todos() {return null; }

  @override
  Future<void> addNewTodo(Todo todo) async {
    var ref = firebaseDatabase.reference().child('todos/');
//    ref.push();
//    ref.set('"todo" : "my todo"');

    ref.push();
    final todo = new Todo((b) => b..title = 'My todo');
    ref.set(todo.toJson());
  }
}
