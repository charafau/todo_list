import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:todo_list/model/serializers.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/repositories/todo_repository.dart';

const TODO_KEY = 'todos/';

class FirebaseTodoRepository implements TodoRepository {
  final FirebaseDatabase firebaseDatabase;

  FirebaseTodoRepository(this.firebaseDatabase);

  @override
  Stream<List<Todo>> todos() {
    return firebaseDatabase
        .reference()
        .child(TODO_KEY)
        .onValue
        .map((Event event) => [new Todo((b) => b..title = 'first')]);
  }

  @override
  Future<void> addNewTodo(Todo todo) async {
    firebaseDatabase
        .reference()
        .child(TODO_KEY)
        .once()
        .then((DataSnapshot snapshot) => _addNew(snapshot, todo));
  }

  void _addNew(DataSnapshot snapshot, Todo todo) {
    var ref = firebaseDatabase.reference().child(TODO_KEY);

    var specifiedType = const FullType(BuiltList, const [const FullType(Todo)]);

    var value = snapshot.value;
    BuiltList<Todo> todos;
    if (value != null) {
      todos = serializers.deserialize(value, specifiedType: specifiedType);

      todos = todos.rebuild((b) => b..add(todo));
    } else {
      todos = new BuiltList([todo]);
    }

    ref.set(serializers.serialize(todos, specifiedType: specifiedType));

    print('saved');
  }
}
