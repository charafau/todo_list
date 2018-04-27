library app_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:todo_list/model/todo.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  AppState._();

  bool get isLoading;

  BuiltList<Todo> get todos;

  factory AppState.init() =>
      new AppState((b) => b
        ..isLoading = true
        ..todos = new BuiltList<Todo>([]).toBuilder()
      );

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
