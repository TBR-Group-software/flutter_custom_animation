// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CartEventTearOff {
  const _$CartEventTearOff();

  _GetCartEvent getCart() {
    return const _GetCartEvent();
  }
}

/// @nodoc
const $CartEvent = _$CartEventTearOff();

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCartEvent value) getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetCartEvent value)? getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCartEvent value)? getCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res> implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  final CartEvent _value;
  // ignore: unused_field
  final $Res Function(CartEvent) _then;
}

/// @nodoc
abstract class _$GetCartEventCopyWith<$Res> {
  factory _$GetCartEventCopyWith(
          _GetCartEvent value, $Res Function(_GetCartEvent) then) =
      __$GetCartEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$GetCartEventCopyWithImpl<$Res> extends _$CartEventCopyWithImpl<$Res>
    implements _$GetCartEventCopyWith<$Res> {
  __$GetCartEventCopyWithImpl(
      _GetCartEvent _value, $Res Function(_GetCartEvent) _then)
      : super(_value, (v) => _then(v as _GetCartEvent));

  @override
  _GetCartEvent get _value => super._value as _GetCartEvent;
}

/// @nodoc

class _$_GetCartEvent extends _GetCartEvent {
  const _$_GetCartEvent() : super._();

  @override
  String toString() {
    return 'CartEvent.getCart()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetCartEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getCart,
  }) {
    return getCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getCart,
  }) {
    return getCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetCartEvent value) getCart,
  }) {
    return getCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetCartEvent value)? getCart,
  }) {
    return getCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetCartEvent value)? getCart,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart(this);
    }
    return orElse();
  }
}

abstract class _GetCartEvent extends CartEvent {
  const factory _GetCartEvent() = _$_GetCartEvent;
  const _GetCartEvent._() : super._();
}
