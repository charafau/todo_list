import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todo_list/repositories/todo_repository.dart';

//final allEpics = combineEpics<AppState>([todoEpic, todoAddEpic]);
final reference = FirebaseDatabase.instance.reference().child('todos');

//Stream<dynamic> todoAddEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
//  return new Observable(actions)
//      .ofType(new TypeToken<AddTodoAction>())
//      .flatMap((_) {
//    return new Observable.just(() {
//      var ref = reference.push();
//      final todo = new Todo((b) => b..title = 'My todo');
//      ref.set(todo.toJson());
//
//    });
//  });
//}
//
//Stream<dynamic> todoEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
////  return new Observable(actions)
////      .ofType(new TypeToken<RequestTodoListEventsAction>())
////      .switchMap((RequestTodoListEventsAction requestAction) {
////        var todoList = getTodoList();
////        return todoList;
////
////  });
////}
////
////Observable<BuiltList<Todo>> getTodoList() {
////  return new Observable(
////          reference.onChildChanged)
////      .map((Event event) => event.snapshot.value);
////}

List<Middleware<AppState>> createStoreTodosMiddleware(
    TodoRepository todosRepository) {
  return [
    new TypedMiddleware<AppState, RequestTodoListEventsAction>(
      _firestoreFetchTodos(todosRepository),
    ),
    new TypedMiddleware<AppState, AddTodoAction>(
      _firestoreAddTodo(todosRepository),
    ),
  ];
}

void Function(
  Store<AppState> store,
  AddTodoAction action,
  NextDispatcher next,
) _firestoreAddTodo(TodoRepository repo) {
  return (store, action, next) {
    next(action);

    var todo = new Todo((b) => b..title = 'my todo');

    repo.addNewTodo(todo);
  };
}

void Function(
  Store<AppState> store,
  RequestTodoListEventsAction action,
  NextDispatcher next,
) _firestoreFetchTodos(TodoRepository repo) {
  return (store, action, next) {
    next(action);

    repo.todos().listen((todos) {
      store.dispatch(new LoadedTodosAction(todos));
    });
  };
}
