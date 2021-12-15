import 'package:flutter_custom_animation/domain/entity/product.dart';

class Cart {
  final String id;

  /// Product amount : product
  final List<CartProduct> products;

  Cart({required this.id, required this.products});
}

class CartProduct {
  final int amount;
  final Product product;

  CartProduct({required this.amount, required this.product});
}

extension TotoalCartSum on Cart {
  double get total {
    double sum = 0.0;

    products.forEach((CartProduct product) {
      sum = sum + product.product.price * product.amount;
    });

    return sum;
  }
}
