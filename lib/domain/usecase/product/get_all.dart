import 'package:flutter_custom_animation/domain/entity/product.dart';
import 'package:flutter_custom_animation/domain/service/products.dart';

abstract class GetAllProductsUseCase {
  Future<List<Product>> call();
}

class ServiceGetAllProductsUseCase implements GetAllProductsUseCase {
  final ProductService _service;

  ServiceGetAllProductsUseCase(this._service);

  @override
  Future<List<Product>> call() => _service.getAllProducts();
}
