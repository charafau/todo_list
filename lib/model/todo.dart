library todo;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:todo_list/model/serializers.dart';

part 'todo.g.dart';

abstract class Todo implements Built<Todo, TodoBuilder> {
  static Serializer<Todo> get serializer => _$todoSerializer;

  Todo._();

  @BuiltValueField(wireName: 'title')
  String get title;

  factory Todo([updates(TodoBuilder b)]) = _$Todo;

  factory Todo.empty() => new Todo((b) => b..title = 'empty');

  String toJson() =>
      json.encode(serializers.serializeWith(Todo.serializer, this));

  static Todo fromJson(String jsonString) =>
      serializers.deserializeWith(Todo.serializer, json.decode(jsonString));
}
