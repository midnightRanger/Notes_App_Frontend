// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ModelResponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ModelResponse _$ModelResponseFromJson(Map<String, dynamic> json) {
  return _ModelResponse.fromJson(json);
}

/// @nodoc
mixin _$ModelResponse {
  String? get error => throw _privateConstructorUsedError;
  dynamic get data => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ModelResponseCopyWith<ModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModelResponseCopyWith<$Res> {
  factory $ModelResponseCopyWith(
          ModelResponse value, $Res Function(ModelResponse) then) =
      _$ModelResponseCopyWithImpl<$Res, ModelResponse>;
  @useResult
  $Res call({String? error, dynamic data, String? message});
}

/// @nodoc
class _$ModelResponseCopyWithImpl<$Res, $Val extends ModelResponse>
    implements $ModelResponseCopyWith<$Res> {
  _$ModelResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ModelResponseCopyWith<$Res>
    implements $ModelResponseCopyWith<$Res> {
  factory _$$_ModelResponseCopyWith(
          _$_ModelResponse value, $Res Function(_$_ModelResponse) then) =
      __$$_ModelResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? error, dynamic data, String? message});
}

/// @nodoc
class __$$_ModelResponseCopyWithImpl<$Res>
    extends _$ModelResponseCopyWithImpl<$Res, _$_ModelResponse>
    implements _$$_ModelResponseCopyWith<$Res> {
  __$$_ModelResponseCopyWithImpl(
      _$_ModelResponse _value, $Res Function(_$_ModelResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? data = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_ModelResponse(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ModelResponse implements _ModelResponse {
  const _$_ModelResponse(
      {required this.error, required this.data, required this.message});

  factory _$_ModelResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ModelResponseFromJson(json);

  @override
  final String? error;
  @override
  final dynamic data;
  @override
  final String? message;

  @override
  String toString() {
    return 'ModelResponse(error: $error, data: $data, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ModelResponse &&
            (identical(other.error, error) || other.error == error) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, error, const DeepCollectionEquality().hash(data), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ModelResponseCopyWith<_$_ModelResponse> get copyWith =>
      __$$_ModelResponseCopyWithImpl<_$_ModelResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ModelResponseToJson(
      this,
    );
  }
}

abstract class _ModelResponse implements ModelResponse {
  const factory _ModelResponse(
      {required final String? error,
      required final dynamic data,
      required final String? message}) = _$_ModelResponse;

  factory _ModelResponse.fromJson(Map<String, dynamic> json) =
      _$_ModelResponse.fromJson;

  @override
  String? get error;
  @override
  dynamic get data;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_ModelResponseCopyWith<_$_ModelResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
