// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TodoState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoStateCopyWith<$Res> {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) then) =
      _$TodoStateCopyWithImpl<$Res, TodoState>;
}

/// @nodoc
class _$TodoStateCopyWithImpl<$Res, $Val extends TodoState>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TodoInitialImplCopyWith<$Res> {
  factory _$$TodoInitialImplCopyWith(
    _$TodoInitialImpl value,
    $Res Function(_$TodoInitialImpl) then,
  ) = __$$TodoInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoInitialImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoInitialImpl>
    implements _$$TodoInitialImplCopyWith<$Res> {
  __$$TodoInitialImplCopyWithImpl(
    _$TodoInitialImpl _value,
    $Res Function(_$TodoInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodoInitialImpl implements TodoInitial {
  const _$TodoInitialImpl();

  @override
  String toString() {
    return 'TodoState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class TodoInitial implements TodoState {
  const factory TodoInitial() = _$TodoInitialImpl;
}

/// @nodoc
abstract class _$$TodoLoadingImplCopyWith<$Res> {
  factory _$$TodoLoadingImplCopyWith(
    _$TodoLoadingImpl value,
    $Res Function(_$TodoLoadingImpl) then,
  ) = __$$TodoLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TodoLoadingImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoLoadingImpl>
    implements _$$TodoLoadingImplCopyWith<$Res> {
  __$$TodoLoadingImplCopyWithImpl(
    _$TodoLoadingImpl _value,
    $Res Function(_$TodoLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TodoLoadingImpl implements TodoLoading {
  const _$TodoLoadingImpl();

  @override
  String toString() {
    return 'TodoState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TodoLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TodoLoading implements TodoState {
  const factory TodoLoading() = _$TodoLoadingImpl;
}

/// @nodoc
abstract class _$$TodoCreatedImplCopyWith<$Res> {
  factory _$$TodoCreatedImplCopyWith(
    _$TodoCreatedImpl value,
    $Res Function(_$TodoCreatedImpl) then,
  ) = __$$TodoCreatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoItem todo});

  $TodoItemCopyWith<$Res> get todo;
}

/// @nodoc
class __$$TodoCreatedImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoCreatedImpl>
    implements _$$TodoCreatedImplCopyWith<$Res> {
  __$$TodoCreatedImplCopyWithImpl(
    _$TodoCreatedImpl _value,
    $Res Function(_$TodoCreatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todo = null}) {
    return _then(
      _$TodoCreatedImpl(
        null == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as TodoItem,
      ),
    );
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoItemCopyWith<$Res> get todo {
    return $TodoItemCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$TodoCreatedImpl implements TodoCreated {
  const _$TodoCreatedImpl(this.todo);

  @override
  final TodoItem todo;

  @override
  String toString() {
    return 'TodoState.created(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoCreatedImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoCreatedImplCopyWith<_$TodoCreatedImpl> get copyWith =>
      __$$TodoCreatedImplCopyWithImpl<_$TodoCreatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return created(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return created?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return created(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return created?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (created != null) {
      return created(this);
    }
    return orElse();
  }
}

abstract class TodoCreated implements TodoState {
  const factory TodoCreated(final TodoItem todo) = _$TodoCreatedImpl;

  TodoItem get todo;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoCreatedImplCopyWith<_$TodoCreatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoErrorImplCopyWith<$Res> {
  factory _$$TodoErrorImplCopyWith(
    _$TodoErrorImpl value,
    $Res Function(_$TodoErrorImpl) then,
  ) = __$$TodoErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TodoErrorImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoErrorImpl>
    implements _$$TodoErrorImplCopyWith<$Res> {
  __$$TodoErrorImplCopyWithImpl(
    _$TodoErrorImpl _value,
    $Res Function(_$TodoErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$TodoErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TodoErrorImpl implements TodoError {
  const _$TodoErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TodoState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoErrorImplCopyWith<_$TodoErrorImpl> get copyWith =>
      __$$TodoErrorImplCopyWithImpl<_$TodoErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TodoError implements TodoState {
  const factory TodoError(final String message) = _$TodoErrorImpl;

  String get message;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoErrorImplCopyWith<_$TodoErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodosLoadedImplCopyWith<$Res> {
  factory _$$TodosLoadedImplCopyWith(
    _$TodosLoadedImpl value,
    $Res Function(_$TodosLoadedImpl) then,
  ) = __$$TodosLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TodoItem> todos});
}

/// @nodoc
class __$$TodosLoadedImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodosLoadedImpl>
    implements _$$TodosLoadedImplCopyWith<$Res> {
  __$$TodosLoadedImplCopyWithImpl(
    _$TodosLoadedImpl _value,
    $Res Function(_$TodosLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todos = null}) {
    return _then(
      _$TodosLoadedImpl(
        null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TodoItem>,
      ),
    );
  }
}

/// @nodoc

class _$TodosLoadedImpl implements TodosLoaded {
  const _$TodosLoadedImpl(final List<TodoItem> todos) : _todos = todos;

  final List<TodoItem> _todos;
  @override
  List<TodoItem> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  String toString() {
    return 'TodoState.loaded(todos: $todos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodosLoadedImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_todos));

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodosLoadedImplCopyWith<_$TodosLoadedImpl> get copyWith =>
      __$$TodosLoadedImplCopyWithImpl<_$TodosLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return loaded(todos);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return loaded?.call(todos);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(todos);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TodosLoaded implements TodoState {
  const factory TodosLoaded(final List<TodoItem> todos) = _$TodosLoadedImpl;

  List<TodoItem> get todos;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodosLoadedImplCopyWith<_$TodosLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoDeletedImplCopyWith<$Res> {
  factory _$$TodoDeletedImplCopyWith(
    _$TodoDeletedImpl value,
    $Res Function(_$TodoDeletedImpl) then,
  ) = __$$TodoDeletedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$TodoDeletedImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoDeletedImpl>
    implements _$$TodoDeletedImplCopyWith<$Res> {
  __$$TodoDeletedImplCopyWithImpl(
    _$TodoDeletedImpl _value,
    $Res Function(_$TodoDeletedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todoId = null}) {
    return _then(
      _$TodoDeletedImpl(
        null == todoId
            ? _value.todoId
            : todoId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TodoDeletedImpl implements TodoDeleted {
  const _$TodoDeletedImpl(this.todoId);

  @override
  final String todoId;

  @override
  String toString() {
    return 'TodoState.deleted(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoDeletedImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoDeletedImplCopyWith<_$TodoDeletedImpl> get copyWith =>
      __$$TodoDeletedImplCopyWithImpl<_$TodoDeletedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return deleted(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return deleted?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class TodoDeleted implements TodoState {
  const factory TodoDeleted(final String todoId) = _$TodoDeletedImpl;

  String get todoId;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoDeletedImplCopyWith<_$TodoDeletedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TodoUpdatedImplCopyWith<$Res> {
  factory _$$TodoUpdatedImplCopyWith(
    _$TodoUpdatedImpl value,
    $Res Function(_$TodoUpdatedImpl) then,
  ) = __$$TodoUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TodoItem todo});

  $TodoItemCopyWith<$Res> get todo;
}

/// @nodoc
class __$$TodoUpdatedImplCopyWithImpl<$Res>
    extends _$TodoStateCopyWithImpl<$Res, _$TodoUpdatedImpl>
    implements _$$TodoUpdatedImplCopyWith<$Res> {
  __$$TodoUpdatedImplCopyWithImpl(
    _$TodoUpdatedImpl _value,
    $Res Function(_$TodoUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todo = null}) {
    return _then(
      _$TodoUpdatedImpl(
        null == todo
            ? _value.todo
            : todo // ignore: cast_nullable_to_non_nullable
                  as TodoItem,
      ),
    );
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TodoItemCopyWith<$Res> get todo {
    return $TodoItemCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$TodoUpdatedImpl implements TodoUpdated {
  const _$TodoUpdatedImpl(this.todo);

  @override
  final TodoItem todo;

  @override
  String toString() {
    return 'TodoState.updated(todo: $todo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoUpdatedImpl &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoUpdatedImplCopyWith<_$TodoUpdatedImpl> get copyWith =>
      __$$TodoUpdatedImplCopyWithImpl<_$TodoUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TodoItem todo) created,
    required TResult Function(String message) error,
    required TResult Function(List<TodoItem> todos) loaded,
    required TResult Function(String todoId) deleted,
    required TResult Function(TodoItem todo) updated,
  }) {
    return updated(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TodoItem todo)? created,
    TResult? Function(String message)? error,
    TResult? Function(List<TodoItem> todos)? loaded,
    TResult? Function(String todoId)? deleted,
    TResult? Function(TodoItem todo)? updated,
  }) {
    return updated?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TodoItem todo)? created,
    TResult Function(String message)? error,
    TResult Function(List<TodoItem> todos)? loaded,
    TResult Function(String todoId)? deleted,
    TResult Function(TodoItem todo)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TodoInitial value) initial,
    required TResult Function(TodoLoading value) loading,
    required TResult Function(TodoCreated value) created,
    required TResult Function(TodoError value) error,
    required TResult Function(TodosLoaded value) loaded,
    required TResult Function(TodoDeleted value) deleted,
    required TResult Function(TodoUpdated value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TodoInitial value)? initial,
    TResult? Function(TodoLoading value)? loading,
    TResult? Function(TodoCreated value)? created,
    TResult? Function(TodoError value)? error,
    TResult? Function(TodosLoaded value)? loaded,
    TResult? Function(TodoDeleted value)? deleted,
    TResult? Function(TodoUpdated value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TodoInitial value)? initial,
    TResult Function(TodoLoading value)? loading,
    TResult Function(TodoCreated value)? created,
    TResult Function(TodoError value)? error,
    TResult Function(TodosLoaded value)? loaded,
    TResult Function(TodoDeleted value)? deleted,
    TResult Function(TodoUpdated value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class TodoUpdated implements TodoState {
  const factory TodoUpdated(final TodoItem todo) = _$TodoUpdatedImpl;

  TodoItem get todo;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoUpdatedImplCopyWith<_$TodoUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
