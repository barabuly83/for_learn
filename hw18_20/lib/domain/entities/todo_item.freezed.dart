// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TodoItem _$TodoItemFromJson(Map<String, dynamic> json) {
  return _TodoItem.fromJson(json);
}

/// @nodoc
mixin _$TodoItem {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TodoItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodoItemCopyWith<TodoItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoItemCopyWith<$Res> {
  factory $TodoItemCopyWith(TodoItem value, $Res Function(TodoItem) then) =
      _$TodoItemCopyWithImpl<$Res, TodoItem>;
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String userId,
    bool isCompleted,
    int order,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$TodoItemCopyWithImpl<$Res, $Val extends TodoItem>
    implements $TodoItemCopyWith<$Res> {
  _$TodoItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? userId = null,
    Object? isCompleted = null,
    Object? order = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as String,
            isCompleted: null == isCompleted
                ? _value.isCompleted
                : isCompleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as int,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TodoItemImplCopyWith<$Res>
    implements $TodoItemCopyWith<$Res> {
  factory _$$TodoItemImplCopyWith(
    _$TodoItemImpl value,
    $Res Function(_$TodoItemImpl) then,
  ) = __$$TodoItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String title,
    String description,
    String userId,
    bool isCompleted,
    int order,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$TodoItemImplCopyWithImpl<$Res>
    extends _$TodoItemCopyWithImpl<$Res, _$TodoItemImpl>
    implements _$$TodoItemImplCopyWith<$Res> {
  __$$TodoItemImplCopyWithImpl(
    _$TodoItemImpl _value,
    $Res Function(_$TodoItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TodoItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? userId = null,
    Object? isCompleted = null,
    Object? order = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$TodoItemImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        isCompleted: null == isCompleted
            ? _value.isCompleted
            : isCompleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as int,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TodoItemImpl implements _TodoItem {
  const _$TodoItemImpl({
    required this.id,
    required this.title,
    required this.description,
    required this.userId,
    this.isCompleted = false,
    this.order = 0,
    this.createdAt,
    this.updatedAt,
  });

  factory _$TodoItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodoItemImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String userId;
  @override
  @JsonKey()
  final bool isCompleted;
  @override
  @JsonKey()
  final int order;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'TodoItem(id: $id, title: $title, description: $description, userId: $userId, isCompleted: $isCompleted, order: $order, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    title,
    description,
    userId,
    isCompleted,
    order,
    createdAt,
    updatedAt,
  );

  /// Create a copy of TodoItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoItemImplCopyWith<_$TodoItemImpl> get copyWith =>
      __$$TodoItemImplCopyWithImpl<_$TodoItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodoItemImplToJson(this);
  }
}

abstract class _TodoItem implements TodoItem {
  const factory _TodoItem({
    required final String id,
    required final String title,
    required final String description,
    required final String userId,
    final bool isCompleted,
    final int order,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$TodoItemImpl;

  factory _TodoItem.fromJson(Map<String, dynamic> json) =
      _$TodoItemImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get userId;
  @override
  bool get isCompleted;
  @override
  int get order;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of TodoItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoItemImplCopyWith<_$TodoItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
