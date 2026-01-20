// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_argument.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultArgument {

 String get category; String get correctAnswers;
/// Create a copy of ResultArgument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultArgumentCopyWith<ResultArgument> get copyWith => _$ResultArgumentCopyWithImpl<ResultArgument>(this as ResultArgument, _$identity);

  /// Serializes this ResultArgument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultArgument&&(identical(other.category, category) || other.category == category)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,correctAnswers);

@override
String toString() {
  return 'ResultArgument(category: $category, correctAnswers: $correctAnswers)';
}


}

/// @nodoc
abstract mixin class $ResultArgumentCopyWith<$Res>  {
  factory $ResultArgumentCopyWith(ResultArgument value, $Res Function(ResultArgument) _then) = _$ResultArgumentCopyWithImpl;
@useResult
$Res call({
 String category, String correctAnswers
});




}
/// @nodoc
class _$ResultArgumentCopyWithImpl<$Res>
    implements $ResultArgumentCopyWith<$Res> {
  _$ResultArgumentCopyWithImpl(this._self, this._then);

  final ResultArgument _self;
  final $Res Function(ResultArgument) _then;

/// Create a copy of ResultArgument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? correctAnswers = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ResultArgument].
extension ResultArgumentPatterns on ResultArgument {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultArgument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultArgument() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultArgument value)  $default,){
final _that = this;
switch (_that) {
case _ResultArgument():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultArgument value)?  $default,){
final _that = this;
switch (_that) {
case _ResultArgument() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String category,  String correctAnswers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultArgument() when $default != null:
return $default(_that.category,_that.correctAnswers);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String category,  String correctAnswers)  $default,) {final _that = this;
switch (_that) {
case _ResultArgument():
return $default(_that.category,_that.correctAnswers);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String category,  String correctAnswers)?  $default,) {final _that = this;
switch (_that) {
case _ResultArgument() when $default != null:
return $default(_that.category,_that.correctAnswers);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultArgument implements ResultArgument {
  const _ResultArgument({required this.category, required this.correctAnswers});
  factory _ResultArgument.fromJson(Map<String, dynamic> json) => _$ResultArgumentFromJson(json);

@override final  String category;
@override final  String correctAnswers;

/// Create a copy of ResultArgument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultArgumentCopyWith<_ResultArgument> get copyWith => __$ResultArgumentCopyWithImpl<_ResultArgument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultArgumentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultArgument&&(identical(other.category, category) || other.category == category)&&(identical(other.correctAnswers, correctAnswers) || other.correctAnswers == correctAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,correctAnswers);

@override
String toString() {
  return 'ResultArgument(category: $category, correctAnswers: $correctAnswers)';
}


}

/// @nodoc
abstract mixin class _$ResultArgumentCopyWith<$Res> implements $ResultArgumentCopyWith<$Res> {
  factory _$ResultArgumentCopyWith(_ResultArgument value, $Res Function(_ResultArgument) _then) = __$ResultArgumentCopyWithImpl;
@override @useResult
$Res call({
 String category, String correctAnswers
});




}
/// @nodoc
class __$ResultArgumentCopyWithImpl<$Res>
    implements _$ResultArgumentCopyWith<$Res> {
  __$ResultArgumentCopyWithImpl(this._self, this._then);

  final _ResultArgument _self;
  final $Res Function(_ResultArgument) _then;

/// Create a copy of ResultArgument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? correctAnswers = null,}) {
  return _then(_ResultArgument(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,correctAnswers: null == correctAnswers ? _self.correctAnswers : correctAnswers // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
