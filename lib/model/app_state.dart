library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_list/model/todo.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  BuiltList<Todo> get todos;

  factory AppState.init() => new AppState((b) => b..todos = new BuiltList<Todo>([new Todo((b) => b.title = "First")]).toBuilder());

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
