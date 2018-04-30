library reducers;

import 'package:built_collection/src/list.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return new AppState((b) => b
    ..isLoading = loadingReducers(state.isLoading, action)
    ..todos = todosReducer(state.todos, action));
}

bool loadingReducers(bool isLoading, action) {
  if (action is LoadTodosAction) {
    return false;
  }
  return true;
}

ListBuilder<Todo> todosReducer(BuiltList<Todo> todos, action) {
  if (action is LoadTodosAction) {
    return todos.rebuild((b) {
      b.clear();
      b.addAll(action.todos);
    }).toBuilder();
  }

  return todos.toBuilder();
}
