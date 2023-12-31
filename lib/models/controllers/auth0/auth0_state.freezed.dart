// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth0_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Auth0State {
  bool get isBusy => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;
  Credentials? get data => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Auth0StateCopyWith<Auth0State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Auth0StateCopyWith<$Res> {
  factory $Auth0StateCopyWith(
          Auth0State value, $Res Function(Auth0State) then) =
      _$Auth0StateCopyWithImpl<$Res, Auth0State>;
  @useResult
  $Res call(
      {bool isBusy, bool isLoggedIn, Credentials? data, String? errorMessage});
}

/// @nodoc
class _$Auth0StateCopyWithImpl<$Res, $Val extends Auth0State>
    implements $Auth0StateCopyWith<$Res> {
  _$Auth0StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? isLoggedIn = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Credentials?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$Auth0StateImplCopyWith<$Res>
    implements $Auth0StateCopyWith<$Res> {
  factory _$$Auth0StateImplCopyWith(
          _$Auth0StateImpl value, $Res Function(_$Auth0StateImpl) then) =
      __$$Auth0StateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isBusy, bool isLoggedIn, Credentials? data, String? errorMessage});
}

/// @nodoc
class __$$Auth0StateImplCopyWithImpl<$Res>
    extends _$Auth0StateCopyWithImpl<$Res, _$Auth0StateImpl>
    implements _$$Auth0StateImplCopyWith<$Res> {
  __$$Auth0StateImplCopyWithImpl(
      _$Auth0StateImpl _value, $Res Function(_$Auth0StateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBusy = null,
    Object? isLoggedIn = null,
    Object? data = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$Auth0StateImpl(
      isBusy: null == isBusy
          ? _value.isBusy
          : isBusy // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Credentials?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Auth0StateImpl with DiagnosticableTreeMixin implements _Auth0State {
  const _$Auth0StateImpl(
      {this.isBusy = false,
      this.isLoggedIn = false,
      this.data,
      this.errorMessage});

  @override
  @JsonKey()
  final bool isBusy;
  @override
  @JsonKey()
  final bool isLoggedIn;
  @override
  final Credentials? data;
  @override
  final String? errorMessage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Auth0State(isBusy: $isBusy, isLoggedIn: $isLoggedIn, data: $data, errorMessage: $errorMessage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Auth0State'))
      ..add(DiagnosticsProperty('isBusy', isBusy))
      ..add(DiagnosticsProperty('isLoggedIn', isLoggedIn))
      ..add(DiagnosticsProperty('data', data))
      ..add(DiagnosticsProperty('errorMessage', errorMessage));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Auth0StateImpl &&
            (identical(other.isBusy, isBusy) || other.isBusy == isBusy) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isBusy, isLoggedIn, data, errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$Auth0StateImplCopyWith<_$Auth0StateImpl> get copyWith =>
      __$$Auth0StateImplCopyWithImpl<_$Auth0StateImpl>(this, _$identity);
}

abstract class _Auth0State implements Auth0State {
  const factory _Auth0State(
      {final bool isBusy,
      final bool isLoggedIn,
      final Credentials? data,
      final String? errorMessage}) = _$Auth0StateImpl;

  @override
  bool get isBusy;
  @override
  bool get isLoggedIn;
  @override
  Credentials? get data;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$Auth0StateImplCopyWith<_$Auth0StateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
