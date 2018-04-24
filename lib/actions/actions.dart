library actions;

import 'package:built_value/built_value.dart';
import 'package:todo_list/model/models.dart';

//abstract class AppActions extends ReduxActions {

//  AppActions._();
//
//  factory AppActions() => new _$AppActions();
//
//  ActionDispatcher<Todo> addTodo;
//  ActionDispatcher<Null> requestTodos;
//
//}

class RequestTodoListEventsAction {}

class AddTodoAction {}

class LoadedTodosAction {
  final List<Todo> todos;

  LoadedTodosAction(this.todos);
}
