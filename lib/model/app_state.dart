library app_state;

import 'package:built_value/built_value.dart';
import 'package:todo_list/model/todo.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  Todo get todo;

  factory AppState.init() => new AppState((b) => b..todo = new Todo.empty().toBuilder());

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
