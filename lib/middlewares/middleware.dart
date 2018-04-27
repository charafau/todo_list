import 'package:firebase_database/firebase_database.dart';
import 'package:redux/redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';
import 'package:todo_list/repositories/todo_repository.dart';

final reference = FirebaseDatabase.instance.reference().child('todos');

List<Middleware<AppState>> createStoreTodosMiddleware(
    TodoRepository todosRepository) {
  return [
    new TypedMiddleware<AppState, LoadTodosAction>(
        _databaseConnect(todosRepository)),
    new TypedMiddleware<AppState, AddTodoAction>(_databaseSaveNewTodo(todosRepository)),
  ];
}

void Function(
    Store<AppState> store, AddTodoAction action, NextDispatcher next)
_databaseSaveNewTodo(TodoRepository repository) {
  return (store, action, next) {
    next(action);

    repository.addNewTodo(action.todo);
  };
}

void Function(
        Store<AppState> store, LoadTodosAction action, NextDispatcher next)
    _databaseConnect(
  TodoRepository repository,
) {
  return (store, action, next) {
    next(action);

    repository.todos().listen((todos) {
      store.dispatch(new LoadTodosAction(todos));
    });
  };
}
