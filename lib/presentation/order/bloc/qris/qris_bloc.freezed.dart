// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qris_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$QrisEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQrCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQrCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQrCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQrCode value) generateQrCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQrCode value)? generateQrCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQrCode value)? generateQrCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrisEventCopyWith<$Res> {
  factory $QrisEventCopyWith(QrisEvent value, $Res Function(QrisEvent) then) =
      _$QrisEventCopyWithImpl<$Res, QrisEvent>;
}

/// @nodoc
class _$QrisEventCopyWithImpl<$Res, $Val extends QrisEvent>
    implements $QrisEventCopyWith<$Res> {
  _$QrisEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$QrisEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'QrisEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQrCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQrCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQrCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQrCode value) generateQrCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQrCode value)? generateQrCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQrCode value)? generateQrCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements QrisEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GenerateQrCodeImplCopyWith<$Res> {
  factory _$$GenerateQrCodeImplCopyWith(_$GenerateQrCodeImpl value,
          $Res Function(_$GenerateQrCodeImpl) then) =
      __$$GenerateQrCodeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId, int grossAmount});
}

/// @nodoc
class __$$GenerateQrCodeImplCopyWithImpl<$Res>
    extends _$QrisEventCopyWithImpl<$Res, _$GenerateQrCodeImpl>
    implements _$$GenerateQrCodeImplCopyWith<$Res> {
  __$$GenerateQrCodeImplCopyWithImpl(
      _$GenerateQrCodeImpl _value, $Res Function(_$GenerateQrCodeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? grossAmount = null,
  }) {
    return _then(_$GenerateQrCodeImpl(
      null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      null == grossAmount
          ? _value.grossAmount
          : grossAmount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$GenerateQrCodeImpl implements _GenerateQrCode {
  const _$GenerateQrCodeImpl(this.orderId, this.grossAmount);

  @override
  final String orderId;
  @override
  final int grossAmount;

  @override
  String toString() {
    return 'QrisEvent.generateQrCode(orderId: $orderId, grossAmount: $grossAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateQrCodeImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.grossAmount, grossAmount) ||
                other.grossAmount == grossAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId, grossAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateQrCodeImplCopyWith<_$GenerateQrCodeImpl> get copyWith =>
      __$$GenerateQrCodeImplCopyWithImpl<_$GenerateQrCodeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQrCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) {
    return generateQrCode(orderId, grossAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQrCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) {
    return generateQrCode?.call(orderId, grossAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQrCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (generateQrCode != null) {
      return generateQrCode(orderId, grossAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQrCode value) generateQrCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return generateQrCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQrCode value)? generateQrCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return generateQrCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQrCode value)? generateQrCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (generateQrCode != null) {
      return generateQrCode(this);
    }
    return orElse();
  }
}

abstract class _GenerateQrCode implements QrisEvent {
  const factory _GenerateQrCode(final String orderId, final int grossAmount) =
      _$GenerateQrCodeImpl;

  String get orderId;
  int get grossAmount;
  @JsonKey(ignore: true)
  _$$GenerateQrCodeImplCopyWith<_$GenerateQrCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckPaymentStatusImplCopyWith<$Res> {
  factory _$$CheckPaymentStatusImplCopyWith(_$CheckPaymentStatusImpl value,
          $Res Function(_$CheckPaymentStatusImpl) then) =
      __$$CheckPaymentStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class __$$CheckPaymentStatusImplCopyWithImpl<$Res>
    extends _$QrisEventCopyWithImpl<$Res, _$CheckPaymentStatusImpl>
    implements _$$CheckPaymentStatusImplCopyWith<$Res> {
  __$$CheckPaymentStatusImplCopyWithImpl(_$CheckPaymentStatusImpl _value,
      $Res Function(_$CheckPaymentStatusImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
  }) {
    return _then(_$CheckPaymentStatusImpl(
      null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CheckPaymentStatusImpl implements _CheckPaymentStatus {
  const _$CheckPaymentStatusImpl(this.orderId);

  @override
  final String orderId;

  @override
  String toString() {
    return 'QrisEvent.checkPaymentStatus(orderId: $orderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckPaymentStatusImpl &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckPaymentStatusImplCopyWith<_$CheckPaymentStatusImpl> get copyWith =>
      __$$CheckPaymentStatusImplCopyWithImpl<_$CheckPaymentStatusImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String orderId, int grossAmount) generateQrCode,
    required TResult Function(String orderId) checkPaymentStatus,
  }) {
    return checkPaymentStatus(orderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String orderId, int grossAmount)? generateQrCode,
    TResult? Function(String orderId)? checkPaymentStatus,
  }) {
    return checkPaymentStatus?.call(orderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String orderId, int grossAmount)? generateQrCode,
    TResult Function(String orderId)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(orderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GenerateQrCode value) generateQrCode,
    required TResult Function(_CheckPaymentStatus value) checkPaymentStatus,
  }) {
    return checkPaymentStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GenerateQrCode value)? generateQrCode,
    TResult? Function(_CheckPaymentStatus value)? checkPaymentStatus,
  }) {
    return checkPaymentStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GenerateQrCode value)? generateQrCode,
    TResult Function(_CheckPaymentStatus value)? checkPaymentStatus,
    required TResult orElse(),
  }) {
    if (checkPaymentStatus != null) {
      return checkPaymentStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckPaymentStatus implements QrisEvent {
  const factory _CheckPaymentStatus(final String orderId) =
      _$CheckPaymentStatusImpl;

  String get orderId;
  @JsonKey(ignore: true)
  _$$CheckPaymentStatusImplCopyWith<_$CheckPaymentStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$QrisState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QrisStateCopyWith<$Res> {
  factory $QrisStateCopyWith(QrisState value, $Res Function(QrisState) then) =
      _$QrisStateCopyWithImpl<$Res, QrisState>;
}

/// @nodoc
class _$QrisStateCopyWithImpl<$Res, $Val extends QrisState>
    implements $QrisStateCopyWith<$Res> {
  _$QrisStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'QrisState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements QrisState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'QrisState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements QrisState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$QrisResponseImplCopyWith<$Res> {
  factory _$$QrisResponseImplCopyWith(
          _$QrisResponseImpl value, $Res Function(_$QrisResponseImpl) then) =
      __$$QrisResponseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MidtransQrisResponse qrisResponse});
}

/// @nodoc
class __$$QrisResponseImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$QrisResponseImpl>
    implements _$$QrisResponseImplCopyWith<$Res> {
  __$$QrisResponseImplCopyWithImpl(
      _$QrisResponseImpl _value, $Res Function(_$QrisResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? qrisResponse = null,
  }) {
    return _then(_$QrisResponseImpl(
      null == qrisResponse
          ? _value.qrisResponse
          : qrisResponse // ignore: cast_nullable_to_non_nullable
              as MidtransQrisResponse,
    ));
  }
}

/// @nodoc

class _$QrisResponseImpl implements _QrisResponse {
  const _$QrisResponseImpl(this.qrisResponse);

  @override
  final MidtransQrisResponse qrisResponse;

  @override
  String toString() {
    return 'QrisState.qrisResponse(qrisResponse: $qrisResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QrisResponseImpl &&
            (identical(other.qrisResponse, qrisResponse) ||
                other.qrisResponse == qrisResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, qrisResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QrisResponseImplCopyWith<_$QrisResponseImpl> get copyWith =>
      __$$QrisResponseImplCopyWithImpl<_$QrisResponseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) {
    return qrisResponse(this.qrisResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) {
    return qrisResponse?.call(this.qrisResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (qrisResponse != null) {
      return qrisResponse(this.qrisResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return qrisResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return qrisResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (qrisResponse != null) {
      return qrisResponse(this);
    }
    return orElse();
  }
}

abstract class _QrisResponse implements QrisState {
  const factory _QrisResponse(final MidtransQrisResponse qrisResponse) =
      _$QrisResponseImpl;

  MidtransQrisResponse get qrisResponse;
  @JsonKey(ignore: true)
  _$$QrisResponseImplCopyWith<_$QrisResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CheckStatusQrisImplCopyWith<$Res> {
  factory _$$CheckStatusQrisImplCopyWith(_$CheckStatusQrisImpl value,
          $Res Function(_$CheckStatusQrisImpl) then) =
      __$$CheckStatusQrisImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MidtransCheckStatusQrisResponse checkStatusQrisResponse});
}

/// @nodoc
class __$$CheckStatusQrisImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$CheckStatusQrisImpl>
    implements _$$CheckStatusQrisImplCopyWith<$Res> {
  __$$CheckStatusQrisImplCopyWithImpl(
      _$CheckStatusQrisImpl _value, $Res Function(_$CheckStatusQrisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? checkStatusQrisResponse = null,
  }) {
    return _then(_$CheckStatusQrisImpl(
      null == checkStatusQrisResponse
          ? _value.checkStatusQrisResponse
          : checkStatusQrisResponse // ignore: cast_nullable_to_non_nullable
              as MidtransCheckStatusQrisResponse,
    ));
  }
}

/// @nodoc

class _$CheckStatusQrisImpl implements _CheckStatusQris {
  const _$CheckStatusQrisImpl(this.checkStatusQrisResponse);

  @override
  final MidtransCheckStatusQrisResponse checkStatusQrisResponse;

  @override
  String toString() {
    return 'QrisState.checkStatus(checkStatusQrisResponse: $checkStatusQrisResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckStatusQrisImpl &&
            (identical(
                    other.checkStatusQrisResponse, checkStatusQrisResponse) ||
                other.checkStatusQrisResponse == checkStatusQrisResponse));
  }

  @override
  int get hashCode => Object.hash(runtimeType, checkStatusQrisResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckStatusQrisImplCopyWith<_$CheckStatusQrisImpl> get copyWith =>
      __$$CheckStatusQrisImplCopyWithImpl<_$CheckStatusQrisImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) {
    return checkStatus(checkStatusQrisResponse);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) {
    return checkStatus?.call(checkStatusQrisResponse);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(checkStatusQrisResponse);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return checkStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return checkStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (checkStatus != null) {
      return checkStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckStatusQris implements QrisState {
  const factory _CheckStatusQris(
          final MidtransCheckStatusQrisResponse checkStatusQrisResponse) =
      _$CheckStatusQrisImpl;

  MidtransCheckStatusQrisResponse get checkStatusQrisResponse;
  @JsonKey(ignore: true)
  _$$CheckStatusQrisImplCopyWith<_$CheckStatusQrisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuccessImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'QrisState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements QrisState {
  const factory _Success(final String message) = _$SuccessImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$QrisStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'QrisState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(MidtransQrisResponse qrisResponse) qrisResponse,
    required TResult Function(
            MidtransCheckStatusQrisResponse checkStatusQrisResponse)
        checkStatus,
    required TResult Function(String message) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult? Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult? Function(String message)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(MidtransQrisResponse qrisResponse)? qrisResponse,
    TResult Function(MidtransCheckStatusQrisResponse checkStatusQrisResponse)?
        checkStatus,
    TResult Function(String message)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_QrisResponse value) qrisResponse,
    required TResult Function(_CheckStatusQris value) checkStatus,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_QrisResponse value)? qrisResponse,
    TResult? Function(_CheckStatusQris value)? checkStatus,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_QrisResponse value)? qrisResponse,
    TResult Function(_CheckStatusQris value)? checkStatus,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements QrisState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
