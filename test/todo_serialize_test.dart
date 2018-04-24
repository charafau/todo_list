import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';
import 'package:todo_list/model/models.dart';
import 'package:todo_list/model/serializers.dart';

void main() {
  final String jsonString = """
  {
    "title": "My todo" 
  }
  """;

  test('should serialize json', () {
    final todo = new Todo((b) => b..title = 'My todo');

    expect(todo.toJson(), '{"title":"My todo"}');
  });

  test('should deserialize json', () {
    final expected = new Todo((b) => b..title = 'My todo');

    final Todo todo = Todo.fromJson(jsonString);

    expect(todo, expected);
  });

  test('should deserialize json', () {
    final todo = new Todo((b) => b..title = 'My todo');

    final BuiltList<Todo> todos = new BuiltList<Todo>([todo]);

    var jString = json.encode(serializers.serialize(todos));

    print(jString);

    //wrong output:
    // {"$":"list","":{"$":"Todo","title":"My todo"}}

  });
}
