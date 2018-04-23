import 'dart:async';

import 'package:built_redux/built_redux.dart';
import 'package:todo_list/actions/actions.dart';
import 'package:todo_list/model/models.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

//Stream<dynamic> todosEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
//  return new Observable(actions)
//      .where((action) => action is AppActionsName<Todo>)
//}

//Observable todoEpic(Observable<Action<dynamic>> stream, MiddlewareApi<AppState, AppStateBuilder, AppActions> mwApi) =>
//    stream
//        .where((action) => action.name == AppActionsNames.requestTodos)
//    .map((action) => action as Action<Null>)
//    .asyncMap(
//(action) =>
//    );


