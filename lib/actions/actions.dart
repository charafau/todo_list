library actions;

import 'package:built_redux/built_redux.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_list/model/models.dart';

part 'actions.g.dart';

abstract class AppActions extends ReduxActions {
  AppActions._();

  factory AppActions() => new _$AppActions();

  ActionDispatcher<Todo> addTodo;

}
