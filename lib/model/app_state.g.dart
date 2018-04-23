// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

// **************************************************************************
// Generator: BuiltValueGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line
// ignore_for_file: annotate_overrides
// ignore_for_file: avoid_annotating_with_dynamic
// ignore_for_file: avoid_returning_this
// ignore_for_file: omit_local_variable_types
// ignore_for_file: prefer_expression_function_bodies
// ignore_for_file: sort_constructors_first

class _$AppState extends AppState {
  @override
  final Todo todo;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._({this.todo}) : super._() {
    if (todo == null) throw new BuiltValueNullFieldError('AppState', 'todo');
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(dynamic other) {
    if (identical(other, this)) return true;
    if (other is! AppState) return false;
    return todo == other.todo;
  }

  @override
  int get hashCode {
    return $jf($jc(0, todo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')..add('todo', todo))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  TodoBuilder _todo;
  TodoBuilder get todo => _$this._todo ??= new TodoBuilder();
  set todo(TodoBuilder todo) => _$this._todo = todo;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _todo = _$v.todo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) throw new ArgumentError.notNull('other');
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ?? new _$AppState._(todo: todo.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'todo';
        todo.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}