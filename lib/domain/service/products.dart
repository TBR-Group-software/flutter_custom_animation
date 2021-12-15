import 'package:flutter_custom_animation/domain/entity/product.dart';

abstract class ProductService {
  Future<List<Product>> getAllProducts();
}
