// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final ActionDispatcher<Todo> addTodo =
      new ActionDispatcher<Todo>('AppActions-addTodo');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    addTodo.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final ActionName<Todo> addTodo =
      new ActionName<Todo>('AppActions-addTodo');
}
