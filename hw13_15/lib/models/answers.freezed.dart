// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'answers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Answers {

@JsonKey(name: 'answer_a') String get answerA;@JsonKey(name: 'answer_b') String get answerB;@JsonKey(name: 'answer_c') String get answerC;@JsonKey(name: 'answer_d') String get answerD;@JsonKey(name: 'answer_e') String? get answerE;@JsonKey(name: 'answer_f') String? get answerF;
/// Create a copy of Answers
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AnswersCopyWith<Answers> get copyWith => _$AnswersCopyWithImpl<Answers>(this as Answers, _$identity);

  /// Serializes this Answers to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Answers&&(identical(other.answerA, answerA) || other.answerA == answerA)&&(identical(other.answerB, answerB) || other.answerB == answerB)&&(identical(other.answerC, answerC) || other.answerC == answerC)&&(identical(other.answerD, answerD) || other.answerD == answerD)&&(identical(other.answerE, answerE) || other.answerE == answerE)&&(identical(other.answerF, answerF) || other.answerF == answerF));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answerA,answerB,answerC,answerD,answerE,answerF);

@override
String toString() {
  return 'Answers(answerA: $answerA, answerB: $answerB, answerC: $answerC, answerD: $answerD, answerE: $answerE, answerF: $answerF)';
}


}

/// @nodoc
abstract mixin class $AnswersCopyWith<$Res>  {
  factory $AnswersCopyWith(Answers value, $Res Function(Answers) _then) = _$AnswersCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'answer_a') String answerA,@JsonKey(name: 'answer_b') String answerB,@JsonKey(name: 'answer_c') String answerC,@JsonKey(name: 'answer_d') String answerD,@JsonKey(name: 'answer_e') String? answerE,@JsonKey(name: 'answer_f') String? answerF
});




}
/// @nodoc
class _$AnswersCopyWithImpl<$Res>
    implements $AnswersCopyWith<$Res> {
  _$AnswersCopyWithImpl(this._self, this._then);

  final Answers _self;
  final $Res Function(Answers) _then;

/// Create a copy of Answers
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? answerA = null,Object? answerB = null,Object? answerC = null,Object? answerD = null,Object? answerE = freezed,Object? answerF = freezed,}) {
  return _then(_self.copyWith(
answerA: null == answerA ? _self.answerA : answerA // ignore: cast_nullable_to_non_nullable
as String,answerB: null == answerB ? _self.answerB : answerB // ignore: cast_nullable_to_non_nullable
as String,answerC: null == answerC ? _self.answerC : answerC // ignore: cast_nullable_to_non_nullable
as String,answerD: null == answerD ? _self.answerD : answerD // ignore: cast_nullable_to_non_nullable
as String,answerE: freezed == answerE ? _self.answerE : answerE // ignore: cast_nullable_to_non_nullable
as String?,answerF: freezed == answerF ? _self.answerF : answerF // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Answers].
extension AnswersPatterns on Answers {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Answers value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Answers() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Answers value)  $default,){
final _that = this;
switch (_that) {
case _Answers():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Answers value)?  $default,){
final _that = this;
switch (_that) {
case _Answers() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'answer_a')  String answerA, @JsonKey(name: 'answer_b')  String answerB, @JsonKey(name: 'answer_c')  String answerC, @JsonKey(name: 'answer_d')  String answerD, @JsonKey(name: 'answer_e')  String? answerE, @JsonKey(name: 'answer_f')  String? answerF)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Answers() when $default != null:
return $default(_that.answerA,_that.answerB,_that.answerC,_that.answerD,_that.answerE,_that.answerF);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'answer_a')  String answerA, @JsonKey(name: 'answer_b')  String answerB, @JsonKey(name: 'answer_c')  String answerC, @JsonKey(name: 'answer_d')  String answerD, @JsonKey(name: 'answer_e')  String? answerE, @JsonKey(name: 'answer_f')  String? answerF)  $default,) {final _that = this;
switch (_that) {
case _Answers():
return $default(_that.answerA,_that.answerB,_that.answerC,_that.answerD,_that.answerE,_that.answerF);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'answer_a')  String answerA, @JsonKey(name: 'answer_b')  String answerB, @JsonKey(name: 'answer_c')  String answerC, @JsonKey(name: 'answer_d')  String answerD, @JsonKey(name: 'answer_e')  String? answerE, @JsonKey(name: 'answer_f')  String? answerF)?  $default,) {final _that = this;
switch (_that) {
case _Answers() when $default != null:
return $default(_that.answerA,_that.answerB,_that.answerC,_that.answerD,_that.answerE,_that.answerF);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Answers implements Answers {
  const _Answers({@JsonKey(name: 'answer_a') required this.answerA, @JsonKey(name: 'answer_b') required this.answerB, @JsonKey(name: 'answer_c') required this.answerC, @JsonKey(name: 'answer_d') required this.answerD, @JsonKey(name: 'answer_e') this.answerE, @JsonKey(name: 'answer_f') this.answerF});
  factory _Answers.fromJson(Map<String, dynamic> json) => _$AnswersFromJson(json);

@override@JsonKey(name: 'answer_a') final  String answerA;
@override@JsonKey(name: 'answer_b') final  String answerB;
@override@JsonKey(name: 'answer_c') final  String answerC;
@override@JsonKey(name: 'answer_d') final  String answerD;
@override@JsonKey(name: 'answer_e') final  String? answerE;
@override@JsonKey(name: 'answer_f') final  String? answerF;

/// Create a copy of Answers
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AnswersCopyWith<_Answers> get copyWith => __$AnswersCopyWithImpl<_Answers>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AnswersToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Answers&&(identical(other.answerA, answerA) || other.answerA == answerA)&&(identical(other.answerB, answerB) || other.answerB == answerB)&&(identical(other.answerC, answerC) || other.answerC == answerC)&&(identical(other.answerD, answerD) || other.answerD == answerD)&&(identical(other.answerE, answerE) || other.answerE == answerE)&&(identical(other.answerF, answerF) || other.answerF == answerF));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,answerA,answerB,answerC,answerD,answerE,answerF);

@override
String toString() {
  return 'Answers(answerA: $answerA, answerB: $answerB, answerC: $answerC, answerD: $answerD, answerE: $answerE, answerF: $answerF)';
}


}

/// @nodoc
abstract mixin class _$AnswersCopyWith<$Res> implements $AnswersCopyWith<$Res> {
  factory _$AnswersCopyWith(_Answers value, $Res Function(_Answers) _then) = __$AnswersCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'answer_a') String answerA,@JsonKey(name: 'answer_b') String answerB,@JsonKey(name: 'answer_c') String answerC,@JsonKey(name: 'answer_d') String answerD,@JsonKey(name: 'answer_e') String? answerE,@JsonKey(name: 'answer_f') String? answerF
});




}
/// @nodoc
class __$AnswersCopyWithImpl<$Res>
    implements _$AnswersCopyWith<$Res> {
  __$AnswersCopyWithImpl(this._self, this._then);

  final _Answers _self;
  final $Res Function(_Answers) _then;

/// Create a copy of Answers
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? answerA = null,Object? answerB = null,Object? answerC = null,Object? answerD = null,Object? answerE = freezed,Object? answerF = freezed,}) {
  return _then(_Answers(
answerA: null == answerA ? _self.answerA : answerA // ignore: cast_nullable_to_non_nullable
as String,answerB: null == answerB ? _self.answerB : answerB // ignore: cast_nullable_to_non_nullable
as String,answerC: null == answerC ? _self.answerC : answerC // ignore: cast_nullable_to_non_nullable
as String,answerD: null == answerD ? _self.answerD : answerD // ignore: cast_nullable_to_non_nullable
as String,answerE: freezed == answerE ? _self.answerE : answerE // ignore: cast_nullable_to_non_nullable
as String?,answerF: freezed == answerF ? _self.answerF : answerF // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
