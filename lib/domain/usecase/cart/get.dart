import 'package:flutter_custom_animation/domain/entity/cart.dart';
import 'package:flutter_custom_animation/domain/service/cart.dart';

abstract class GetCartUseCase {
  Future<Cart> call();
}

class ServiceGetCartUseCase implements GetCartUseCase {
  final CartService _service;

  ServiceGetCartUseCase(this._service);

  @override
  Future<Cart> call() => _service.getCart();
}
