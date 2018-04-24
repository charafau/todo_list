import 'dart:async';

import 'package:todo_list/model/models.dart';

abstract class TodoRepository {
  Stream<List<Todo>> todos();

  Future<void> addNewTodo(Todo todo);

}
