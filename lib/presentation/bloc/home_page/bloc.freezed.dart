// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInitialData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInitialData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInitialData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInitialDataEvent value) getInitialData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetInitialDataEvent value)? getInitialData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInitialDataEvent value)? getInitialData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  final HomePageEvent _value;
  // ignore: unused_field
  final $Res Function(HomePageEvent) _then;
}

/// @nodoc
abstract class _$$_GetInitialDataEventCopyWith<$Res> {
  factory _$$_GetInitialDataEventCopyWith(_$_GetInitialDataEvent value,
          $Res Function(_$_GetInitialDataEvent) then) =
      __$$_GetInitialDataEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetInitialDataEventCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements _$$_GetInitialDataEventCopyWith<$Res> {
  __$$_GetInitialDataEventCopyWithImpl(_$_GetInitialDataEvent _value,
      $Res Function(_$_GetInitialDataEvent) _then)
      : super(_value, (v) => _then(v as _$_GetInitialDataEvent));

  @override
  _$_GetInitialDataEvent get _value => super._value as _$_GetInitialDataEvent;
}

/// @nodoc

class _$_GetInitialDataEvent extends _GetInitialDataEvent {
  const _$_GetInitialDataEvent() : super._();

  @override
  String toString() {
    return 'HomePageEvent.getInitialData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetInitialDataEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getInitialData,
  }) {
    return getInitialData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? getInitialData,
  }) {
    return getInitialData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getInitialData,
    required TResult orElse(),
  }) {
    if (getInitialData != null) {
      return getInitialData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetInitialDataEvent value) getInitialData,
  }) {
    return getInitialData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetInitialDataEvent value)? getInitialData,
  }) {
    return getInitialData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetInitialDataEvent value)? getInitialData,
    required TResult orElse(),
  }) {
    if (getInitialData != null) {
      return getInitialData(this);
    }
    return orElse();
  }
}

abstract class _GetInitialDataEvent extends HomePageEvent {
  const factory _GetInitialDataEvent() = _$_GetInitialDataEvent;
  const _GetInitialDataEvent._() : super._();
}
