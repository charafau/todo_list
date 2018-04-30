library actions;

import 'package:todo_list/model/models.dart';

class RequestCounterDataEventsAction {}

class CancelCounterDataEventsAction {}


class AddTodoAction {
  final Todo todo;

  AddTodoAction(this.todo);

  @override
  String toString() {
    return 'AddTodoAction{todo: $todo}';
  }
}

class LoadTodosAction {
  final List<Todo> todos;

  LoadTodosAction(this.todos);

  @override
  String toString() {
    return 'LoadTodosAction{todos: $todos}';
  }
}
