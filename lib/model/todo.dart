library todo;

import 'package:built_value/built_value.dart';

part 'todo.g.dart';


abstract class Todo implements Built<Todo, TodoBuilder> {

  Todo._();

  @BuiltValueField(wireName: 'title')
  String get title;

  factory Todo([updates(TodoBuilder b)]) = _$Todo;

  factory Todo.empty() => new Todo((b) => b..title = 'empty');

}