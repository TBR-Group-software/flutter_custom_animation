import 'package:flutter_custom_animation/domain/entity/cart.dart';

abstract class CartService {
  Future<Cart> getCart();
}
