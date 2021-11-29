part of 'bloc.dart';

@immutable
@freezed
abstract class CartEvent with _$CartEvent {
  const CartEvent._();

  const factory CartEvent.getCart() = _GetCartEvent;
}
