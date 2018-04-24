library reducers;

import 'package:todo_list/model/models.dart';

AppState appStateReducer(AppState state, dynamic action) {
  return state..rebuild((b) => b);
}
