library reducers;

import 'package:built_redux/built_redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';

var reducerBuilder  = new ReducerBuilder<AppState, AppStateBuilder>()
    ..add(AppActionsNames.addTodo, addTodo);

void addTodo(AppState state, Action<Todo> action, AppStateBuilder builder) {
  builder.todo = state.todo.toBuilder();
}


