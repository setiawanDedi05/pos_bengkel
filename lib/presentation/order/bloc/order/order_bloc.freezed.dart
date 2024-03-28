// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String paymentMethod, List<OrderItem> items)
        addPaymentMethod,
    required TResult Function(int nominal) addNominal,
    required TResult Function(int fee) addServiceFee,
    required TResult Function(String name) addOrderName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult? Function(int nominal)? addNominal,
    TResult? Function(int fee)? addServiceFee,
    TResult? Function(String name)? addOrderName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult Function(int nominal)? addNominal,
    TResult Function(int fee)? addServiceFee,
    TResult Function(String name)? addOrderName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddPaymentMethod value) addPaymentMethod,
    required TResult Function(_AddNominal value) addNominal,
    required TResult Function(_AddServiceFee value) addServiceFee,
    required TResult Function(_AddOrderName value) addOrderName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult? Function(_AddNominal value)? addNominal,
    TResult? Function(_AddServiceFee value)? addServiceFee,
    TResult? Function(_AddOrderName value)? addOrderName,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult Function(_AddNominal value)? addNominal,
    TResult Function(_AddServiceFee value)? addServiceFee,
    TResult Function(_AddOrderName value)? addOrderName,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderEventCopyWith<$Res> {
  factory $OrderEventCopyWith(
          OrderEvent value, $Res Function(OrderEvent) then) =
      _$OrderEventCopyWithImpl<$Res, OrderEvent>;
}

/// @nodoc
class _$OrderEventCopyWithImpl<$Res, $Val extends OrderEvent>
    implements $OrderEventCopyWith<$Res> {
  _$OrderEventCopyWithImpl(this._value, this._then);

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
    extends _$OrderEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'OrderEvent.started()';
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
    required TResult Function(String paymentMethod, List<OrderItem> items)
        addPaymentMethod,
    required TResult Function(int nominal) addNominal,
    required TResult Function(int fee) addServiceFee,
    required TResult Function(String name) addOrderName,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult? Function(int nominal)? addNominal,
    TResult? Function(int fee)? addServiceFee,
    TResult? Function(String name)? addOrderName,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult Function(int nominal)? addNominal,
    TResult Function(int fee)? addServiceFee,
    TResult Function(String name)? addOrderName,
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
    required TResult Function(_AddPaymentMethod value) addPaymentMethod,
    required TResult Function(_AddNominal value) addNominal,
    required TResult Function(_AddServiceFee value) addServiceFee,
    required TResult Function(_AddOrderName value) addOrderName,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult? Function(_AddNominal value)? addNominal,
    TResult? Function(_AddServiceFee value)? addServiceFee,
    TResult? Function(_AddOrderName value)? addOrderName,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult Function(_AddNominal value)? addNominal,
    TResult Function(_AddServiceFee value)? addServiceFee,
    TResult Function(_AddOrderName value)? addOrderName,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements OrderEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddPaymentMethodImplCopyWith<$Res> {
  factory _$$AddPaymentMethodImplCopyWith(_$AddPaymentMethodImpl value,
          $Res Function(_$AddPaymentMethodImpl) then) =
      __$$AddPaymentMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentMethod, List<OrderItem> items});
}

/// @nodoc
class __$$AddPaymentMethodImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddPaymentMethodImpl>
    implements _$$AddPaymentMethodImplCopyWith<$Res> {
  __$$AddPaymentMethodImplCopyWithImpl(_$AddPaymentMethodImpl _value,
      $Res Function(_$AddPaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
    Object? items = null,
  }) {
    return _then(_$AddPaymentMethodImpl(
      null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
    ));
  }
}

/// @nodoc

class _$AddPaymentMethodImpl implements _AddPaymentMethod {
  const _$AddPaymentMethodImpl(this.paymentMethod, final List<OrderItem> items)
      : _items = items;

  @override
  final String paymentMethod;
  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'OrderEvent.addPaymentMethod(paymentMethod: $paymentMethod, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentMethodImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, paymentMethod, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentMethodImplCopyWith<_$AddPaymentMethodImpl> get copyWith =>
      __$$AddPaymentMethodImplCopyWithImpl<_$AddPaymentMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String paymentMethod, List<OrderItem> items)
        addPaymentMethod,
    required TResult Function(int nominal) addNominal,
    required TResult Function(int fee) addServiceFee,
    required TResult Function(String name) addOrderName,
  }) {
    return addPaymentMethod(paymentMethod, items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult? Function(int nominal)? addNominal,
    TResult? Function(int fee)? addServiceFee,
    TResult? Function(String name)? addOrderName,
  }) {
    return addPaymentMethod?.call(paymentMethod, items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult Function(int nominal)? addNominal,
    TResult Function(int fee)? addServiceFee,
    TResult Function(String name)? addOrderName,
    required TResult orElse(),
  }) {
    if (addPaymentMethod != null) {
      return addPaymentMethod(paymentMethod, items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddPaymentMethod value) addPaymentMethod,
    required TResult Function(_AddNominal value) addNominal,
    required TResult Function(_AddServiceFee value) addServiceFee,
    required TResult Function(_AddOrderName value) addOrderName,
  }) {
    return addPaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult? Function(_AddNominal value)? addNominal,
    TResult? Function(_AddServiceFee value)? addServiceFee,
    TResult? Function(_AddOrderName value)? addOrderName,
  }) {
    return addPaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult Function(_AddNominal value)? addNominal,
    TResult Function(_AddServiceFee value)? addServiceFee,
    TResult Function(_AddOrderName value)? addOrderName,
    required TResult orElse(),
  }) {
    if (addPaymentMethod != null) {
      return addPaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _AddPaymentMethod implements OrderEvent {
  const factory _AddPaymentMethod(
          final String paymentMethod, final List<OrderItem> items) =
      _$AddPaymentMethodImpl;

  String get paymentMethod;
  List<OrderItem> get items;
  @JsonKey(ignore: true)
  _$$AddPaymentMethodImplCopyWith<_$AddPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddNominalImplCopyWith<$Res> {
  factory _$$AddNominalImplCopyWith(
          _$AddNominalImpl value, $Res Function(_$AddNominalImpl) then) =
      __$$AddNominalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int nominal});
}

/// @nodoc
class __$$AddNominalImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddNominalImpl>
    implements _$$AddNominalImplCopyWith<$Res> {
  __$$AddNominalImplCopyWithImpl(
      _$AddNominalImpl _value, $Res Function(_$AddNominalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nominal = null,
  }) {
    return _then(_$AddNominalImpl(
      null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddNominalImpl implements _AddNominal {
  const _$AddNominalImpl(this.nominal);

  @override
  final int nominal;

  @override
  String toString() {
    return 'OrderEvent.addNominal(nominal: $nominal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddNominalImpl &&
            (identical(other.nominal, nominal) || other.nominal == nominal));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nominal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddNominalImplCopyWith<_$AddNominalImpl> get copyWith =>
      __$$AddNominalImplCopyWithImpl<_$AddNominalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String paymentMethod, List<OrderItem> items)
        addPaymentMethod,
    required TResult Function(int nominal) addNominal,
    required TResult Function(int fee) addServiceFee,
    required TResult Function(String name) addOrderName,
  }) {
    return addNominal(nominal);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult? Function(int nominal)? addNominal,
    TResult? Function(int fee)? addServiceFee,
    TResult? Function(String name)? addOrderName,
  }) {
    return addNominal?.call(nominal);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult Function(int nominal)? addNominal,
    TResult Function(int fee)? addServiceFee,
    TResult Function(String name)? addOrderName,
    required TResult orElse(),
  }) {
    if (addNominal != null) {
      return addNominal(nominal);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddPaymentMethod value) addPaymentMethod,
    required TResult Function(_AddNominal value) addNominal,
    required TResult Function(_AddServiceFee value) addServiceFee,
    required TResult Function(_AddOrderName value) addOrderName,
  }) {
    return addNominal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult? Function(_AddNominal value)? addNominal,
    TResult? Function(_AddServiceFee value)? addServiceFee,
    TResult? Function(_AddOrderName value)? addOrderName,
  }) {
    return addNominal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult Function(_AddNominal value)? addNominal,
    TResult Function(_AddServiceFee value)? addServiceFee,
    TResult Function(_AddOrderName value)? addOrderName,
    required TResult orElse(),
  }) {
    if (addNominal != null) {
      return addNominal(this);
    }
    return orElse();
  }
}

abstract class _AddNominal implements OrderEvent {
  const factory _AddNominal(final int nominal) = _$AddNominalImpl;

  int get nominal;
  @JsonKey(ignore: true)
  _$$AddNominalImplCopyWith<_$AddNominalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddServiceFeeImplCopyWith<$Res> {
  factory _$$AddServiceFeeImplCopyWith(
          _$AddServiceFeeImpl value, $Res Function(_$AddServiceFeeImpl) then) =
      __$$AddServiceFeeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int fee});
}

/// @nodoc
class __$$AddServiceFeeImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddServiceFeeImpl>
    implements _$$AddServiceFeeImplCopyWith<$Res> {
  __$$AddServiceFeeImplCopyWithImpl(
      _$AddServiceFeeImpl _value, $Res Function(_$AddServiceFeeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fee = null,
  }) {
    return _then(_$AddServiceFeeImpl(
      null == fee
          ? _value.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AddServiceFeeImpl implements _AddServiceFee {
  const _$AddServiceFeeImpl(this.fee);

  @override
  final int fee;

  @override
  String toString() {
    return 'OrderEvent.addServiceFee(fee: $fee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServiceFeeImpl &&
            (identical(other.fee, fee) || other.fee == fee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fee);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServiceFeeImplCopyWith<_$AddServiceFeeImpl> get copyWith =>
      __$$AddServiceFeeImplCopyWithImpl<_$AddServiceFeeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String paymentMethod, List<OrderItem> items)
        addPaymentMethod,
    required TResult Function(int nominal) addNominal,
    required TResult Function(int fee) addServiceFee,
    required TResult Function(String name) addOrderName,
  }) {
    return addServiceFee(fee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult? Function(int nominal)? addNominal,
    TResult? Function(int fee)? addServiceFee,
    TResult? Function(String name)? addOrderName,
  }) {
    return addServiceFee?.call(fee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult Function(int nominal)? addNominal,
    TResult Function(int fee)? addServiceFee,
    TResult Function(String name)? addOrderName,
    required TResult orElse(),
  }) {
    if (addServiceFee != null) {
      return addServiceFee(fee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddPaymentMethod value) addPaymentMethod,
    required TResult Function(_AddNominal value) addNominal,
    required TResult Function(_AddServiceFee value) addServiceFee,
    required TResult Function(_AddOrderName value) addOrderName,
  }) {
    return addServiceFee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult? Function(_AddNominal value)? addNominal,
    TResult? Function(_AddServiceFee value)? addServiceFee,
    TResult? Function(_AddOrderName value)? addOrderName,
  }) {
    return addServiceFee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult Function(_AddNominal value)? addNominal,
    TResult Function(_AddServiceFee value)? addServiceFee,
    TResult Function(_AddOrderName value)? addOrderName,
    required TResult orElse(),
  }) {
    if (addServiceFee != null) {
      return addServiceFee(this);
    }
    return orElse();
  }
}

abstract class _AddServiceFee implements OrderEvent {
  const factory _AddServiceFee(final int fee) = _$AddServiceFeeImpl;

  int get fee;
  @JsonKey(ignore: true)
  _$$AddServiceFeeImplCopyWith<_$AddServiceFeeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrderNameImplCopyWith<$Res> {
  factory _$$AddOrderNameImplCopyWith(
          _$AddOrderNameImpl value, $Res Function(_$AddOrderNameImpl) then) =
      __$$AddOrderNameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$AddOrderNameImplCopyWithImpl<$Res>
    extends _$OrderEventCopyWithImpl<$Res, _$AddOrderNameImpl>
    implements _$$AddOrderNameImplCopyWith<$Res> {
  __$$AddOrderNameImplCopyWithImpl(
      _$AddOrderNameImpl _value, $Res Function(_$AddOrderNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$AddOrderNameImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddOrderNameImpl implements _AddOrderName {
  const _$AddOrderNameImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'OrderEvent.addOrderName(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrderNameImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrderNameImplCopyWith<_$AddOrderNameImpl> get copyWith =>
      __$$AddOrderNameImplCopyWithImpl<_$AddOrderNameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String paymentMethod, List<OrderItem> items)
        addPaymentMethod,
    required TResult Function(int nominal) addNominal,
    required TResult Function(int fee) addServiceFee,
    required TResult Function(String name) addOrderName,
  }) {
    return addOrderName(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult? Function(int nominal)? addNominal,
    TResult? Function(int fee)? addServiceFee,
    TResult? Function(String name)? addOrderName,
  }) {
    return addOrderName?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String paymentMethod, List<OrderItem> items)?
        addPaymentMethod,
    TResult Function(int nominal)? addNominal,
    TResult Function(int fee)? addServiceFee,
    TResult Function(String name)? addOrderName,
    required TResult orElse(),
  }) {
    if (addOrderName != null) {
      return addOrderName(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddPaymentMethod value) addPaymentMethod,
    required TResult Function(_AddNominal value) addNominal,
    required TResult Function(_AddServiceFee value) addServiceFee,
    required TResult Function(_AddOrderName value) addOrderName,
  }) {
    return addOrderName(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult? Function(_AddNominal value)? addNominal,
    TResult? Function(_AddServiceFee value)? addServiceFee,
    TResult? Function(_AddOrderName value)? addOrderName,
  }) {
    return addOrderName?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddPaymentMethod value)? addPaymentMethod,
    TResult Function(_AddNominal value)? addNominal,
    TResult Function(_AddServiceFee value)? addServiceFee,
    TResult Function(_AddOrderName value)? addOrderName,
    required TResult orElse(),
  }) {
    if (addOrderName != null) {
      return addOrderName(this);
    }
    return orElse();
  }
}

abstract class _AddOrderName implements OrderEvent {
  const factory _AddOrderName(final String name) = _$AddOrderNameImpl;

  String get name;
  @JsonKey(ignore: true)
  _$$AddOrderNameImplCopyWith<_$AddOrderNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)
        success,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStateCopyWith<$Res> {
  factory $OrderStateCopyWith(
          OrderState value, $Res Function(OrderState) then) =
      _$OrderStateCopyWithImpl<$Res, OrderState>;
}

/// @nodoc
class _$OrderStateCopyWithImpl<$Res, $Val extends OrderState>
    implements $OrderStateCopyWith<$Res> {
  _$OrderStateCopyWithImpl(this._value, this._then);

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
    extends _$OrderStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'OrderState.initial()';
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
    required TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)
        success,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult Function()? error,
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

abstract class _Initial implements OrderState {
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
    extends _$OrderStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'OrderState.loading()';
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
    required TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)
        success,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult Function()? error,
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

abstract class _Loading implements OrderState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<OrderItem> items,
      int totalQty,
      int totalPrice,
      String paymentMethod,
      int nominal,
      int serviceFee,
      String orderName});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalQty = null,
    Object? totalPrice = null,
    Object? paymentMethod = null,
    Object? nominal = null,
    Object? serviceFee = null,
    Object? orderName = null,
  }) {
    return _then(_$SuccessImpl(
      null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>,
      null == totalQty
          ? _value.totalQty
          : totalQty // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      null == nominal
          ? _value.nominal
          : nominal // ignore: cast_nullable_to_non_nullable
              as int,
      null == serviceFee
          ? _value.serviceFee
          : serviceFee // ignore: cast_nullable_to_non_nullable
              as int,
      null == orderName
          ? _value.orderName
          : orderName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(
      final List<OrderItem> items,
      this.totalQty,
      this.totalPrice,
      this.paymentMethod,
      this.nominal,
      this.serviceFee,
      this.orderName)
      : _items = items;

  final List<OrderItem> _items;
  @override
  List<OrderItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int totalQty;
  @override
  final int totalPrice;
  @override
  final String paymentMethod;
  @override
  final int nominal;
  @override
  final int serviceFee;
  @override
  final String orderName;

  @override
  String toString() {
    return 'OrderState.success(items: $items, totalQty: $totalQty, totalPrice: $totalPrice, paymentMethod: $paymentMethod, nominal: $nominal, serviceFee: $serviceFee, orderName: $orderName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalQty, totalQty) ||
                other.totalQty == totalQty) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.nominal, nominal) || other.nominal == nominal) &&
            (identical(other.serviceFee, serviceFee) ||
                other.serviceFee == serviceFee) &&
            (identical(other.orderName, orderName) ||
                other.orderName == orderName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      totalQty,
      totalPrice,
      paymentMethod,
      nominal,
      serviceFee,
      orderName);

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
    required TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)
        success,
    required TResult Function() error,
  }) {
    return success(items, totalQty, totalPrice, paymentMethod, nominal,
        serviceFee, orderName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult? Function()? error,
  }) {
    return success?.call(items, totalQty, totalPrice, paymentMethod, nominal,
        serviceFee, orderName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(items, totalQty, totalPrice, paymentMethod, nominal,
          serviceFee, orderName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
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

abstract class _Success implements OrderState {
  const factory _Success(
      final List<OrderItem> items,
      final int totalQty,
      final int totalPrice,
      final String paymentMethod,
      final int nominal,
      final int serviceFee,
      final String orderName) = _$SuccessImpl;

  List<OrderItem> get items;
  int get totalQty;
  int get totalPrice;
  String get paymentMethod;
  int get nominal;
  int get serviceFee;
  String get orderName;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$OrderStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl();

  @override
  String toString() {
    return 'OrderState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)
        success,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<OrderItem> items,
            int totalQty,
            int totalPrice,
            String paymentMethod,
            int nominal,
            int serviceFee,
            String orderName)?
        success,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
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

abstract class _Error implements OrderState {
  const factory _Error() = _$ErrorImpl;
}
